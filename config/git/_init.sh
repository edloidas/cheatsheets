USER=$1
EMAIL=$2

if [ -z "$1" ]
  then
    echo -n "Enter user name: "
    read USER
fi

if [ -z "$2" ]
  then
    echo -n "Enter user email: "
    read EMAIL
fi

GIT="$HOME/.gitconfig"

echo "[user]" > $GIT
echo "	email = $EMAIL" >> $GIT
echo "	name = $USER" >> $GIT
cat .gitconfig >> $GIT

echo "Created .gitconfig for ( $USER : $EMAIL )"

read -p "Press any key to continue... " -n1 -s
