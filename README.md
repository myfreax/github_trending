Github trending api for dart

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).

## Usage

A simple usage example:

```dart
GithubTrending githubTrending = GithubTrending();
try {
  // default time language
  List<Map<String, dynamic>> defaultArray = await githubTrending.toList();
  print(defaultArray);
} catch (e) {
  // get origin response
  githubTrending.response;
  print(e);
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme
