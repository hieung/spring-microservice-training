# spring-microservice-training

Follow the steps below to run

Run Rabbit MQ
----------------------------------------------
./rabbitmq-server

Database Configuration
----------------------------------------------
- Start Postgres service in localhost on port 5432
- Make sure there is a user 'postgres' with no password
- Under 'postgres' user, execute setup/build_db.sql to set up new DB and load dummy data

Build all projects using the pom.xml at the root level. 
-------------------------------------------------
mvn –Dmaven.test.skip=true clean install 

Run 
-------------------------------------------
Run below projects from the respective folders. 

Hint: Note that wait for 40-60 seconds before starting the next service. This will ensure that the dependent services are registered and are available before we starting a new service.

java -jar target/config-server-1.0.jar

java -jar target/eurekaserver-1.0.jar

java -jar target/fares-1.0.jar

java -jar target/search-1.0.jar

java -jar target/checkin-1.0.jar

java -jar target/book-1.0.jar

java –jar target/fares-apigateway-1.0.jar

java –jar target/search-apigateway-1.0.jar

java –jar target/checkin-apigateway-1.0.jar

java –jar target/book-apigateway-1.0.jar

java -jar target/website-1.0.jar

Open the browser window and point to http://localhost:8001