#! /bin/bash
echo $VIRTUAL_ENV
designer_path=/lib/python3.11/site-packages/PySide6/designer
full_path="$VIRTUAL_ENV""$designer_path"

echo $full_path