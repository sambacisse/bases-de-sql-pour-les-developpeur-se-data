# If bash command fails, build should error out
set -e

# Get the data zip and unpack
apt-get update && apt-get install -y unzip
FILMS_REPO="https://assets.datacamp.com/course/tmp_fixme_filip/films.zip"
mkdir -p courses-intro-to-sql/data
wget $FILMS_REPO
unzip films.zip -d courses-intro-to-sql/data
rm films.zip

# Load the database into postgreSQL
service postgresql start \
  && sudo -u postgres createdb -O repl films \
  && cd courses-intro-to-sql \
  && sudo -u postgres psql films < data/films/films.sql \
  && service postgresql stop
