примеры запросов: stackforum_api.postman_collection.json

Для запуска необходимы Docker и Docker Compose

запуск: docker-compose up

после первого запуска необходимо выполнить следующие команды:

docker exec -it stackforum_rails rake db:setup
docker exec -it stackforum_rails psql -h postgres -d stackforum_dev -U postgres -f demo_bd.sql