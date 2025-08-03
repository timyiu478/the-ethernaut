---
title: "Hello Ethernaut"
tags: ["Warm up"]
reference: https://ethernaut.openzeppelin.com/level/0x7E0f53981657345B31C59aC44e9c21631Ce710c7
---

# Description

This level is a tutorial to learn how to play this game.

# Interact with the smart contract using chrome developer console

1. `contract.info()`

```
You will find what you need in info1().
```

2. `contract.info1()`

```
Try info2(), but with \"hello\" as a parameter.
```

3. 

```
await contract.info2("hello")
'The property infoNum holds the number of the next info method to call.'
```

4. 

```
infoNum = await contract.infoNum()
i {negative: 0, words: Array(2), length: 1, red: null}
infoNum.words
(2) [42, empty]
```

5.

```
await contract.info42()
'theMethodName is the name of the next method.'
```

6. 

```
await contract.theMethodName()
'The method name is method7123949.'
```

7.

```
await contract.method7123949()
'If you know the password, submit it to authenticate().'
```

8. get password

guessed correctly which the contract has the password method

```
await contract.password()
'ethernaut0'
```

9. authenticate

```
await contract.authenticate('ethernaut0')
```
