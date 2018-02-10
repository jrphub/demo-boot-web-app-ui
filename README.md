# Demo Web Application with Spring Security, Spring Boot, Spring Data JPA, HSQL, JSP

## Demo

The "feature" branch of this project is deployed to heroku and can be seen @ this url https://dboot.herokuapp.com/

To login using existing user :

username : testuser01

password : testuser01

You can sign up as new user using registration link also.

The dashboard is auto populated for first two users. One among those user is testuser01. The second one has not been created by me. You can sign up.

## Prerequisites

- JDK 1.7 or later
- Maven 3 or later

## Stack
- Spring Security
- Spring Boot
- Spring Data JPA
- Maven
- JSP
- HSQL or Mysql or Postgres or any database with JDBC support

## Run

Go to project directory and run below command

```mvn clean spring-boot:run```

Then browse

http://localhost:8080/

You can sign up and later login.

**Note** : 

For demo purpose, in memory database (hsql) is being used. So, every time you start the application the tables will be re-created and you need to sign up again.

To show a few documents on dashboard, for users with userid 01 and 02, I have created the insert script (data.sql) for table "doc".

When you will use any other database with jdbc support like mysql or postgres, you can remove the data.sql file as it will be executed everytime when the applicattion starts. As mysql or postgres are not in memory database, you can run the script once manually before the application starts.

## Snapshots

![Login](https://i.imgur.com/PBOfEoH.png)



![registration](https://i.imgur.com/QyQD9Oz.png)



![dashboard](https://i.imgur.com/6xsAVkw.png)



![Logout](https://i.imgur.com/Kly5k1Q.png)

## Database

I have provided the code support for HSQL (in-memory) , MySQL and Postgres.

In future, other database which supports jdbc can also be added with minimal changes in the application. There are two places where this change will go.

1. src/main/resources/application.properties
2. Add connector jar dependecy in pom.xml

### Using HSQL

HSQL is in-memory database and used as default database in this application.

You can run the application as it is to use this database. This runs data.sql file to populate tbl_doc after schema population and then application starts. As a result, when you will sign up for user id = 1 or 2, there will be some documents , which will be listed in user's dashboard. You can click on the download link to get the document.

### Using MySQL

To use mysql as database, you need to have mysql-server running at some host and port. The database must have been created before.

(To install mysql on linux [ubuntu] : http://www.iamjrp.com/2017/mssql-on-Linux-cli/)

Changes needed are :

1. modify pom.xml - comment hsqldb dependency and uncomment mysql
2. modify application.properties - Uncomment lines starting with '#' under ###Mysql section
3. Run data.sql file scripts manually in your mysql, so that tbl_doc will be populated.
4. Comment sql scripts in data.sql file
5. Run the application

### Using Postgres

Similar to mysql, to use postgres as database, you need to have postgres server running at some host and port. The database must have been created before.

(To install Postgres on linux [ubuntu] : http://www.iamjrp.com/2017/installing-postgres/ )

Changes needed are :

1. modify pom.xml - comment hsqldb dependency and uncomment postgres
2. modify application.properties - Uncomment lines starting with '#' under ###Postgres section
3. Run data.sql file scripts manually in your postgres, so that tbl_doc will be populated.
4. Comment sql scripts in data.sql file
5. Run the application

## Code walkthrough

### Directory structure

![directory_structure](https://i.imgur.com/iO5AOLW.png)

The project follows Model-View-Controller (MVC) pattern. All the apis are mentioned in UserController.java file.

### Server

for /login : POST - Spring security handles the request for authentication purpose, so it is not mentioned in the controller file.

The Spring boot application comes with embedded tomcat server. So there is no need to configure tomcat externally. To use external tomcat, remove tomcat dependency from pom.xml.

Currently, the logs are shown in console only. You can configure log4j2 or any other logging methods.

Also, there is not much exception handling implemented currently.

### UI

For UI, traditional JSP is used with JSTL tag  for simplicity purpose.

In CSS front, bootstrap is used. To add more UI element, please check this reference

1. https://bootsnipp.com/ - HTML/CSS/JS code for many web elements like form, header, pagination, table etc.
2. https://www.w3schools.com/bootstrap/default.asp - Learning bootstrap



## Reference

1. Spring boot reference guide : https://docs.spring.io/spring-boot/docs/current-SNAPSHOT/reference/htmlsingle/
2. Spring Boot quick start video from Javabrains : https://www.youtube.com/watch?v=msXL2oDexqw&list=PLqq-6Pq4lTTbx8p2oCgcAQGQyqN8XeA1x
3. Spring tuorial by Java Brains : https://www.youtube.com/watch?v=GB8k2-Egfv0&list=PLC97BDEFDCDD169D7

