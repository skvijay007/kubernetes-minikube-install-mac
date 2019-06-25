echo "Installing Homebrew.."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo “Installing kubectl”
brew install kubernetes-cli

echo “Making the kubectl binary executable”
chmod +x ./kubectl

echo “Moving kubectl binary in to your path”
sudo mv ./kubectl /usr/local/bin/kubectl

echo “Installing hyperkit”
brew install hyperkit

echo “Installing minikube fork of the hyperkit driver”
curl -LO https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-hyperkit \
&& sudo install -o root -g wheel -m 4755 docker-machine-driver-hyperkit /usr/local/bin/

echo “Install minikube”
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64 \
  && chmod +x minikube

echo “Setting hyperkit as a default driver for minikube”
minikube config set vm-driver hyperkit

echo “For more information on Virtual box drivers visit https://github.com/kubernetes/minikube/blob/master/docs/drivers.md#hyperkit-driver”

echo “Moving minikube executable to your path”
sudo mv minikube /usr/local/bin

echo “Kubernetes version”
kubectl version

echo “Minikube version”
minikube version

echo “Starting minikube”
minikube start
