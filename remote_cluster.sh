uniq $OAR_NODEFILE > node_list
manage=$(awk NR==1 node_list)

scp -r package root@$manage:/root/package
ssh root@$manage chmod 777 -R /root/package