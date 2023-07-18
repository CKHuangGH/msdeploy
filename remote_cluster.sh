uniq $OAR_NODEFILE > node_list
manage=$(awk NR==1 node_list)

ssh root@$manage rm -rf /root/package
scp -r package root@$manage:/root/package
ssh root@$manage chmod 777 -R /root/package

cat node_list