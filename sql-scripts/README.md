## To populate data
- Connect your EC2 Instance to AWS RDS Instance (rmit-store)
- On EC2 CentOS, assuming that you are on the `root` directory of the repository, run following commands:
```bash
sudo mysql -hrmit-store.c9kica0o89u0.us-east-1.rds.amazonaws.com -udb_admin -prmit_password < ./sql-scripts/sql-script.sql
```
You can change `rmit-store.c9kica0o89u0.us-east-1.rds.amazonaws.com` to any other hostname