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