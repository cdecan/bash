#!/bin/bash
#
# bad_dirs.sh: List incorrectly named directories

# list directories with spaces
spaces=$(find . -maxdepth 1 -type d -regex '.* .*' -print | sort)
if [[ -n $spaces ]]; then
  echo "Filenames with spaces:"
  echo "$spaces"
fi

# list directories with unusual characters
unusual=$(find . -maxdepth 1 -type d -regex '\./.*[^-_a-zA-Z0-9 ].*' -print | sort)
if [[ -n $unusual ]]; then
  echo "Filenames with unusual characters:"
  echo "$unusual"
fi

# list directories without _ between names
separated=$(find . -maxdepth 1 -type d -regex '.*[a-z][A-Z].*' -print | sort)
if [[ -n $separated ]]; then
  echo "Filenames that might have incorrectly separated names:"
  echo "$separated"
fi

# list all changes to be made
combined=$(find . -maxdepth 1 -type d -regex '.* .*' -print -o -type d -regex '\./.*[^-_a-zA-Z0-9 ].*' -print | sort)
echo "Directories that should be renamed:"
if [[ -n $combined ]]; then
  echo "$combined"
else
  echo "None"
fi
