# git知识点🧀️

[TOC]

------

## 分支

### 创建分支

1. git branch freshbranch
2. git checkout freshbranch (or git checkout -b freshbranch)
3. 由于是新建的分支，不需要pull，直接git push origin freshbranch(此时会自动将master的东西拷贝到新分支中)

------

### 同步远程仓库的分支

1. 在远程创建分支freshbranch
2. 在本地`git branch -a`可查看本地和远程的所有分支
3. `git checkout -b fresh origin/fresh`可将远程的分支拉到本地

### 删除远程仓库的分支

1. 切换到其他分支
2. 在本地删除该分支：git branch -D freshbranch
3. 同步到远程仓库：git push origin :freshbranch