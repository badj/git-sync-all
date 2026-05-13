# git-sync-all

> A lightweight pair of scripts to recursively fetch, stash, and pull updates for all Git repositories within a directory. Perfect for developers and QA engineers managing dozens of microservices or dotfiles.

## Features

- **Mass Update:** One command to update every repo in a folder. 
- **Auto-Stash:** Safely tucks away your uncommitted changes before pulling and re-applies them after (via git stash pop). 
- **Cross-Platform:** Includes both Bash (macOS/Linux) and PowerShell (Windows/Core) versions. 
- **No Overhead:** Zero dependencies other than Git itself.

---

### Table of contents

- [Features](#features)
- [Project structure](#project-structure)
- [How it Works](#how-it-works) 
- [Installation](#installation)
  - [For macOS / Linux Bash](#for-macos--linux-bash)
    - [Recommended – Bash – Fetch All and Stash and Pull](#recommended--bash--fetch-all-and-stash-and-pull)
    - [Bash – Fetch All No Stash and Pull](#bash--fetch-all-no-stash-and-pull)
  - [For Windows / Cross-Platform - PowerShell](#for-windows--cross-platform---powershell)
    - [Recommended – PowerShell – Fetch All and Stash and Pull](#recommended--powershell--fetch-all-and-stash-and-pull)
    - [Install and run PowerShell on macOS](#install-and-run-powershell-on-macos)
- [Global Alias](#global-alias)
  - [Setting the Alias](#setting-the-alias)
    - [For Zsh (macOS)](#for-zsh-macos)
      - [Recommended – Zsh - Bash – Fetch All and Stash and Pull](#recommended--zsh---bash--fetch-all-and-stash-and-pull)
      - [Zsh - Bash – Fetch All No Stash and Pull](#zsh---bash--fetch-all-no-stash-and-pull)
    - [For PowerShell](#for-powershell)
      - [Recommended – PowerShell – Alias – Fetch All and Stash and Pull](#recommended--powershell--alias--fetch-all-and-stash-and-pull)
- [Sample usage output](#sample-usage-output)
  - [Recommended – Bash sample output – Fetch All and Stash and Pull](#recommended--bash-sample-output--fetch-all-and-stash-and-pull)
  - [Bash sample output – Fetch All No Stash and Pull](#bash-sample-output--fetch-all-no-stash-and-pull) 
  - [Recommended – PowerShell sample output – Fetch All and Stash and Pull](#recommended--powershell-sample-output--fetch-all-and-stash-and-pull)
- [Contributing](#contributing)

---

## Project structure

```terminaloutput
git-sync-all 
├── LICENSE
├── README.md
├── fans.sh  // Alias script for "Fetch All, No Stash, and Pull" in Bash
├── faws.ps1 // Alias script for "Fetch All, Stash, and Pull" in PowerShell
└── faws.sh  // Alias script for "Fetch All, Stash, and Pull" in Bash
```

[_⇡ Return to the Table of Contents_](#table-of-contents)


## How it Works

> The scripts iterate through every subdirectory in their current location. If a .git folder is detected, it performs the following sequence:

1. `git fetch --all`: Grabs all latest metadata from remotes.
2. `git stash`: Only triggers if you have "dirty" (uncommitted) changes.
3. `git pull`: Updates your current branch.
4. `git stash pop`: Restores your work-in-progress files.


[_⇡ Return to the Table of Contents_](#table-of-contents)


## Installation

1. Clone this repository or download the scripts.
2. Place the scripts in the root folder where your repositories live or add them to your system PATH.

[_⇡ Return to the Table of Contents_](#table-of-contents)


### For macOS / Linux Bash

#### Recommended – Bash – Fetch All and Stash and Pull

Give the script execution permissions:

```bash
chmod +x faws.sh
```
Run it:

```bash
./faws.sh
```

[_⇡ Return to the Table of Contents_](#table-of-contents)


#### Bash – Fetch All No Stash and Pull

Give the script execution permissions:

```bash
chmod +x faws.sh
```
Run it:

```bash
./faws.sh
```

[_⇡ Return to the Table of Contents_](#table-of-contents)


### For Windows / Cross-Platform - PowerShell

#### Recommended – PowerShell – Fetch All and Stash and Pull

Open your terminal (PowerShell or Terminal) and Run the script:

```PowerShell
./faws.ps1
```
**Note:** On Windows, if you get a script execution error, run:

```PowerShell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

[_⇡ Return to the Table of Contents_](#table-of-contents)


#### Install and run PowerShell on macOS

> No MS Windows environment – Install and run PowerShell on macOS

**Install PowerShell** 

> There are two ways to do this via Brew. I recommend the formula method as it's often more "terminal-friendly" on macOS:

```bash
brew install powershell
````

**Note:** If that doesn't work, try `--cask` instead

```bash
brew install --cask powershell
````

**Run PowerShell**

> - Once installed, type the cross-platform command `pwsh` to open PowerShell.
> - You’ll see the prompt change to PS /Users/yourname>. 
> - To exit: Type `exit`.


[_⇡ Return to the Table of Contents_](#table-of-contents)


## Global Alias

> To run this from anywhere on your machine, add an alias to your profile (.zshrc, .bashrc, or $PROFILE).

### Setting the Alias

### For Zsh (macOS):

#### Recommended – Zsh - Bash – Fetch All and Stash and Pull

```Bash
alias update-all='~/path/to/your/script/faws.sh'
```

[_⇡ Return to the Table of Contents_](#table-of-contents)


#### Zsh - Bash – Fetch All No Stash and Pull

```Bash
alias update-all='~/path/to/your/script/fans.sh'
```

[_⇡ Return to the Table of Contents_](#table-of-contents)


### For PowerShell:

#### Recommended – PowerShell – Alias – Fetch All and Stash and Pull

```PowerShell
Set-Alias -Name gup -Value C:\path\to\faws.ps1
```

[_⇡ Return to the Table of Contents_](#table-of-contents)


## Sample usage output

### Recommended – Bash sample output – Fetch All and Stash and Pull


<details>
  <summary>Click to expand!</summary>

```terminaloutput
    jjbadenhorst:Git-demo % ./faws.sh
    Starting bulk update with auto-stash...
    --------------------------------------------
    Updating: ./awesome-mcp-servers
    Already up to date.
    --------------------------------------------
    Updating: ./badj
    Already up to date.
    --------------------------------------------
    Updating: ./cypress-checkout-test
    Local changes detected: Stashed.
    Already up to date.
    Re-applying local changes...
    On branch main
    Your branch is up to date with 'origin/main'.
    
    Changes not staged for commit:
      (use "git add/rm <file>..." to update what will be committed)
      (use "git restore <file>..." to discard changes in working directory)
            modified:   cypress.config.js
            modified:   cypress/fixtures/testdata.json
            deleted:    e2e/cypress-checkout-test.cy.js
            deleted:    fixtures/testdata.json
            deleted:    support/commands.js
            deleted:    support/e2e.js
            deleted:    support/selectors.js
    
    Untracked files:
      (use "git add <file>..." to include in what will be committed)
            .DS_Store
            cypress/.DS_Store
            cypress/reports/
            cypress/screenshots/
            cypress/videos/
            node_modules/
            package-lock.json
    
    no changes added to commit (use "git add" and/or "git commit -a")
    Dropped refs/stash@{0} (f71a404883ffe2d7e47b0b0d245fb1f0c2cc2344)
    --------------------------------------------
    Updating: ./cypress-cucumber-poc
    Already up to date.
    --------------------------------------------
    Updating: ./cypress-realworld-app
    Local changes detected: Stashed.
    Already up to date.
    Re-applying local changes...
    On branch develop
    Your branch is up to date with 'origin/develop'.
    
    Changes not staged for commit:
      (use "git add <file>..." to update what will be committed)
      (use "git restore <file>..." to discard changes in working directory)
            modified:   .env
            modified:   data/database-seed.json
            modified:   data/database.json
    
    no changes added to commit (use "git add" and/or "git commit -a")
    Dropped refs/stash@{0} (470e7319fe99ccc9cdaba286135b1f04d06d3abc)
    --------------------------------------------
    Updating: ./hashiqube
    Already up to date.
    --------------------------------------------
    Updating: ./mcp-appium-server
    Local changes detected: Stashed.
    Already up to date.
    Re-applying local changes...
    On branch main
    Your branch is up to date with 'origin/main'.
    
    Changes not staged for commit:
      (use "git add <file>..." to update what will be committed)
      (use "git restore <file>..." to discard changes in working directory)
            modified:   README.md
            modified:   package-lock.json
            modified:   package.json
            modified:   wdio.android.conf.ts
            modified:   wdio.conf.ts
            modified:   wdio.ios.conf.ts
    
    Untracked files:
      (use "git add <file>..." to include in what will be committed)
            chromedriver-mobile/
            test/pageobjects/login.page.ts
            test/pageobjects/page.ts
            test/pageobjects/secure.page.ts
            test/specs/test.e2e.ts
    
    no changes added to commit (use "git add" and/or "git commit -a")
    Dropped refs/stash@{0} (3ed914a2083a699384c8f31de7cc6ed07c12772e)
    --------------------------------------------
    Updating: ./repoguard
    Already up to date.
    --------------------------------------------
    All done!
```
</details>


[_⇡ Return to the Table of Contents_](#table-of-contents)


### Bash sample output – Fetch All No Stash and Pull

<details>
  <summary>Click to expand!</summary>

```terminaloutput
    jjbadenhorst:Git-demo % ./fans.sh
    Starting bulk fetch and pull...
    --------------------------------------------
    Updating: ./awesome-mcp-servers
    Already up to date.
    --------------------------------------------
    Updating: ./badj
    Already up to date.
    --------------------------------------------
    Updating: ./cypress-checkout-test
    Already up to date.
    --------------------------------------------
    Updating: ./cypress-cucumber-poc
    Already up to date.
    --------------------------------------------
    Updating: ./cypress-realworld-app
    Already up to date.
    --------------------------------------------
    Updating: ./hashiqube
    Already up to date.
    --------------------------------------------
    Updating: ./mcp-appium-server
    Already up to date.
    --------------------------------------------
    Updating: ./repoguard
    Already up to date.
    --------------------------------------------
    Done!
```
</details>


[_⇡ Return to the Table of Contents_](#table-of-contents)


### Recommended – PowerShell sample output – Fetch All and Stash and Pull

<details>
  <summary>Click to expand!</summary>

```terminaloutput
    jjbadenhorst:Git-demo % pwsh
    PowerShell 7.6.1
    PS /Users/jjbadenhorst/Documents/Git-demo> pwsh ./faws.ps1
    --------------------------------------------
    Updating: awesome-mcp-servers
    Already up to date.
    --------------------------------------------
    Updating: badj
    Already up to date.
    --------------------------------------------
    Updating: cypress-checkout-test
    Local changes detected: Stashed safely.
    Already up to date.
    Re-applying your local changes...
    On branch main
    Your branch is up to date with 'origin/main'.

    Changes not staged for commit:
      (use "git add/rm <file>..." to update what will be committed)
      (use "git restore <file>..." to discard changes in working directory)
            modified:   cypress.config.js
            modified:   cypress/fixtures/testdata.json
            deleted:    e2e/cypress-checkout-test.cy.js
            deleted:    fixtures/testdata.json
            deleted:    support/commands.js
            deleted:    support/e2e.js
            deleted:    support/selectors.js
    
    Untracked files:
      (use "git add <file>..." to include in what will be committed)
            .DS_Store
            cypress/.DS_Store
            cypress/reports/
            cypress/screenshots/
            cypress/videos/
            node_modules/
            package-lock.json
    
    no changes added to commit (use "git add" and/or "git commit -a")
    Dropped refs/stash@{0} (a10e0cdc665edffaf2105aef262562c5e05f8230)
    --------------------------------------------
    Updating: cypress-cucumber-poc                                                                                                                                                                                                          
    Already up to date.                                                                                                                                                                                                                     
    --------------------------------------------
    Updating: cypress-realworld-app                                                                                                                                                                                                         
    Local changes detected: Stashed safely.                                                                                                                                                                                                 
    Already up to date.                                                                                                                                                                                                                     
    Re-applying your local changes...
    On branch develop                                                                                                                                                                                                                       
    Your branch is up to date with 'origin/develop'.
    
    Changes not staged for commit:
      (use "git add <file>..." to update what will be committed)
      (use "git restore <file>..." to discard changes in working directory)
            modified:   .env
            modified:   data/database-seed.json
            modified:   data/database.json
    
    no changes added to commit (use "git add" and/or "git commit -a")
    Dropped refs/stash@{0} (e64d4c8b46758b42a27f9eaed560de35a0a5a985)
    --------------------------------------------
    Updating: hashiqube                                                                                                                                                                                                                     
    Already up to date.                                                                                                                                                                                                                     
    --------------------------------------------
    Updating: mcp-appium-server
    Local changes detected: Stashed safely.
    Already up to date.
    Re-applying your local changes...
    On branch main
    Your branch is up to date with 'origin/main'.
    
    Changes not staged for commit:
      (use "git add <file>..." to update what will be committed)
      (use "git restore <file>..." to discard changes in working directory)
            modified:   README.md
            modified:   package-lock.json
            modified:   package.json
            modified:   wdio.android.conf.ts
            modified:   wdio.conf.ts
            modified:   wdio.ios.conf.ts
    
    Untracked files:
      (use "git add <file>..." to include in what will be committed)
            chromedriver-mobile/
            test/pageobjects/login.page.ts
            test/pageobjects/page.ts
            test/pageobjects/secure.page.ts
            test/specs/test.e2e.ts
    
    no changes added to commit (use "git add" and/or "git commit -a")
    Dropped refs/stash@{0} (b1c0f01f47d3791a0d6f4948886436957fd94ffa)
    --------------------------------------------
    Updating: repoguard                                                                                                                                                                                                                     
    Already up to date.                                                                                                                                                                                                                     
    --------------------------------------------
    All repositories processed!                                                                                                                                                                                                             
    PS /Users/jjbadenhorst/Documents/Git-demo>    
```
</details>



[_⇡ Return to the Table of Contents_](#table-of-contents)


## Contributing

Found a way to make it faster? (Parallel execution, perhaps?) Feel free to fork and submit a Pull Request!


[_⇡ Return to the Table of Contents_](#table-of-contents)
