#! /bin/bash
while read line
do
	base_name=$(basename $line .mp4)
	#echo $base_name
	#echo $1"/"$line
	val=`expr $base_name % 5`
	if [ "$val" -eq "$2" ]
	then
		#echo $val
		ffmpeg -i $1"/"$line -vf fps=fps=1/2 -f image2 "train_data_yolov_image/"$base_name"-%05d.jpeg" </dev/null
	fi
done