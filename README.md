# junos_expect
it can be used to run multiple commands on multiple devices  and dump the output to tar.gz, this script uses expect and then ssh is used to login to individual devices

tools to run operational commands  on junos, including configurations

Usage: main.sh 
run the bash main.sh, the hostfile must be populated before hand with IP, username and password details. the commands.txt must be       populated by 'show commands'. The script will create a new folder with today's date and month and will add the results to that directory with each router's IP address as the filename for the result outputs.

set match_max 500000 to a higher number if the outputs of the commands are too long.
