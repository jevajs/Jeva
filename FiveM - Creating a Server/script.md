# 1 | FiveM - Creating a FiveM Server

* Better guide to make a FiveM Server http://docs.fivem.net/server-manual/setting-up-a-server/


**Requirements**
- Decent Internet
- Probably more things I can't think of

# Guide
1. Go to [Server Artifacts](https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/) and download the latest *to server.zip*
2. Create a new folder on the desktop and call it `server`
3. Move the `server.zip` into the new folder
4. Extract the `server.zip` in the `server` folder.
5. Go to [cfx-server-data repo](https://github.com/citizenfx/cfx-server-data) and download it
6. Extract the new zip file into your `server` folder
**Make sure your directory for the server folder looks like this**:
```yaml
Desktop -> server -> { <server.zip Files>, cfx-server-data-master, more folders prob} 
```
That is a horrible diagram of your directory. 

7. Go to [server.cfg site](http://docs.fivem.net/server-manual/setting-up-a-server/#server-cfg) and copy the `server.cfg example`
    - Or you can copy this `server.cfg` template:
    ```yaml
    # You probably don't want to change these!
    # Only change them if you're using a server with multiple network interfaces.
    endpoint_add_tcp "0.0.0.0:30120"
    endpoint_add_udp "0.0.0.0:30120"

    # These resources will start by default.
    start mapmanager
    start chat
    start spawnmanager
    start sessionmanager
    start fivem
    start hardcap
    start rconlog
    start scoreboard
    start playernames

    # This allows players to use scripthook based plugins such as lambda menu.
    # Set this to 0 to disallow scripthook.
    sv_scriptHookAllowed 1

    # Uncomment this to enable RCON. Make sure to change the password.
    #rcon_password changeme

    # A comma-separated list of tags for your server.
    # For example:
    # - sets tags "drifting, cars, racing"
    # Or:
    # - sets tags "roleplay, military, tanks"
    sets tags "default"

    # Set an optional server info and connecting banner image url.
    # Size doesn't matter, any banner sized image will be fine.
    #sets banner_detail "http://url.to/image.png"
    #sets banner_connecting "http://url.to/image.png"

    # Set your server's hostname
    sv_hostname "My new FXServer!"

    # Nested configs!
    #exec server_internal.cfg

    # Loading a server icon (96x96 PNG file)
    #load_server_icon myLogo.png

    # convars which can be used in scripts
    set temp_convar "hey world!"

    # Uncomment this line if you do not want your server to be listed in the server browser.
    #sv_master1 ""

    # Want to only allow players authenticated with a third-party provider like Steam?
    # Don't forget Social Club is a third party provider too!
    #sv_authMaxVariance 1
    #sv_authMinTrust 5

    # Add system admins
    add_ace group.admin command allow # allow all commands
    add_ace group.admin command.quit deny # but don't allow quit
    add_principal identifier.steam:110000112345678 group.admin # add the admin to the group

    # Hide player endpoints in external log output.
    sv_endpointprivacy true

    # Server player slot limit (must be between 1 and 32)
    sv_maxclients 32

    # License key for your server (https://keymaster.fivem.net)
    sv_licenseKey changeme
    ```
8. Create a new file (with notepad if you want) paste the `server.cfg` contents from above.
9. Save the file as `server.cfg` in the `cfx-server-data-master`, in the `server` folder we made
10. Go to [keymaster for fivem](https://keymaster.fivem.net) and login/create an account, then create a new key. **copy the key**
11. Go to your `server.cfg` in the `cfx-server-data-master`folder and on the *final lines* of it, paste your key after it says `sv_licenseKey` - **No quotes**
    - Before (from server.cfg template): 
    ```yaml
    # License key for your server (https://keymaster.fivem.net)
    sv_licenseKey changeme
    ```
    - After (Replace the bottom lines of your server.cfg):
    ```yaml
    # License key for your server (https://keymaster.fivem.net)
    sv_licenseKey b2y05w832wsez9dnfnlpj5tx5ga9qmrd
    ```
12. Running the server with a server starter:
    - Create a bat file (notepad if you want)
    - In the bat file, paste this and replace `Administrator` in the directories as your username for the pc - *in other words, just make it cd into your directory for the server*
    ```sh
    cd /d C:\users\Administrator\desktop\server\cfx-server-data-master
    C:\users\Administrator\desktop\server\run.cmd +exec server.cfg   
    ```
    - Save this file **as a bat** in your `server` folder and call it whatever you want.
13. Run the bat file.

* If you have an error regarding **Visual C++ redistributable**, download it [here](https://go.microsoft.com/fwlink/?LinkId=746572)

* [Common issues](http://docs.fivem.net/server-manual/setting-up-a-server/#common-issues) *by The Proper FiveM Documentation* 

# Hopefully you were able to follow this **terrible** tutorial. Watch the video to follow better...