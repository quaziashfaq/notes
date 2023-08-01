This list includes a bunch of different commands that are useful to know when working with Linux. Not all of these commands are covered in the videos, so feel free to investigate them on your own.
# Learning bash
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

`set -o pipefail` -> It turns on the option to fail the whole commands tied with pipes if one of the command fails. For example,
`cat somefile.txt | uniq || exit 80` -> If `somefile.txt` does not exist, the left part of the OR (||) sign will fail and then the script will exit. It increases resiliency of the script.

`set -o noclobber` -> It turns on the option not to overwrite a file with '>' sign.

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


When a user starts a terminall session (tty), the tty will have a shell process running with a one-to-one relationship to between them. This shell is called is parent shell. 

Within the above parent shell, we run other commands and when they run in the prcoessor as processes, they get pid (process id).



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


=======
## Prefixes and Suffixes
```
$ name="Associate Dev-Ops Engineer"
$ echo ${name#a}
Associate Dev-Ops Engineer
$ echo ${name#Associate}
Dev-Ops Engineer
$ echo ${name% *}
Associate Dev-Ops
$ echo "${name#* }"
Dev-Ops Engineer
```

### Shortest and Longest match to remove.
```
$ path=/home/username/temp.txt
$ echo ${path#*/}
home/username/temp.txt
$ echo ${path##*/}
temp.txt

```

## Brace Expansion

```
$ touch {1..10}
$ touch {1..10..2}
$ ls
file1  file3  file5  file7  file9

ls -l file[1-9][1-9]
ls -l file{
```


## Special Shell Varialbles:
`$0` -> Name of the script being run
`$?` -> Returns exit code value
`$#` -> Number of arguments being passed to a script or function.
`$*` -> String of all argumnets being passed.
`$@` -> List/separated values of all arguments being passed.
`$$` -> current process ID.
`$!` -> ID of the __last__ backgroupnd job.
`$-` -> Contains flags in use by your script.

## IFS
IFS=$' \t\n'
ANSI-C Quoting

A  --  signals  the end of options and disables further option processing.  Any arguments after the -- are treated as filenames and argu‐
                 ments.  An argument of - is equivalent to --.


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

## Learn `uniq -c`
### kodekloud solution
```
#!/bin/bash
set -o pipefail

logfile="/etc/logs/error.log"

echo "Number of times each error message appears:"
cat "${logfile}" | grep "ERROR" | sort  | uniq  -c || { echo "Error encountered in pipe commands" >&2; exit 1; }

exit 0
```

### My solution
```
#!/bin/bash
set -o pipefail
set -o noclobber

logfile="/etc/logs/error.log"

echo "Number of times each error message appears:"

errorline="ERROR: DB_CONN_FAILURE: Connection to database failed"
count=$(cat "$logfile" | grep -o "$errorline" | wc -l) || exit 1
echo "<${count}> ${errorline}"
```

## Exmaples of Heredocs
### Read a file remotely with Heredocs
```
$ ssh -T bob@node01 bash "<<EOF 
cat /home/bob/docker_files/backup/sql_files/schema.sql
EOF"
CREATE DATABASE "employees";
\c employees

CREATE TABLE "employee" (
"id_employee" int PRIMARY KEY,
"first_name" varchar,
"last_name" varchar,
"area" varchar,
"job_title" varchar,
"email" varchar
);

\c employees
INSERT INTO "employee"(id_employee, first_name, last_name, area, job_title, email) VALUES ('01', 'Kriti', 'Shreshtha', 'Finance', 'Financial Analyst', 'kriti shreshtha@company.com');
INSERT INTO "employee"(id_employee, first_name, last_name, area, job_title, email) VALUES ('02', 'Rajasekar', 'Vasudevan', 'Finance', 'Senior Accountant', 'rajasekar.vasudevan@company.com');
INSERT INTO "employee"(id_employee, first_name, last_name, area, job_title, email) VALUES ('03', 'Debbie', 'Miller', 'IT', 'Software Developer', 'debbie.miller@company.com');
INSERT INTO "employee"(id_employee, first_name, last_name, area, job_title, email) VALUES ('04', 'Enrique', 'Rivera', 'Marketing', 'Marketing Specialist', 'enrique.rivera@company.com');
INSERT INTO "employee"(id_employee, first_name, last_name, area, job_title, email) VALUES ('05', 'Feng', 'Lin', 'Sales', 'Sales Manager', 'feng.lin@company.com');
SELECT * FROM "employee";
```



