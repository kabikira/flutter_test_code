import 'package:counter_app/counter.dart';
import 'package:test/test.dart';

void main() {
  group('テスト開始、インクリメント、デクリメント', () {
    test('値は0から始まる', () {
      expect(Counter().value, 0);
    });
    test('カウンタ値をインクリメントする', () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });

    test('カウンタの値をデクリメントする', () {
      final counter = Counter();

      counter.decrement();

      expect(counter.value, -1);
    });
  });
}
