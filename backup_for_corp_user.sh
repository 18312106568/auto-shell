#! /bin/bash

if [ -n "$1" -a -n "$2" ];then
echo "###1 TB_USER"
mysqldump -uroot -p$1 -t Biz TB_USER --single-transaction --where="ORG_CODE IN ($2)" >> /home/ubuntu/testbackup_`date +%Y%m%d%k`.sql

echo "###2 TB_USER_RECORD"
mysqldump -uroot -p$1 -t Biz TB_USER_RECORD --single-transaction --where="USER_ID IN (SELECT ID FROM TB_USER u WHERE u.ORG_CODE IN ($2))" >> /home/ubuntu/testbackup_`date +%Y%m%d%k`.sql

echo "###3 TB_USER_LOGIN_RECORD"
mysqldump -uroot -p$1 -t Biz TB_USER_LOGIN_RECORD --single-transaction --where="USER_ID IN (SELECT ID FROM TB_USER u WHERE u.ORG_CODE IN ($2))" >> /home/ubuntu/testbackup_`date +%Y%m%d%k`.sql

echo "###4 TB_USER_INFO"
mysqldump -uroot -p$1 -t Biz TB_USER_INFO --single-transaction --where="ID IN (SELECT ID FROM TB_USER u WHERE u.ORG_CODE IN ($2))" >> /home/ubuntu/testbackup_`date +%Y%m%d%k`.sql

echo "###5 TB_USER_CREDIT"
mysqldump -uroot -p$1 -t Biz TB_USER_CREDIT --single-transaction --where="ID IN (SELECT ID FROM TB_USER u WHERE u.ORG_CODE IN ($2))" >> /home/ubuntu/testbackup_`date +%Y%m%d%k`.sql

echo "###6 TB_CERTIFICATE"
mysqldump -uroot -p$1 -t Biz TB_CERTIFICATE --single-transaction --where="USER_ID IN (SELECT ID FROM TB_USER u WHERE u.ORG_CODE IN ($2))" >> /home/ubuntu/testbackup_`date +%Y%m%d%k`.sql

echo "###7 TB_PROOF"
mysqldump -uroot -p$1 -t Biz TB_PROOF --single-transaction --where="CERTIFICATE_ID IN (SELECT ID FROM TB_CERTIFICATE WHERE USER_ID IN (SELECT ID FROM TB_USER u WHERE u.ORG_CODE IN ($2)))" >> /home/ubuntu/testbackup_`date +%Y%m%d%k`.sql

echo "###8 TB_CERTIFICATE_RECORD"
mysqldump -uroot -p$1 -t Biz TB_CERTIFICATE_RECORD --single-transaction --where="CERTIFICATE_ID IN (SELECT ID FROM TB_CERTIFICATE WHERE USER_ID IN (SELECT ID FROM TB_USER u WHERE u.ORG_CODE IN ($2)))" >> /home/ubuntu/testbackup_`date +%Y%m%d%k`.sql

echo "###9 TB_USER_AUTHENTICATE"
mysqldump -uroot -p$1 -t Biz TB_USER_AUTHENTICATE --single-transaction --where="ID IN (SELECT ID FROM TB_USER u WHERE u.ORG_CODE IN ($2))" >> /home/ubuntu/testbackup_`date +%Y%m%d%k`.sql

echo "###10 TB_CORPORATION_BASE"
mysqldump -uroot -p$1 -t Biz TB_CORPORATION_BASE --single-transaction --where="ORG_CODE IN ($2)" >> /home/ubuntu/testbackup_`date +%Y%m%d%k`.sql

echo "###11 TB_CORPORATION_CREDIT"
mysqldump -uroot -p$1 -t Biz TB_CORPORATION_CREDIT --single-transaction --where="ID IN (SELECT cb.ID FROM TB_CORPORATION_BASE cb WHERE cb.ORG_CODE IN ($2))" >> /home/ubuntu/testbackup_`date +%Y%m%d%k`.sql

echo "###12 TB_CORPCREDIT_RECORD"
mysqldump -uroot -p$1 -t Biz TB_CORPCREDIT_RECORD --single-transaction --where="CORP_CREDIT_ID IN (SELECT ID FROM TB_CORPORATION_CREDIT WHERE ID IN (SELECT cb.ID FROM TB_CORPORATION_BASE cb WHERE cb.ORG_CODE IN ($2)))" >> /home/ubuntu/testbackup_`date +%Y%m%d%k`.sql

echo "###13 TB_CORPORATION_BASE_INFO"
mysqldump -uroot -p$1 -t Biz TB_CORPORATION_BASE_INFO --single-transaction --where="CORPORATION_ID IN (SELECT cb.ID FROM TB_CORPORATION_BASE cb WHERE cb.ORG_CODE IN ($2))" >> /home/ubuntu/testbackup_`date +%Y%m%d%k`.sql
else
echo "Please Enter PassWord And Parameter"
fi
