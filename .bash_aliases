# Aliases
alias ali="code -n ~/.bash_aliases"
alias upg="sudo apt update && sudo apt upgrade -y"
alias kth="cd /mnt/e/kth"
alias home="cd /mnt/c/Users/Pontus"

# Global variables
bold=$(tput bold)       # bold text
normal=$(tput sgr0)     # normal text

# C/C++
cex () {
    filename=$(basename -s .c $1)
    gcc $@ -o $filename && ./$filename
    if [ $? -eq 0 ]; then
        rm ./$filename
    else
        return $?
    fi
}
cexecute() {
    if [ $(stat -c%s "$1") -gt 6969 ]; then
        echo "COMMENCING ${bold}CEXECUTION!${normal}"
        cex $1
        if [ $? -eq 0 ]; then 
            echo "${bold}CEXECUTION${normal} FINNISHED SUCCESFULLY!"
        else
            echo "${bold}CEXECUTION${normal} FAILED MISSERABLY! PATHETIC!"
        fi
    else 
        echo "You do not command the power of The Schwartz!"
    fi
}

# Git
alias gs="git status"
glo () {
    git log --oneline -"$1"
}
gcam () {
    git commit -am "$1"
}

#KTH
alias con-kth="ssh psoderlu@student-shell-1.sys.kth.se"

# IS1500_dtek
alias mcb=". /opt/mcb32tools/environment"
mmmcbmi () {
    . /opt/mcb32tools/environment
    make 
    make install TTYDEV=/dev/ttyS"$1"
    if [-s *.c.o]; then
        rm *.c.o
    fi

    if [-s *.S.o ]; then
        rm *.S.o
    fi
    rm -rf /.deps
}
