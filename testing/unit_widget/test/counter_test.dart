import 'package:flutter_test/flutter_test.dart';
import 'package:unit_widget/counter.dart';

void main() {
  test('Counter value should be incremenetd', () {
    final counter = Counter();
    counter.increment();
    expect(counter.value, 1);
  });
}
