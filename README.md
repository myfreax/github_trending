# Github trending api for dart
Get the popular repository on github,You can also get all the languages.And convert the data into Map, List, JSON

## Install

[install from pub dev](https://pub.dev/packages/github_trend#-installing-tab-)

## Usage

A simple usage example:

```dart
GithubTrend githubTrend = GithubTrend();
try {
  // default time language
  List<Map<String, dynamic>> repos = await githubTrend.fetchRepos();
  List<String> languages = await githubTrend.fetchLanguages()
  print(repos);
} catch (e) {
  // get origin response
  githubTrend.response;
  print(e);
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/huangyanxiong01/github_trending/issues
