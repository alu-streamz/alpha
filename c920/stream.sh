#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

TARGET_IP=${2?"missing target ip"}
PROG_START_CMD="./gst_start.sh $TARGET_IP"


stopStream() {
        if [ -f $DIR/pid ]; then
                pkill -KILL -P `cat $DIR/pid`
                kill -SIGKILL `cat $DIR/pid`
        fi
}

startStream() {
        #stop any running process first
        stopStream

        #start new process
        nohup $PROG_START_CMD &
        echo $! > $DIR/pid
}



case "$1" in
  start)
    echo "video stream should start in a few seconds"
    startStream
  ;;
  stop)
    echo "video stream should stop in a few seconds"
    stopStream
  ;;
  *)
    echo "usage: stream.sh start|stop [target_ip]"
  ;;
esac
exit 0
