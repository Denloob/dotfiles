function crp --description "Copies the RealPath of the argument into the clipboard"
  if test -z "$argv[1]"
    set target "$PWD"
  else
    set target (realpath "$argv[1]")
  end

  echo -n "$target" | xclip -sel clip
end
