#! /bin/bash
cd /home/ubuntu/sourcecode/branches/
svn update

cd /home/ubuntu/sourcecode/branches/20170814/BTMqServer/
mvn -U clean package


cd /home/ubuntu/
rm -rf BTMqServer-1.0-SNAPSHOT.war


cp -rf /home/ubuntu/sourcecode/branches/20170814/BTMqServer/target/BTMqServer-1.0-SNAPSHOT.war /home/ubuntu/

~
