<h1>Born2beroot</h1>

<p>"This project aims to introduce you to the wonderful world of virtualization. You will create your first machine in VirtualBox (or UTM if you can’t use VirtualBox) under specific instructions. Then, at the end of this project, you will be able to set up your own operating system while implementing strict rules."</p>

<p>I followed gemartins's tutorial: https://github.com/gemartin99/Born2beroot-Tutorial</p>
<p>I also followed Joao's alternative tips on some aspects of the tutorial: https://github.com/jpjpcs/42_born2beroot</p>

<br>

<p>The main change that I made in my VM was the display of the script. The project subjects states that "at server startup, the script will display some information on all terminals every 10 minutes".</p>
<p>By adding "*/10 * * * * bash /home/user/monitoring.sh" to the crontab file, this instructs cron to display the script at every minute 10th minute of the hour (ex: 09:10, 09:20, 09:30).</p>
<p>To fix this, I created a second script to delay the display taking into account the server startup time.</p>
