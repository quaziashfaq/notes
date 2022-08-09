# Managing files and directories
### Creating useful aliases and add them in $HOME/.bashrc
```
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias l='ls -CF'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'

#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'

```


### Copying dot-files (hidden files) without creating a new directory in the target locaiton
`$ cp -rv /etc/skel/. /home/bob/data`


chmod modifiers files: changes the permissions for the files according to the provided modifiers; we've seen +x to make the file executable
*chown user files*: changes the owner of the files to the given user
chgrp group files: changes the group of the files to the given group


