---
title: Hexo搭建个人博客使用教程
tags:
  - Hexo
categories:
  - - 教程
    - Hexo
comments: true
copyright: Runlin
copyright_author: Runlin
abbrlink: 48998
date: 2021-09-06 00:00:00
updated:
keywords:
description:
top_img:
cover:
toc:
toc_number:
copyright_author_href:
mathjax:
katex:
aplayer:
aside:
top: true
---

Hexo 是一个快速、简洁且高效的博客框架。Hexo 使用 [Markdown](http://daringfireball.net/projects/markdown/)（或其他渲染引擎）解析文章，在几秒内，即可利用靓丽的主题生成静态网页。

<!-- more -->

# 创建GitHub个人仓库：

## 1、注册GitHub：

进入[GitHub](https://github.com/)官网,点击右上角的**Sign UP**,输入自己的邮箱进行注册。

## 2、新建个人仓库

点击GitHub中的**New repository**创建一个新仓库。

仓库名应该为：**你的GitHub用户名**.github.io

# 在本地搭建Hexo：

## 1、安装Git：

Git 是一 款免费、开源的分布式版本控制系统，也是当今流行的版本控制系统之一，在众多的项目开发中普遍使用，得到程序员和工程师的欢迎和喜爱。

在Hexo博客搭建过程中，Git用于管理Hexo相关的本地文件，并将其上传部署到你的GitHub。

到[Git官网](https://git-scm.com/)上下载最新版本的Git，在安装后，右键菜单栏中将会出现**Git bash here**的选项，并通过该选项来打开**Git Bash**这个命令行工具，后续的Git操作均通过此进行。

在安装后，为了确保安装成功，在命令行中输入`git --version`来查看Git的版本。

## 2、安装Node.js

Node.js 是一个基于 Chrome V8 引擎的 JavaScript 运行环境。Node.js 使用了一个事件驱动、非阻塞式 I/O 的模型，使其轻量又高效。 Node.js 的使用包管理器 npm来管理所有模块的安装、配置、删除等操作。

在Hexo的搭建过程中，我们需要使用npm来进行相关模块的安装。

打开[nodejs](https://nodejs.org/zh-cn/)的官网，选择任意一版本Node.js进行下载(Node.js 版本需不低于 10.13，Hexo官方建议使用 Node.js 12.0 及以上版本)

安装完成后，打开命令行，输入：

```
node -v
npm -v
```

来检查Node.js是否安装成功，出现已下画面，则说明安装成功。

![version](https://raw.githubusercontent.com/GoDKyLiN/Runlin.image.host/main/img/202109050015911.png)

## 3、安装Hexo

在确认安装好Node.js与Git之后，我们可以开始安装Hexo。

新建一个文件夹（名字随意），然后打开这个文件夹，并在这个文件夹下右键打开**Git bash**。

输入npm 安装 Hexo。

```
$ npm install -g hexo-cli
```

对于熟悉 npm 的进阶用户，可以仅局部安装 `hexo` 包。

```
$ npm install hexo
```

安装完成后使用`hexo -v`来查看Hexo的版本。

安装 Hexo 完成后，请执行下列命令，Hexo 将会在指定文件夹中新建所需要的文件。

```
$ hexo init //在当前文件夹中初始化Hexo
$ npm install //在当前文件夹中进行安装
```

新建完成后，指定文件夹的目录如下：

```
.
├── _config.yml
├── package.json
├── scaffolds
├── source
|   ├── _drafts
|   └── _posts
└── themes
```

我们来简单的介绍一下这些文件的功能：

_config.yml：网站的 [配置](https://hexo.io/zh-cn/docs/configuration) 信息，您可以在此配置大部分的参数。

package.json：Hexo所使用的应用程序的信息。[EJS](https://ejs.co/), [Stylus](http://learnboost.github.io/stylus/) 和 [Markdown](http://daringfireball.net/projects/markdown/) renderer 已默认安装。

scaffolds：[模版](https://hexo.io/zh-cn/docs/writing) 文件夹。当您新建文章时，Hexo 会根据 scaffold 来建立文件。

source：资源文件夹是存放用户资源的地方。

themes：[主题](https://hexo.io/zh-cn/docs/themes) 文件夹。Hexo 会根据主题来生成静态页面。

接下来我们来生成初始的博客页面：

```
hexo g
hexo s
```

在服务器中输入http://localhost:4000/ 就可以看到你生成的博客了。

欣赏完你的博客后，可以使用**ctrl + c**关掉该服务。

# 将Hexo部署到你的GitHub

在Git Bash中输入：

```
git config --global user.name "你Github的用户名"
git config --global user.email "你GitHub的注册邮箱"
```

然后生成.ssh密钥文件（无需输入，连按三个回车即可）：

```bash
ssh-keygen -t rsa -C "你GitHub的注册邮箱"
```

在生成密钥文件后，打开你本地的C:\Users\Username\\.ssh文件夹，找到生成的`id_rsa.pub`公钥，用记事本打开，将其内容全部复制。

![公钥](https://raw.githubusercontent.com/GoDKyLiN/Runlin.image.host/main/img/202109050022772.png)

回到GitHub，打开Setting页面，找到并进入`SSH and GPG keys`，点击`New SSH key` ，把你的`id_rsa.pub`里面的信息复制进去，最后点击**Add SSH key**。(Title随便取一个名字就行)

![ssh and gpg keys](https://raw.githubusercontent.com/GoDKyLiN/Runlin.image.host/main/img/202109050022157.png)

为了检测GitHub公钥是否连接成功，在本地的Git Bash中输入：

```text
ssh -T git@github.com
```

![SSH成功](https://raw.githubusercontent.com/GoDKyLiN/Runlin.image.host/main/img/202109050014855.png)

出现以上内容，则说明设置成功，通过接下来的操作，可以将本地的Hexo部署到GitHub上。

打开站点配置文件`_config.yml`,拉到底部，修改以下内容

```text
deploy:
  type: git
  repo: https://github.com/你Github的用户名/你Github的用户名.github.io.git 
  branch: main 
```

2020年10月后，GitHub将库的默认分支从master改为了main，因此，相较于以前的教程，这里的branch需填成` branch` 。

修改完成后，在Git Bash中输入：（让Hexo将你的blog部署在GitHub的仓库里）

```text
npm install hexo-deployer-git --save
```

然后，输入：

```text
hexo clean  //清除已生成文件
hexo g  //hexo generate 生成
hexo d  //hexo deploy 部署
```

完成后等待一段时间，打开浏览器，输入`https://你Github的用户名.github.io/ `,即可访问你的博客。

# 将博客绑定个人域名

你现在博客的地址为`你的GitHub用户名.github.io`

由于域名过长，不方便记忆，不利于个人博客的推广，因此我们通常会选择设置一个更简短的个人域名。

## 1、申请域名

域名注册有多种方式，可以选择付费的域名，也可以选择免费的域名。

获取免费域名的攻略如下：



作者建议选择购买付费的域名，因为部分顶级域名仍然处于推广期，费用不算很高，一年就几十块的费用，但你完全的具有这个域名的使用权和拥有权，比较放心。

注册一个阿里云账户，可选用支付宝直接登录，进行实名认证后，在[万网](https://wanwang.aliyun.com/)上进行域名的购买，作者购买的域名为`runlin.tech`,新注十年的价格仅为199，算下来年均20，我认为比较划算。

## 2、Dns解析

在本地用win+R快捷键打开‘运行“窗口，输入cmd运行命令行控制台，打开后输入：

```
ping yourname.github.io
```

返回的值即为你托管在GitHub上的Blog的ip。

进入[域名解析列表](https://dns.console.aliyun.com/)并对购买的域名进行解析。

![域名设置](https://raw.githubusercontent.com/GoDKyLiN/Runlin.image.host/main/img/202109041414984.png)

删除默认的解析并添加以下解析，如图：

![解析设置](https://raw.githubusercontent.com/GoDKyLiN/Runlin.image.host/main/img/202109041414741.png)

## 3、GitHub设置

登录GitHub，找到托管博客的仓库，在Settings中进入GitHub Pages，对域名进行设置：

![GitHubPages设置](https://raw.githubusercontent.com/GoDKyLiN/Runlin.image.host/main/img/202109050021822.png)

## 4、GitHub CNAME文件的设置

在本地博客文件下找到source文件夹，新建一个名为**CNAME**的文件(#**CNAME文件没有后缀**)，内容为你购买的域名：

![CNAME文件](https://raw.githubusercontent.com/GoDKyLiN/Runlin.image.host/main/img/202109041427581.png)

然后去到你blog的根目录下，修改 _config.yml 文件：

```
skip_render: CNAME
```

最后在Git Bash中，输入：

```text
hexo clean
hexo g
hexo d
```

到此，你的域名就与你的博客站点关联在一起了。

在绑定新域名后，你原来`yourname.github.io`的域名并未失效，只是会自动跳转到你的新域名。

# 实现Hexo Blog的多端同步

由于我更倾向于在笔记本上进行写作，而搭建博客的本地文件则保留在台式机上，为了方便记录灵感，我们可以利用Git管理代码，实现Hexo的多端同步。

我们在输入hexo d时，实则是将在本地编译生成，保存在`.deploy_git`中的源文件上传部署到GitHub中，而其它本地配置的文件，包括source和themes在内的所有文件都没有上传到GitHub中。

因此，我们可以通过将Hexo环境上传到GitHub仓库的方式，来实现多端同步，方法如下。

## 1、新建仓库分支-Hexo

在仓库中新建一个空的hexo分支，如图：

![创建hexo分支](https://raw.githubusercontent.com/GoDKyLiN/Runlin.image.host/main/img/202109050013646.png)
并在Settings中将hexo分支设为默认分支；

![设置hexo为默认分支](https://raw.githubusercontent.com/GoDKyLiN/Runlin.image.host/main/img/202109050013656.png)

## 2、使用Git clone拷贝仓库

在本地的任意目录下，右键打开Git Bash，输入在code中找到的clone命令，

![git clone](https://raw.githubusercontent.com/GoDKyLiN/Runlin.image.host/main/img/202109050016048.png)

```
git clone git@github.com:GoDKyLiN/GoDKyLiN.github.io.git
```

将其克隆到本地；

在克隆到本地的`GoDKyLiN.github.io`中，把除了.git文件夹以外的所有文件夹都删除，

并将本地的博客文件中，除了`.deploy_git`以外的所有源文件全部复制进去。

新建一个.gitignore文件（没有后缀！！！），忽略一些不需要上传的文件，内容如下：

```
.DS_Store
Thumbs.db
db.json
*.log
node_modules/
public/
.deploy*/
```

然后

```
git add .
git commit –m "hexo" //一个名为hexo的上传操作，方便回滚
git push 
```

然后你就能在GitHub上看到你的配置文件了。

![hexo 配置文件](https://raw.githubusercontent.com/GoDKyLiN/Runlin.image.host/main/img/202109050015688.png)

## 3、在另一台设备上进行克隆

按照上文在本地搭建Hexo的方式在另一台设备上搭建Hexo环境

在Git Bash中输入：

```
git config --global user.name "你Github的用户名"
git config --global user.email "你GitHub的注册邮箱"
```

然后生成.ssh密钥文件（无需输入，连按三个回车即可）：

```
ssh-keygen -t rsa -C "你GitHub的注册邮箱"
```

回到GitHub，打开Setting页面，找到并进入SSH and GPG keys，点击New SSH key ，把你的id_rsa.pub里面的信息复制进去，最后点击Add SSH key。(Title随便取一个名字就行)

为了检测GitHub公钥是否连接成功，在本地的Git Bash中输入：

```
ssh -T git@github.com #验证是否成功
```

进入克隆到的文件夹：

```
npm install
npm install hexo-deployer-git --save
```

自此，你就可以在你的另一台设备上进行写作了，生成、部署：

```
hexo g
hexo d
```

在完成一次更新后，记得进行一次上传操作，留下备份：

```
git add .
git commit –m "hexo" //一个名为hexo的上传操作，方便回滚
git push 
```

可以使用`git pull`这个操作，直接和远端仓库进行同步。

自此，Hexo的多端同步已经完成。

# 为Hexo更换主题
