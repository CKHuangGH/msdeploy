i=$1
manage=$2
#echo "call $i"
#echo "set registry-mirrors"
#ssh root@$i sed -i '1a\ \"registry-mirrors\":[\"http://docker-cache.grid5000.fr\"],' /etc/docker/daemon.json
#echo "restart docker"
#ssh root@$i service docker restart

echo "download new version of mck8s_lsv"
ssh root@$i rm -rf /root/mck8s_lsv
scp -r /home/chuang/msdeploy/mck8s_lsv root@$i:/root/
#ssh root@$i git clone -b experimemt01 https://github.com/CKHuangGH/mck8s_lsv.git
echo "run precluster.sh (write ip address to config, and known host)"
ssh root@$i chmod 777 /root/mck8s_lsv/remote_script/precluster.sh
ssh root@$i chmod 777 /root/mck8s_lsv/01_combineAll.sh
ssh root@$i chmod 777 /root/mck8s_lsv/02_createvalue.sh
ssh root@$i chmod 777 /root/mck8s_lsv/03_mck8s.sh
ssh root@$i chmod 777 /root/mck8s_lsv/04_mck8s-2.sh
ssh root@$i chmod 777 /root/mck8s_lsv/05_joining_test.sh
ssh root@$i chmod 777 /root/mck8s_lsv/06_deployment.sh
ssh root@$i chmod 777 /root/mck8s_lsv/patch/patch.sh
ssh root@$i chmod 777 /root/mck8s_lsv/patch/worker_node_patch.sh
ssh root@$i chmod 777 /root/mck8s_lsv/checking.sh
ssh root@$i chmod 777 /root/mck8s_lsv/worker_node.sh
ssh root@$i chmod 777 /root/mck8s_lsv/results/02_cas.sh
ssh root@$i chmod 777 /root/mck8s_lsv/results/01_status.sh
ssh root@$i chmod 777 /root/mck8s_lsv/results/03_cptorennes.sh
scp /home/chuang/.ssh/id_rsa root@$i:/root/.ssh
ssh root@$i . /root/mck8s_lsv/remote_script/precluster.sh $manage
echo "----------------$i OK----------------"