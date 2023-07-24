This list includes a bunch of different commands that are useful to know when working with Linux. Not all of these commands are covered in the videos, so feel free to investigate them on your own.

## Operating with the content of files
cat file: shows the content of the file through standard output
wc file: counts the amount of characters, words, and lines in the given file; can also count the same values of whatever it receives via stdin
file file: prints the type of the given file, as recognized by the operating system
head file: shows the first 10 lines of the given file
tail file: shows the last 10 lines of the given file
less file: scrolls through the contents of the given file (press "q" to quit)
sort file: sorts the lines of the file alphabetically
cut -dseparator -ffields file: for each line in the given file, splits the line according to the given separator and prints the given fields (starting from 1)

## Additional commands
echo "message": prints the message to standard output
date: prints the current date
who: prints the list of users currently logged into the computer
man command: shows the manual page of the given command; manual pages contain a lot of information explaining how to use each command (press "q" to quit)
uptime: shows how long the computer has been running
free: shows the amount of unused memory on the current system


## Managing streams
These are the redirectors that we can use to take control of the streams of our programs

command > file: redirects standard output, overwrites file
command >> file: redirects standard output, appends to file
command < file: redirects standard input from file
command 2> file: redirects standard error to file
command1 | command2: connects the output of command1 to the input of command2

## Operating with processes
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

## Interesting commands
cat /var/log/syslog | cut -d' ' -f5- | sort  | uniq -c | sort -nr | less

## Shell built-in process and other process
$ type echo
$ type time
$ type cat

$ time echo
$ time cat


## Find Process
$ pgrep -o bash

$ ps -ef | grep bash

$ sudo strace -Tfp $(pgrep -o bash) 2>&1 | grep -e 'execve' &
$ sudo strace -Tfp $$ 2>&1 | grep -e 'execve' &
$ echo 'Hello'
$ cat file.txt

## Guard Clause
### Rewriting a bad code example
Rather than writing bad nested if/else loops, we can rewrite them as gaurds before executing the actual code.

```
if [[ "$USER_NAME}" == "admin" ]]; then
    if [[ -e "${FILE_PATH}" ]]; then
        if [[ -s "${FILE_PATH}" ]]; then
            run_process
        else
            echo "File exists but is empty"
        fi
    else
        echo "file does not exist"
    fi
else
    echo "User is not admin"
fi

exit 0

```
The above code example is bad and hard to comprehend and debug.
The better way is as below.

```
if [[ ! "$USER_NAME}" == "admin" ]]; then
    echo "User is not admin"
    exit 1
fi

if [[ ! -e "${FILE_PATH}" ]]; then
    echo "File does not exist"
    exit 1
fi

if [[ ! -s "${FILE_PATH}" ]]; then
    echo "File exists but is empty"
    exit 1
fi

run_process
exit 0
```
### Oneliner guard clause example
```
[[ -e ${filename} ]] || {echo "File does not exist"; exit 1;}
[[ -z ${1} ]] && {echo "Argument is empty"; exit 1;}
[[ -f "${filename}" ]] || {echo "File does not exist."; exit 1;}
```



# Some bash scripts
## counting 
```
$ cat count-requests.sh 

echo -e " Log name   \t      GET      \t      POST    \t   DELETE "
echo -e "------------------------------------------------------------"

for app_name in $(cat /tmp/assets/apps.txt)
do
        filename="/var/log/apps/${app_name}_app.log"
        get_requests=$(cat ${filename} | grep "GET" | wc -l)
        post_requests=$(cat ${filename} | grep "POST" | wc -l)
        delete_requests=$(cat ${filename} | grep "DELETE" | wc -l)
        echo -e " ${app_name}    \t ${get_requests}    \t    ${post_requests}   \t   ${delete_requests}"
done
```
## List of some other scripts
 - [A test deployment script](test-deploy-ecommerce-application.sh)
 - [Count open connections](./count_connections.sh)


