import 'package:github_trending/github_trending.dart';
import 'package:test/test.dart';

void main() {
  group('github trending', () {
    GithubTrending githubTrending;

    setUp(() {
      githubTrending = GithubTrending();
    });

    test('get default list', () async{
      List<Map<String, dynamic>> array = await githubTrending.toList();
      expect(array, isList);
    });

    test('get rust language list', () async{
      List<Map<String, dynamic>> array = await githubTrending.toList(language: 'rust');
      expect(array[0]['language'] , 'Rust');
    });
  });
}
