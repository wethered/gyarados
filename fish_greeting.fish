function fish_greeting
  set_color $fish_color_autosuggestion
  
  if test -e ~/.config/kalima/record_session
    set -l should_record (cat ~/.config/kalima/record_session)
  else
    set -l should_record "false"
  end

  if status is-interactive; and not set -q ASCIINEMA_REC; and test "$should_record" = "true"
    set -gx ASCIINEMA_REC 1
    asciinema rec (cat ~/.config/kalima/project_home)/1_evidence/screenshot_(date +%F_%H-%M-%S).cast
  end

  echo "I am properly running! Here is the recording status:"
  echo $should_record

  set_color normal
end