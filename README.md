# bookish-barnacle
This is an example interface that I am working on with my neighbor as a way of making what he is doing in excel more manageable (I hope).

# development environment
- vscode  ( https://code.visualstudio.com/download)https://code.visualstudio.com/download )
- docker  ( https://www.docker.com/products/docker-desktop/)https://www.docker.com/products/docker-desktop/ )
- git     ( https://git-scm.com/downloads )
## this is a possiblity
- gitbutler ( git clone https://github.com/gitbutlerapp/gitbutler.git )

# 2 containers:
- Postgres container  ( for the database )
- Python3 container   ( for an API layer )
- UI - defering decision until later.

# How to start the containers
```
   % docker build -f Dockerfile.web -t web .
   % docker compose up
```

# How to open a broser to view this project
1) Open in incognito window for your browser. 
2) from the docker compose up command:
```
   bookish-barnacle-db-1   | 
   bookish-barnacle-db-1   | PostgreSQL Database directory appears to contain a database; Skipping initialization
   bookish-barnacle-db-1   | 
   bookish-barnacle-db-1   | 2024-05-10 19:36:38.264 UTC [1] LOG:  starting PostgreSQL 13.4 on aarch64-unknown-linux-musl, compiled by gcc (Alpine 10.3.1_git20210424) 10.3.1 20210424, 64-bit
   bookish-barnacle-db-1   | 2024-05-10 19:36:38.264 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
   bookish-barnacle-db-1   | 2024-05-10 19:36:38.264 UTC [1] LOG:  listening on IPv6 address "::", port 5432
   bookish-barnacle-db-1   | 2024-05-10 19:36:38.267 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
   bookish-barnacle-db-1   | 2024-05-10 19:36:38.273 UTC [22] LOG:  database system was shut down at 2024-04-03 15:01:50 UTC
   bookish-barnacle-db-1   | 2024-05-10 19:36:38.280 UTC [1] LOG:  database system is ready to accept connections
   bookish-barnacle-web-1  | Watching for file changes with StatReloader
   bookish-barnacle-web-1  | Performing system checks...
   bookish-barnacle-web-1  | 
   bookish-barnacle-web-1  | System check identified no issues (0 silenced).
   bookish-barnacle-web-1  | May 10, 2024 - 19:36:39
   bookish-barnacle-web-1  | Django version 5.0.3, using settings 'AssemblyStatus.settings'
   bookish-barnacle-web-1  | Starting development server at http://0.0.0.0:8000/
   bookish-barnacle-web-1  | Quit the server with CONTROL-C.
```
enter the development server at [address] in the address bar (the "http://0.0.0.0:8000" )
3) Should see the starting page for this project

To see the "admin" page, use "http://0.0.0.0:8000/admin"

# How to log into the containers (after the docker compose up).
For example, you can log in to the web container by first fined the containers that are runing using 'docker ps'
```
    % docker ps   
    CONTAINER ID   IMAGE                  COMMAND                  CREATED         STATUS         PORTS                    NAMES
    fb67a338fde9   web:latest             "python manage.py ru…"   5 minutes ago   Up 3 minutes   0.0.0.0:8000->8000/tcp   bookish-barnacle-web-1
    8ebfccfd00d8   postgres:13.4-alpine   "docker-entrypoint.s…"   5 minutes ago   Up 3 minutes   0.0.0.0:5432->5432/tcp   bookish-barnacle-db-1
```
log into the running container from the container name:
```
    % docker exec -it bookish-barnacle-web-1 bash 
```
Or from the container id:
```
    % docker exec -it fb67a338fde9 bash 
```
You can log in to the database continer in the same manner.

#Modifying the code:
## 1 clone the repository to your local directory
```
git clone https://github.com/rob-baron/bookish-barnacle.git
```
## 2 open the bookish-barnicle directory using vscode
Start up vscode, and open the cloned directory

The directory structure is as follows:
```
- bookish-barnicle
    .gitignore
    Dockerfile.web
    LICENSE
    README.md
    docker-compose.yaml
    data/
        ....                  (data directory of database)
    database/
        init.sql
    app/                      (django files (python) )
        AssemblyStatus/        
            __init__.py
            asgi.py
            settings.py
            urls.py
            wsgi.py
        manage.py
```
The docker-compose file mounts the data directory in to the postgres
continer, and mounts the app directory into the app directory of the
web container.  This makes editing the code outside of the container
possible, as well as using git outside of the container to manage
how the files of the project.

For certain operations, like running manage.py, you will need to log
into the web/python container to run manage.py from the commandline.



















