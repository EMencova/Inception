all:
	@docker-compose -f ./src/docker-compose.yml up

down:
	@docker-compose -f ./src/docker-compose.yml down

re:
	@docker-compose -f ./src/docker-compose.yml up --build

clean:
	@docker-compose down --volumes --rmi all --remove-orphans

