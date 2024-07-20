import 'package:safe_cast/safe_cast.dart';
import 'package:test/test.dart';

void main() {
  final String sample = 'sample';
  final String empty = '';
  final String ifNull = 'isNull';
  final Map<String, String> map = {sample: empty};
  ifNullReturn() => ifNull;
  group('Test for SafeCast static', () {
    test('SafeCast.as<String>(\'\', ifNull: ifNullReturn)', () {
      expect(empty, isNotNull);
      final value = SafeCast.as<String>(empty, ifNull: ifNullReturn);
      expect(value, equals(empty));
    });
    test('SafeCast.as<String>(\'$sample\', ifNull: ifNullReturn)', () {
      expect(sample, isNotNull);
      final value = SafeCast.as<String>(sample, ifNull: ifNullReturn);
      expect(value, equals(sample));
      expect(value, isNot(empty));
    });
    test('SafeCast.as<String>($map, ifNull: ifNullReturn)', () {
      expect(map, isNotNull);
      expect(map, isMap);
      final value = SafeCast.as<String>(map, ifNull: ifNullReturn);
      expect(value, equals(ifNull));
    });
    test('SafeCast.as<Map>($map, ifNull: () => {})', () {
      expect(map, isNotNull);
      expect(map, isMap);
      final value = SafeCast.as<Map>(map, ifNull: () => {});
      expect(value, isNotNull);
      expect(value, isMap);
      expect(value, equals(map));
    });
    test('SafeCast.as<Map<int, String>>($map, ifNull: () => {})', () {
      expect(map, isNotNull);
      expect(map, isMap);
      final value = SafeCast.as<Map<int, String>>(map, ifNull: () => {});
      expect(value, isNotNull);
    });
    test('SafeCast.as<String>(null, ifNull: ifNullReturn)', () {
      final value = SafeCast.as<String>(null, ifNull: ifNullReturn);
      expect(value, isNotNull);
      expect(value, equals(ifNull));
    });
    test('SafeCast.asNullable<String>(\'\')', () {
      expect(empty, isNotNull);
      final value = SafeCast.asNullable<String>(empty);
      expect(value, isNotNull);
      expect(value, equals(empty));
    });
    test('SafeCast.asNullable<String>(\'$sample\')', () {
      expect(sample, isNotNull);
      final value = SafeCast.asNullable<String>(sample);
      expect(value, isNotNull);
      expect(value, equals(sample));
      expect(value, isNot(empty));
    });
    test('SafeCast.asNullable<String>($map)', () {
      expect(map, isNotNull);
      expect(map, isMap);
      final value = SafeCast.asNullable<String>(map);
      expect(value, isNull);
    });
    test('SafeCast.asNullable<Map>($map)', () {
      expect(map, isNotNull);
      expect(map, isMap);
      final value = SafeCast.asNullable<Map>(map);
      expect(value, isNotNull);
      expect(value, isMap);
      expect(value, equals(map));
    });
    test('SafeCast.asNullable<Map<int, String>>($map)', () {
      expect(map, isNotNull);
      expect(map, isMap);
      final value = SafeCast.asNullable<Map<int, String>>(map);
      expect(value, isNull);
    });
    test('SafeCast.asNullable<String>(null)', () {
      final value = SafeCast.asNullable<String>(null);
      expect(value, isNull);
    });
  });
}
