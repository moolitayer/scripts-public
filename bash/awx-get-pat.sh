curl -ku admin:password -H "Content-Type: application/json" -X POST \
-d '{"description":"AWX Go Client","application":null,"scope":"write"}' \
"http://localhost:9100/api/v2/users/admin/personal_tokens/" | jq .
