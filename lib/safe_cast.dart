/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

final class Cast {
  final dynamic _value;
  const Cast(this._value);
  T to<T>() => as<T>(_value);
  T? toNullable<T>() => asNullable<T>(_value);

  @pragma('vm:prefer-inline')
  static T as<T>(dynamic value) => value as T;
  @pragma('vm:prefer-inline')
  static T? asNullable<T>(dynamic value) => value is T ? value : null;
}

final class SafeCast<V> implements Cast {
  @override
  final dynamic _value;
  final V Function() ifNull;
  const SafeCast(this._value, {required this.ifNull});

  @override
  T to<T>() {
    if (_value is T) {
      return _value;
    }
    final value = ifNull();
    assert(
      value is T,
      'ifNull must be instance of $T, returned ${value.runtimeType}',
    );
    return value as T;
  }

  @override
  T? toNullable<T>() => Cast.asNullable<T>(_value);

  @pragma('vm:prefer-inline')
  static T as<T>(dynamic value, {required T Function() ifNull}) =>
      Cast.asNullable<T>(value) ?? ifNull();
  @pragma('vm:prefer-inline')
  static T? asNullable<T>(dynamic value) => Cast.asNullable<T>(value);
}
