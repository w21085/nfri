**In Linux, there is two parts for the video driver, the kernel part and the X server part.**

Let's identify your hardware first. By typing lspci | grep VGA in a terminal, you should see a line with you graphic card description (even if not configured at all).   
Let's check the correct kernel driver is loaded find /dev -group video.   
Let's check the correct X driver is loaded glxinfo | grep -i vendor.   
If you want more help, I would like the result of following commands:    
(Remember, never trust command line that people ask you to execute without knowing what it does.)   

```
lspci | grep VGA
lsmod | grep "kms\|drm"
find /dev -group video
cat /proc/cmdline
find /etc/modprobe.d/
cat /etc/modprobe.d/*kms*
ls /etc/X11/xorg.conf
glxinfo | grep -i "vendor\|rendering"
grep LoadModule /var/log/Xorg.0.log
```
