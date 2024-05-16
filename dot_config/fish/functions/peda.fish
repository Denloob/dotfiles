function peda --wraps=gdb\ --eval-command\ \'init-peda\' --description alias\ peda=gdb\ --eval-command\ \'init-peda\'
  gdb --eval-command 'init-peda' $argv
end
