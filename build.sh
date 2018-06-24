#!/bin/bash

repo-add katio.db.tar.gz ../pkg-yaourt/*.pkg.tar.gz

rm katio.db
rm katio.files

mv katio.db.tar.gz katio.db
mv katio.files.tar.gz katio.files

cat << 'EOF' > README.md

# pacman.conf

```
[katio]
SigLevel = Never
Server = https://github.com/onokatio/archlinux-katio/raw/master
```

# Packages

```
EOF

ls ../pkg-yaourt/*.pkg.tar.gz|cut -d '/' -f 3 >> README.md

echo '```' >> README.md
