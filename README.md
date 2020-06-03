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

------

### 删除远程仓库的分支

1. 切换到其他分支
2. 在本地删除该分支：git branch -D freshbranch
3. 同步到远程仓库：git push origin :freshbranch

------

### 合并分支

1. 切换到master分支
2. git merge freshbranch
3. git push origin master



## 代码回退

```ruby
git reset --hard HEAD^        回退到上个版本
```



## 删除历史

> https://www.jianshu.com/p/7ace3767986a
>
> https://www.cnblogs.com/zooqkl/p/10417186.html
>
> https://www.jianshu.com/p/6217949e87a3

不小心上传了大文件，即使删除了，但是history还是有这个文件的历史，导致库很大

1. 寻找大文件

   ```bash
   $ git verify-pack -v .git/objects/pack/pack-43035f03d78ed39da647d4685e427bd126209bdb.idx | sort -k 3 -n | tail -10
   ```

2. 查找对应路径

   ```bash
   git rev-list --objects --all | grep e28b267b24de7d5b32ed2391669
   # e28b267b24de7d5b32ed2391669df8a72e24257d backEnd/vendor/history/dockerimages/fabric-baseos
   ```

3. 查找对此出现该文件的log

   ```bash
   git log --pretty=oneline --branches -- backEnd/vendor/history/dockerimages/fabric-baseos
   ```

4. 清理history

   ```bash
   git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch backEnd/vendor/ILIOS/dockerimages/fabric-baseos' --prune-empty --tag-name-filter cat -- --all
   ```

5. 清理所有废弃的引用

   ```bash
   git for-each-ref --format='delete %(refname)' refs/original | git update-ref --stdin    
   git reflog expire --expire=now --all
   git gc --prune=now
   git count-objects -v
   git push origin --force --all
   ```

------

删除所有分支和历史记录，成为一个干净的新仓库

```bash
git checkout --orphan latest_brahch
git add -A
git commit -am "commit"
git branch -D master
git push -f origin master
```

