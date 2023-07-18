clusterstart=0
numberofcluster=1
manage=$(awk NR==1 node_list)
scp node_list root@$manage:/root/mck8s_lsv
chmod 777 /home/chuang/msdeploy/script/rmc.sh

	for i in $(cat node_list)
	do
		echo call $i
		#read -p "please input yaml number(ex: 4):" yaml
		sh /home/chuang/msdeploy/script/rmc.sh $i $clusterstart $numberofcluster $manage $yaml &
		clusterstart=$(($clusterstart+$numberofcluster))
		numberofcluster=1
	done
echo "please ssh to $manage and deploy mck8s_lsv"