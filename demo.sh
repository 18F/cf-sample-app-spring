#!/usr/bin/env bash

########################
# include the magic
########################
. .demo-magic/demo-magic.sh


########################
# Configure the options
########################

#
# speed at which to simulate typing. bigger num = faster
#
# TYPE_SPEED=20

#
# custom prompt
#
# see http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html for escape sequences
#
DEMO_PROMPT="${GREEN}➜ ${CYAN}\W "

# hide the evidence
clear

# put your demo awesomeness here
pe "cf help"

[ -d cf-sample-app-spring ] && rm -rf cf-sample-app-spring/
pe "git clone https://github.com/18F/cf-sample-app-spring"

pe "cd cf-sample-app-spring"

p "cf login -a https://api.fr.cloud.gov --sso"

cat<<END
API endpoint: https://api.fr.cloud.gov

One Time Code ( Get one at https://login.fr.cloud.gov/passcode )>
Authenticating...
OK
END

pe "cf target -o demo-usda -s dev"

echo "view https://github.com/18F/cg-workshop/raw/master/images/app_push_flow_diagram_diego.png"

# pe "cf push"

# show a prompt so as not to reveal our true nature after
# the demo has concluded
p ""