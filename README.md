# AutoAss
原理
----
读取箱子中前三个物品的数据，计算md5值。

与预存的md5值对比获取对应key。

若能取得匹配key则将物品按顺序分别输入1-14输入总线。

通过key获取配方对应流体、流体需要输入的输入仓以及需要输入的量。

传输流体。

***
需要注意的文件
----
* md5List -- 一个顺序table，存储了key与对应的md5值

  *例子： md5List[1] = f13f3531e58bd60f5bb8e553edf92461 为luv马达前三个物品计算出的值，因此luv马达对应的key值就是1。*

* liquidPosation -- 一个非顺序table，存储了流体名与流体位置的对应关系

  *例子： solder = "2" 流体名：焊锡 位置 2*

* liquidRecipe -- 一个顺序table，存储了流体需求与位置

  *例子：*
  
  *liquidRecipe[1] = {
	{
		type = "solder" ,
		amount = "144",
	},	
	{
		type = "lubricating_oil",
		amount = "250",
	}
}*
