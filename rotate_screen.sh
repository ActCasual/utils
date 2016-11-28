#!/bin/bash

# FIXME: allow relative path to screen_state file
# FIXME: create default screen_state file if not present or mangled
. /home/wahoosteve/rotate_screen/screen_state # load current screen rotation state

states=( normal left )

#touchStates=( none ccw ) # only matters for touchscreen

#matrix=( "1 0 0 0 1 0 0 0 1" "0 -1 1 1 0 0 0 0 1") # this only matters for touchscreen input

# find index of current state
i=9999
for n in 0 1; do
 echo ${state}
 echo ${states[$n]}
 if [ "${state}" == "${states[$n]}" ]; then
  echo $n
  i=$n
  break
 fi
done

# increment state index
i=$((i+1))
if [ $i == 2 ]; then
 i=0;
fi

echo $i

# rotate screen to new state
state=${states[$i]}
echo $state
xrandr --output DP1 --rotate $state

# write new state to file
line="state=${state}"
echo $line > /home/wahoosteve/rotate_screen/screen_state
