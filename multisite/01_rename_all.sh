uniq $OAR_NODEFILE > node
for i in $(cat node)
do
	ssh root@$i ifconfig eno1 |grep "inet " | cut -f 10 -d " " >> node_list
done
