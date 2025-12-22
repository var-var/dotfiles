# General instructions to use git to contribute to MigFlow

## Install git

If git is not supplied by your OS, you can download it from [the official git website](https://git-scm.com/downloads).

## Configure git

Before starting to use git, you have to configure a few variables to specify your name, email, and editors.

```
git config --global user.name "Jon Doe"
git config --global user.email johndoe@example.com
git config --global core.editor vim
git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
```

Replace  `vim` by your text editor and `vimdiff` by your diff viewer (skip this configuration if you do not have a diff viewer).

You may also wish to set up an alias `git alog` which allows to easily visualize the history graph from the command line.

```
git config --global alias.alog "log --graph --oneline --all --decorate"
```
You can now use `git alog to see the commit history.

## Get the MigFlow source code

Clone the [MigFlow official repositoy](https://git.immc.ucl.ac.be/fluidparticles/MigFlow/)

```
git clone https://username@git.immc.ucl.ac.be/fluidparticles/migflow.git
```
(replace `username` by your login)

## Create a feature branch

Never work directly on the `master` branch, always work on a specific branch then, when your branch is ready, check that all testcases pass and submit a request to merge your branch into `master`.

You can also run the tests directly on your machine, by running ```ctest ``` in your build directory.

Your new branch will start from `master`, so first be sure that your copy of the `master` branch is up-to-date.
```
git checkout master
git pull
```
You can now create your branch (here called `myfeature`).
```
git checkout -b myfeature
```
(Use `git checkout branchname` to switch from one branch to another).

## Make some commits

After editing the source code, you have to add to the index the files that you want to include in your commit.
```
git add file1.cpp file2.h
```
A file can be added several time if it was further modified.
```
git add file1.cpp
```
It is also possible to add a part of a file.
```
git add -p file3.cpp
```
To see the current status, use  :
- `git status` to list the files that will be included in the next commit
- `git diff --cached` to list the modifications that will be included
- `git diff` to list the modifications that won't be included.

Once a coherent set of modifications is in the index, the actual commit can be performed.
```
git commit
```

## Publish a branch

Other developers work on their own branches, so you can push your branch to the server without fear of conflicts.
To push a branch for the first time, use
```
git push --set-upstream origin myfeature
```
after that, you can simply push with
```
git push
```

## Update a branch

If other developers contribute to the same branch, you may wish to get their commits and apply your commits on top of theirs. Be sure, that all modifications are commited (or stashed), then :

```
git pull --rebase
```

## Request a merge 

Once a branch is ready, it has to be merged into `master`.
First, be sure that all the changes that are in the `master` branch are also in your branch.
```
git fetch
git merge origin/master
git push
```
The `git push` command will print a message with the url where you can create a merge request for your branch.

## Fixing conflicts

If conflicts occur during a rebase or a merge, git will stop and you will have to fix them.
- `git status` list the files in conflicts
- fix the conflicts add the fixed files to the index with `git add`
- when no conflict remains, resume the merge (with `git merge --continue`) or rebase (with `git rebase --continue`) operation.
- if you prefer to cancel the operation instead of resolving conflicts, use `git merge --abort` or `git rebase --abort`.

## Accept a merge request

First check that the commits in the branch do not break the testcases (the gitlab server should put a green icon beside the commit and on the page of the merge request) and that the code looks good.
If it's not the case, you can discuss the modifications on the page of the merge request on gitlab and ask for changes. Once the branch is satisfactory, merge it into master.

```
git fetch
git checkout master
git merge --no-ff myfeature
git push
```

Finally, delete the branch locally and on the server

```
git branch -d myfeature
git push origin --delete myfeature
```

## (Optional) Clean a branch

Before requesting a merge of your branch into master, you may wish to clean its history (e.g. to combine commit with another commit that fixes it).
Always do it in a copy of your branch.
```
git fetch
git checkout -b myfeatyre-clean myfeature
git rebase -i origin/master
```
Then follow the instructions.

## (Optional) Revert modifications
- `git checkout file.cpp` revert the file to its state at the last commit
- `git reset --soft`  undo the last commit but do not touch the files in your workspace and put all the modifications in the index, ready for a new commit
- `git reset --mixed` undo the last commit but  do not touch the files in your workspace, and empties the index
- `git reset --hard` undo the last commit, including the files in your workspace

**Never reset a branch in a way that would remove or alter commits that are already pushed to the server**.
If you want to remove changes already pushed to the server, you can either 
- create a new branch, fix its history then push it
- or create a new commit that will revert the changes introduced by a previous commit using `git revert rev` (replace rev by the hash of the commit).

## (Optional) Others
Here are some commands that you may find useful (use `git help command` for more information, e.g. `git help stash`):
- `git stash`/`git stash pop` : put changes aside for later use
- `git bisect` : find regression in history
- `git blame filename.c` : list which is the last commit affecting each line
- `git grep` : search for an expression in the history
- `git cherry-pick rev` : apply a single commit from another branch

## References
- Read the [Git Pro Book](https://git-scm.com/book/en/v2), it's good !
- [Atlassian Git] (https://www.atlassian.com/git/tutorials/comparing-workflows) has a good descriptions of various workflow with git.
- [This presentation] (http://gitlab.onelab.info/gmsh/gmsh/wikis/ThirdGmshWorkshop/lambrechts-git.pdf) during the [third Gmsh workshop](http://gitlab.onelab.info/gmsh/gmsh/wikis/ThirdGmshWorkshop) provided a relatively long introduction to git.
