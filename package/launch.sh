sudo sysctl fs.inotify.max_user_watches=524288
sudo sysctl fs.inotify.max_user_instances=512
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
mv /root/kubectl /usr/local/bin/kubectl
chmod 777 /usr/local/bin/kubectl
kind create cluster --image kindest/node:v1.27.3 --name management1 &
kind create cluster --image kindest/node:v1.27.3 --name management2 &
kind create cluster --image kindest/node:v1.27.3 --name member1 &