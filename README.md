# iOS 架构设计

## 1.概述
iOS 开发中，MVC（Model View Controller）是构建iOS App的标准模式，是苹果推荐的一个用来组织代码的权威范式，iOS自己的库基本都是这个模式，而它的缺点如下：

* ViewController代码厚重
* 功能模块划分混乱
* 可测试性差

随着工程越来越大也表现得更加明显，继而MVVM，MVP等架构设计流行起来


## 2.MVVM
![](pg1.png)

#### mvc中的model，添加业务逻辑成胖model，再添加操作数据的接口就成了viewmodel.

### 思路：

- view 引用viewModel，返回view的可用数据 ，但反过来不行（即不要在viewModel中引入#import UIKit.h，任何视图本身的引用都不应该放在viewModel中）
- viewModel 引用model，但反过来不行
- viewController 尽量不涉及业务逻辑，让 viewModel 去做这些事情

### 优势：

- View可以独立于Model变化和修改，一个 viewModel 可以绑定到不同的 View 上
- 开发人员可以专注于业务逻辑和数据的开发(viewModel)，设计人员可以专注于页面设计
- 通常界面是比较难于测试的，而 MVVM 模式可以针对 viewModel来进行测试

### 弊端：

- 数据绑定使得Bug 很难被调试，有可能是View的代码问题，也可能是 Model的代码有问题
- 对于过大的项目，数据绑定需要花费更多的内存。

## 3.MVP

![](pg2.png)
#### mvc中的view，添加特定的UI交合逻辑，变成自定义view，再添加数据的填充逻辑就变成了presenter
### 思路：

- Controller其实将view和viewController传递给了P层, 这样P层其实就拥有了控制器的权利, 完全可以行使控制器的职责.
- Controller又持有Presenter, 那么它只需要调用P层暴露出的接口, 就完全可以完成整个业务逻辑和页面展示
- Controller只负责控制页面跳转，调用其它模块。
- 任务均摊，我们将最主要的任务划分到 Presenter 和 Model，而 View 的功能较少

### 优势：

- 模块化UI组件，Controller结构更加清晰，责任更单一
- UI组件复用好

### 弊端：

- presenter之间的交互比较困难，模块抽取粒度衡量难度大

## 4.总结
MVVM，MVP各个有各自的优缺点，主要职责是减少Controller里面的代码量

- MVVM通过抽取业务数据逻辑而减少Controller的代码
- MVP通过模块化各个UI组件来减少Controller的代码
	



