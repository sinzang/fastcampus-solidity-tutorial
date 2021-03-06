# 프로그래밍 기본개념

1. AND, OR 연산이란?

다수의 조건의 true/false에 따라서 `true`와 `false` 결과를 주는 연산자

```
예를들어, x축이 0~10, y축이 0~10까지 만 움직일 수 있다고 가정을 해보자.

A라는 사람의 좌표가 (3, 3)에 위치할 때 (3,4)로 움직일 수 있는지 검사하기 위해서는 x좌표인 3이 0~10사이에 있는지 검사한 후 y축 좌표인 4가 0~10사이에 있는지 검사를 해야한다. 그리고 두개의 검사 결과가 true가 나와야 움직일 수 있다. 이때 사용하는 것이 and연산이다.

반대로 둘중 하나의 조건만 만족해도 true 결과를 얻는것은 or연산이다.

여기서 조건을 검사한 후 나오는 결과를 테이블 형태로 나타낼 수 있는데 이것을 진리표라고 한다.
```

* and 연산 진리표

| 조건 | 조건 | and 연산 결 |
|:--------:|:--------:|:--------:|
| false | false | false |
| false | true | false |
| true | false | false |
| true | true | true |

* or 연산 진리표

| 조건 | 조건 | and 연산 결 |
|:--------:|:--------:|:--------:|
| false | false | false |
| false | true | true |
| true | false | true |
| true | true | true |

프로그램에서 and와 or연산을 하기 위해서는 **`&&`** 와 **`||`** 을 사용하여 표현합니다.

```
require(10 > 1 && 4 < 10); // and 연산
```

10 > 1은 true, 4 < 10은 false이기 때문에 true && false는 false입니다.

```
require(10 > 1 || 4 < 10); // or 연산
```

10 > 1은 true, 4 < 10은 false이기 때문에 true || false는 true입니다.
