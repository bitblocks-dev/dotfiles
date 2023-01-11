# !/usr/bin/env bash
# AUTHOR: gotbletu (@gmail|twitter|youtube|github|lbry)
#         https://www.youtube.com/user/gotbletu
# DESC:   turn any terminal into a dropdown terminal
# DEMO:   https://www.youtube.com/watch?v=mVw2gD9iiOg
# DEPEND: coreutils xdotool wmutils (https://github.com/wmutils/core | https://aur.archlinux.org/packages/wmutils-git/)
# CLOG:   2022-03-05   else statement to allow terminal to jump to current virtual desktop if is visible on another desktop
#         2022-02-28   added auto launch terminal if none running by https://github.com/aaccioly
#         2021-02-10   use comm to match window name and class, this avoids terminal windows with different names
#         2015-02-15   0.1
#
#   Modified by Bitblocks to use the more widely compatible xdotools
#   WARNING: Janky repeated move command based animation
my_term=kitty 

# get terminal emulator pid ex: 44040485
pid=$(xdotool search --class "$my_term" | tail -n1)

# start a new terminal if none is currently running
if [[ -z "$pid" ]]; then
    while IFS='|' read -ra TERMS; do
        for candidate_term in "${TERMS[@]}"; do
            if command -v "$candidate_term" &>/dev/null; then
                ${candidate_term} &>/dev/null &
                disown
                pid=$!
                break
            fi
        done
    done <<<"$my_term"
else
    # get windows id from pid ex: 0x2a00125%
    wid=$(printf 0x%x "$pid")

    #Focus the window and set the size
    xdotool windowfocus --sync "$wid"
    xdotool windowsize --sync "$wid" 1920 500

    #Determine if the window is mapped. If not, map the window and move it to its spot
    if [[ -z $(xdotool search --onlyvisible --class "kitty") ]]; then
        xdotool windowmap "$wid"
        for n in {-500..0..8}; do xdotool windowmove 0x5a0000f 0 $n; done
    else
        for n in {0..-500..10}; do xdotool windowmove 0x5a0000f 0 $n; done
        xdotool windowunmap "$wid"
    fi
fi
