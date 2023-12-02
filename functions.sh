function datestring {
    echo $(date +%d_%m_%y-%H_%M_%S)
}

function currdir {
    echo $(basename $(pwd))
}

function logfilename {
    echo "$(datestring).log";
}

function logfilepath {
    mkdir -p ~/.logs/$(currdir);
    echo ~/.logs/$(currdir)/$(logfilename);
}

function mlog {
    if [[ $# -eq 0 ]] ; then
        echo "Usage: mlog <cmd>";
        return
    fi
    
    if hash $1 2>/dev/null; then
        fpath=$(logfilepath)
        $@ 2>1 >> $fpath &
        disown $!;
        echo $! >> $fpath;
        # head -n 1 $fpath;
        unset fpath;
        return
    else
        echo $(hash $1);
        return
    fi
}

function glog {
    fnumber=0
    lfpath=~/.logs/$(currdir)/
    if [[ $# -eq 0 ]] ; then
        fnumber=1
    else
        if [[ $1 -le 0 ]] ; then 
            echo -e "Enter a number greater than 0...\n(The Number of logs prior to which you would like to visit)";
            unset fnumber;
            return
        fi
        fnumber=$1
        if [[ $(ls -l $lfpath | wc -l) -lt $fnumber  ]] ; then
            echo " There are only $(ls -l $lfpath | wc -l) number of logs for this directory...";
            unset fnumber;
            return
        fi
    fi

    lfname=$(ls -t $lfpath  | head -n $fnumber | tail -1)
    less $lfpath$lfname;

    unset fnumber lfname lfpath;
}

function llog {
    fnumber=0
    lfpath=~/.logs/$(currdir)/
    if [[ $# -eq 0 ]] ; then
        fnumber=1
    else
        if [[ $1 -le 0 ]] ; then 
            echo -e "Enter a number greater than 0...\n(The Number of logs prior to which you would like to watch)";
            unset fnumber;
            return
        fi
        fnumber=$1
        if [[ $(ls -l $lfpath | wc -l) -lt $fnumber  ]] ; then
            echo " There are only $(ls -l $lfpath | wc -l) number of logs for this directory...";
            unset fnumber;
            return
        fi
    fi

    lfname=$(ls -t $lfpath  | head -n $fnumber | tail -1)
    tail -f $lfpath$lfname;

    unset fnumber lfname lfpath;
}
