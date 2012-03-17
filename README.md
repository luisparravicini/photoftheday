README
------

Some months ago I started to use some of [National Geographic's Photo of the day](http://photography.nationalgeographic.com/photography/photo-of-the-day/) as wallpapers on my computer. Since then, I go to the site every now and then and check if there is new photos to download.

This script automates the task. It creates a list with all the urls for the available wallpaper images, from the first available date (January 1, 2009) to the current date.

The script can be interrupted and on the following run it resumes from the last date processed. If you don't want this, and want to start again from the first day available, remove *last_url.txt*.

The photo's urls are stored in *photos_urls.txt*. With that list of urls you can then download them running *download.rb*:

    ruby download.rb <dir>

Where *dir* is the directory where photos will be stored. Only new photos will be downloaded.
