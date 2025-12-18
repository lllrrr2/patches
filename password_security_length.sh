#!/bin/bash

file="./libs/hbb_common/src/password_security.rs"
func="pub fn temporary_password_length() -> usize {"

start_line=$(grep -n "$func" "$file" | head -1 | cut -d: -f1)
if [ -z "$start_line" ]; then
  echo "Function not found!"
  exit 1
fi

end_line=$((start_line + 10))
sed -i "${start_line},${end_line}d" "$file"

sed -i "${start_line}i\\
pub fn temporary_password_length() -> usize {\\
    1\\
}" "$file"
