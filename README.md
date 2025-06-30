# gogs-mass-user-delete
Small script to remove users with their repositories in gogs web

## Prerequisites

Clone gogs-cli from [grogorick/gogs-cli](https://github.com/grogorick/gogs-cli)

##### Configure with two files 

**gogs-server-url.txt** - insert here your gogs url
**gogs-api-token.txt**  - insert here your admin user gogs token (configure it on /user/settings/applications)

##### Place executable

Place *mass-delete.sh* to the same directory of gogs-cli

Make it executable

```bash
chmod +x mass-delete.sh
```

#### Prepare users list
If you have access to the database, just use 

```mysql
SELECT name from user where ## expression of your need
```

##### Place file
Name of the file by default is *users*
The names should be line-by-line
Place it in the same directory

### Run

./mass-delete.sh
