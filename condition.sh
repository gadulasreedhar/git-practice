#!/bin/bash
DAY=$(date +%A)
echo "$DAY"
echo "Today day is: $(date +%A)"
if [ $DAY = Sunday ] || [ $DAY = Saturday ]
then
    echo "No class"
else
    echo "Attend class"
fi



