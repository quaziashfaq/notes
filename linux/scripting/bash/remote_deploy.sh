#!/usr/bin/env bash

file_url="https://raw.githubusercontent.com/kodekloudhub/solar-system-9/main/app.tar.gz"
remote_dir="/home/bob/nodejs/kodekloud-lab6"
remote_user="bob"
remote_server=localhost

spin_script_path="/home/bob/spinning.sh"

# Function to start the spinner
start_spinner()  {
echo  "Beginning the Package Download..."
source  "${spin_script_path}"  &
spin_pid=$!
}


download_file()  {
  # Add the commands to wget the file_url into remote_dir, and then untar the file in there.
  for server in $remote_server; do
  ssh  "${remote_user}@${remote_server}"  <<EOF
    cd ${remote_dir}
    wget -q "${file_url}"
    tar -xzvf app.tar.gz
    mv app/* .
    ## Add new code here

    npm install > /dev/null 2>&1
    node app1.js > /dev/null 2>&1 &
    node app2.js > /dev/null 2>&1 &
    node app3.js > /dev/null 2>&1 &
EOF
done
}

stop_spinner()  {
  kill  "${spin_pid}"
  echo  "Download complete!"
}
download_file
