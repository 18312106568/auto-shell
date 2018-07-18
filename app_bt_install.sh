 #! /bin/bash
 #This program is used to deploy HXJR applications.
         read -p "Are you sure to install HXJR applications,if yes,the script will undeploy the old version and then deploy the 
         newest version.Please input your choice Y/y or N/n:" CHOICE
 if [ $CHOICE = "Y" ]||[ $CHOICE = "y" ];then
        source /etc/profile
        asadmin  --echo=false --user=admin --passwordfile=aspwd undeploy  BTCreditMarket
        asadmin  --echo=false --user=admin --passwordfile=aspwd undeploy  BTCreditManager
        asadmin  --echo=false --user=admin --passwordfile=aspwd undeploy  BTFacilities-1.0-SNAPSHOT
        
        
        while [ 0 -eq 0 ]  
        do  
            echo ".................. Deploy BTFacilities start  ..................."
            deploy_log=`asadmin deploy --echo=false --user=admin --passwordfile=aspwd --name=BTFacilities-1.0-SNAPSHOT --virtualservers www,admin BTFacilities-1.0-SNAPSHOT.ear 2>&1`
            echo ${deploy_log}
            idx=$(expr match "${deploy_log}" ".*failed")
            if [ $idx -le 0 ]; then  
                echo "--------------- Deploy BTFacilities complete ---------------"  
                break;  
            else  
                echo "...............Deploy BTFacilities failed, retry in 2 seconds .........."  
                sleep 2  
            fi  
        done
              
        while [ 0 -eq 0 ]  
        do  
            echo ".................. Deploy BTCreditManager start  ..................."
            deploy_log=`asadmin deploy  --echo=false --user=admin --passwordfile=aspwd --name=BTCreditManager --virtualservers admin --contextroot=/admin  BTCreditManager-1.0-SNAPSHOT.war 2>&1`
            echo ${deploy_log}
            idx=$(expr match "${deploy_log}" ".*failed")
            if [ $idx -le 0 ]; then  
                echo "--------------- Deploy BTFacilities complete ---------------"  
                break;  
            else  
                echo "...............Deploy BTCreditManager failed, retry in 2 seconds .........."  
                sleep 2  
            fi  
        done       
        
              
        while [ 0 -eq 0 ]  
        do  
            echo ".................. Deploy BTCreditMarket start  ..................."
            deploy_log=`asadmin deploy --echo=false --user=admin --passwordfile=aspwd --name=BTCreditMarket --virtualservers www  --contextroot=/   BTCreditMarket-1.0-SNAPSHOT.war 2>&1`
            echo ${deploy_log}
            idx=$(expr match "${deploy_log}" ".*failed")
            if [ $idx -le 0 ]; then  
                echo "--------------- Deploy BTFacilities complete ---------------"  
                break;  
            else  
                echo "...............Deploy BTCreditMarket failed, retry in 2 seconds .........."  
                sleep 2  
            fi  
        done          

        #asadmin restart-domain domain1
        chmod -R 777 /usr/local/glassfish4/glassfish/domains/domain1/applications
        echo "Now,the new applications were installed successful at `date +%Y-%m-%d_%T`" 
        asadmin  --echo=false --user=admin --passwordfile=aspwd  list-applications

        echo "Now,the new applications were installed successful,the next step we will backup the applications to the directory '/data/backup/app/'"
        cp BTFacilities-1.0-SNAPSHOT.ear  /data/backup/app/BTFacilities-1.0-SNAPSHOT.ear_`date +%Y-%m-%d_%T`
        cp BTCreditManager-1.0-SNAPSHOT.war  /data/backup/app/BTCreditManager-1.0-SNAPSHOT.war_`date +%Y-%m-%d_%T`
        cp BTCreditMarket-1.0-SNAPSHOT.war  /data/backup/app/BTCreditMarket-1.0-SNAPSHOT.war_`date +%Y-%m-%d_%T`
        chmod -R 777 /usr/local/glassfish4/glassfish/domains/domain1/applications/
        echo "------------------------Please wait a minnute to input 'http://uat1.efushui.com/' to access HXJR website!";

     elif [ $CHOICE = "N" ]||[ $CHOICE = "n" ];then
        echo "I will quit this script!"
     else echo "Please input the right choice."
  fi
