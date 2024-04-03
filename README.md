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
   % docker build -f Dockerfile.py3 -t py3 py3
   % docker-compose up
```