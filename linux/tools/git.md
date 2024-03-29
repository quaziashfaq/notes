## Merge
### Merging an upstream repository into your fork

quaziashfaq/emacs.d is a fork of purcell/emacs.d

Clone my fork in my machine
`$ git clone git@github.com:quaziashfaq/emacs.d.git`

Checkout master branch of my fork.
`$ git checkout master`

This is what `origin` pointns to ->
```bash
$ git remote
origin

$ git remote show origin
  * remote origin
  Fetch URL: git@github.com:quaziashfaq/emacs.d.git
  Push  URL: git@github.com:quaziashfaq/emacs.d.git
  HEAD branch: master
  Remote branches:
    company-again      tracked
    master             tracked
    patch-1            tracked
    smartparens-take-2 tracked
  Local branch configured for 'git pull':
    master merges with remote master
  Local ref configured for 'git push':
    master pushes to master (up to date)
```

Now get the upstream data. Give it a name: 'upstream'
```bash
$ git remote add upstream git@github.com:purcell/emacs.d.git

$ git remote
origin
upstream

$ git remote show upstream
* remote upstream
  Fetch URL: git@github.com:purcell/emacs.d.git
  Push  URL: git@github.com:purcell/emacs.d.git
  HEAD branch: master
  Remote branches:
    company-again      new (next fetch will store in remotes/upstream)
    master             new (next fetch will store in remotes/upstream)
    patch-1            new (next fetch will store in remotes/upstream)
    smartparens-take-2 new (next fetch will store in remotes/upstream)
  Local ref configured for 'git push':
    master pushes to master (fast-forwardable)
```

Now pull the data from purcell/emacs.d master branch
```
$ git pull upstream master
From github.com:purcell/emacs.d
 * branch            master     -> FETCH_HEAD
 * [new branch]      master     -> upstream/master
Already up to date.
```

We are in `master` branch of local. Now merge my local master branch with purcell's master branch
```
$ git merge upstream/master 
Already up to date.
```
[There is no update now that's it's very clean.. :-)]

Now push your local updated repo to your fork in github.
`$ git pull origin master`

### Merging repo from another machine with github repository
Clone the repo from another machine
```
$ git clone ssh://ash@192.168.56.21/home/ash/docker/docker-config
$ git remote -v
origin	ssh://ash@192.168.56.21/home/ash/docker/docker-config (fetch)
origin	ssh://ash@192.168.56.21/home/ash/docker/docker-config (push)
```

Now add the github repo
Change directory.
```
$ cd docker-config/
$ git remote -v
```

Now add the github url
```
$ git remote add githubrepo git@github.com:quaziashfaq/docker-config.git
$ git remote -v
githubrepo	git@github.com:quaziashfaq/docker-config.git (fetch)
githubrepo	git@github.com:quaziashfaq/docker-config.git (push)
origin	ssh://ash@192.168.56.21/home/ash/docker/docker-config (fetch)
origin	ssh://ash@192.168.56.21/home/ash/docker/docker-config (push)
```

## Some commands to explore
```
git diff
git diff <filename>
git diff --staged
git diff --staged <filename>

git log
git log -p
git log --stat

git add <filename>
git add -p
git add -p <filename>

git commit

git show <commit-ID>
```

| Test1 | Test2 |
| -- | -- |
| ok ok | fine |


Command	Explanation & Link

| Command             | Description                                     |
|---------------------+-------------------------------------------------|
| `git commit -a`     | Stages files automatically                      |
| `git log -p`        | Produces patch text                             |
| `git show`          | Shows various objects                           |
|---------------------+-------------------------------------------------|
| `git diff`          | Is similar to the Linux `diff` command,         |
|                     | and can show the differences in various commits |
|---------------------+-------------------------------------------------|
| `git diff --staged` | An alias to --cached, this will show            |
|                     | all staged files compared to the named commit   |
|---------------------+-------------------------------------------------|


git add -p	Allows a user to interactively review patches to add to the current commit
git mv	Similar to the Linux `mv` command, this moves a file
git rm	Similar to the Linux `rm` command, this deletes, or removes a file
There are many useful git cheatsheets online as well. Please take some time to research and study a few, such as this one.


## .gitignore files
.gitignore files are used to tell the git tool to intentionally ignore some files in a given Git repository. For example, this can be useful for configuration files or metadata files that a user may not want to check into the master branch. Check out more at: https://git-scm.com/docs/gitignore.

A few common examples of file patterns to exclude can be found here.


## Going back to history

File not staged and want to restore to previous version:
git checkout <filename>
git restore <filename>

File is staged by 'git add' command. Now want to restore to previous version.
git reset HEAD <file>
git restore --staged <file>


Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	modified:   all_checks.py

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   all_checks.py

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	output.txt

** git revert HEAD
to rollback to previous commit
With git revert, a new commit is created with inverse changes. This cancels previous changes instead of making it as though the original commit never happened.

It creates a new commit with inverse changes.

is selected.This is correct.
Awesome! With git revert, new commit is created with inverse changes. This cancels previous changes instead of making it as though the original commit never happened.

to check after we rollback
git log -p -2


## Amending git commit
git commit --amend
Awesome! git commit --amend allows us to modify and add changes to the most recent commit.
It overwrite the previous commit.
Don't use it in public repository.
Use git commit --amend in your local repository. Then you can publish the changes. But avoid amending commits that have already been made public.

## git revert cheat sheet
git checkout is effectively used to switch branches.

git reset basically resets the repo, throwing away some changes. It’s somewhat difficult to understand, so reading the examples in the documentation may be a bit more useful.

There are some other useful articles online, which discuss more aggressive approaches to resetting the repo.

git commit --amend is used to make changes to commits after-the-fact, which can be useful for making notes about a given commit.

