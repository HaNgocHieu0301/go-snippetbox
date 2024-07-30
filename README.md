# go-snippetbox
### Access MySQL DB in Container
`mysql -u root -p`

### Export DB and push to Git
- copy file config sql to container (if no having):  
`docker cp ./my.cnf mysql_container:/etc/mysql/my.cnf`  


- run cmd to export sql file in my computer:  
`docker exec -i mysql_container mysqldump --defaults-file=/etc/mysql/my.cnf snippetbox > db_dump.sql`