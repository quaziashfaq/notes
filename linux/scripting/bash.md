This list includes a bunch of different commands that are useful to know when working with Linux. Not all of these commands are covered in the videos, so feel free to investigate them on your own.

# Managing files and directories
Creating useful aliases and add them in $HOME/.bashrc
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


Copying dot-files (hidden files) without creating a new directory in the target locaiton
`$ cp -rv /etc/skel/. /home/bob/data`


chmod modifiers files: changes the permissions for the files according to the provided modifiers; we've seen +x to make the file executable
*chown user files*: changes the owner of the files to the given user
chgrp group files: changes the group of the files to the given group

* Operating with the content of files
cat file: shows the content of the file through standard output
wc file: counts the amount of characters, words, and lines in the given file; can also count the same values of whatever it receives via stdin
file file: prints the type of the given file, as recognized by the operating system
head file: shows the first 10 lines of the given file
tail file: shows the last 10 lines of the given file
less file: scrolls through the contents of the given file (press "q" to quit)
sort file: sorts the lines of the file alphabetically
cut -dseparator -ffields file: for each line in the given file, splits the line according to the given separator and prints the given fields (starting from 1)

* Additional commands
echo "message": prints the message to standard output
date: prints the current date
who: prints the list of users currently logged into the computer
man command: shows the manual page of the given command; manual pages contain a lot of information explaining how to use each command (press "q" to quit)
uptime: shows how long the computer has been running
free: shows the amount of unused memory on the current system


* Managing streams
These are the redirectors that we can use to take control of the streams of our programs

command > file: redirects standard output, overwrites file
command >> file: redirects standard output, appends to file
command < file: redirects standard input from file
command 2> file: redirects standard error to file
command1 | command2: connects the output of command1 to the input of command2

* Operating with processes
These are some commands that are useful to know in Linux when interacting with processes. Not all of them are explained in videos, so feel free to investigate them on your own.

ps: lists the processes executing in the current terminal for the current user
ps ax: lists all processes currently executing for all users
ps e: shows the environment for the processes listed

Signals are tokens delivered to running processes to indicate a desired action.
kill PID: sends the SIGTERM signal to the process identified by PID
kill -l: To print the list of signals
fg: causes a job that was stopped or in the background to return to the foreground
bg: causes a job that was stopped to go to the background
jobs: lists the jobs currently running or stopped
top: shows the processes currently using the most CPU time (press "q" to quit)

* Interesting commands
cat /var/log/syslog | cut -d' ' -f5- | sort  | uniq -c | sort -nr | less
