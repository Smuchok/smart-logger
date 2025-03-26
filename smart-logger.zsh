# === SMART LOGGER CONFIG ===
LOGDIR=~/my_logs/

LOGDIRDAY=$LOGDIR$(date +%F)
mkdir -p "$LOGDIRDAY"
LOGFILE="$LOGDIRDAY/my_log_$(date +%H-%M-%S).log"

logrun() {
    echo -e "\n[$(date '+%H:%M:%S')] ➜ $(pwd) \$ $*" | tee -a "$LOGFILE"
    "$@" 2>&1 | tee -a "$LOGFILE"
}

logs() {
    local today_dir=$LOGDIR$(date +%F)
    local prev_dir="$PWD"
    if [ -d "$today_dir" ]; then
        echo "Today logs in $today_dir:"
        cd "$today_dir" && ls -CF
        cd "$prev_dir"
    else
        echo 'No logs today:'
        cd "$LOGDIR" && ls -CF
    fi
}

alias logss="cd $LOGDIR; ls -CF"
alias runlog='logrun'
