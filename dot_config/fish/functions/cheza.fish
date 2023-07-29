function cheza --wraps='chezmoi apply -v' --description 'alias cheza chezmoi apply -v'
  chezmoi apply -v $argv
end

# Quiet version
function chezaq --wraps='chezmoi apply' --description 'alias cheza chezmoi apply'
  chezmoi apply $argv
end
