# usage
 ```
# in the project you want to develop in:
git clone https://github.com/kreczko/fast-dev.git
cp -r fast-dev/docker* .
docker-compose up -d
docker-compose exec box bash
# do your thing
...
docker-compose down
```
