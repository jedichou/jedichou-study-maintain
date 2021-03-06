<# Part 1 #>

# How to create hashtable
$user = @{
    FirstName = "John";
    LastName  = "Smith";
    PhoneNumber = "555-1212"};

# Pls notice
# You can't use GetType().FullName get type description.
write-output "User's type is $($user.GetType().Name)";
write-output "  First Name   : $($user.FirstName)";
write-output "  Second Name  : $($user.LastName)";
write-output "  Phone Number : $($user.PhoneNumber)";
write-output ""

# you can use key to find value
write-output "User's basic info : $($user["firstname","lastname"])"
write-output ""

# you can use keys or values
write-output $user.keys;
write-output $user.values;
write-output $user[$user.keys]; # the output same as line20
write-output ""

# you can sort result
write-output "sort keys   : $($user.keys | sort-object)"
write-output "sort values : $($user.values | sort-object)"

<# Part 2 #>

# you can modify and manipulating hashtables
$user.date = get-date;
write-output $user;
write-output ""

# the second method that modify hashtables
$user['city'] = "Detroit"
write-output $user;
write-output ""

# use remove() to delete key.
$user.remove("city")
write-output $user;
