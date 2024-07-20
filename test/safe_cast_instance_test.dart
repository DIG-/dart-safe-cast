import 'package:safe_cast/safe_cast.dart';
import 'package:test/test.dart';

void main() {
  final String sample = 'sample';
  final String empty = '';
  final String ifNull = 'isNull';
  final Map<String, String> map = {sample: empty};
  ifNullReturn() => ifNull;
  group('Test for SafeCast instance', () {
    test('SafeCast(\'\', ifNull: ifNullReturn).to<String>()', () {
      expect(empty, isNotNull);
      final value = SafeCast(empty, ifNull: ifNullReturn).to<String>();
      expect(value, equals(empty));
    });
    test('SafeCast(\'$sample\', ifNull: ifNullReturn).to<String>()', () {
      expect(sample, isNotNull);
      final value = SafeCast(sample, ifNull: ifNullReturn).to<String>();
      expect(value, equals(sample));
      expect(value, isNot(empty));
    });
    test('SafeCast($map, ifNull: ifNullReturn).to<String>()', () {
      expect(map, isNotNull);
      expect(map, isMap);
      final value = SafeCast(map, ifNull: ifNullReturn).to<String>();
      expect(value, equals(ifNull));
    });
    test('SafeCast($map, ifNull: () => {}).to<Map>()', () {
      expect(map, isNotNull);
      expect(map, isMap);
      final value = SafeCast(map, ifNull: () => {}).to<Map>();
      expect(value, isNotNull);
      expect(value, isMap);
      expect(value, equals(map));
    });
    test('SafeCast($map, ifNull: () => {}).to<Map<int, String>>()', () {
      expect(map, isNotNull);
      expect(map, isMap);
      try {
        SafeCast(map, ifNull: () => {}).to<Map<int, String>>();
      } catch (e) {
        expect(e, isA<AssertionError>());
        return;
      }
      fail('Must throw exception');
    });
    test('SafeCast($map, ifNull: () => <int, String>{}).to<Map<int, String>>()',
        () {
      expect(map, isNotNull);
      expect(map, isMap);
      final value =
          SafeCast(map, ifNull: () => <int, String>{}).to<Map<int, String>>();
      expect(value, isNotNull);
    });
    test('SafeCast(null, ifNull: ifNullReturn).to<String>()', () {
      final value = SafeCast(null, ifNull: ifNullReturn).to<String>();
      expect(value, isNotNull);
      expect(value, equals(ifNull));
    });
    test('SafeCast(\'\', ifNull: ifNullReturn).toNullable<String>()', () {
      expect(empty, isNotNull);
      final value = SafeCast(empty, ifNull: ifNullReturn).toNullable<String>();
      expect(value, isNotNull);
      expect(value, equals(empty));
    });
    test('SafeCast(\'$sample\', ifNull: ifNullReturn).toNullable<String>()',
        () {
      expect(sample, isNotNull);
      final value = SafeCast(sample, ifNull: ifNullReturn).toNullable<String>();
      expect(value, isNotNull);
      expect(value, equals(sample));
      expect(value, isNot(empty));
    });
    test('SafeCast($map, ifNull: ifNullReturn).toNullable<String>()', () {
      expect(map, isNotNull);
      expect(map, isMap);
      final value = SafeCast(map, ifNull: ifNullReturn).toNullable<String>();
      expect(value, isNull);
    });
    test('SafeCast($map, ifNull: () => {}).toNullable<Map>()', () {
      expect(map, isNotNull);
      expect(map, isMap);
      final value = SafeCast(map, ifNull: () => {}).toNullable<Map>();
      expect(value, isNotNull);
      expect(value, isMap);
      expect(value, equals(map));
    });
    test('SafeCast($map, ifNull: () => {}).toNullable<Map<int, String>>()', () {
      expect(map, isNotNull);
      expect(map, isMap);
      final value =
          SafeCast(map, ifNull: () => {}).toNullable<Map<int, String>>();
      expect(value, isNull);
    });
    test('SafeCast(null, ifNull: ifNullReturn).toNullable<String>()', () {
      final value = SafeCast(null, ifNull: ifNullReturn).toNullable<String>();
      expect(value, isNull);
    });
  });
}
