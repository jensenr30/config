# config

- Synchronize files - controlled by `.gitignore`
-  `.*rc`
- `.bashrc`
- `.alias.sh`
- `.config/`
- `.jensenr30/install/`
- `bin/`

## Init

```
git clone https://github.com/jensenr30/config.git
rsync -a config/ $HOME 
rm -rf config/
bash
```
