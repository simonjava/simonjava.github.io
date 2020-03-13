#入职须知
1. 找段兵营分配个企业邮箱帐号
2. 下载 Tunnelblick VPN ,找段兵营要个vpn的帐号，代码仓库在阿里云上，代码的下载与提交都需要vpn

# 代码下载

项目目录结构如下
livesdk
	app
	skr_flutter
	pbgit

1. 撕歌主项目代码 地址 http://git.inframe.club/chengsimin/livesdk 。访问不了找相关人员配置Member加权限
2. 撕歌项目flutter部分代码 地址 http://git.inframe.club/skrer/skr_flutter 。 访问不了找相关人员配置Member加权限
3. 撕歌项目pbgit部分代码 地址 http://git.inframe.club/skrer/pb . PbGit 定义 下行信令消息 的Protocol buffer 协议。

# 编译环境配置
1. 代码下载完成后
2. 下载NDK，版本为 android-ndk-r15c 。因为音视频引擎原因，只支持这个版本
3. 配置 flutter 编译环境
	1. 下载 flutter sdk。
	2. 使用 flutter version ，切换flutter 分支为 1.9.1+hotfix.6 ，因为我们使用的一个重要的路由组件 flutter boost 只支持这个版本。
	3. 切换到 skr_flutter 目录下，运行 flutter pub get 确保生成 .android 目录

在AS中运行编译或者使用 ./ins.sh 脚本运行编译。


# 项目结构介绍
livesdk --- 撕歌项目
	app --- 空壳app，也有一些flutter methodchannel 代码。以及一些全局事件的处理代码
	baselibray --- 业务无关的基础库
		AndResGuard --- APK包大小压缩库
		android-gif-drawable --- 著名的开源gif库
		arcCloud --- 对演唱进行打分的库，花钱买的
		avstatistics --- 引擎统计
		commonsdk --- 基础库，图片压缩，播放器，音视频缓存工具，各种工具类，图片相册浏览等等等很多基础库，想到的功能几乎都有，不用在业务模块中再写基础库
		enginesdk --- 引擎库
		mediaengine --- 引擎库
		effectsdk --- 抖音魔法表情库
		my-utils-gradle --- gradle插件库，目前没用
		replugin-xxxx --- 360 replugin 插件库，目前没用，不参与编译
	commoncore --- 业务相关，但几乎所有App都有的业务。比如帐号，scheme，权限管理的封装，app的升级的等
	Component --- 业务基础组件库，比如app风格的统一弹窗，统一的歌词渲染控件，通知管理等等
	Module --- 业务模块
		Club --- 家族模块
		Feeds --- 帖子浏览
		Home --- 主页，设置，个人主页等
		IMKit --- 消息模块，对融云的封装，长链接信令的入口也在这
		PlayWays --- 所有游戏的主要玩法都在这，抢唱，排位，双人合唱，主题房等
		Posts --- 帖子的制作与发布
	commonservice --- 定义了Module 对外暴露的接口		
	skr_flutter --- 一些逻辑简单的页面为了节约人力，统一用flutter写，android ios 公用

# 项目架构解析
	1. Module 之间无编译依赖，完全解耦，支持插拔
	2. Module间的通信借助ARouter依赖注入，接口在 commonservice 中暴露
	3. Module的初始化在 XXXConfiguration 中进行，Application在commonsdk层，BaseApplication，在onCreate时会通过反射找出各个Module的Configuration，并执行初始化。

# 相关地址
1. jira地址，测试在上面开bug。负责人，陈墨   https://www.bugclose.com/console.html
2. 石墨文档地址。产品的需求文档在上面。负责人，丁一   https://shimo.im/dashboard
3. 蓝湖地址。设计的设计图在上面。负责人，陈晋涛   https://lanhuapp.com/web/#/item
4. wiki地址 http://wiki.inframe.club/confluence/pages/viewpage.action?pageId=3670683

以上任何地址如果没有权限，在大群里找相关责任人添加权限。


