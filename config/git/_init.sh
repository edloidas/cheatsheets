# Unset variables
name=
email=
workflow=

# Test `getopt` support
function testGlobals {
  `${@:2}` > /dev/null
  if [[ $? -ne $1 ]]; then
      echo "'${@:2}' failed in this environment."
      exit 1
  fi
}

testGlobals 4 "getopt --test"

OPTIONS=e:n:w
LONGOPTIONS=email:,name:,workflow

PARSED=$(getopt --options=$OPTIONS --longoptions=$LONGOPTIONS --name "$0" -- "$@")
if [[ $? -ne 0 ]]; then
    exit 2
fi

eval set -- "$PARSED"

while true; do
    case "$1" in
        -w|--workflow)
            workflow=true
            shift
            ;;
        -e|--email)
            email="$2"
            shift 2
            ;;
        -n|--name)
            name="$2"
            shift 2
            ;;
        --)
            shift
            break
            ;;
        *)
            echo "Programming error"
            exit 3
            ;;
    esac
done

# One-liner for script dirname
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# if arguments are not set, read from file
CRED="$DIR/.credentials"
if [ -f $CRED ]; then source $CRED; fi

if [[ -z "$name" ]]; then name=$SAVED_NAME; fi
if [[ -z "$email" ]]; then email=$SAVED_EMAIL; fi
if [[ -z "$workflow" ]]; then workflow=$SAVED_WORKFLOW; fi

# if still not set, read from direct input
if [[ -z "$name" ]]; then echo -n "Enter user name: " && read name; fi
if [[ -z "$email" ]]; then echo -n "Enter user email: " && read email; fi
if [[ -z "$workflow" ]]; then echo -n "Add workflow aliases (Y/N)? " && read reply; fi
if [[ $reply =~ ^[Yy]$ ]]; then workflow=true; fi

# write .gitconfig
GIT="$HOME/.gitconfig"
GIT_TEMPLATE="$DIR/.gitconfig"
GIT_WORKFLOW="$DIR/workflow.gitconfig"

echo "[user]" > $GIT
echo "	email = $email" >> $GIT
echo "	name = $name" >> $GIT
cat $GIT_TEMPLATE >> $GIT
if [ "$workflow" == "true" ]; then cat $GIT_WORKFLOW >> $GIT; fi

# save credentials
echo SAVED_NAME=\"$name\">$CRED
echo SAVED_EMAIL=\"$email\">>$CRED
echo SAVED_WORKFLOW=$workflow>>$CRED

echo "Created .gitconfig for ( $name : $email )"
if [[ "$workflow" == "true" ]]; then echo "Workflow: true"; fi

read -p "Press any key to continue..." -n1 -s
#
# echo "workflow: $workflow, email: $email, name: $name"
