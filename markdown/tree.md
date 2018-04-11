#### 1. git仓库的存储：
> git中有四种对象：blob、tree、commit、tag。
- blob 代表文件，tree 代表目录，commit 代表提交历史，tag 代表标签。
- 这四种对象都是由 SHA1 值表示的。在仓库的 .git 目录中保存了 git 管理仓库所需要的全部信息。


##### git ls-tree
> git-ls-tree:  Lists the contents of a given tree object, like what "/bin/ls -a" does in the current working directory.

```shell
tree                                 # 显示存储结构


git ls-tree HEAD README.md           # 显示当前HEAD下README.md文件的type，SHA值等信息。(100644 blob 0087913ac9308cf72dea16337dbafa2dcaada39c    README.md)

git ls-tree origin/dev README.md     # 显示远程origin/dev分支 下README.md信息。

# -l --long Show object size of blob (file) entries.显示文件的大小bytes
git ls-tree -l HEAD README.md        # 100644 blob 0087913ac9308cf72dea16337dbafa2dcaada39c    1254    README.md



cat .git/HEAD                        # 本地仓库工作对应的分支： refs/heads/master


git cat-file -t {SHA}                # 显示一个SHA的type，是blob、tree、commit、tag之一。
git cat-file -p {SHA}                # 显示 SHA 的详细信息，例如：parent
```
