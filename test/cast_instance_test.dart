import 'package:safe_cast/safe_cast.dart';
import 'package:test/test.dart';

void main() {
  final String sample = 'sample';
  final String empty = '';
  final Map<String, String> map = {sample: empty};
  group('Test for Cast instance', () {
    test('Cast(\'\').to<String>()', () {
      expect(empty, isNotNull);
      final value = Cast(empty).to<String>();
      expect(value, equals(empty));
    });
    test('Cast(\'$sample\').to<String>()', () {
      expect(sample, isNotNull);
      final value = Cast(sample).to<String>();
      expect(value, equals(sample));
      expect(value, isNot(empty));
    });
    test('Cast($map).to<String>()', () {
      expect(map, isNotNull);
      expect(map, isMap);
      try {
        Cast(map).to<String>();
      } catch (e) {
        expect(e, isA<TypeError>());
        return;
      }
      fail('Must throw exception');
    });
    test('Cast($map).to<Map>()', () {
      expect(map, isNotNull);
      expect(map, isMap);
      final value = Cast(map).to<Map>();
      expect(value, isNotNull);
      expect(value, isMap);
      expect(value, equals(map));
    });
    test('Cast($map).to<Map<int, String>>()', () {
      expect(map, isNotNull);
      expect(map, isMap);
      try {
        Cast(map).to<Map<int, String>>();
      } catch (e) {
        expect(e, isA<TypeError>());
        return;
      }
      fail('Must throw exception');
    });
    test('Cast(null).to<String>()', () {
      try {
        Cast(null).to<String>();
      } catch (e) {
        expect(e, isA<TypeError>());
        return;
      }
      fail('Must throw exception');
    });
    test('Cast(\'\').toNullable<String>()', () {
      expect(empty, isNotNull);
      final value = Cast(empty).toNullable<String>();
      expect(value, isNotNull);
      expect(value, equals(empty));
    });
    test('Cast(\'$sample\').toNullable<String>()', () {
      expect(sample, isNotNull);
      final value = Cast(sample).toNullable<String>();
      expect(value, isNotNull);
      expect(value, equals(sample));
      expect(value, isNot(empty));
    });
    test('Cast($map).toNullable<String>()', () {
      expect(map, isNotNull);
      expect(map, isMap);
      final value = Cast(map).toNullable<String>();
      expect(value, isNull);
    });
    test('Cast($map).toNullable<Map>()', () {
      expect(map, isNotNull);
      expect(map, isMap);
      final value = Cast(map).toNullable<Map>();
      expect(value, isNotNull);
      expect(value, isMap);
      expect(value, equals(map));
    });
    test('Cast($map).toNullable<Map<int, String>>()', () {
      expect(map, isNotNull);
      expect(map, isMap);
      final value = Cast(map).toNullable<Map<int, String>>();
      expect(value, isNull);
    });
    test('Cast(null).toNullable<String>()', () {
      final value = Cast(null).toNullable<String>();
      expect(value, isNull);
    });
  });
}
