# be root
sudo /bin/su -
# follow the log file
tail -f log
# check size
df -h
#check size for folder
du -s log -h
# remove all files with 2019* with a prompte
rm logstash-plain-2019*
# remove all files with 2019* force
# remove all files with within jan 2020
rm -f logstash-plain-2020-0[1]
# remove all files with within april/may 2020
rm -f logstash-plain-2020-0[34]
#Install and remove git
sudo apt install git-all
sudo apt-get remove git-all
sudo apt install git