# Installation

## Prerequisites
- Remove krmeshopware6pluginscripts require and repository, remove scripts from composer.json
- composer update

## Install
```bash
curl -s https://raw.githubusercontent.com/KruseMedienGmbH/krme-code-quality-meta/main/script.sh | bash

Invoke-WebRequest -Uri https://raw.githubusercontent.com/KruseMedienGmbH/krme-code-quality-meta/main/script.sh -OutFile script.sh
.\script.sh
```

## Clean Up
- Remove scripts.sh
