#! /bin/bash
cd /root/sourcecode/branches/
svn update

cd /root/sourcecode/branches/20170814/EasyDoServer/
mvn -U clean package -Dmaven.test.skip=true


cd /root/
rm -rf EasyDoServer.jar

cp -rf /root/sourcecode/branches/20170814/EasyDoServer/target/EasyDoServer-1.0-SNAPSHOT.jar /root/EasyDoServer.jar

chmod -R 777 EasyDoServer.jar

