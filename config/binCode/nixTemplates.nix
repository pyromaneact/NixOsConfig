{ pkgs }:

pkgs.writeShellScriptBin "template" ''
#check if a local template directory exsists
if [ -d ../template ]; then
# code for setting the target Directory to the local templates folder
DIRECTORY=../template
else
# code for setting the generic folder
DIRECTORY=~/brain/openSourceEchosystem/software/nix/templates/genericTemplate
fi
# copy Files across
cp -r $DIRECTORY/* ./

''
