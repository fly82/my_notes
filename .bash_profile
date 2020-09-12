# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi
# User specific environment and startup programs
WEBHOOK_URL='https://outlook.office.com/webhook/<UUID>@<UUID>/IncomingWebhook/<HASH>/<UUID>' #copy url from connectors channel teams
[[ -p /tmp/teams ]] || mkfifo /tmp/teams
while :; do curl -s -o /dev/null -X POST -H 'Content-Type: application/json' -d "{\"text\": \"$(cat < /tmp/teams)\"}" ${WEBHOOK_URL} ; done &
export TEAMS=/tmp/teams
