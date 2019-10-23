# Bash Profile Framework
- Add Zsh Plugin: ~/.oh-my-zsh/custom/includeProfileApp.zsh
- Or, add to to: ~/.profile
```
source /Users/me/bash-profile/app.sh
```

## Create Repo in CWD
```
git:setup
```

## Set Origin to Master
CWD name must match repo name
```
git:connect
```

## Ignore & ReadMe
Created if doesn't exist.
```
git:ignore
git:readme
```

## Save (push)
```
git:save "custom message"
git:save (uses "wip" when no argument specified)
```

## Sync (pull)
```
git:sync
```


## Branch
Full
```
git:branch dev
```
Fresh
```
git:branch gh-pages fresh
```
Switching
```
git:switch master
```
Deleting
```
git:branch:delete dev
```

## Reset
Revert to Head (Hard)
```
git:reset
```

#### Question
```
if logger:question "Are you sure?"; then
  logger:success "Completed."
else
  logger:error "Aborted."
fi
```

#### Logger
```
logger:divider
===================================================================================================
```

```
logger:success "Cool!"
✅ Cool! (green text)
```

```
logger:info "Testing ready to start."
🤖 Testing ready to start. (blue text)
```

```
logger:warning "Tests failing..."
⚠️ Tests failing... (yellow text)
```

```
logger:warning "Testing failed!"
🤬 Testing failed! (red text)
```

```
logger:debug "Hmmm..."
Hmmm... (grey text)
```

```
logger:blank
(empty line)
```


#### Test Output
```
➜ 🤖 Initializing Local Repository...
Initialized empty Git repository in /Users/builder/Desktop/git-test-output/.git/
===================================================================================================
➜ 🤖 📡 Git Remote Connecting to ...
remote: Enumerating objects: 18, done.
remote: Counting objects: 100% (18/18), done.
remote: Compressing objects: 100% (12/12), done.
remote: Total 18 (delta 0), reused 16 (delta 0), pack-reused 0
Unpacking objects: 100% (18/18), done.
From github.com:bayareawebpro/git-test-output
 * branch            master     -> FETCH_HEAD
 * [new branch]      master     -> origin/master
➜ ✅  Git Remote is set to origin and syncronized: git@github.com:bayareawebpro/git-test-output.git.
Branch 'master' set up to track remote branch 'master' from 'origin'.
Everything up-to-date
===================================================================================================
➜ 🤖 Creating .gitignore...
➜ ⚠️️.gitignore already exists.
➜ 🤖 Creating README.md...
➜ ⚠️️README.md already exists.
===================================================================================================
➜ 🤖 Saving... WIP
[master f7dbccf] WIP
 1 file changed, 1 insertion(+)
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 12 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 318 bytes | 318.00 KiB/s, done.
Total 3 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To github.com:bayareawebpro/git-test-output.git
   aa3dcf4..f7dbccf  master -> master
➜ ✅  Local Pushed to Remote Successfully!
===================================================================================================
➜ 🤖 Creating Branch gh-pages...
Switched to a new branch 'gh-pages'
➜ ✅  Branch created successfully.
On branch gh-pages
nothing to commit, working tree clean
➜ ⚠️️Creating clean branch exit now or regret it, waiting 10 seconds...
rm '.gitignore'
rm 'README.md'
➜ ✅  Branch cleared.
===================================================================================================
➜ 🤖 Creating .gitignore...
➜ ✅  .gitignore Created!
➜ 🤖 Creating README.md...
➜ ✅  Created README.md!
Total 0 (delta 0), reused 0 (delta 0)
remote: 
remote: Create a pull request for 'gh-pages' on GitHub by visiting:
remote:      https://github.com/bayareawebpro/git-test-output/pull/new/gh-pages
remote: 
To github.com:bayareawebpro/git-test-output.git
 * [new branch]      gh-pages -> gh-pages
Branch 'gh-pages' set up to track remote branch 'gh-pages' from 'origin'.
===================================================================================================
➜ 🤖 Saving... WIP
[gh-pages 4fc6787] WIP
 1 file changed, 1 insertion(+), 1 deletion(-)
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 12 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 314 bytes | 314.00 KiB/s, done.
Total 3 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To github.com:bayareawebpro/git-test-output.git
   f7dbccf..4fc6787  gh-pages -> gh-pages
➜ ✅  Local Pushed to Remote Successfully!
===================================================================================================
➜ 🤖 Creating Branch dev...
Switched to a new branch 'dev'
➜ ✅  Branch created successfully.
===================================================================================================
➜ 🤖 Creating .gitignore...
➜ ⚠️️.gitignore already exists.
➜ 🤖 Creating README.md...
➜ ⚠️️README.md already exists.
Total 0 (delta 0), reused 0 (delta 0)
remote: 
remote: Create a pull request for 'dev' on GitHub by visiting:
remote:      https://github.com/bayareawebpro/git-test-output/pull/new/dev
remote: 
To github.com:bayareawebpro/git-test-output.git
 * [new branch]      dev -> dev
Branch 'dev' set up to track remote branch 'dev' from 'origin'.
===================================================================================================
➜ 🤖 Saving... WIP
[dev 53666af] WIP
 1 file changed, 1 insertion(+)
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 12 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 316 bytes | 316.00 KiB/s, done.
Total 3 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To github.com:bayareawebpro/git-test-output.git
   4fc6787..53666af  dev -> dev
➜ ✅  Local Pushed to Remote Successfully!
===================================================================================================
➜ 🤖 Switching Branch to master...
Switched to branch 'master'
Your branch is up to date with 'origin/master'.
➜ ✅  Switched to master
===================================================================================================
➜ 🤖 Deleting Branch...
53666afd2a3c48feb75404ad3bb1eb444c0ffa1a refs/heads/dev
To github.com:bayareawebpro/git-test-output.git
 - [deleted]         dev
➜ ✅  Branch Deleted Successfully!
===================================================================================================
➜ 🤖 Deleting Branch...
4fc678770d4e8531b4ce1ada369a35860522f07d refs/heads/gh-pages
To github.com:bayareawebpro/git-test-output.git
 - [deleted]         gh-pages
➜ ✅  Branch Deleted Successfully!
```