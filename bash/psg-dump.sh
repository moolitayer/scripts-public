# Dump
# sudo su - -c "pg_dump --table=tags --table=container_label_tag_mappings vmdb_development" > output.sql
sudo su - -c "pg_dump --table=ext_management_systems vmdb_development" > output.sql

