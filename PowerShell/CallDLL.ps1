Clear-Host

[void][reflection.assembly]::LoadFile("D:/math2.dll")
[void][reflection.assembly]::LoadFile("D:/MiKu-Util.dll")

$a = New-Object Math.Methods
$b = $a.CompareI(10,2)

# Define a miku_util instance
$miku_util = New-Object MiKuTest.Util

# Output string md5 value
$string1_md5 = $miku_util.MD5("abc")
$string2_md5 = $miku_util.MD5("def")
$string3_md5 = $miku_util.MD5("ghi")
$string4_md5 = $miku_util.MD5("")
Write-Host "string1-", $string1_md5
Write-Host "string2-", $string2_md5
Write-Host "string3-", $string3_md5
Write-Host "string4-", $string4_md5
Write-Host

# Output file md5 value
$file1_md5 = $miku_util.MD5FromFile("d:/math2.cs")
$file2_md5 = $miku_util.MD5FromFile("D:\MiKu-Util.cs")
Write-Host "file1-", $file1_md5
Write-Host "file2-", $file2_md5

$file3_md5 = $miku_util.MD5FromFile("K:\connmysql\hellow.c")
Write-Host "file3-", $file3_md5

$file4_md5 = $miku_util.MD5FromFile("D:\moust.tmp")
$file5_md5 = $miku_util.MD5FromFile("D:\moust.bak")
Write-Host "file4-", $file4_md5
Write-Host "file5-", $file5_md5