#!/bin/bash

file="./libs/hbb_common/src/password_security.rs"
func="pub fn temporary_password_length() -> usize {"

# 获取起始行号
start_line=$(grep -n "$func" "$file" | head -1 | cut -d: -f1)
if [ -z "$start_line" ]; then
  echo "Function not found!"
  exit 1
fi

# 删除从 start_line 开始的接下来 10 行（足够覆盖整个函数）
end_line=$((start_line + 10))
sed -i "${start_line},${end_line}d" "$file"

# 在原位置插入新函数
sed -i "${start_line}i\\
pub fn temporary_password_length() -> usize {\\
    1\\
}" "$file"
