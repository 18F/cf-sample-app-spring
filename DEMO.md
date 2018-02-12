# Before a demo:

0. login as a sandbox-only user (e.g. w/ @cao.org email account)
0. delete all apps and services and routes
0. make sure all the step below wor
0. For a group walkthrough, set up an empty Windows box, then:
* Install chocolatey
* Install mysql client

# Demo

We're using this as our standard demo app since a) it uses the Java buildpack, b) the code is pretty simple

### Login

```
cf api https://api.fr.cloud.gov
cf login --sso
```

### Show empty state

```
cf target
cf apps
cf services
```

### Launch

```
cf push
```

During push, describe what's going on:

![Staging](https://github.com/18F/cg-workshop/raw/master/images/app_push_flow_diagram_diego.png)

### Connect up app to a database

```
cf marketplace
cf marketplace -s aws-rds
cf create-service aws-rds shared-mysql cf-spring-db
cf bind-service cf-spring cf-spring-db
```

# Choose your own adventure

* View the logs, command line and w/ Kibana
* Connect to app with SSH
* Connect to DB with `connect-to-service`
* View other available services
* Visit the dashboard 

# Clean up