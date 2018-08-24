#!/bin/bash
# Basic pre-commit script

EXIT_CODE=0

chmod +x ./.deploy/commands/*.sh

# Sensiolabs Security Checker
./.deploy/commands/security_checker.sh || EXIT_CODE=1

# PHP Lint
./.deploy/commands/parallel_lint.sh || EXIT_CODE=1

# PHPUnit
#./.deploy/commands/phpunit.sh || EXIT_CODE=1

# PHP CodeSniffer
./.deploy/commands/phpcs.sh || EXIT_CODE=1

# PHP Mess Detector
./.deploy/commands/phpmd.sh || EXIT_CODE=1

[ $EXIT_CODE -ne 0 ] &&
echo -e "\n\t************************************************\n\t*  PRE-COMMIT HOOK FAILED (see reasons above)  *\n\t************************************************" ||
echo -e "\n\t*********************************************\n\t*  PRE-COMMIT HOOK PASSED, ready to commit  *\n\t*********************************************"

exit $EXIT_CODE