install:
		npm install
		npm run build
		docker-compose build --no-cache

build:
		docker-compose build --no-cache

up:
		docker-compose up

up-d:
		docker-compose up -d

down:
		docker-compose down

start:
		docker-compose start

run:
		docker-compose run
