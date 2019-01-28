export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin

# Contains alias
source ~/.profile
source ~/.bash_python

# Virtualenvwrapper stuff
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

parse_git_reponame() {
    BRANCH_NAME=$(git remote show origin -n 2> /dev/null | grep h.URL | sed 's/.*://;s/.git$//')

    # Replace origin if name is origin
    REPO_DIR_NAME=$(git rev-parse --show-toplevel 2> /dev/null)
    if [ -z "$REPO_DIR_NAME" ]
    then
        REPO_DIR_NAME="\\w"
    else
        REPO_DIR_NAME=$(basename "$REPO_DIR_NAME")
    fi

    if [ -z "$BRANCH_NAME" ]
    then
        echo $(pwd)
    else
        echo $BRANCH_NAME | sed "s/origin/$REPO_DIR_NAME/"
    fi
}


export EDITOR="vim"
export PS1="\u > \[\033[32m\]\$(parse_git_reponame)\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH=$PATH:$GOBIN

export PATH="/usr/local/opt/scala@2.11/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
