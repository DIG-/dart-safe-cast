Safe Cast
=========
[![Build Status](https://img.shields.io/github/actions/workflow/status/DIG-/dart-safe-cast/ci.yml)](https://github.com/DIG-/dart-safe-cast/actions/workflows/ci.yml)
[![Pub](https://img.shields.io/pub/v/safe_cast.svg)](https://pub.dev/packages/safe_cast)
[![Pub Score](https://img.shields.io/pub/points/safe_cast?color=2E8B57&label=pub%20points)](https://pub.dev/packages/safe_cast/score)
[![License](https://img.shields.io/static/v1?label=license&message=MIT&color=blue)](https://opensource.org/license/mit)

- Simple syntax
- Reduces boillerplate
- Does not throw like `as T?`

Usage
=====
```dart
import 'package:safe_cast/safe_cast.dart';
 ⋮
 Fruit? fruit = Cast.asNullable<Fruit>(maybeFruit);
 // or, if you need a fruit
 Fruit fruit = SafeCast.as<Fruit>(maybeFruit, ifNull: () => availableFruit());
```

How effective it is
-------------------
It is better for chained operations..
```dart
CuttedFruit? cutted = maybeFruit is Fruit ? maybeFruit.cut(fruitCutter) : null;
// intead of
CuttedFruit? cutted = Cast.asNullable<Fruit>(maybeFruit)?.cut(fruitCutter);
```

License
=======
[The MIT License](https://opensource.org/license/mit)