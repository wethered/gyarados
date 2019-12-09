#
# Asciinema: Record next session
#

function __gyarados_asciinema_record_next_session
	if test -e ~/.config/kalima/record_session
		set -g GYARADOS_SHOULD_RECORD (cat ~/.config/kalima/record_session)
	else
		set -g GYARADOS_SHOULD_RECORD "false"
	end

	if status is-interactive; and not set -q ASCIINEMA_REC; and test "$GYARADOS_SHOULD_RECORD" = "true"
		set -g ASCIINEMA_REC 1
		mkdir -p (cat ~/.config/kalima/project_home)/1_evidence
		asciinema rec (cat ~/.config/kalima/project_home)/1_evidence/screenshot_(date +%F_%H-%M-%S).cast
	else
		echo "[i] Disabling logging for new terminal sessions..."
		set -e -g ASCIINEMA_REC
	end
end