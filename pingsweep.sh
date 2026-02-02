#!/bin/bash
# Ping sweep the Lab

# base="onyxnode"

function printHelp(){
	echo "Ping Sweep for Onyx nodes script overview:"
	echo "Usage: $0 [-h] [-p]"
	echo "[-h] Displays this help menu and exits program."
	echo "[-p] Ping sweeps through all avaiable Onyx nodes from onyxnode1 to 200 and then logs the results to a file"
}

function pingSweep(){
	local base = "onyxnode"
	for q in {1..200}
		do
			curr="$base$q"
			ping -c 1 $curr >> ping.log
		done
}


function main(){
	while getopts ":hp" opt; do
		case ($opt) in
		h)
		    printHelp
			;;
		p)
			echo "Beginning Ping Sweep!"
			pingSweep
			echo "Done!"
			;;
		\?)
			echo "Invalid option detected! -$OPTARG" >&2
			printHelp
			exit 0
			;;

		esac
	done
	shift $((OPTIND -1))
}

if [ $# -eq 0]; then
	printHelp
else
	main


