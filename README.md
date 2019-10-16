# Github trending api for dart
Get the popular repository on github. You can also get popular repository by language or time(daily, weekly, monthly).

## Install

[install from pub dev](https://pub.dev/packages/github_trend#-installing-tab-)

## Usage

A simple usage example:

```dart
import 'package:github_trend/github_trend.dart';
import 'package:html/dom.dart';

main() async {
  GithubTrend githubTrend = GithubTrend();
  try {
    Document document = await githubTrend.fetchTrending();
    List<Repo> repos = Repos(document).list;
    List<String> languages = Languages(document).list;
    repos[0].name;
    print(languages);
  } catch (e) {
    // handle error
  }
}
```

## Doc
[Online Doc](https://pub.dev/packages/github_trend/versions)

Local Doc

```shell
git clone git@github.com:huangyanxiong01/github_trending.git
pub get
dartdoc
pub global activate dhttpd
dhttpd --path doc/api
```
Server started on port 8080

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/huangyanxiong01/github_trending/issues
