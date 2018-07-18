#! /bin/bash
cd /home/ubuntu/sourcecode/trunk
svn update

cd /home/ubuntu/sourcecode/trunk/BTFacilities/
mvn -U clean package -Pprodprofile -Dmaven.test.skip=true

cd /home/ubuntu/sourcecode/trunk/BTCreditMarket/
mvn -U clean package -Pprodprofile -Dmaven.test.skip=true

cd /home/ubuntu/sourcecode/trunk/BTCreditManager/
mvn -U clean package -Pprodprofile -Dmaven.test.skip=true

cd /home/ubuntu/
rm -rf BTCreditManager-1.0-SNAPSHOT.war BTFacilities-1.0-SNAPSHOT.ear BTCreditMarket-1.0-SNAPSHOT.war

cp -rf /home/ubuntu/sourcecode/trunk/BTFacilities/target/BTFacilities-1.0-SNAPSHOT.ear /home/ubuntu/

cp -rf /home/ubuntu/sourcecode/trunk/BTCreditMarket/target/BTCreditMarket-1.0-SNAPSHOT.war /home/ubuntu/

cp -rf /home/ubuntu/sourcecode/trunk/BTCreditManager/target/BTCreditManager-1.0-SNAPSHOT.war /home/ubuntu/
