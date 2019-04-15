```dart
import 'package:github_trend/github_trending.dart';

main() async {
  GithubTrending githubTrending = GithubTrending();
  // fetch languages
  List<String> languages = await githubTrending.fetchLanguages();
  print(languages);
  
  // default time language
  try {
    List<Map<String, dynamic>> defaultArray =
        await githubTrending.getTrendingRepos();
    print(defaultArray);
  } catch (e) {
    // get origin response
    githubTrending.response;
    print(e);
  }

  // rust language and default time
  List<Map<String, dynamic>> rustArray =
      await githubTrending.getTrendingRepos(language: 'rust');
  print(rustArray);

  // rust language and last weekly
  List<Map<String, dynamic>> rustWeekArray =
      await githubTrending.getTrendingRepos(language: 'rust', since: 'weekly');
  print(rustWeekArray);

  // return default trending when pass error since and language params.
  List<Map<String, dynamic>> rustWeekArrayerror =
      await githubTrending.getTrendingRepos(language: 'error', since: 'error');
  print(rustWeekArrayerror);
}

```