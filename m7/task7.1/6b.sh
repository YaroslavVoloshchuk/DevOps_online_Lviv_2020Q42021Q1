#!/bin/bash
function most_ip {
        echo "1. The most requests were from the ip : "
        awk '{print $1}' $1 | sort | uniq -c | sort -g | tail -n 1 | awk '{print $2}'
        echo
}
function most_page {
        echo "2. Most requested page : "
        awk '{print $7}' $1 | sort | uniq -c | sort -g | tail -n 1 | awk '{print $2}'
        echo 
}
function req_per_ip {
        echo "3. Requests from each ip"
        awk '{print $1}' $1 | sort | uniq -c | sort -g
        echo
}
function nonexist_pages {
        echo "4. Requests to nonexisted pages : "
        grep "302" $1 | awk '{print $7}'
        echo
}
function time_of_mreq {
        echo "5. Time of most requests : "
        awk '{print $4}' $1 | cut -d ":" -f1-2 | uniq -c | sort -g | tail -n 1 | cut -d "[" -f2
        echo
}
function list_bots {
        echo "6. Search-bots : "
        awk '{print "(" $1 ") - "  $14 " - " $9}' $1 | grep -i bot | sort | uniq -c | sort -h
        echo
}

if [ -z "$@" ]
then
        echo -e "No key is provided!"\
                '\nexit....'
elif [ -f $1 ]
then
        most_ip $1
        most_page $1
        req_per_ip $1
        nonexist_pages $1
        time_of_mreq $1
        list_bots $1
else
        echo "File doesn't exist!"
fi
