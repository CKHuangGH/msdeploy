sudo sysctl fs.inotify.max_user_watches=524288
sudo sysctl fs.inotify.max_user_instances=512

kind create cluster --image kindest/node:v1.27.3 --name management1
kind create cluster --image kindest/node:v1.27.3 --name management2
kind create cluster --image kindest/node:v1.27.3 --name member1