docker-up:
	docker-compose up -d

docker-down:
	docker-compose down

docker-build:
	docker-compose up --build -d

docker-cli:
	docker exec -it app_demo_php-cli_1 /bin/bash
docker-cli-redis:
	docker exec -it app_demo_redis_1 /bin/bash

test:
	docker exec app_demo_php-cli_1 app/vendor/bin/phpunit  --colors=always

migrate:
	docker exec app_demo_php-cli_1 app/yii migrate

assets-install:
	docker exec app_demo_node_1 yarn install

assets-dev:
	docker exec app_demo_node_1 yarn run dev

assets-watch:
	docker exec app_demo_node_1 yarn run watch

perm:
	sudo chown ${USER}:${USER} bootstrap/cache -R
	sudo chown ${USER}:${USER} storage -R
	if [-d "node-modules" ]; then sudo chown ${USER}:${USER} node-modules -R; fi
	if [-d "public-build" ]; then sudo chown ${USER}:${USER} public-build -R; fi
