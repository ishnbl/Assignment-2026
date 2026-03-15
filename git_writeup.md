# GIT WRITEUPS

## master
`git push`


## commit-one-file
```
git add A.txt
git commit
git push
```

## commit-one-file-staged
```
git reset A.txt
git commit
git push
```


## ignore-them 
first create a git ignore file
```
*.exe
*.o
*.jar 
libraries/*
```
```
git add .
git commit
git push
```

## chase branch
```
git reset --hard escaped
```
use git reset to move the current branch to escaped
after this push using git push


## merge-conflict 
```
git merge another-piece-of-work
```
after this manually resolve merge conflict by writing 2 + 3 = 5 manually to eequation.txt
after that stage and commit and push

## save-your-work
first save by 
```
git stash
```
after that do the change in bug.txt and commit 
after that move to prior work by
```
git stash apply
```
after that do the changes in bug.txt and commit
after this push


## change-branch-history
just rebase using this command
```
git rebase hot-bugfix
```
after this git push

## remove-ignored
first remove the currently tracked file using 
```
git rm --cached ignored.txt
```
after doing this just commit and push

## case-sensitive-filename
in this first rename the file using this command 
```
git mv File.txt file.txt
```
after this stage, commit and push


## fix-typo
first correct the content of the file
after this stage the changes via git add .
after this make the commit using 
```
git commit --amend
```
change the commit message and push using git push

## forge-date
make the amended commit 
```
git commit --amend --date="Sat Mar 14 16:42:38 1987 +053"
```
after this push the changes 


## fix-old-typo
```
git rebase -i HEAD~2
```
then add edit next to the first commit
change the typo
```
git commit --amend 
```
after that 
```
git rebase --continue
```
solve the merge conflict
stage the changes
```
git rebase --continue again
```
