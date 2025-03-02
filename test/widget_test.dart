import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('finds a Text widget', (tester) async {
    // 文字'H'を表示するテキスト・ウィジェットを持つアプリを作る。
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: Text('H'))));

    // 文字'H'を表示するウィジェットを探す。
    expect(find.text('H'), findsOneWidget);
  });

  testWidgets('finds a widget using a Key', (tester) async {
    // テスト・キーを定義する。
    const testKey = Key('K');

    // testKey で MaterialApp をビルドします。
    await tester.pumpWidget(MaterialApp(key: testKey, home: Container()));

    // testKeyを使用してMaterialAppウィジェットを検索します。
    expect(find.byKey(testKey), findsOneWidget);
  });

  testWidgets('finds a specific instance', (tester) async {
    const childWidget = Padding(padding: EdgeInsets.zero);

    //コンテナに子ウィジェットを提供します。
    await tester.pumpWidget(Container(child: childWidget));

    // ツリー内で子ウィジェットを検索し、存在することを確認する。
    expect(find.byWidget(childWidget), findsOneWidget);
  });
}
