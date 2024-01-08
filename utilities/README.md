## Getting Started
- Create two EC2 Instances from AWS CloudFormation
### On EC2 Instance for RMIT Store Database
- In case the instance does not populate the data on RDS when startup, refer to [Database README](../sql-scripts/README.md)
### On EC2 Instance for RMIT Store Apache
- In case the instance does not run my Public Docker Image, run following commands:
Clean up running ports
```bash
sudo docker stop $(sudo docker ps -aq)
kill $(lsof -t -i tcp:80)
```
Run my prepared Docker Image
```
docker run -d --name my-rmit-store -p 80:80 laansdole/s3963207-rmit-store
```