#! /bin/bash
cd /home/ubuntu/sourcecode/branches/
svn update

cd /home/ubuntu/sourcecode/branches/20170814/BTFacilities/
mvn -U clean package -Dmaven.test.skip=true

cd /home/ubuntu/sourcecode/branches/20170814/BTCreditMarket/
mvn -U clean package -Dmaven.test.skip=true

cd /home/ubuntu/sourcecode/branches/20170814/BTCreditManager/
mvn -U clean package -Dmaven.test.skip=true

cd /home/ubuntu/
rm -rf BTCreditManager-1.0-SNAPSHOT.war BTFacilities-1.0-SNAPSHOT.ear BTCreditMarket-1.0-SNAPSHOT.war

cp -rf /home/ubuntu/sourcecode/branches/20170814/BTFacilities/target/BTFacilities-1.0-SNAPSHOT.ear /home/ubuntu/

cp -rf /home/ubuntu/sourcecode/branches/20170814/BTCreditMarket/target/BTCreditMarket-1.0-SNAPSHOT.war /home/ubuntu/

cp -rf /home/ubuntu/sourcecode/branches/20170814/BTCreditManager/target/BTCreditManager-1.0-SNAPSHOT.war /home/ubuntu/
