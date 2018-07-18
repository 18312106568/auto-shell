 #! /bin/bash
 #This program is used to deploy BTAPI applications.
         read -p "Are you sure to install BTAPI applications,if yes,the script will undeploy the old version and then deploy the 
         newest version.Please input your choice Y/y or N/n:" CHOICE
 if [ $CHOICE = "Y" ]||[ $CHOICE = "y" ];then
        source /etc/profile
        asadmin  --echo=false --user=admin --passwordfile=aspwd undeploy  BTInterfaceApi 
        
        while [ 0 -eq 0 ]  
        do  
            echo ".................. Deploy BTInterfaceApi start  ..................."
            deploy_log=`asadmin deploy  --echo=false --user=admin --passwordfile=aspwd --name=BTInterfaceApi --virtualservers admin --contextroot=/public  BTInterfaceApi-1.0-SNAPSHOT.war 2>&1`
            echo ${deploy_log}
            idx=$(expr match "${deploy_log}" ".*failed")
            if [ $idx -le 0 ]; then 
                echo "--------------- Deploy BTInterfaceApi complete ---------------"  
                break;  
            else  
                echo "...............Deploy BTInterfaceApi failed, retry in 2 seconds .........."  
                sleep 2  
            fi  
        done        
        
              
        #asadmin restart-domain domain1
        chmod -R 777 /usr/local/glassfish4/glassfish/domains/domain1/applications
        echo "Now,the new applications were installed successful at `date +%Y-%m-%d_%T`" 
        asadmin  --echo=false --user=admin --passwordfile=aspwd  list-applications
     elif [ $CHOICE = "N" ]||[ $CHOICE = "n" ];then
        echo "I will quit this script!"
     else echo "Please input the right choice."
  fi
