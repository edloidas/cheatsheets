ATOM_HOME="$HOME/.atom"

cp -R {config.cson,keymap.cson,styles.less} $ATOM_HOME

echo "Settings copied to $ATOM_HOME"
read -p "Press any key to continue... " -n1 -s
