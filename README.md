# PieceStore


![](logo.png)

![](http://img.shields.io/badge/Swift-4-orange.svg)  
![Version](https://img.shields.io/cocoapods/v/PieceStore.svg?style=flat)	
![License](https://img.shields.io/cocoapods/l/CmdBluetooth.svg?style=flat)	
![Platform](https://img.shields.io/cocoapods/p/CmdBluetooth.svg?style=flat)

PieceStore是一个轻量级的对象存储框架，以`key-value`方式使用。


# 前言

最近在做一个运动健康方面的项目，在项目中有很多使用NSUserDefalut存储的工作，比如存储用户的userId, user_name以及一些基本的配置信息。之前我们可能简单的使用NSUserDefalut对单个属性进行存储，这会导致代码管理压力。所以PieceStore就是为了解决这种问题而存在的一个小型的框架。

# 适用于

假如你的项目当中有很多的零散信息需要持久化,数据量少，但是分散。还不至于使用数据库这种庞大的存储框架的时候，PieceStore也许非常适合你

# 特性

- 持久化支持多用户
- 对象之间的归档互不影响
- 存储操作简单，再也不需要去编写序列化/反序列化的机械操作

# 安装

### Podfile[require: Swift3.0]
> 已支持Swift4, Swift3需要继承CodingSupport基类，Swift4需要符合Codable协议(其实不需要实现任何接口)

在podfile中添加PieceStore依赖
```swift
pod 'PieceStore', '~> 4.0.0'
```
然后运行pod 更新
```swift
$ pod install
```

# 使用

### Swift3基础用法

 假如项目有个需求，需要存储用户的信息，在没有网络的情况下也可以显示
 
##### 定一个User模型

 > 注意: 存储的Model类一定要继承`CodingSupport`。   

```swift
class User: CodingSupport {
    var name = "default"
    var age = 0 
}
```

##### 更新整个用户信息

```swift
 let user = User()
 user.name = "zero"
 user.age = 23
 PieceStore.saveInfo(obj: user)
```

##### 获取整个用户信息

```swift
 PieceStore.getInfo(type: User.self)
```

##### 更新用户属性信息

```swift 
//更新用户名
  PieceStore.update(User.self, value: name, key: "name")

//更新用户年龄
  PieceStore.update(User.self, value: sex, key: "age")
```

##### 获取用户属性信息

```swift 
  PieceStore.get(User.self, key: "name") as! String
```

--------
### Swift4基础用法

##### 定一个User模型

 > 注意: 存储的Model类一定要继承`Codable`。   

```swift
class UserInfo: Codable {
    var name = "default"
    var age = 0
}
```

##### 更新Model信息

```swift
  let user = User()
  user.name = "zero"
  user.age = 23
  PieceStore.save(obj: userInfo)
```

##### 获取Model信息

```swift
  let userInfo = PieceStore.get(type: User.self)
```

### 进阶用法

我们上面已经存储量用户的相关信息，但是每个用户的信息是不一样的，App由｀User_A｀切换到了｀User_B｀账户，B账户肯定不需要A账户的存储信息，而且当｀User_B｀再切回｀User_A｀的时候，项目要保证A账户的信息还在。
> 这个时候，你可以考虑使用PieceStore的分管理用户存储功能 `handleContext` ， handleContext方法可以在不同管理用户间快速切换，但是注意，同一时间只能存在一个管理用户。
```swift 
  PieceStore.handleContext(id: String)
```
