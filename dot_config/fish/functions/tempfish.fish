function tempfish --description 'Creates a new shell in a temp folder'
    fish -C "cd (mktemp -d)"
end