git revert makes a new commit which effectively rolls back a previous commit. It’s a bit like an undo command.

There are a few ways you can rollback commits in Git.

There are some interesting considerations about how git object data is stored, such as the usage of sha-1.

Feel free to read more here:

https://en.wikipedia.org/wiki/SHA-1
https://github.blog/2017-03-20-sha-1-collision-detection-on-github-com/

## git branching
Command	Explanation & Link
git branch	Used to manage branches
git branch <name>	Creates the branch
git branch -d <name>	Deletes the branch
git branch -D <name>	Forcibly deletes the branch
git checkout <branch>	Switches to a branch.
git checkout -b <branch>	Creates a new branch and switches to it.
git merge <branch>	Merge joins branches together.
git merge --abort	If there are merge conflicts (meaning files are incompatible), --abort can be used to abort the merge action.
git log --graph --oneline	This shows a summarized view of the commit history for a repo.

## Git working with remote branch
** Workflow
Check the remote branch status
#+BEGIN_SRC bash
$ git remote show origin
\* remote origin
  Fetch URL: git@github.com:quaziashfaq/health-checks.git
  Push  URL: git@github.com:quaziashfaq/health-checks.git
  HEAD branch: master
  Remote branch:
    master tracked
  Local branch configured for 'git pull':
    master merges with remote master
  Local ref configured for 'git push':
    master pushes to master (local out of date)
#+END_SRC

Then fetch the updated origin/master
$ git fetch

$ git status
On branch master
Your branch is behind 'origin/master' by 1 commit, and can be fast-forwarded.
  (use "git pull" to update your local branch)

nothing to commit, working tree clean

$ git log origin/master
commit 3708a5ef03f7ace159c8b53b46bacabaae9b2ee0 (origin/master)
Author: quaziashfaq <quazi.ashfaq@gmail.com>
Date:   Sun May 17 18:29:20 2020 +0800

    added free_memory.py

commit a8a0683aab72de11a99ba716c68b45cb816b7371 (HEAD -> master)
Author: Ashfaq <quazi.ashfaq@gmail.com>
Date:   Sun May 17 18:07:55 2020 +0800

    Add README.md file.

    
Now merge the origin/master update to local repo.
$ git branch 
\* master
$ git branch -r
  origin/master

Now merge
$ git merge origin/master
Updating a8a0683..3708a5e
Fast-forward
 free_memory.py | 7 +++++++
 1 file changed, 7 insertions(+)

 
Now check the git log update.

$ git log 
commit 3708a5ef03f7ace159c8b53b46bacabaae9b2ee0 (HEAD -> master, origin/master)
Author: quaziashfaq <quazi.ashfaq@gmail.com>
Date:   Sun May 17 18:29:20 2020 +0800

    added free_memory.py

commit a8a0683aab72de11a99ba716c68b45cb816b7371
Author: Ashfaq <quazi.ashfaq@gmail.com>
Date:   Sun May 17 18:07:55 2020 +0800

    Add README.md file.
    
 

    
## Cheat Sheet

Command	Explanation & Links
| Command                | What it does?                                                                                |
|------------------------+----------------------------------------------------------------------------------------------|
| git remote             | Lists remote repos                                                                           |
| git remote -v          | List remote repos verbosely                                                                  |
| git remote show <name> | Describes a single remote repo                                                               |
| git remote update      | Fetches the most up-to-date objects                                                          |
| git fetch              | Downloads specific objects                                                                   |
| git branch -r          | Lists remote branches; can be combined with other branch arguments to manage remote branches |

## Git Rebasing
### Fast forward merging
If a branch is created and some commit is done. But there is no commit in master branch. So when we are merging the branch with master, it's called fast-forward merging.

### 3-way merge
If a branch is created and some commit is done. And there is commit in master branch. So when we are merging the branch with master, it's called 3-way merging. If same files are changed or same lines are changed in the same files then there could be conflict which need to be remedied.

### git rebasing
New branches are created to bring new changes for improvement or to solve the bugs. Then merging happens in 3-way and the git commit history becomes complex. So to make it linear and easy to understand, we rebase it. Rebasing replays the change on the other branch.

Create a new branch
`$ git checkout -b refactor`

Changes are committed.
`$ git commit`

Push the new branch
`$ git push origin refactor`

Now rebase on the master: move the current branch (refactor) on top of master
This makes debugging easier and prevents three-way merges by transferring the completed work from one branch to another.
`$ git rebase --verbose master`

Check the git commit history log and find it in linear format.
`$ git log --graph --oneline -all`

Check out the master
`$ git checkout master`

git merge 
`$ git merge refactor`

Check the git commit history log and find it in linear format.
`$ git log --graph --oneline -all`

Now get rid of the refactor branch both remotely and locally.
```
$ git push --delete origin refactor
$ git branch -d refactor
```
Now push the master branch
`$ git push --verbose`

## How to work with github
Fork a repo from another account to your account and then clone it to local pc
`$ git clone github-repo-url`

Create a new branch add a feature 
```
$ git checkout -b add-readme
$ vim README.md
$ git add README.md
$ git commit
```
 
 Push local repo to remote repo
`$ git push --set-upstream origin local-branch`

Create a pull request in Github.com

## Git Help Links
Check out the following links for more information:

https://arp242.net/diy.html 
https://help.github.com/en/articles/closing-issues-using-keywords
https://help.github.com/en/articles/setting-guidelines-for-repository-contributors 
https://www.infoworld.com/article/3271126/what-is-cicd-continuous-integration-and-continuous-delivery-explained.html
https://stackify.com/what-is-cicd-whats-important-and-how-to-get-it-right/
https://docs.travis-ci.com/user/tutorial/
https://docs.travis-ci.com/user/build-stages/

