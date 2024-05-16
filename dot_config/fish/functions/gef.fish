function gef --wraps=gdb\ --eval-command\ \'init-gef\' --description alias\ gef=gdb\ --eval-command\ \'init-gef\'
  gdb --eval-command 'init-gef' $argv
end
