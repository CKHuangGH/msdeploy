i=$1
clustername=$2
clustercount=$3
managemodel=$4
yaml=$5
for j in `seq 1 $clustercount`
		do
			ssh root@$i kind create cluster --image kindest/node:v1.18.0 --config /root/mck8s_lsv/remote_script/config_01/kind-example-config-$j.yaml --name cluster$clustername
			echo "waiting cluster........"
			sleep 15
			 ssh root@$i kubectl config use-context kind-cluster$clustername
			 ssh root@$i helm repo update
			 ssh root@$i helm install cilium cilium/cilium --version 1.9.3 \
			   --namespace kube-system \
			   --set nodeinit.enabled=true \
			   --set kubeProxyReplacement=partial \
			   --set hostServices.enabled=false \
			   --set externalIPs.enabled=true \
			   --set nodePort.enabled=true \
			   --set hostPort.enabled=true \
			   --set bpf.masquerade=false \
			   --set image.pullPolicy=IfNotPresent \
			   --set ipam.mode=kubernetes
			ssh root@$i mv /root/.kube/config /root/.kube/cluster$clustername
			ssh root@$i scp /root/.kube/cluster$clustername root@$managemodel:/root/.kube
			clustername=$(($clustername+1))	
		done
echo "----------------$i OK----------------"