# kind create cluster --image kindest/node:v1.27.3 --name management0 &
# kind create cluster --image kindest/node:v1.27.3 --name management1 &
# kind create cluster --image kindest/node:v1.27.3 --name member0 &

kind create cluster --config config/kind-example-config-1.yaml --name management0 &
kind create cluster --config config/kind-example-config-2.yaml --name management1 &
kind create cluster --config config/kind-example-config-3.yaml --name member0 &