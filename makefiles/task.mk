build:
	docker build . -t marlonric/orbis-training-docker:2.0.0
push:
	@make login
	docker push marlonric/orbis-training-docker:2.0.0
up:
	docker-compose up
login:
	docker login