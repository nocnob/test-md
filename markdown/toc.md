# Docker快速搭建开发环境—实战版

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="true" -->

- [概要](#%E6%A6%82%E8%A6%81)
	- [RoadMap](#roadmap)
- [Docker基础](#docker%E5%9F%BA%E7%A1%80)
	- [刀客有三宝：镜像、容器、仓库；](#%E5%88%80%E5%AE%A2%E6%9C%89%E4%B8%89%E5%AE%9D%EF%BC%9A%E9%95%9C%E5%83%8F%E3%80%81%E5%AE%B9%E5%99%A8%E3%80%81%E4%BB%93%E5%BA%93%EF%BC%9B)
	- [Docker搭建和起步](#docker%E6%90%AD%E5%BB%BA%E5%92%8C%E8%B5%B7%E6%AD%A5)
	- [Docker命令合集](#docker%E5%91%BD%E4%BB%A4%E5%90%88%E9%9B%86)
	- [run vs exec比对](#run-vs-exec%E6%AF%94%E5%AF%B9)
	- [Docker registry搭建](#docker-registry%E6%90%AD%E5%BB%BA)
	- [Docker使用好习惯](#docker%E4%BD%BF%E7%94%A8%E5%A5%BD%E4%B9%A0%E6%83%AF)
	- [Docker registry搭建](#docker-registry%E6%90%AD%E5%BB%BA-1)
- [番外篇0：Docker CE VS Docker EE](#%E7%95%AA%E5%A4%96%E7%AF%870%EF%BC%9Adocker-ce-vs-docker-ee)
	- [选择 VS 选择恐惧症](#%E9%80%89%E6%8B%A9-vs-%E9%80%89%E6%8B%A9%E6%81%90%E6%83%A7%E7%97%87)
	- [我是正文](#%E6%88%91%E6%98%AF%E6%AD%A3%E6%96%87)
- [番外篇1：命令举例](#%E7%95%AA%E5%A4%96%E7%AF%871%EF%BC%9A%E5%91%BD%E4%BB%A4%E4%B8%BE%E4%BE%8B)
	- [docker port](#docker-port)
	- [docker run](#docker-run)
	- [docker rm](#docker-rm)
	- [docker run Vs docker exec](#docker-run-vs-docker-exec)
	- [docker rm -f](#docker-rm--f)
	- [docker logs](#docker-logs)
	- [docker 命令综合应用](#docker-%E5%91%BD%E4%BB%A4%E7%BB%BC%E5%90%88%E5%BA%94%E7%94%A8)
- [番外篇2：盗梦空间](#%E7%95%AA%E5%A4%96%E7%AF%872%EF%BC%9A%E7%9B%97%E6%A2%A6%E7%A9%BA%E9%97%B4)
	- [参考bashrc](#%E5%8F%82%E8%80%83bashrc)
	- [设置命令](#%E8%AE%BE%E7%BD%AE%E5%91%BD%E4%BB%A4)
	- [赠与root](#%E8%B5%A0%E4%B8%8Eroot)
	- [效果展示](#%E6%95%88%E6%9E%9C%E5%B1%95%E7%A4%BA)
- [番外篇3：Docker exec 进入容器简化](#%E7%95%AA%E5%A4%96%E7%AF%873%EF%BC%9Adocker-exec-%E8%BF%9B%E5%85%A5%E5%AE%B9%E5%99%A8%E7%AE%80%E5%8C%96)
	- [保存脚本为dgo](#%E4%BF%9D%E5%AD%98%E8%84%9A%E6%9C%AC%E4%B8%BAdgo)
	- [设置Setup](#%E8%AE%BE%E7%BD%AEsetup)
	- [演示Usage](#%E6%BC%94%E7%A4%BAusage)
	- [脚本参数](#%E8%84%9A%E6%9C%AC%E5%8F%82%E6%95%B0)
- [番外篇4：git小技巧之删除repo上的文件夹](#%E7%95%AA%E5%A4%96%E7%AF%874%EF%BC%9Agit%E5%B0%8F%E6%8A%80%E5%B7%A7%E4%B9%8B%E5%88%A0%E9%99%A4repo%E4%B8%8A%E7%9A%84%E6%96%87%E4%BB%B6%E5%A4%B9)
	- [区分大小写](#%E5%8C%BA%E5%88%86%E5%A4%A7%E5%B0%8F%E5%86%99)
	- [解决：删除repo上的文件夹](#%E8%A7%A3%E5%86%B3%EF%BC%9A%E5%88%A0%E9%99%A4repo%E4%B8%8A%E7%9A%84%E6%96%87%E4%BB%B6%E5%A4%B9)
- [番外篇5：修改无法启动的docker容器的配置](#%E7%95%AA%E5%A4%96%E7%AF%875%EF%BC%9A%E4%BF%AE%E6%94%B9%E6%97%A0%E6%B3%95%E5%90%AF%E5%8A%A8%E7%9A%84docker%E5%AE%B9%E5%99%A8%E7%9A%84%E9%85%8D%E7%BD%AE)
	- [问题描述](#%E9%97%AE%E9%A2%98%E6%8F%8F%E8%BF%B0)
	- [解决思路](#%E8%A7%A3%E5%86%B3%E6%80%9D%E8%B7%AF)
	- [解决步骤](#%E8%A7%A3%E5%86%B3%E6%AD%A5%E9%AA%A4)
	- [总结](#%E6%80%BB%E7%BB%93)

<!-- /MarkdownTOC -->


<a name="%E6%A6%82%E8%A6%81"></a>
# 概要

本文由去年Reboot教育课程笔记为基础，加上自己的实践整理而来：如有疏漏之处，实属自己学艺不精，请各位大神不吝指教。

最近在上海出差，周末闲来无事，写个小系统练练手。需要搭建开发平台，就想起来了Docker，翻了翻之前的笔记，确实有些不合适了，遂计划重新整理一遍。主要目的是为了用Docker来快速搭建开发环境。

至于为啥要学Docker，这年头，混江湖，没把趁手武器可还行？哪怕是所处的商业环境还在犹豫，你也可以提前三五年储备么。就能大幅节省时间这一条理由，就足够了。

<a name="roadmap"></a>
## RoadMap

```shell
快速搭建开发环境
	|---Docker基础
	|	|---Docker有三宝
	|	|---Docker搭建和起步
	|	|---Docker命令合集
	|	|---Docker registry搭建
	|	|---Docker使用好习惯
	|---Docker网络及徒手敲一个上线系统
	|	|---Docker-Mariadb搭建
	|	|---Docker-Django搭建
	|	|---Docker开发机配置SSH免密登录
	|	|---从Docker带来的网络的挑战说到自动发现上线系统
	|---Docker Compose(微服务编排神器)
	|	|---搭建Redmine3.3.4 + MySQL5.6
	|	|---搭建Python + Django + MySQL
	|	|---搭建MySQL主从复制 + 读写分离
	|	|---搭建Vue.js + Sanic + Maridb10
	|	|---搭建zookeeper + goa + Maridb微服务框架学习(暂定)
	|---项目实战
	|	|---考勤系统（Vue.js + Sanic + Maridb10）
	|	|---周报系统（Vue.js + Sanic + Maridb10）
	|	|---需分快速原型搭建（Vue.js + Sanic + Maridb10 + Echarts）
	|	|---项目开发辅助平台、配置及建章立制（Redmine + Jenkins + MarkDown文档）
	|		|---Tomcat + Maven + SVN
	|		|---Tomcat + Maven + git (暂定)
	|		|---上线系统（Vue.js + Sanic + Maridb10 + Ngnix + gitlab）
	|		|---Docker部署前端自动化测试(待定)
	|		|---运维监控、部署、智能化预警处理平台(读源码、先做计划，再考虑实施)
	|---不是结束语的结束语
    		|---牛皮吹了这么多，不知道能实现多少：且行且珍惜
    		|---只是先梳理这么多吧，随着时间的推移，和进步交流，这份清单会适时修订		
    
```

<a name="docker%E5%9F%BA%E7%A1%80"></a>
# Docker基础

​	天下武功，唯快不破。

​	Docker就是一个字：“快”！

​	我决定给Docker起个中文名：刀客 :)  

<a name="%E5%88%80%E5%AE%A2%E6%9C%89%E4%B8%89%E5%AE%9D%EF%BC%9A%E9%95%9C%E5%83%8F%E3%80%81%E5%AE%B9%E5%99%A8%E3%80%81%E4%BB%93%E5%BA%93%EF%BC%9B"></a>
## 刀客有三宝：镜像、容器、仓库；

```shell
刀客（Docker）有三宝
	|____镜像（Image）# 秘籍：天下风云出我辈
 	|____容器（Container）# 江湖：一入江湖岁月催
 	|____仓库（Repository）# 琅嬛：尘事如潮人如水， 只叹江湖几人回。
```

<a name="docker%E6%90%AD%E5%BB%BA%E5%92%8C%E8%B5%B7%E6%AD%A5"></a>
## Docker搭建和起步

+ 学习
  + Mac安装：[Install Docker for Mac](https://docs.docker.com/docker-for-mac/install/)
  + Windows安装：[Install Docker for Windows](https://docs.docker.com/docker-for-windows/install/)
+ 服务器安装
  + Ubuntu安装：[Get Docker CE for Ubuntu](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-docker-ce)
  + CentOS安装：[Get Docker CE for CentOS](https://docs.docker.com/engine/installation/linux/docker-ce/centos/)
  + Linux安装后的配置：[Post-installation steps for Linux](https://docs.docker.com/engine/installation/linux/linux-postinstall/)
+ Docker起步
  + [Get started with Docker for Mac](https://docs.docker.com/docker-for-mac/)
  + [Get started with Docker for Windows](https://docs.docker.com/docker-for-windows/install/)



<a name="docker%E5%91%BD%E4%BB%A4%E5%90%88%E9%9B%86"></a>
## Docker命令合集

| 编号   | 命令                             | 举例   | 作用                        |
| ---- | ------------------------------ | ---- | ------------------------- |
| 1    | docker run                     |      | #运行命令                     |
| 2    | docker ps [-a]                 |      | #列出当前运行的容器，-a列出所有运行过的容器   |
| 3    | docker pull                    |      | #下载镜像                     |
| 4    | docker images                  |      | #列出本地镜像                   |
| 5    | docker rmi                     |      | #删镜像（比较危险，删之前关闭镜像启动的所有容器） |
| 6    | docker stop/rm                 |      | #停止/删除容器                  |
| 7    | docker exec                    |      | #进入一个启动的容器.               |
| 8    | docker logs <container id>     |      | #查看容器日志                   |
| 9    | docker inspect <container id>  |      | # 查看容器详细信息                |
| 10   | docker export/import save/load |      | # 导入/导出，保存/加载             |
| 11   | docker tag                     |      | # 给镜像打标签                  |
| 12   | docker push                    |      | # push镜像到（个人）仓库           |

<a name="run-vs-exec%E6%AF%94%E5%AF%B9"></a>
## run vs exec比对

run 命令可以启动一个容器（如果没有则启动，然后运行命令），  exec的目标必须是一个启动的容器

扩展学习： [常用docker命令，及一些坑](http://blog.csdn.net/wsscy2004/article/details/25878363)

扩展学习：

+ [Docker 配置国内镜像源 linux/mac/windows](http://www.jianshu.com/p/9fce6e583669)
+ [Docker 中国官方镜像加速](https://www.docker-cn.com/registry-mirror)
+ [阿里云 - 容器Hub服务控制台](https://cr.console.aliyun.com/)，您的专属加速Docker镜像：需要注册，支持支付宝等阿里账号登录；

小规模使用可以用docker export、import 、input 、load来简单使用镜像的发布。大规模使用建议搭建自己的registry，相当于官方的docker hub，类似于github 私有仓库。

<a name="docker-registry%E6%90%AD%E5%BB%BA"></a>
## Docker registry搭建

待补

<a name="docker%E4%BD%BF%E7%94%A8%E5%A5%BD%E4%B9%A0%E6%83%AF"></a>
## Docker使用好习惯

### 使用DockerFile而不是DockerCommit

我们下载下来的镜像，一般来说是不能直接满足我们的实际开发生产环节需求的，都需要配置安装后者删减一些内容。这个时候，我们有两种办法：

+ 进入容器，各种命令之后，退出之前，commit；打包发布新镜像；
+ 将需要的操作写入Docker file，尽可能的少用Run：就是说一个Run标签，可以多些几条命令。因为每多一个Run就会生成一个layer；

从版本管理的角度和后续维护的角度来看，推荐使用第二种方法。即方便git或svn版本管理，又方便后续维护的人看到每一步的改变；

### 将配置文件和数据文件单独挂载

参考案例：[修改无法启动的docker容器的配置](http://blog.veryjava.cn/2016/10/11/01/)

> 话说在使用docker的过程中,直接进入容器修改配置文件,出错了好像真没有什么办法能够恢复.只能在使用过程中注意了…
>
> 话说在使用docker的过程中,还是要把配置文件挂载出来的好…

### 我是谁我在哪儿

参见：[番外篇2：盗梦空间](#番外篇2：盗梦空间)

### 简化容器进入命令

参见 [番外篇3：Docker exec 进入容器简化](#番外篇3：Docker-exec-进入容器简化)

<a name="docker-registry%E6%90%AD%E5%BB%BA-1"></a>
## Docker registry搭建

待补

<a name="%E7%95%AA%E5%A4%96%E7%AF%870%EF%BC%9Adocker-ce-vs-docker-ee"></a>
# 番外篇0：Docker CE VS Docker EE

<a name="%E9%80%89%E6%8B%A9-vs-%E9%80%89%E6%8B%A9%E6%81%90%E6%83%A7%E7%97%87"></a>
## 选择 VS 选择恐惧症

​	对于有选择恐惧症的人来说，纠结了。这个问题好比选择学习哪种语言，选哪种框架一样：“对于大神来说，你纠结的功夫，人家学完了，还顺手敲了一个小实战项目仍github了。”人生的区别就在于此，调整好状态，开干吧。扯完了，看正文：

<a name="%E6%88%91%E6%98%AF%E6%AD%A3%E6%96%87"></a>
## 我是正文

截至此篇文章发表，Docker已经和去年的生态环境不大一样了。正式推出Docker EE，宣布进军企业级市场。

对于初学者，选择Docker CE（社区民间版），足以。企业级应用强调了安全，安全，安全，就这一项，不差钱的壕已经选择了跟进。当然，EE版所提供的服务，通过开源解决方案也能实现，而且比刚出炉的EE还要Strong一些，国内的环境：没有困难制造困难也要上的，要什么自行车。Docker CE足以。

<a name="%E7%95%AA%E5%A4%96%E7%AF%871%EF%BC%9A%E5%91%BD%E4%BB%A4%E4%B8%BE%E4%BE%8B"></a>
# 番外篇1：命令举例

<a name="docker-port"></a>
## docker port

```shelll
$ docker port webserver
80/tcp -> 0.0.0.0:80
```

<a name="docker-run"></a>
## docker run

```shell
docker run centos uname -a
dokcer run centos tail -f /etc/hosts
docker run centos ping -c 3 g.cn
```

<a name="docker-rm"></a>
## docker rm

```shell
$ docker rm 69719220cdb6
69719220cdb6
```

<a name="docker-run-vs-docker-exec"></a>
## docker run Vs docker exec

```shell
[AnInputForce@teach ~]$ docker run -it centos /bin/bash
[root@69719220cdb6 /]# ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.3  0.0  11784  2912 ?        Ss   04:48   0:00 /bin/bash
root        15  0.0  0.0  47432  3212 ?        R+   04:49   0:00 ps aux
```

```shell
$ docker run --name="centos_kch" -itd centos tail -f /etc/hosts
6b6a260a95754e2c2b4942506bd53d3aecacc26568b6242613b39648afa16876
$ docker exec -it centos_kch /bin/bash #进入交互式bash
```

<a name="docker-rm--f"></a>
## docker rm -f

```shell
$ docker rm -f centos_kch # 停止并删除容器:干净整洁不留垃圾.毫秒级；
```

<a name="docker-logs"></a>
## docker logs

```shell
$ docker logs <容器名orID> 2>&1 | grep '^User: ' | tail -n1 #得到容器的root密码,因为启动时密码随机
```

<a name="docker-%E5%91%BD%E4%BB%A4%E7%BB%BC%E5%90%88%E5%BA%94%E7%94%A8"></a>
## docker 命令综合应用

export/import sava/load/tag/rm/rmi ，展示小规模应用时的导入导出镜像。

```bash
Last login: Mon Nov 21 10:50:18 on ttys003
ChinaDreams:~ kangcunhua$ docker run -it busybox sh
Unable to find image 'busybox:latest' locally
latest: Pulling from library/busybox

56bec22e3559: Pull complete 
Digest: sha256:29f5d56d12684887bdfa50dcd29fc31eea4aaf4ad3bec43daf19026a7ce69912
Status: Downloaded newer image for busybox:latest
/ # ls -la
total 44
drwxr-xr-x   19 root     root          4096 Nov 21 02:59 .
drwxr-xr-x   19 root     root          4096 Nov 21 02:59 ..
-rwxr-xr-x    1 root     root             0 Nov 21 02:59 .dockerenv
drwxr-xr-x    2 root     root         12288 Oct  7 18:18 bin
......
/bin # exit
ChinaDreams:~ kangcunhua$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
busybox             latest              e02e811dd08f        6 weeks ago         1.093 MB
ChinaDreams:~ kangcunhua$ docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED              STATUS                      PORTS                         NAMES
b58c7c9d57ad        busybox             "sh"                     About a minute ago   Exited (0) 47 seconds ago                                 agitated_archimedes
......
ChinaDreams:~ kangcunhua$ docker export b58c7c9d57ad > busy.tar
ChinaDreams:~ kangcunhua$ file busy.tar 
busy.tar: POSIX tar archive
ChinaDreams:tmp kangcunhua$ docker import busy.tar 
sha256:3f29889a5ccfc3c0cd9c2d6da171a4b7735f5f140cd6ac16f589ab1b9f3b4cf6
ChinaDreams:tmp kangcunhua$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
<none>              <none>              3f29889a5ccf        10 seconds ago      1.094 MB
busybox             latest              e02e811dd08f        6 weeks ago         1.093 MB
ChinaDreams:tmp kangcunhua$ docker tag 3f29889a5ccf busy-t1:import
ChinaDreams:tmp kangcunhua$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
busy-t1             import              3f29889a5ccf        5 minutes ago       1.094 MB
busybox             latest              e02e811dd08f        6 weeks ago         1.093 MB
ChinaDreams:tmp kangcunhua$ docker save -o busy-t2.tar busybox
ChinaDreams:tmp kangcunhua$ ls
bin		dev		proc		tmp
busy-t2.tar	etc		root		usr
busy.tar	home		sys		var
ChinaDreams:tmp kangcunhua$ docker load --input busy-t2.tar 
Loaded image: busybox:latest
ChinaDreams:tmp kangcunhua$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
busy-t1             import              3f29889a5ccf        9 minutes ago       1.094 MB
busybox             latest              e02e811dd08f        6 weeks ago         1.093 MB
ChinaDreams:tmp kangcunhua$ docker rmi busybox
Error response from daemon: conflict: unable to remove repository reference "busybox" (must force) - container b58c7c9d57ad is using its referenced image e02e811dd08f
ChinaDreams:tmp kangcunhua$ docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                      PORTS                         NAMES
b58c7c9d57ad        busybox             "sh"                     21 minutes ago      Exited (0) 20 minutes ago                                 agitated_archimedes
ChinaDreams:tmp kangcunhua$ docker rm -f b58c7c9d57ad
b58c7c9d57ad
ChinaDreams:tmp kangcunhua$ docker rmi busybox
Untagged: busybox:latest
Untagged: busybox@sha256:29f5d56d12684887bdfa50dcd29fc31eea4aaf4ad3bec43daf19026a7ce69912
Deleted: sha256:e02e811dd08fd49e7f6032625495118e63f597eb150403d02e3238af1df240ba
Deleted: sha256:e88b3f82283bc59d5e0df427c824e9f95557e661fcb0ea15fb0fb6f97760f9d9
ChinaDreams:tmp kangcunhua$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
busy-t1             import              3f29889a5ccf        11 minutes ago      1.094 MB
ChinaDreams:tmp kangcunhua$ docker load --input busy-t2.tar 
e88b3f82283b: Loading layer 1.294 MB/1.294 MB
Loaded image: busybox:latest
ChinaDreams:tmp kangcunhua$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
busy-t1             import              3f29889a5ccf        11 minutes ago      1.094 MB
busybox             latest              e02e811dd08f        6 weeks ago         1.093 MB
ChinaDreams:tmp kangcunhua$ docker rmi busybox
Untagged: busybox:latest
Deleted: sha256:e02e811dd08fd49e7f6032625495118e63f597eb150403d02e3238af1df240ba
Deleted: sha256:e88b3f82283bc59d5e0df427c824e9f95557e661fcb0ea15fb0fb6f97760f9d9
ChinaDreams:tmp kangcunhua$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
busy-t1             import              3f29889a5ccf        19 minutes ago      1.094 MB
ChinaDreams:tmp kangcunhua$ docker load < busy-t2.tar 
e88b3f82283b: Loading layer 1.294 MB/1.294 MB
Loaded image: busybox:latest
ChinaDreams:tmp kangcunhua$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
busy-t1             import              3f29889a5ccf        20 minutes ago      1.094 MB
busybox             latest              e02e811dd08f        6 weeks ago         1.093 MB
```



<a name="%E7%95%AA%E5%A4%96%E7%AF%872%EF%BC%9A%E7%9B%97%E6%A2%A6%E7%A9%BA%E9%97%B4"></a>
# 番外篇2：盗梦空间

使用docker时，应时刻注意自己在哪儿，防止误操作。docker容器一般都是root权限，这个时候往往是宿主机、各容器相互交错，甚至有时候还有自己的笔记本远程登录维护的场景；一个不慎，就是生产事故。

​**解决办法：设置PS1变量**，每个用户下颜色不一样，提示符不一样。同时加强用户权限的管理和落地，赋予运维人员岗位角色最小的权限，严格控制特殊权限如root的申请流程和双人复核制度；

<a name="%E5%8F%82%E8%80%83bashrc"></a>
## 参考bashrc



将以下代码保存为 bashrc

```Shell
#!/bin/bash
#export DYLD_FALLBACK_LIBRARY_PATH="${HOME}/wine/wine-1.2/lib:/usr/X11/lib:/usr/
lib"
export TERM=xterm-color
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export EDITOR=vi
#export CDPATH=$CDPATH:/Users/auxten/Documents/Codes/

use_color=false

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
    && type -P dircolors >/dev/null \
    && match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
    # Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
    if type -P dircolors >/dev/null ; then
        if [[ -f ~/.dir_colors ]] ; then
            eval $(dircolors -b ~/.dir_colors)
        elif [[ -f /etc/DIR_COLORS ]] ; then
            eval $(dircolors -b /etc/DIR_COLORS)
        fi
    fi

    if [[ ${EUID} == 0 ]] ; then
        PS1='\[\033[01;31m\]\h\[\033[01;34m\] \w \$\[\033[00m\] '
    else
        PS1='\[\033[01;33m\]\u.\[\033[01;34m\]\[\033[01;32m\]\h\[\033[01;34m\] \
w \$\[\033[00m\] '
	#PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
    fi

    alias ls='ls -G'
    alias grep='grep --colour=auto'
else
    if [[ ${EUID} == 0 ]] ; then
        # show root@ when we don't have colors
        PS1='\u@\h \W \$ '
    else
        PS1='\u@\h \w \$ '
    fi
fi

# Try to keep environment pollution down, EPA loves us.
unset use_color safe_term match_lhs
```

<a name="%E8%AE%BE%E7%BD%AE%E5%91%BD%E4%BB%A4"></a>
## 设置命令

```bash
cp bashrc ~/.bashrc
. ~/.bashrc
```

<a name="%E8%B5%A0%E4%B8%8Eroot"></a>
## 赠与root

```bash
sudo cp ~/.bashrc /root/
sudo su -
```

<a name="%E6%95%88%E6%9E%9C%E5%B1%95%E7%A4%BA"></a>
## 效果展示

![盗梦空间_ps1](screenshoots/盗梦空间_ps1.png)

<a name="%E7%95%AA%E5%A4%96%E7%AF%873%EF%BC%9Adocker-exec-%E8%BF%9B%E5%85%A5%E5%AE%B9%E5%99%A8%E7%AE%80%E5%8C%96"></a>
# 番外篇3：Docker exec 进入容器简化

我们经常要写这条命令，进入容器交互bash：

```bash
docker exec -it centos_kch bash
```

有网友写了个脚本简化这件事：[帖子看这里](http://askubuntu.com/questions/505506/how-to-get-bash-or-ssh-into-a-running-container-in-background-mode)，看3楼的回复。

```bash
#!/bin/bash -xe

# docker id might be given as a parameter
DID=$1

if [[ "$DID" == "" ]]; then
  # if no id given simply just connect to the first running instance
    DID=$(docker ps | grep -Eo "^[0-9a-z]{8,}\b")
fi

docker exec -i -t $DID bash
```

修订一下：如果不带参数，默认进入第一个运行的容器，但是过滤出来的是所有运行的容器。此处修订：

<a name="%E4%BF%9D%E5%AD%98%E8%84%9A%E6%9C%AC%E4%B8%BAdgo"></a>
## 保存脚本为dgo

```bash
#!/bin/bash -xe

# docker id might be given as a parameter
DID=$1

if [[ "$DID" == "" ]]; then
  # if no id given simply just connect to the first running instance
    DID=$(docker ps | grep -Eo "^[0-9a-z]{8,}\b" | head -n 1)
fi

docker exec -i -t $DID bash
```

<a name="%E8%AE%BE%E7%BD%AEsetup"></a>
## 设置Setup

> Put docker-ssh file in your $PATH with the following contents

有root权限的话，我们直接copy到bin目录

```bash
sudo cp dgo /usr/local/bin/
```

<a name="%E6%BC%94%E7%A4%BAusage"></a>
## 演示Usage

> If you have one running instance simply run

- dgo 

> Otherwise provide it with a docker id parmeter that you get from docker ps (first col)

- dgo $docker-id，# dgo 3ccdb6bcf75a
- dgo $container-name，# dgo centos_kch

```bash
AnInputForce.teach ~ $ docker run --name="centos_kch" -itd centos tail -f /etc/hosts
3ccdb6bcf75a197b4cfbeec3d6754d3d55630e11544f396e5cd942064dae220e
AnInputForce.teach ~ $ dgo centos_kch
+ DID=centos_kch
+ [[ centos_kch == '' ]]
+ docker exec -i -t centos_kch bash
[root@3ccdb6bcf75a /]# 
```

<a name="%E8%84%9A%E6%9C%AC%E5%8F%82%E6%95%B0"></a>
## 脚本参数

- bash -xe
- -x 显示执行日志
  - 把它执行的每条命令都打到console上，有助于让大家了解都执行的什么，有助于提醒这个脚本是个自定义命令；这是一个非常好的习惯；
- -e 执行完退出；

<a name="%E7%95%AA%E5%A4%96%E7%AF%874%EF%BC%9Agit%E5%B0%8F%E6%8A%80%E5%B7%A7%E4%B9%8B%E5%88%A0%E9%99%A4repo%E4%B8%8A%E7%9A%84%E6%96%87%E4%BB%B6%E5%A4%B9"></a>
# 番外篇4：git小技巧之删除repo上的文件夹

场景：图片我放到了“Screenshoot”目录，链接写成了“screenshoot”，图片显示不出来。我把本地文件夹手工改成“screenshoot”，add和commit、push之后，发现git不变。配置大小写敏感：

<a name="%E5%8C%BA%E5%88%86%E5%A4%A7%E5%B0%8F%E5%86%99"></a>
## 区分大小写

```shell
git config core.ignorecase false
```

只好手工改了“Screenshoot”为“screenshoot”。

再次add和commit、push之后，发现github中出现了两个文件夹“Screenshoot”、“screenshoot”，

我尝试了mv命令，可是即使配置了大小写敏感也搞不定

```shell
ChinaDreams:O1.8-Docker快速搭建开发环境—实战 kangcunhua$ git mv -f screenshoots Screenshoots
fatal: renaming 'O1-博客/O1.8-Docker快速搭建开发环境—实战/screenshoots' failed: Invalid argument
```

<a name="%E8%A7%A3%E5%86%B3%EF%BC%9A%E5%88%A0%E9%99%A4repo%E4%B8%8A%E7%9A%84%E6%96%87%E4%BB%B6%E5%A4%B9"></a>
## 解决：删除repo上的文件夹

此时，如用git rm -r，则本地文件也被删了。应删缓存。参考：[这里](https://stackoverflow.com/questions/7927230/remove-directory-from-remote-repository-after-adding-them-to-gitignore)。

```Shell
git rm -r --cached some-directory
git commit -m "Remove the now ignored directory some-directory"
git push
```

仓库里两个文件夹消失了，此时重新提交

```shell
git add .
git commit -m 修订图片链接
git push
```

网上也有这么支招的，挺欢乐的：)

```shell
git mv myfolder tmp
git mv tmp MyFolder
```

<a name="%E7%95%AA%E5%A4%96%E7%AF%875%EF%BC%9A%E4%BF%AE%E6%94%B9%E6%97%A0%E6%B3%95%E5%90%AF%E5%8A%A8%E7%9A%84docker%E5%AE%B9%E5%99%A8%E7%9A%84%E9%85%8D%E7%BD%AE"></a>
# 番外篇5：修改无法启动的docker容器的配置

发表于 2016年 10月 11日 济南 作者 [阳光如初](http://www.veryjava.cn/) ；原文地址：[点击这里](http://blog.veryjava.cn/2016/10/11/01/)；**转帖原因**：文章写得太好了，先提前备份下来，有机会测试验证下。

<a name="%E9%97%AE%E9%A2%98%E6%8F%8F%E8%BF%B0"></a>
## 问题描述

mysql在运行过程中报错,进入mysql容器修改配置文件时,单词拼错,导致mysql容器无法重新启动.

<a name="%E8%A7%A3%E5%86%B3%E6%80%9D%E8%B7%AF"></a>
## 解决思路

由于docker无法进入已经停止的容器,所以只能曲线救国.

- 先提交无法进入的docker容器
- 使用临时终端启动新的镜像并修改相应文件,再次提交改容器
- 将无法启动的docker容器中的内容复制出来
- 使用新的镜像启动容器并挂载文件内容

<a name="%E8%A7%A3%E5%86%B3%E6%AD%A5%E9%AA%A4"></a>
## 解决步骤

- 提交已经死亡的mysql容器

- ```shell
  bash docker commit mysql-old sunshineasbefore/mysql
  ```

- 启动临时终端并修改出错的配置文件

- ```shell
  bash docker run -it --name mysql-modify sunshineasbefore/mysql /bin/bash
  bash vim /etc/mysql/my.cnf
  ```

- 复制原有mysql数据库

  ```shell
  bash cp -r /data/docker/volumes/925bca0a69b6bffc06933db5578dcadda2efa3d7cee7c5642d7734e001293353 /_data /xxx/xxx
  ```

- 提交修改后的mysql容器

  ```Shell
  bash docker commit mysql-modify sunshineasbefore/mysql
  ```

- 重新启动新的mysql容器并挂载原有mysql数据库

  ```shell
  bash docker run -d -p 3306:3306 --name mysql-new -v /xxx/xxx/_data/:/var/lib/mysql sunshineasbefore/mysql mysqld
  ```

  **这个地方需要注意:** 因为在第二个步骤启动临时终端时使用了`/bin/bash`命令覆盖了mysql镜像中的`mysqld`命令,如果这一步不使用`mysqld` 命令覆盖回来的话,则不会启动成功.

<a name="%E6%80%BB%E7%BB%93"></a>
## 总结

- 话说在使用docker的过程中,直接进入容器修改配置文件,出错了好像真没有什么办法能够回复.只能在使用过程中注意了…
- 话说在使用docker的过程中,还是要把配置文件挂载出来的好…