### Show tables in a docker container remotely with Heredocs
```
[bob@student-node ~]$ ssh -T bob@node01 << EOF
sudo docker ps
sudo docker exec -i my_postgres_container bash -c "psql -U postgres -d employees << EOF
> select * from employee;
> EOF"
> EOF
CONTAINER ID   IMAGE               COMMAND                  CREATED          STATUS          PORTS                    NAMES
d97ad94704a9   my_postgres_image   "docker-entrypoint.s…"   11 minutes ago   Up 11 minutes   0.0.0.0:5432->5432/tcp   my_postgres_container
id_employee | first_name | last_name |   area    |      job_title       |              email
-------------+------------+-----------+-----------+----------------------+---------------------------------
   1 | Kriti      | Shreshtha | Finance   | Financial Analyst    | kriti shreshtha@company.com
   2 | Rajasekar  | Vasudevan | Finance   | Senior Accountant    | rajasekar.vasudevan@company.com
   3 | Debbie     | Miller    | IT        | Software Developer   | debbie.miller@company.com
   4 | Enrique    | Rivera    | Marketing | Marketing Specialist | enrique.rivera@company.com
   5 | Feng       | Lin       | Sales     | Sales Manager        | feng.lin@company.com
(5 rows)
```

### Finding a piece of data and writing to a file.
```
[bob@student-node ~]$ ssh -T bob@node01 << EOF
sudo docker exec -i my_postgres_container bash -c "psql -U postgres -d employees << EOF
\pset tuples_only on
select email from employee where first_name='Kriti';
EOF" >> /home/bob/kodekloud/employee1_email.txt
EOF
    email
kriti shreshtha@company.com
(1 row)
```

### Spinning Wheel
```
[bob@student-node ~]$ cat spinning.sh
#!/usr/bin/env bash

spin='-\|/'

i=0
while [[ true ]]; do
printf "\r${spin:$((i%4)):1}"
sleep 0.1
((i++))
done

exit 0
```

### Changing data with file descriptor and Heredocs
```
[bob@student-node ~]$ ssh -T bob@node01 <<EOF
exec 20<> /home/bob/kodekloud/employee1_email.txt
read -n 5 <& 20
echo -n "." >& 20
echo 20>&-
cat /home/bob/kodekloud/employee1_email.txt
EOF

kriti.shreshtha@company.com
```

## Removig and prefixes and suffixes.
### Study the examples:
```
$ filepath="/home/vagrant/test_name.txt.bak"
$ echo ${filepath%.*}
/home/vagrant/test_name.txt
$ echo ${filepath%%.*}
/home/vagrant/test_name

$ echo ${filepath#*/}
home/vagrant/test_name.txt.bak
$ echo ${filepath##*/}
test_name.txt.bak
```

### Extreme example
```
#!/bin/bash
url="https://github.com/jcroyoaun/kodekloud-lab-sample-nodejs/blob/master/app.js"
raw_url_step1="${url/github.com/raw.githubusercontent.com}"
#code for
prefix="${raw_url_step1%%blob*}"
suffix="${raw_url_step1#*blob/}"
echo "${prefix}"
echo "${suffix}"

raw_url="${prefix}${suffix}"
#echo "Raw URL: ${raw_url}"
curl "${raw_url}"
exit 0
```


## Some educational scripts
- [A test deployment scrip](test-deploy-ecommerce-application.sh)
- [Spinning wheel](spinning.sh)
- [Package Download with Spinning wheel](package.sh)
- [Count open connections](./count_connections.sh)

