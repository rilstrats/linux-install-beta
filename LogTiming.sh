if [ ! -d "Documents/LogTiming" ]
then
    mkdir Documents/LogTiming
    ln LogTiming.sh Documents/LogTiming/LogTiming.sh
fi

echo "What day are you logging and timing?"
read day
script -a --timing=Documents/LogTiming/day$day.timing Documents/LogTiming/day$day.log