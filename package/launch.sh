sudo sysctl fs.inotify.max_user_watches=524288
sudo sysctl fs.inotify.max_user_instances=512

for i in {1..3}
do
echo "  apiServerAddress: \"$(ifconfig eno1 |grep "inet " | cut -f 10 -d " ")"\" >> config/kind-example-config-$i.yaml
done

curl -LO https://dl.k8s.io/release/v1.27.3/bin/linux/amd64/kubectl
mv /root/package/kubectl /usr/local/bin/kubectl
chmod 777 /usr/local/bin/kubectl

# kind create cluster --image kindest/node:v1.27.3 --name management0 &
# kind create cluster --image kindest/node:v1.27.3 --name management1 &
# kind create cluster --image kindest/node:v1.27.3 --name member0 &

kind create cluster --config config/kind-example-config-1.yaml --name management0 &
kind create cluster --config config/kind-example-config-2.yaml --name management1 &
kind create cluster --config config/kind-example-config-3.yaml --name member0 &