---
title: rCore 2020 暑期实验总结
date: 2020-07-26 22:30:56
categories:
    - report
tags:
    - author:VitalyAnkh
    - repo:https://github.com/VitalyAnkh/learn/tree/master/OS/rcore-summer-os
---

## 题前
    虽然本科专业属于数学系，我一直对计算机操作系统以及更底层的系统的运行原理深感兴趣。我也在2018年就学习了Rust 语言，2019 年的上半年一直在自学数学逻辑设计和 CPU 设计。自己设计一个 OS ， CPU 或者其他大型的软硬件系统，是多么令人兴奋的一件事！之前一直畏难，这个夏天，终于在 rCore 的帮助下完成了。

## 过程总结

### Rust
本以为自己 Rust 纯熟不需要写一些练习题，但发现用 Rust 写直接操作硬件的超底层代码还是超出以前的 Rust 经验。

### OS 实验
很惭愧自己只做到lab 2 。一来是对底层代码不熟悉，二来是低估了项目难度，预留时间太少，前面的时间都在东看西看，所以 26 号时才做到lab 2 。

收获实在很多，尤其是看到实验文档中举重若轻般解决一个个跟 RISC-V 有关的问题。

### RISC-V 处理器核
感染到 RISC-V 指令集的优雅简洁与强大，我开始尝试自己用 chisel 实现一个 RISC-V 处理器核。于是学 scala ， 复习数字逻辑知识，学 chisel ，这是让我有最大收获的过程。