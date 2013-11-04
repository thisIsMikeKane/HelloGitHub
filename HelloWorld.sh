# Create Git commits that spell out HELLO WORLD
#  when shown in the Git Hub profile contributions
#  (C) Michael Kane - Spring 2013

# Specify first date to start, then convert to epoch time
#  (Should be a Sunday)
START='2013/11/03 12:00:00 -0400'
START=$(date --date "$START" +%s)

# 1's specify which pixels should be filled to spell
#  HELLO WORLD from the days Sunday - Monday
PIXELS=(0 1 1 1 1 1 0 \
		0 0 0 1 0 0 0 \
		0 1 1 1 1 1 0 \
		0 0 0 0 0 0 0 \
		0 1 1 1 1 1 0 \
		0 1 0 1 0 1 0 \
		0 1 0 0 0 1 0 \
		0 0 0 0 0 0 0 \
		0 1 1 1 1 1 0 \
		0 0 0 0 0 1 0 \
		0 0 0 0 0 1 0 \
		0 0 0 0 0 0 0 \
		0 1 1 1 1 1 0 \
		0 0 0 0 0 1 0 \
		0 0 0 0 0 1 0 \
		0 0 0 0 0 0 0 \
		0 1 1 1 1 1 0 \
		0 1 0 0 0 1 0 \
		0 1 1 1 1 1 0 \
		0 0 0 0 0 0 0 \
		0 0 0 0 0 0 0 \
		0 1 1 1 1 0 0 \
		0 0 0 0 0 1 0 \
		0 0 0 0 1 0 0 \
		0 0 0 0 0 1 0 \
		0 1 1 1 1 0 0 \
		0 0 0 0 0 0 0 \
		0 1 1 1 1 1 0 \
		0 1 0 0 0 1 0 \
		0 1 1 1 1 1 0 \
		0 0 0 0 0 0 0 \
		0 1 1 1 1 1 0 \
		0 1 0 1 1 0 0 \
		0 1 1 1 0 1 0 \
		0 0 0 0 0 0 0 \
		0 1 1 1 1 1 0 \
		0 0 0 0 0 1 0 \
		0 0 0 0 0 1 0 \
		0 0 0 0 0 0 0 \
		0 1 1 1 1 1 0 \
		0 1 0 0 0 1 0 \
		0 0 1 1 1 0 0 \
		0 0 0 0 0 0 0 \
		0 0 0 0 0 0 0 \
		0 0 0 0 0 0 0)

# It takes 308 to spell HELLO WORLD using the pixels above
for i in {0..307} 
do
	if [ ${PIXELS[i]} -eq 1 ]
	then
		TODAY=$((START+60*60*24*i)) # Compute what day commit should be made
		
		# Say hello to the readme file
		echo -e "\nHello on $(date --date @$TODAY +'%A %B %e, %Y')" \
			>> README.md
		
		# Make the git commit
		git commit -a -m "Hello on $(date --date @$TODAY +'%A %B %e, %Y')" \
			--date "$(date --date @$TODAY +'%Y.%m.%dT%H:%M:%S -0400')"
	fi
done
	