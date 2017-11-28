#reads in a text file of emails (or other metadata), and calls the ldap script

while IFS='' read -r line || [[ -n "$line" ]]; do
#    echo "Text read from file: $line"
    ./parseLDAPData.sh "$line"
done < "$1" 
