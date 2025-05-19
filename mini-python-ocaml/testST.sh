MINIPY=./minipython.exe

if [ ! -x "$MINIPY" ]; then
  echo "Error: $MINIPY not found or not executable"
  exit 1
fi

for f in Tests-StaticTyping/*.py; do
  echo "==> Testing $f"
  $MINIPY --debug "$f"
  echo
done
