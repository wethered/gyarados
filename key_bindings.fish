bind ! __gyarados_history_previous_command
bind '$' __gyarados_history_previous_command_arguments

# This is so hacky.....but init.fish is refusing to run for some reason.
if test -e ~/.config/kalima/record_session
	set -g GYARADOS_SHOULD_RECORD (cat ~/.config/kalima/record_session)
else
	set -g GYARADOS_SHOULD_RECORD "false"
end

if status is-interactive; and not set -q ASCIINEMA_REC; and test "$GYARADOS_SHOULD_RECORD" = "true"
	set -g ASCIINEMA_REC 1
	asciinema rec --append (cat ~/.config/kalima/project_home)/1_evidence/screenshot_(date +%F_%H-%M-%S).cast
else
	echo "[i] Disabling logging for new terminal sessions..."
	set -e -g ASCIINEMA_REC
end