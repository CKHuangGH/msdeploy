kind delete cluster --name management0
kind delete cluster --name management1
kind delete cluster --name member0

kind create cluster --config config/kind-example-config-1.yaml --name management0 &
kind create cluster --config config/kind-example-config-2.yaml --name management1 &
kind create cluster --config config/kind-example-config-3.yaml --name member0 &