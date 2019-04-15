import 'package:github_trend/github_trend.dart';
import 'dart:convert';

main() async {
  GithubTrend githubTrend = GithubTrend();

  // fetch languages
  List<String> languages = await githubTrend.fetchLanguages();
  print(languages);
  print(json.encode(languages));
  // default time language
  try {
    List<Map<String, dynamic>> defaultArray =
        await githubTrend.fetchTrendingRepos();
    print(defaultArray);
  } catch (e) {
    // get origin response
    githubTrend.response;
    print(e);
  }

  // rust language and default time
  List<Map<String, dynamic>> rustArray =
      await githubTrend.fetchTrendingRepos(language: 'rust');
  print(rustArray);

  // rust language and last weekly
  List<Map<String, dynamic>> rustWeekArray = await githubTrend
      .fetchTrendingRepos(language: 'rust', since: 'weekly');
  print(rustWeekArray);

  // return default trending when pass error time and language params.
  List<Map<String, dynamic>> rustWeekArrayerror = await githubTrend
      .fetchTrendingRepos(language: 'error', since: 'error');
  print(rustWeekArrayerror);
}
