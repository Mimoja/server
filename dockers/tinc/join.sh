if [ "$#" -ne 1 ]; then
  echo "Usage: $0 URL" >&2
  exit 1
fi
docker-compose run --entrypoint "sh -c" tinc "tinc join $1"
