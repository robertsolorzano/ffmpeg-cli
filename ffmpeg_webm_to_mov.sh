!/bin/bash

# Script to ask use for file name of video to be converted (webm)
# And name of the output (mov)

echo 'Please specify video file to be converted (include file type)'

read input

echo 'Please specify output file name (include file type)'

read output

echo running script

ffmpeg -i $input -c:v prores -profile:v 3 -c:a copy $output

