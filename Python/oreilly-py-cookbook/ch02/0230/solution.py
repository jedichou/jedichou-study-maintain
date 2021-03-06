# coding: utf-8
# TODO 需进行测试

CRCTableh = [0] * 256
CRCTablel = [0] * 256

def _inittables(CRCTableh, CRCTablel, POLY64REVh, BIT_TOGGLE):
    for i in xrange(256):
        partl = i
        parth = 0L
        for j in xrange(8):
            rflag = partl & 1L
            partl >>= 1L
            if parth & 1:
                partl ^= BIT_TOGGLE
            parth >>= 1L
            if rflag:
                parth ^= POLY64REVh
        CRCTableh[i] = parth
        CRCTablel[i] = partl
        
POLY64REVh = 0xd8000000L
BIT_TOGGLE = 1L << 31L
_inittables(CRCTableh, CRCTablel, POLY64REVh, BIT_TOGGLE)

del _inittables, POLY64REVh, BIT_TOGGLE

def crc64(bytes, (crch, crcl)=(0,0)):
    for byte in bytes:
        shr = (crch & 0xFF) << 24
        temp1h = crch >> 8L
        temp1l = (crcl >> 8L) | shr
        tableindex = (crcl ^ ord(byte)) & 0xFF
        crch = temp1h ^ CRCTableh[tableindex]
        crcl = temp1l ^ CRCTablel[tableindex]
    return crch, crcl
    
def crc64digest(aString):
    return "%o8X%o8X" % (crc64(bytes))
    
if __name__ == "__main__":
    assert crc64("IHATEMATH") == (3822890454, 2600578513)
    assert crc64digest("IHATEMATH") == "E3DCADD69B01ADD1"
    print 'crc64: dumb test successful'