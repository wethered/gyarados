  if test -e ~/.config/kalima/record_session
    set -gx GYARADOS_SHOULD_RECORD (cat ~/.config/kalima/record_session)
  else
    set -gx GYARADOS_SHOULD_RECORD "false"
  end

  if status is-interactive; and not set -q ASCIINEMA_REC; and test "$GYARADOS_SHOULD_RECORD" = "true"
    set -gx ASCIINEMA_REC 1
    asciinema rec (cat ~/.config/kalima/project_home)/1_evidence/screenshot_(date +%F_%H-%M-%S).cast
  else
    set -e ASCIINEMA_REC
  end

  echo "I am properly running! Here is the recording status: $GYARADOS_SHOULD_RECORD"

  echo $package

  set -gx MYPACKAGE $package