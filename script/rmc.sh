i=$1
clustername=$2
clustercount=$3
managemodel=$4
yaml=$5
for j in `seq 1 $clustercount`
		do
			ssh root@$i kind create cluster --image kindest/node:v1.23.3 --config /root/mck8s_lsv/remote_script/config_03/kind-example-config-$j.yaml --name cluster$clustername
			echo "waiting cluster........"
			sleep 15
			ssh root@$i kubectl config use-context kind-cluster$clustername
			ssh root@$i helm repo update
			ssh root@$i helm install cilium cilium/cilium --version 1.11.2 --namespace kube-system --set cluster.name cluster$clustername --set cluster.id $clustername
			ssh root@$i mv /root/.kube/config /root/.kube/cluster$clustername
			ssh root@$i scp /root/.kube/cluster$clustername root@$managemodel:/root/.kube
			clustername=$(($clustername+1))	
		done
echo "----------------$i OK----------------"