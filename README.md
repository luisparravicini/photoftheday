README
------

Some months ago I started to use some of [National Geographic's Photo of the day](http://photography.nationalgeographic.com/photography/photo-of-the-day/) as wallpapers on my computer. Since then, I go to the site every now and then and check if there is new photos to download.

This script automates the task. It creates a list with all the urls for the available wallpaper images (from the current date to the first available (2009)).

With that list of urls you can then download them using *wget*:
    wget -i photos_urls.txt


