sudo sysctl fs.inotify.max_user_watches=524288
sudo sysctl fs.inotify.max_user_instances=512

sudo apt install net-tools -y
sudo apt install make -y

curl -LO https://dl.k8s.io/release/v1.27.3/bin/linux/amd64/kubectl
mv /root/package/kubectl /usr/local/bin/kubectl
chmod 777 /usr/local/bin/kubectl

curl -L -o vcluster "https://github.com/loft-sh/vcluster/releases/latest/download/vcluster-linux-amd64" && sudo install -c -m 0755 vcluster /usr/local/bin && rm -f vcluster

for i in {1..3}
do
echo "  apiServerAddress: \"$(ifconfig eno1 |grep "inet " | cut -f 10 -d " ")"\" >> config/kind-example-config-$i.yaml
done

kind create cluster --config config/kind-example-config-1.yaml --name management0 &
kind create cluster --config config/kind-example-config-2.yaml --name management1 &
kind create cluster --config config/kind-example-config-3.yaml --name member0 &

rm -rf /usr/local/bin/clusteradm

rm -rf clusteradm_mmc/

git clone https://github.com/CKHuangGH/clusteradm_mmc.git
chmod 777 clusteradm_mmc/
cd clusteradm_mmc/
make build

cp /root/go/bin/clusteradm /usr/local/bin/clusteradm