amici-google
============

Disables all traffic to and from any of google's servers with iptables.

amici-google specifically targets google, which is nice because google is a big player with a lot of data on the world-wide-web. You can use this script to see just how much of an influence google has on your daily life, you could also use it to boycot google or try to ensure google is not tracking your on-line behaviour when you don't want to be watched. Google can be scary if you think about it too much, and it's only natural to feel that way every once in a while`[citation needed]`, amici-google maygive you some rest while you reflect on where the world is heading, it may even be a permanent solution to those wanting to go on a pelgrimage to a place without google.

This is the first attempt at an amici script, amici aims to foil the PRISM program that the American governement has been conducting in secret by simply allowing you to easily "boycot" the services it watches in an automated manner. Amici leverages the spf records provided by the corporates themselves to determine which addresses need to be be blocked, the blocking itself is done via `iptables` and `ip6tables`.

[Wikipedia:Amici](https://en.wikipedia.org/wiki/Amici_prism)

##Usage
Run the script like you would any program, no configuration possible at this point. once ran, the networks will remain prohibited until you reboot, unless you use some fancy `iptables-save`r.

###Disabling
amici-google has no option for disabling yet, but you can clear out the iptables rules it set up by issuing the command `iptables -F && ip6tables -F` though this method is a bit destructive. I'll come up with a cleaner way, soon!

##Limitations and Bugs
amici-google can only block google's services in a resonable manner due to the way it was designed, but it's a start!
