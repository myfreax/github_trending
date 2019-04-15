```dart
import 'package:github_trend/github_trending.dart';

main() async {
  GithubTrend githubTrend = GithubTrend();
  // fetch languages
  List<String> languages = await githubTrend.fetchLanguages();
  print(languages);
  
  // default time language
  try {
    List<Map<String, dynamic>> defaultArray =
        await githubTrend.getTrendingRepos();
    print(defaultArray);
  } catch (e) {
    // get origin response
    githubTrend.response;
    print(e);
  }

  // rust language and default time
  List<Map<String, dynamic>> rustArray =
      await githubTrend.getTrendingRepos(language: 'rust');
  print(rustArray);

  // rust language and last weekly
  List<Map<String, dynamic>> rustWeekArray =
      await githubTrend.getTrendingRepos(language: 'rust', since: 'weekly');
  print(rustWeekArray);

  // return default trending when pass error since and language params.
  List<Map<String, dynamic>> rustWeekArrayerror =
      await githubTrend.getTrendingRepos(language: 'error', since: 'error');
  print(rustWeekArrayerror);
}

```