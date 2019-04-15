import 'package:github_trend/github_trending.dart';
import 'package:test/test.dart';

void main() {
  group('github trending', () {
    GithubTrending githubTrending;

    setUp(() {
      githubTrending = GithubTrending();
    });

    test('get default list', () async{
      List<Map<String, dynamic>> array = await githubTrending.fetchTrendingRepos();
      expect(array, isList);
    });

    test('get rust language list', () async{
      List<Map<String, dynamic>> array = await githubTrending.fetchTrendingRepos(language: 'rust');
      expect(array[0]['language'] , 'Rust');
    });

    test('fetch github language', () async{
      List<String> array = await githubTrending.fetchLanguages();
      expect(array[0], 'All languages');
    });
  });
}
