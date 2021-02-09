import 'package:test/test.dart';

import 'package:bottom_rs_dart/bottom_rs_dart.dart';

void main() {
  test('adds one to input values', () {
    final calculator = Bottom();
    expect(calculator.addOne(2), 3); //TODO tests
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
    expect(() => calculator.addOne(null), throwsNoSuchMethodError);
  });
}
