# PieceStore

![](https://travis-ci.org/ZeroFengLee/PieceStore.svg?branch=master)
![](http://img.shields.io/badge/Swift-4-orange.svg)
![Version](https://img.shields.io/cocoapods/v/PieceStore.svg?style=flat)	
![License](https://img.shields.io/cocoapods/l/CmdBluetooth.svg?style=flat)	
![Platform](https://img.shields.io/cocoapods/p/CmdBluetooth.svg?style=flat)

✨PieceStore conveniently used to handle the save model

# Advantage

- Simple & Code readable
- Switch context
- Support multiple users 

# Bad Way

> Set

UserDefaults.standard.set("myName", forKey: "name")  
UserDefaults.standard.set(0, forKey: "age")

> Get

UserDefaults.standard.string(forKey: "name")  
UserDefaults.standard.integer(forKey: "age")

# Good Way

```swift
class User: Codable {
    var name = "default name"
    var age = 12
    
    init(userId: Int, name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
```

> Set

```swift
var user = User(name: "myName", age: 12)
PieceStore.save(obj: user)
```

> Get

```swift
let user = PieceStore.get(type: User.self)
```

## Switch context

```swift
PieceStore.handleContext(userId: "user1.id")
```

## Multiple users

> Set

```swfit
PieceStore.handleContext(userId: "user1.id")
let user01 = User(name: "user1's name", age: 12)
PieceStore.save(obj: user01)

PieceStore.handleContext(userId: "user2.id")
let user02 = User(name: "user2's name", age: 18)
PieceStore.save(obj: user02)
```

> Get

```swift
PieceStore.handleContext(userId: "user1.id")
let user1 = PieceStore.get(type: User.self)

PieceStore.handleContext(userId: "user2.id") // name == "user1's name"
let user2 = PieceStore.get(type: User.self) // name == "user2's name"
```

# Installation

```swift
pod 'PieceStore', '~> 4.0.1'
```

> Swift3需要继承CodingSupport基类，Swift4需要支持Codable协议(其实不需要实现任何接口)

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
