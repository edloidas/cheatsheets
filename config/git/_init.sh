# set from arguments
NAME=$1
EMAIL=$2

# One-liner for script dirname
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# if arguments are not set, read from file
CRED="$DIR/.credentials"
source $CRED

if [ -z "$NAME" ]; then NAME=$SAVED_NAME; fi
if [ -z "$EMAIL" ]; then EMAIL=$SAVED_EMAIL; fi

# if still not set, read from direct input
if [ -z "$NAME" ]; then echo -n "Enter user name: " && read NAME; fi
if [ -z "$EMAIL" ]; then echo -n "Enter user email: " && read EMAIL; fi

# write .gitconfig
GIT="$HOME/.gitconfig"
GIT_TEMPLATE="$DIR/.gitconfig"

echo "[user]" > $GIT
echo "	email = $EMAIL" >> $GIT
echo "	name = $NAME" >> $GIT
cat $GIT_TEMPLATE >> $GIT

# save credentials
echo SAVED_NAME=$NAME>$CRED
echo SAVED_EMAIL=$EMAIL>$CRED

echo "Created .gitconfig for ( $NAME : $EMAIL )"

read -p "Press any key to continue... " -n1 -s
