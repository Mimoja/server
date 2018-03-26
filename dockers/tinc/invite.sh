if [ "$#" -ne 1 ]; then
  echo "Usage: $0 CLIENT" >&2
  exit 1
fi
docker-compose exec tinc tinc -n Mimoja invite $1

