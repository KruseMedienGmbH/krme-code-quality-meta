#!/bin/bash

composer config allow-plugins.symfony true
composer config allow-plugins.symfony/flex true
composer config allow-plugins.symfony/runtime true
composer config allow-plugins.phpstan/extension-installer false
composer config allow-plugins.bamarni/composer-bin-plugin true
composer config repositories.krme-code-quality-meta git https://github.com/KruseMedienGmbH/krme-code-quality-meta.git

# Installiert Symfony Flex in Version 2
composer require --dev symfony/flex "~2" --no-scripts --no-plugins

# Konfiguriert den Symfony Flex-Repository-Endpunkt
composer config extra.symfony --merge --json '{"endpoint": "https://raw.githubusercontent.com/KruseMedienGmbH/krme-recipes/flex/main/index.json","allow-contrib": false,"docker": false}'
composer config extra.bamarni-bin --merge --json '{"bin-links": false,"target-directory": "vendor-bin","forward-command": true}'

# Installiert das Paket "krme/code-quality-meta"
composer require --dev krme/code-quality-meta:6.6 --no-scripts --no-plugins
composer require --dev bamarni/composer-bin-plugin

# Aktualisiert die Symfony Flex-Rezepte
composer recipes:install krme/code-quality-meta --force

# Cleanup
sed -i '/"auto-scripts"/,+3 d' composer.json
rm .env .env.dev src/Kernel.php src/Controller/.gitignore
rm -rf bin config public templates translations
rm script.sh