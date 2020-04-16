#!/bin/bash
username_pass=<username:password>
komga_server=<ip:port>
wrk_dir=<work directory>
##All variables above need to be updated.
log_dir=${wrk_dir}/logs
comicbook_lst=${log_dir}/ll.lst
curl --user ${username_pass} \
-X GET "http://${komga_server}/api/v1/series/${1}/books?size=1000" \
-H "accept: application/json" | \jq '.content[].id' > ${comicbook_lst}

echo "ComicBook List Generated:"
ls -lrt ${comicbook_lst}
cat ${comicbook_lst} 

while read comicbook
do
sh ${wrk_dir}/update.book.numbersort.sh ${comicbook}
done < ${comicbook_lst}
