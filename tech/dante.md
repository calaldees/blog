Dante Socks5 Proxy
==================

* https://www.digitalocean.com/community/tutorials/how-to-set-up-dante-proxy-on-ubuntu-20-04
* other
    * https://linuxize.com/post/how-to-setup-ssh-socks-tunnel-for-private-browsing/
    * https://first2host.co.uk/blog/set-up-socks5-proxy-server/
    * Firefox and chrome don't support username .. lame .. 

```bash
sudo nano /etc/danted.conf

sudo journalctl -u danted.service

systemctl status danted.service
sudo systemctl restart danted.service
sudo systemctl stop danted.service

curl -v -x socks5://45.152.210.188:1080 http://www.google.com/
curl -v -x socks5://dante_user:password@45.152.210.188:1080 http://www.google.com/
```

From https://www.digitalocean.com/community/tutorials/how-to-set-up-dante-proxy-on-ubuntu-20-04
```conf
logoutput: syslog
user.privileged: root
user.unprivileged: nobody

# The listening network interface or address.
internal: 45.152.210.188 port=1080

# The proxying network interface or address.
external: 45.152.210.188

# socks-rules determine what is proxied through the external interface.
#socksmethod: username
socksmethod: none

# client-rules determine who can connect to the internal interface.
clientmethod: none

client pass {
    from: 0.0.0.0/0 to: 0.0.0.0/0
}

socks pass {
    from: 0.0.0.0/0 to: 0.0.0.0/0
}
```


Chrome
------

Start Chome with Socks5 Proxy from commandline
```
"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --user-data-dir="%USERPROFILE%\proxy-profile" --proxy-server="socks5://45.152.210.188:1080"
```