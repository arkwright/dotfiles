export PS1="\W $ "

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pip3 homebrew compatibility
# brew install python3
export PATH="/Users/arkwright/Library/Python/3.8/bin:$PATH"

eval "$(ssh-agent -s)"
