#!/bin/bash

MOVIES=("Court" "HIT3" "PUSHPA2" "Thandel")




echo "First Movie: ${MOVIES[0]}"
echo "First Movie: ${MOVIES[3]}"
echo "First Movie: ${MOVIES[4]}"

echo "All movies: ${MOVIES[@]}"

echo "Number of variables: $#"
echo "Script name: $0"
echo "Current Directory: $PWD"
echo "User running this script: $USER"
echo "Home directory of user: $HOME"
echo "PID of the script: $$"
sleep 10 &
echo "PID of last command in background: $!"