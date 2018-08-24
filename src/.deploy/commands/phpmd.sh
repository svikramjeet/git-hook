#!/bin/bash
# PHP githook script

# PHP Mess Detector
./vendor/bin/phpmd . text .deploy/phpmd_ruleset.xml --exclude vendor,_ide_helper.php,database,app/Console/Kernel.php,tests
RESULT=$?
[[ $RESULT -eq 0 ]] && echo "PHP Mess Detector check passed"

exit $RESULT