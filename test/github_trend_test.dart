import 'package:github_trend/github_trend.dart';
import 'package:test/test.dart';

void main() {
  group('github trending', () {
    GithubTrend githubTrend;

    setUp(() {
      githubTrend = GithubTrend();
    });

    test('get default list', () async{
      List<Map<String, dynamic>> array = await githubTrend.fetchRepos();
      expect(array, isList);
    });

    test('get rust language list', () async{
      List<Map<String, dynamic>> array = await githubTrend.fetchRepos(language: 'rust');
      expect(array[0]['language'] , 'Rust');
    });

    test('fetch github language', () async{
      List<String> array = await githubTrend.fetchLanguages();
      expect(array[0], 'C++');
    });
  });
}
