#!/bin/bash
#
BASE=`pwd`
APP_BASE="/home/metatron/servers/metatron-integrator"
#DATA_BASE=/data/log/metatron-integrator
DATA_BASE=$APP_BASE
PID=$APP_BASE/var/app.pid
LOG=$DATA_BASE/app.log
ERROR=$DATA_BASE/app-error.log
HADOOP_HOME=/etc/hadoop/conf
RUNNABLEUSER=metatron
 
#COMMAND="java -server -Xms2g -Xmx2g -classpath $HADOOP_HOME/core-site.xml:$HADOOP_HOME/hdfs-site.xml:$HADOOP_HOME/mapred-site.xml:$HADOOP_HOME/yarn-site.xml -Dspring.profiles.active=prod -jar $APP_BASE/bin/integrator-0.0.1-SNAPSHOT.war"
COMMAND="java -server -Xms2g -Xmx2g -classpath $HADOOP_HOME/core-site.xml:$HADOOP_HOME/hdfs-site.xml:$HADOOP_HOME/mapred-site.xml:$HADOOP_HOME/yarn-site.xml -Dspring.profiles.active=prod -jar $APP_BASE/bin/integrator-0.0.1-SNAPSHOT.war"
 
USR=`id -u -n`
 
if [ $USR != $RUNNABLEUSER ]
then
    echo ""
    echo "Error: The execute user must be "$RUNNABLEUSER". Please change user"
    echo ""
    exit 1
fi

status() {
    echo
    echo "==== Status"

    if [ -f $PID ]
    then
        echo
        echo "Pid file: $( cat $PID ) [$PID]"
        echo
        ps -ef | grep -v grep | grep $( cat $PID )
    else
        echo
        echo "No Pid file"
    fi
}

start() {
    if [ -f $PID ]
    then
        echo
        echo "Already started. PID: [$( cat $PID )]"
    else
        echo "==== Start"
        touch $PID
        if nohup $COMMAND >>$LOG 2>&1 &
        then echo $! >$PID
             echo "Done."
             echo "$(date '+%Y-%m-%d %X'): START" >>$LOG
        else echo "Error... "
             /bin/rm $PID
        fi
    fi
}

kill_cmd() {
    SIGNAL=""; MSG="Killing "
    while true
    do
        LIST=`ps -ef | grep -v grep | grep $CMD | grep -w $USR | awk '{print $2}'`
        if [ "$LIST" ]
        then
            echo; echo "$MSG $LIST" ; echo
            echo $LIST | xargs kill $SIGNAL
            sleep 2
            SIGNAL="-9" ; MSG="Killing $SIGNAL"
            if [ -f $PID ]
            then
                /bin/rm $PID
            fi
        else
           echo; echo "All killed..." ; echo
           break
        fi
    done
}

stop() {
    echo "==== Stop"

    if [ -f $PID ]
    then
        if kill $( cat $PID )
        then echo "Done."
             echo "$(date '+%Y-%m-%d %X'): STOP" >>$LOG
        fi
        /bin/rm $PID
        kill_cmd
    else
        echo "No pid file. Already stopped?"
    fi
}

case "$1" in
    'start')
            start
            ;;
    'stop')
            stop
            ;;
    'restart')
            stop ; echo "Sleeping..."; sleep 1 ;
            start
            ;;
    'status')
            status
            ;;
    *)
            echo
            echo "Usage: $0 { start | stop | restart | status }"
            echo
            exit 1
            ;;
esac

exit 0

