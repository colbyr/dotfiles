current="$(pwd)"
home="/home/colby"
tmp="$current/btsync_update.tmp"
mkdir $tmp
cd $tmp

# stop the current running process
kill -9 $(pgrep btsync)
rm $home/btsync

# download and unzip the version
wget "http://download-lb.utorrent.com/endpoint/btsync/os/linux-i386/track/stable"
tar -zxvf "$tmp/stable"
mv "$tmp/btsync" "$home/btsync"

# start a new instance
~/btsync --config "$home/.sync/conf"

# cleanup
cd $current
rm -rf $tmp