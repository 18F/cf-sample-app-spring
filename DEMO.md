# Before a demo:

0. login as a sandbox-only user (e.g. w/ @cao.org email account)
0. delete all apps and services and routes
0. make sure all the step below work
0. For a group walkthrough, set up an empty Windows box, then:
* Install chocolatey
* Install mysql client

# Simple Demo

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

# 2. Demo w/ management options

Scenario: 
  * `$user@connect.gov` is an OrgManager for `demo-$department`
  * `$user` is logged in to dashboard
  * `$user` goes to `demo-$department`, creates 3 spaces
    * Nope - can't do this
  * `$user` invites `$user@cao.gov` to the `dev` space

## Before the demo

1. Create yourself as user@connect.gov, this example uses `peter.burhkolder` 
1. As a cloud.gov admin user, create a new org and associate your `connect.gov` persona as the OrgManager
    ```
    neworg=demo-usda
    user="peter.burkholder"
    cf create-org $neworg -q default
    cf set-org-role $user@connect.gov $neworg OrgManager
    ```
1. Since the Dashboard doesn't allow space creation, add three spaces:
    ```
    cf create-space -o $neworg dev
    cf create-space -o $neworg stage
    cf create-space -o $neworg preprod
    ```
1. As the uses@connect.gov, login to dashboard:
1. As the user@cao.gov, login to CF at the command line (use CF_HOME=~/.cf-cao)

## Demo

Dashboard:
1. Invite `$user@cao.gov` to the dev space
1. Set perms to `developer` only (managee things, not people)

CLI as user@cao.gov, confirm settings are OK

```
cf orgs
cf target -o demo-usda -s dev
cf target
```

CLI as 

### Demo reset

As ADMIN

```
cf target -o $neworg -s dev
cf delete cf-spring
cf ds cf-spring-db
cf delete-orphaned-routes
cf unset-space-role peter.burkholder@cao.gov demo-usda dev SpaceDeveloper
```





# Choose your own adventure

* View the logs, command line and w/ Kibana
* Connect to app with SSH
* Connect to DB with `connect-to-service`
* View other available services
* Visit the dashboard 

# Clean up
