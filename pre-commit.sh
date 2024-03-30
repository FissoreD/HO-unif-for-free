#!/usr/bin/env bash

PRECOMMIT_PATH=".git/hooks/pre-commit"
PRECOMMIT_TEXT="#!/usr/bin/env bash\n./pre-commit.sh"

touch $PRECOMMIT_PATH & 
chmod u+x $PRECOMMIT_PATH & 
echo -e $PRECOMMIT_TEXT > $PRECOMMIT_PATH

make test >& /tmp/unif-log
RESULT=$?

cat /tmp/unif-log | grep -A100 "SOME.*FAIL"

if [[ ${RESULT} -ne 0 ]]
then
    RED='\033[0;31m'
    printf "${RED}Unit tests failed. Commit rejected\n"
fi
exit ${RESULT}
