!/bin/bash

# Script to ask use for file name of video to be converted (webm)
# And name of the output (mov)

echo 'Choose conversion type:'

select choice in 'MP4' 'MP4-Lossless' 'MOV'; do
	if [[ $choice == 'MP4' ]]; then
		selected='libx264 -crf 18 -preset slow -c:a aac' && filetype='.mp4'
	elif [[ $choice == 'MP4-Lossless' ]]; then
		selected='libx264 -crf 0 -preset slow -c:a copy' && filetype='.mp4'
	elif [[ $choice == 'MOV' ]]; then
		selected='prores -profile:v 3 -c:a copy' && filetype='.mov'
	fi
	break
done

echo You chose $choice

echo 'Please specify video file to be converted (include file type)'

input=$(find /home/robert/Videos -type f | fzf) 

echo 'Please specify output file name'

read output

ffmpeg -i $input -c:v $selected $output$filetype
