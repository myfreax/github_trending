import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';
import 'dart:async';
import 'config.dart';

/// Since is a enum  map to github trending time option
enum Since { daily, weekly, monthly }

/// The GithubTrend class for crawl https://github.com/trending page 
class GithubTrend {

  String _trendingURL= site + '/trending';
  
  /// Map the [Since] enumeration to an actual value
  /// 
  /// This is a private method, It only accepts values of the [Since] enumeration type
  /// and return string
  String _since(Since since) {
    switch (since) {
      case Since.monthly:
        return 'monthly';
        break;
      case Since.weekly:
        return 'weekly';
        break;
      default:
        return 'daily';
    }
  }

  /// concat github trending url query parameter
  /// 
  /// [language] is string, it is any string
  /// [since] is [Since] enum value
  String _url(String language, Since since) {
    String uri = _trendingURL;
    if (language != 'all') {
      uri = _trendingURL + '/$language';
    }
    return uri+'?since=$_since(since)';
  }

  /// Sends an HTTP GET request with the given parameter to [_url] method return url, which
  ///
  /// [language] is string, it is any string
  /// [since] is [Since] enum value
  Future<Document> fetchTrending({language = 'all', Since since = Since.daily}) async{
    http.Response response = await http.get(_url(language, since).toLowerCase());
    return parse(response.body);
  }
}
