docker images --no-trunc | grep '<none>' | awk '{ print $3 }' \
    | xargs -r docker rmi 
docker ps --filter status=dead --filter status=exited -aq \
  | xargs docker rm -v 
find '/var/lib/docker/volumes/' -mindepth 1 -maxdepth 1 -type d | grep -vFf <(
  docker ps -aq | xargs docker inspect | jq -r '.[]|.Mounts|.[]|.Name|select(.)'
) 
docker volume ls -qf dangling=true | xargs -r docker volume rm 
docker ps --filter status=dead --filter status=exited -aq | xargs -r docker rm -v 
docker images --no-trunc | grep '<none>' | awk '{ print $3 }' | xargs -r docker rmi 
find '/var/lib/docker/volumes/' -mindepth 1 -maxdepth 1 -type d | grep -vFf <(
  docker ps -aq | xargs docker inspect | jq -r '.[] | .Mounts | .[] | .Name | select(.)'
) | xargs -r rm -fr
