sudo sysctl fs.inotify.max_user_watches=524288
sudo sysctl fs.inotify.max_user_instances=512

apt install net-tools -y

curl -LO https://dl.k8s.io/release/v1.27.3/bin/linux/amd64/kubectl
mv /root/package/kubectl /usr/local/bin/kubectl
chmod 777 /usr/local/bin/kubectl