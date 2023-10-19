# Aliases
alias l='exa --long --git'
alias la='exa --long --icons --git --all'
alias lt='exa --tree --level=2 --long --icons --git'
alias cat='batcat'
alias c='clear'

# Git
alias g='git'
alias gst='git status'
alias gco='git checkout'
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'
alias gfp='git fetch && git pull'
alias gpf='git push --force-with-lease'
alias gri='git rebase -i'

# Poetry
alias p='poetry run invoke'
alias pr='poetry run'

# Neovim
alias n='nvim'

# Glab
alias gl='glab'

# Direnv
direnv hook fish | source

# bash ~/scripts/hello.sh

# from : https://gist.github.com/gerbsen/5fd8aa0fde87ac7a2cae
# content has to be in .config/fish/config.fish
# if it does not exist, create the file
setenv SSH_ENV $HOME/.ssh/environment

function start_agent                                                                                                                                                                    
    echo "Initializing new SSH agent ..."
    ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
    echo "succeeded"
    chmod 600 $SSH_ENV 
    . $SSH_ENV > /dev/null
    ssh-add
end

function test_identities                                                                                                                                                                
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $status -eq 0 ]
        ssh-add
        if [ $status -eq 2 ]
            start_agent
        end
    end
end

if [ -n "$SSH_AGENT_PID" ] 
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    end
else
    if [ -f $SSH_ENV ]
        . $SSH_ENV > /dev/null
    end
    ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    else
        start_agent
    end
end
