import 'package:github_trend/github_trend.dart';
import 'package:html/dom.dart';
import 'package:test/test.dart';
import 'dart:math';

void main() {
  group('test github trending', () {
    GithubTrend githubTrend;
    Document document;
    List<Repo>  repos;
    Repo repo;
    List<String> languages;
    setUp(() async{
      githubTrend = GithubTrend();
      document = await githubTrend.fetchTrending();
      repos = Repos(document).list;
      languages = Languages(document).list;
      repo = repos[Random().nextInt(repos.length)];
    });

    test('get default trending list', () {
      expect(repos, isList);
      expect(repos.length, isNonZero);
    });

    test('repo field buildBy from default trending list read element by random index', () {
      expect(repo.buildBy, isList);
      expect(repos.length, isNonZero);
    });

    test('repo field name from default trending list read element by random index', () {
      expect(repo.name, isNotEmpty);
      expect(repo.name, isNotNull);
    });
    
    test('repo field star from default trending list read element by random index', () {
      expect(repo.star, isNotEmpty);
      expect(repo.star, isNotNull);
      expect(int.parse(repo.star.replaceAll(',', '')), isPositive);
    });

    test('repo field url from default trending list read element by random index', () {
      expect(repo.url, isNotEmpty);
      expect(repo.url, isNotNull);
      expect(RegExp(r"https://github.com/[\w-]+/[\w-]+").hasMatch(repo.url), isTrue);
    });

    test('repo field todayStar from default trending list read element by random index', () {
      expect(repo.todayStar, isNotEmpty);
      expect(repo.todayStar, isNotNull);
      expect(int.parse(repo.star.replaceAll(',', '')), isPositive);
    });

    test('repo field fork from default trending list read element by random index', () {
      expect(repo.fork, isNotEmpty);
      expect(repo.fork, isNotNull);
      expect(int.parse(repo.fork.replaceAll(',', '')), isPositive);
    });

    test('repo field language from default trending list read element by random index', () {
      expect(repo.language, isNotEmpty);
      expect(repo.language, isNotNull);
    });

    test('repo field description from default trending list read element by random index', () {
      expect(repo.description, isNotEmpty);
      expect(repo.description, isNotNull);
    });

    test('language list', () {
      expect(languages, isList);
      expect(languages.length, isNonZero);
    });

    test('get weekly trending list', ()async{
      document = await githubTrend.fetchTrending(since: Since.weekly);
      repos = Repos(document).list;
      languages = Languages(document).list;
      repo = repos[Random().nextInt(repos.length)];
      expect(repos, isList);
      expect(repos.length, isNonZero);
      expect(languages, isList);
      expect(languages.length, isNonZero);
    });

    test('get rust language trending list', ()async{
      document = await githubTrend.fetchTrending(language: "rust");
      repos = Repos(document).list;
      languages = Languages(document).list;
      repo = repos[Random().nextInt(repos.length)];
      expect(repos, isList);
      expect(repos.length, isNonZero);
      expect(languages, isList);
      expect(languages.length, isNonZero);
      expect(repo.language.toLowerCase() == "rust", isTrue);
    });

    test('get rust language trending list by weekly', ()async{
      document = await githubTrend.fetchTrending(language: "rust", since: Since.weekly);
      repos = Repos(document).list;
      languages = Languages(document).list;
      repo = repos[Random().nextInt(repos.length)];
      expect(repos, isList);
      expect(repos.length, isNonZero);
      expect(languages, isList);
      expect(languages.length, isNonZero);
      expect(repo.language.toLowerCase() == "rust", isTrue);
    });
  });
}
