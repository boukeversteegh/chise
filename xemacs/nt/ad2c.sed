/^!/d
/^$/d
s/\\/\\\\/g
s/\\$//g
s/"/\\"/g
s/^/(String) "/
: test
/\\$/b slash
s/$/",/
p
d
: slash
n
/^!/d
/^$/d
s/"/\\"/g
s/\\\\/\\/g
s/\\n/\\\\n/g
s/\\t/\\\\t/g
s/\\f/\\\\f/g
s/\\b/\\\\b/g
b test
