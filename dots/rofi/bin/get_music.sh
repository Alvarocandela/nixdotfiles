song=$(playerctl metadata title)
artist=$(playerctl metadata artist)

song=${song%-*}
song=${song%(Live*}
echo ${song} - ${artist}
