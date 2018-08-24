#!/bin/bash
# PHP githook script

# PHP CodeSniffer
./vendor/bin/phpcs --config-set colors 1 >> /dev/null
./vendor/bin/phpcs --config-set show_progress 1 >> /dev/null
./vendor/bin/phpcs --config-set show_warnings 1 >> /dev/null
./vendor/bin/phpcs . --ignore=config/*,vendor/*,database/*,_ide_helper* --runtime-set ignore_warnings_on_exit true --standard=./.deploy/phpcs_ruleset.xml
