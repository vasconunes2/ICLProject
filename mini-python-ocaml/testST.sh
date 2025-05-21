MINIPY=./minipython.exe

# Check if the script is being run from the correct directory
dos2unix ./Tests-StaticTyping/*.py

if [ ! -x "$MINIPY" ]; then
  echo "Error: $MINIPY not found or not executable"
  exit 1
fi

for f in Tests-StaticTyping/*.py; do
  echo "==> Testing $f"
  $MINIPY --debug "$f"
  echo

done
