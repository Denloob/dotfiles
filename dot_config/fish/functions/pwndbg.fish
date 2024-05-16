function pwndbg --wraps=gdb\ --eval-command\ \'init-pwndbg\' --description alias\ pwndbg=gdb\ --eval-command\ \'init-pwndbg\'
  gdb --eval-command 'init-pwndbg' $argv
end
