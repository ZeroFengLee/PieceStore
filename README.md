# PieceStore

![](https://travis-ci.org/ZeroFengLee/PieceStore.svg?branch=master)
![](http://img.shields.io/badge/Swift-4-orange.svg)
![Version](https://img.shields.io/cocoapods/v/PieceStore.svg?style=flat)	
![License](https://img.shields.io/cocoapods/l/CmdBluetooth.svg?style=flat)	
![Platform](https://img.shields.io/cocoapods/p/CmdBluetooth.svg?style=flat)

✨PieceStore conveniently used to handle the save model

# Installation

```swift
pod 'PieceStore', '~> 4.0.1'
```

# Use - Swift4

> Inherited protocol `Codable`

##### Define a model

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

##### Set 

```swift
var user = User(name: "myName", age: 12)
PieceStore.save(obj: user)
```

##### Get

```swift
let user = PieceStore.get(type: User.self)
```

# Use - Swift3

 > > Inherited base class `CodingSupport`   

```swift
class User: CodingSupport {
    var name = "default"
    var age = 0 
}
```

##### Set

```swift
 var user = User(name: "myName", age: 12)
 PieceStore.saveInfo(obj: user)
```

##### Get

```swift
 PieceStore.getInfo(type: User.self)
```

##### Update

```swift 
//更新用户名
  PieceStore.update(User.self, value: name, key: "name")
```

##### Get one property

```swift 
  PieceStore.get(User.self, key: "name") as! String
```

--------

# Advantage

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

