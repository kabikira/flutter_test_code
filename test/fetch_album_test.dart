import 'package:counter_app/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_album_test.mocks.dart';

// Mockito パッケージを使用して MockClient を生成します。
// 各テストでこのクラスの新しいインスタンスを作成します。
@GenerateMocks([http.Client])
void main() {
  group('fetchAlbum', () {
    test(' httpコールが正常に完了した場合、Albumを返します。', () async {
      final client = MockClient();

      // 提供されたhttp.Client.Mockitoを呼び出したときに成功したレスポンスを返すように
      // Mockitoを使用する。
      when(
        client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')),
      ).thenAnswer(
        (_) async =>
            http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200),
      );

      expect(await fetchAlbum(client), isA<Album>());
    });

    test('http 呼び出しがエラーで完了した場合に例外をスローします。', () {
      final client = MockClient();

      // 提供されたhttp.Client.Mockitoを呼び出したときに失敗した応答を返すように
      // Mockitoを使用する
      when(
        client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')),
      ).thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchAlbum(client), throwsException);
    });
  });
}
