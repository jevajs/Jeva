# 2 | FiveM - Configuring Your Server
__________
## Configuring

| Thing | How-to |
| ----- | ------ |
| Letting anyone globally join your server | [Port Forward](http://portforward.com) |
| Max. Players | **server.cfg** - `sv_maxclients <num>` *(32 is max)* |
| Server Name | **server.cfg** - `sv_hostname "Fear"` |
| Server Tags | **server.cfg** - `sets tags "seperate, different, tags, with, commas"` |
| Server icon/logo | **server.cfg** - `load_server_icon logo.png` *(where logo.png is in the same directory as the server.cfg)* |
| Allow Client-Sided Scripts | **server.cfg** - `sv_scriptHookAllowed 1` *(where 1 is on and 0 is off)* |
| Server/Connecting Banner | **server.cfg** - `sets banner_detail "http://thatziv.ddns.net/zgradient.png"` + `sets banner_connecting "http://thatziv.ddns.net/zabstract.png"` *(where those urls are images on the internet)* |
| server.cfg Modularity | **server.cfg** and **resources.cfg** (create resources.cfg) - copy all your starting resources in `server.cfg` to your new `resources.cfg` for modularity and cleaning up the main `server.cfg`. Then in the `server.cfg`, add `exec resources.cfg` |

# End

*Port forwarding is different for everyone and sometimes you dont need to at all, therefore I will not explain how to do such.* **Google It**
