# Setting up Node.js (Javascript)
by [zua](https://github.com/thatziv) at JEVA

Requirements
* [Node js](https://nodejs.org)
* Working shell (shouldn't be an issue)
* Internet
* [Code Editor](https://atom.io/)
_____________

# Guide
1. Download [nodejs](https://nodejs.org) (current)
  - Setup nodejs
  - [img](1.png)
  - If on linux; to install:
  ```bash
  sudo apt-get install -y node.js
  ```
2. Restart Computer *if necessary*
3. Make a new folder (anywhere)
  - [img](3.png)
4. Open your shell *In your new folder preferably*
  - Command Prompt for windows
  - Terminal for Linux/Mac
  - [img](4.png)
5. `cd` into the new directory (folder) using:
  ```bash
  cd folder
  OR
  cd directory/folder
  ```
  Where folder is your new folder's name and the directory representing the directory to your folder
  -[img](5.png)
6. Now, type in
  ```bash
  npm init
  ```
  -
  and follow the prompts, then hit enter for *yes*
7. Create a Javascript file where your `package.json` is located (`index.js` by default)
  - [img](7.png)
8. Open the Javascript file (using the code editor) and now we can do a simple program **in the index.js**. ex:
  ```js
  // index.js
  console.log("Hello World!")
  ```
9. To run the index.js (using node), **in the console** that is still `cd` in the directory with both files do:
```bash
node index.js
```
[img](9.png)

## Great Job! You successfully installed node and made your first program in node.js.
Make sure to subscribe to Jeva and join our discord!
