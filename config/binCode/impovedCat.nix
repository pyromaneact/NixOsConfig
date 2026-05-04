{ pkgs }:

pkgs.writeShellScriptBin "cat" '' 
if [[ "$1" == *".md" ]]; then
mkdir /tmp/diagrams
${pkgs.mermaid-cli}/bin/mmdc -i $1 -o /tmp/diagrams/markdown.md -t dark -b transparent -e png > /dev/null
${pkgs.mdcat}/bin/mdcat /tmp/diagrams/markdown.md
rm /tmp/diagrams -r

else
${pkgs.coreutils-full}/bin/cat $1
fi
''
