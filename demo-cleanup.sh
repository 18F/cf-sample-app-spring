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
TYPE_SPEED=40

#
# custom prompt
#
# see http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html for escape sequences
#
DEMO_PROMPT="${GREEN}➜ ${CYAN}\W "

# hide the evidence
clear

# put your demo awesomeness here
pe "cf apps ; cf services ; cf routes"


pe "cf delete cf-spring -f"
pe "cf delete-service cf-spring-db -f"
pe "cf delete-orphaned-routes -f"
pe "cd $HOME/Projects/18f/cf-sample-app-spring"
pe "rm -rf cf-sample-app-spring"

# show a prompt so as not to reveal our true nature after
# the demo has concluded
p ""