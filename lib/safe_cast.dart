/// Type cast library with friendly syntax
library;

/// Do type cast from [Object?] to any class
final class Cast {
  final Object? _value;

  /// Construct an instance of Cast that contains the [Object?] to be type casted
  /// It is recommended to use the static methods
  const Cast(this._value);

  /// Force type cast to [T], will throw if [null] or is not [T]
  T to<T>() => as<T>(_value);

  /// Type cast to [T], will return [null] if value is [null] or is not [T]
  T? toNullable<T>() => asNullable<T>(_value);

  /// Generate hash code for [SafeCast] instance
  @override
  int get hashCode => Object.hash(super.hashCode, _value);

  /// Compare two [Cast] instance values
  @override
  bool operator ==(Object other) => other is Cast && other._value == _value;

  /// Print content value
  @override
  String toString() => 'Cast(value=$_value)';

  /// Force type cast to [T], will throw if [null] or is not [T]
  @pragma('vm:prefer-inline')
  static T as<T>(Object? value) => value as T;

  /// Type cast to [T], will return [null] if value is [null] or is not [T]
  @pragma('vm:prefer-inline')
  static T? asNullable<T>(Object? value) => value is T ? value : null;
}

/// Do type cast from [Object?] to any class and provides fallback
final class SafeCast<V> implements Cast {
  @override
  final Object? _value;
  final V Function() ifNull;

  /// Construct an instance of SafeCast that contains the [Object?] to be type casted, also with required fallback creator
  /// It is recommended to use the static methods
  const SafeCast(this._value, {required this.ifNull});

  /// Type cast to [T], will return the value created by [ifNull] when the original value is [null] or is not [T]
  @override
  T to<T>() {
    if (_value is T) {
      return _value as T;
    }
    final value = ifNull();
    assert(
      value is T,
      'ifNull must be instance of $T, returned ${value.runtimeType}',
    );
    return value as T;
  }

  /// Type cast to [T], will return [null] if value is [null] or is not [T]
  /// This method does not returns [ifNull]
  /// It is only for compatibility with [Cast] class
  @override
  T? toNullable<T>() => Cast.asNullable<T>(_value);

  /// Generate hash code for [SafeCast] instance
  @override
  int get hashCode => Object.hash(super.hashCode, _value, ifNull);

  /// Compare two [Cast] instance values or two [SafeCast] values and ifNull
  @override
  bool operator ==(Object other) =>
      (other is Cast && other._value == _value) &&
      (other is! SafeCast || other.ifNull == ifNull);

  /// Print content value
  @override
  String toString() => 'SafeCast(value=$_value, ifNull=$ifNull)';

  /// Type cast to [T], will return the value created by [ifNull] when the original value is [null] or is not [T]
  @pragma('vm:prefer-inline')
  static T as<T>(Object? value, {required T Function() ifNull}) =>
      Cast.asNullable<T>(value) ?? ifNull();

  /// Type cast to [T], will return [null] if value is [null] or is not [T]
  /// This method is only for compatibility with Cast to fast replacement
  @pragma('vm:prefer-inline')
  static T? asNullable<T>(Object? value) => Cast.asNullable<T>(value);
}
