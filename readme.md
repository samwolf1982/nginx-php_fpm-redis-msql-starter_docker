#Заготовка для php проектов в докере    

## docker env 
https://docs.docker.com/compose/env-file/   


### запуск стоп
docker-compose up --build
docker-compose down

### для php 7.2 
добавить
RUN pecl install mcrypt
RUN docker-php-ext-enable mcrypt
###    тунелировани
https://localtunnel.github.io/ww
