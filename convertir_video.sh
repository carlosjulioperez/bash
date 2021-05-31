# https://superuser.com/questions/1041816/combine-one-image-one-audio-file-to-make-one-video-using-ffmpeg

# ffmpeg -loop 1 -y -i image8.jpg -i sound11.amr -shortest -acodec copy -vcodec mjpeg result.avi

ffmpeg -loop 1 -i se_valiente.jpg -i se_valiente.mp4 -c:v libx264 -tune stillimage -c:a aac -b:a 192k -pix_fmt yuv420p -shortest out.mp4
