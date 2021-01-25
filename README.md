# AutoAss
***
原理
----
读取箱子中前三个物品的数据，计算md5值。

与预存的md5值对比获取对应key。

若能取得匹配key则将物品按顺序分别输入1-14输入总线。

通过key获取配方对应流体、流体需要输入的输入仓以及需要输入的量。

传输流体。

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


