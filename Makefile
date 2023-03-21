build:
	docker build -t docker-go-ir .
run: build
	docker run -p 3000:3000 docker-go-ir
minikube:
	minikube start
cluster:
	kubectl apply -f k8s
