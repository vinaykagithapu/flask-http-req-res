# Flask Http Request Response

# Get Started

## Run on Local
1. Install required python packages.
```shell
pip install -r requirements.txt
```
2. Run `app.py` using `python3`
```shell
python3 app.py
```
3. Access the app at http://localhost:5000

## Run on Docker
1. Build the Docker image.
```shell
docker build -t cyberwarrior423/flask-req-res-app:latest .
```
2. Run the Docker container
```shell
docker run -d -p 5000:5000 --name flask-req-res-app cyberwarrior423/flask-req-res-app:latest
```
3. Access the app at http://localhost:5000
4. Stop and remove docker container and images.
```shell
docker stop flask-req-res-app
docker rm flask-req-res-app
docker rmi cyberwarrior423/flask-req-res-app:latest
```

## Run on Kubernetes
1. Create a namespace
```shell
kubectl create namespace app-ns
```
2. Create deployment and service
```shell
kubectl -n app-ns apply -f kubernetes/deployment.yaml
kubectl -n app-ns apply -f kubernetes/service.yaml
kubectl -n app-ns get pod
```
3. Port-forward the service
```shell
kubectl -n app-ns port-forward service/flask-req-res-app 5000:80
```
4. Access the app at http://localhost:5000
5. Remove k8s resources
```shell
kubectl -n app-ns delete -f kubernetes/service.yaml
kubectl -n app-ns delete -f kubernetes/deployment.yaml
kubectl delete namespace app-ns
```