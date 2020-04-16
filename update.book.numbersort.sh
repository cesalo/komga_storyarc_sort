username_pass=<username:password>
komga_server=<ip:port>
wrk_dir=<work directory>
##All variables above need to be updated.

curl --user ${username_pass} \
-X GET "http://${komga_server}/api/v1/books/${1}?size=1000" \
-H "accept: application/json" | \jq '.number' \
| xargs -I var1 curl --user ${username_pass} \
-X PATCH "http://${komga_server}/api/v1/books/${1}/metadata" \
-H "accept: application/json" -H "Content-Type: application/json" \
-d "{ \"numberSort\": var1, \"number\": var1 }" | \jq '.'
