###update mck8s_lsv and ready key, known host, and write ip to config
uniq $OAR_NODEFILE > node_list
manage=$(awk NR==1 node_list)
git clone https://github.com/CKHuangGH/mck8s_lsv.git
chmod 777 /home/chuang/msdeploy/script/rmsr.sh

rm -rf /usr/bin/kubectl
curl -LO https://dl.k8s.io/release/v1.23.3/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl
sudo mv ./kubectl /usr/bin/kubectl

rm -rf /usr/local/bin/kubefedctl
wget --tries=0 https://github.com/kubernetes-sigs/kubefed/releases/download/v0.9.1/kubefedctl-0.9.1-linux-amd64.tgz
tar xzvf kubefedctl-0.9.1-linux-amd64.tgz
mv kubefedctl /usr/local/bin/


rm -rf /usr/local/bin/helm
wget --tries=0 https://get.helm.sh/helm-v3.8.0-linux-amd64.tar.gz
tar xzvf helm-v3.8.0-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/
helm repo add stable https://charts.helm.sh/stable
helm repo add cilium https://helm.cilium.io/
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update


#for i in $(cat node_list)
#do
#scp /home/chuang/images/grafana.tar root@$i:/root/
#done

for i in $(cat node_list)
do
	sh /home/chuang/msdeploy/script/rmsr.sh $i $manage &
done
echo "management node is $manage"