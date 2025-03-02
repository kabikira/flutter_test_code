import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // テストを定義します。 TestWidgets 関数は、
  // WidgetTester も提供します。 WidgetTester を使用すると、テスト環境で
  // ウィジェットをビルドしたり、ウィジェットと対話したりすることができます。
  testWidgets('MyWidgetはタイトルとメッセージを持つ', (tester) async {
    // テスターにウィジェットのビルドを指示して、ウィジェットを作成します。
    await tester.pumpWidget(const MyWidget(title: 'T', message: 'M'));

    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    // テキストウィジェットがウィジェットツリーにちょうど1回表示されることを
    // 確認するために、flutter_test が提供する `findsOneWidget` matcher を使用する。
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.title, required this.message});

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(child: Text(message)),
      ),
    );
  }
}
