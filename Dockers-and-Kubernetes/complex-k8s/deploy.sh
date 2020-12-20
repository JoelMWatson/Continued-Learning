docker build -t joel3rbear/multi-client:latest -t joel3rbear/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t joel3rbear/multi-server:latest -t joel3rbear/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t joel3rbear/multi-worker:latest -t joel3rbear/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push joel3rbear/multi-client:latest
docker push joel3rbear/multi-server:latest
docker push joel3rbear/multi-worker:latest
docker push joel3rbear/multi-client:$SHA
docker push joel3rbear/multi-server:$SHA
docker push joel3rbear/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=joel3rbear/multi-server:$SHA
kubectl set image deployments/client-deployment client=joel3rbear/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=joel3rbear/multi-worker:$SHA