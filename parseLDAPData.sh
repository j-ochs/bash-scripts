# performs ldap requests for given email address, and parses metatata into csv file

names=($(ldapsearch -h pdc.westmont.edu -b cn=Users,dc=campus,dc=westmont,dc=edu -D cn=<YourUsername,cn=Users,dc=campus,dc=westmont,dc=edu  mail=$1 -w <YourPassword> | grep 'sn:\|givenName:\|mail:\|employeeType:' | cut -d\   -f2))
#names=($(ldapsearch -h pdc.westmont.edu -b cn=Users,dc=campus,dc=westmont,dc=edu -D cn=jochs,cn=Users,dc=campus,dc=westmont,dc=edu -W | grep 'sn:\|givenName:\|mail:\|employeeType:' | cut     -d\   -f2))

last=${names[0]}
first=${names[1]}
email=${names[2]}
posn=${names[3]}
all="$first $last $email $posn"
echo "user: $all"

printf '%s\n' $all | paste -sd ',' >> phishme.csv;

echo "DONE!"
