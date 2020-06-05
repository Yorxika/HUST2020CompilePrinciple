## Lab1 词法语法分析器的设计与实现

编译环境：ubuntu 18.04.3 LTS 64-bit
内核版本： 4.18.9
编译过程
```SHELL
flex lex.l
bison -d -v parser.y
gcc ast.c parser.tab.c lex.yy.c -lfl -o test
./test test.c > log.log ## test.c为测试代码 输出见log.log
```

实验完成情况：

+ 二元组
+ 抽象语法树
+ int float char 以及对应的正则表达式识别
+ for break continue 识别
+ 多维数组的识别
+ +-\*/%以及对应的复合赋值运算符识别，自增自减识别
+ 单行注释以及多行注释剔除
+ 
