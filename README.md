# AutoAss
***

![image](https://github.com/Acquity2/AutoAss/blob/main/image/1.png)

开放式电脑机器人自动化GT New Horizons装配线

机器人组装
----
![image](https://github.com/Acquity2/AutoAss/blob/main/image/2.png)

最基础的机器人需要：

	1*高级机箱 1*t2APU 2*t2内存 1*luabios 1*t2硬盘 基础与高级水箱升级 基础与高级物品栏控制升级 键盘 基础显示器 磁盘 因特网卡

搭建
----
* 搭建装配线

* 在每个输入仓下方附加gt泵，并用螺丝刀将其调至输入模式

* 在每个输入仓下放置流体容器（例如超低压流体储罐）

* 将机器人置于装配线第一个输入总线之下，机器人需面向装配线末端

* 在机器人下方放置箱子，此箱子为me接口向自动化系统输入合成材料的物品容器

* 在箱子后放置流体容器，其中流体分别为：焊锡、润滑油、丁苯橡胶、冷却液...

	*此处流体的位置在liquidPosition.lua中定义

* 在机器人右侧放置充电器并且连接发电机，使用红石信号激活充电器

* 启动机器人开始安装程序

原理
----
读取箱子中前三个物品的数据，计算md5值。

与预存的md5值对比获取对应key。

若能取得匹配key则将物品按顺序分别输入1-14输入总线。

通过key获取配方对应流体、流体需要输入的输入仓以及需要输入的量。

传输流体。

安装
----
下载downloader.lua `pastebin get -f YyUC6kwG downloader.lua`

使用downloader.lua下载文件，运行trigger.lua即开始运行。

启动更新程序指令:

`cd /home`

`downloader`

无脑启动方式如下:

开机后输入

`cd autoAss/`

`Trigger`

关闭软件直接重启oc机器人

需要注意的文件
----
* md5List -- 一个顺序table，存储了key与对应的md5值

  	*例子： `md5List[1] = f13f3531e58bd60f5bb8e553edf92461` 为luv马达前三个物品计算出的值，因此luv马达对应的key值就是1。*

* liquidPosation -- 一个非顺序table，存储了流体名与流体存储位置（超级缸）的对应关系

  	*例子： `solder = "2"` 流体名：焊锡 位置：2*

* liquidRecipe -- 一个顺序table，存储了流体需求与输入仓位置

  	*例子：*
  
  	*`liquidRecipe[1] = {{type = "solder" ,amount = "144",},	{type = "lubricating_oil",amount = "250",}}`*
  	*key值为1的需求与位置，这里是一个table的嵌套，内部为一个顺序table。key值1234分别为输入仓的位置，type为流体名，amount为流体量。*

* calculateMd5 -- 计算md5使用的脚本
	
	*将配方所需物品放入机器人下方箱子内，运行此脚本即可获取配方md5，便于添加配方。*
	
	*md5值输出至 `/tmp/result.md5` *
	
其他的一些事情
----
* 机器人使用类似坐标轴的方法记录位置以及移动，通过 `require("robotCoordinateMovement")` 之后可以用 `robotCoordinateMovement.moveTo(now,target)` 来控制机器人移动。now为机器人所处坐标，target为希望机器人移动到的坐标。

	*例子: 机器人处于第二个输入总线下，希望机器人回归原位*

	*`robotCoordinateMovement.moveTo(2,1)`*

	*坐标轴原点可以随意选取，但是本脚本集中控制自动化装配线的部分中第一个输入总线下的坐标为1*

* 其他的想到再写


