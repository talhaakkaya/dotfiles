# Aliases 
alias ls='ls -lhi --color'
alias nemo='nemo --no-desktop'

# Homestead VM Alias
# alias homestead='function __homestead() { (cd /media/Code/Homestead && vagrant $*); unset -f __homestead; }; __homestead'

# Open Alias
alias xo='xdg-open'

# Git Alias
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# ┌─[░░░]─[#talha]─[~/.ssh/hello]
# └─$

export GITAWAREPROMPT=~/.mta-dotfiles/bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

debian_chroot=${debian_chroot:+($debian_chroot)}
user_and_host="\[$bldblu\]#\u\[$txtrst\]"
where_am_i="\[$bldylw\]\w\[$txtrst\]"
time="\[$bldblk\]\t\[$txtrst\]" 

first_line="┌─${debian_chroot}│${time}│─│${user_and_host}│─│${where_am_i}│ \$git_branch \n"
second_line="└─\[$bldwht\]λ \[$txtrst\]"

export PS1=${first_line}${second_line}

