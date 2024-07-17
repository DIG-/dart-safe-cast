import 'package:safe_cast/safe_cast.dart';
import 'package:test/test.dart';

void main() {
  final String sample = 'sample';
  final String empty = '';
  final Map<String, String> map = {sample: empty};
  group('Test for Cast static', () {
    test('Cast.as<String>(\'\')', () {
      expect(empty, isNotNull);
      final value = Cast.as<String>(empty);
      expect(value, equals(empty));
    });
    test('Cast.as<String>(\'$sample\')', () {
      expect(sample, isNotNull);
      final value = Cast.as<String>(sample);
      expect(value, equals(sample));
      expect(value, isNot(empty));
    });
    test('Cast.as<String>($map)', () {
      expect(map, isNotNull);
      expect(map, isMap);
      try {
        Cast.as<String>(map);
      } catch (e) {
        expect(e, isA<TypeError>());
        return;
      }
      fail('Must throw exception');
    });
    test('Cast.as<String>(null)', () {
      try {
        Cast.as<String>(null);
      } catch (e) {
        expect(e, isA<TypeError>());
        return;
      }
      fail('Must throw exception');
    });
    test('Cast.asNullable<String>(\'\')', () {
      expect(empty, isNotNull);
      final value = Cast.asNullable<String>(empty);
      expect(value, isNotNull);
      expect(value, equals(empty));
    });
    test('Cast.asNullable<String>(\'$sample\')', () {
      expect(sample, isNotNull);
      final value = Cast.asNullable<String>(sample);
      expect(value, isNotNull);
      expect(value, equals(sample));
      expect(value, isNot(empty));
    });
    test('Cast.asNullable<String>($map)', () {
      expect(map, isNotNull);
      expect(map, isMap);
      final value = Cast.asNullable<String>(map);
      expect(value, isNull);
    });
    test('Cast.asNullable<String>(null)', () {
      final value = Cast.asNullable<String>(null);
      expect(value, isNull);
    });
  });
}
