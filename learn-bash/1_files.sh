cp --help
cp file.txt new_file.txt
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
# display output one screen at a time
more file.txt
