import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reddit_readonly/src/reddit_response.dart';

class RedditClient {
  final String host = "https://www.reddit.com";
  final Map<String, dynamic> parameters = {
    'limit': 25,
    'include_over_18': true,
  };
  final Map<String, dynamic> searchParams = {
    'limit': 25,
    'include_over_18': true,
    'type': "sr,link,user",
  };

  Future<RedditResponse> getSubmissions({
    String? sort,
    String? subreddit,
    Map<String, dynamic>? options,
  }) async {
    Map<String, dynamic> params = {
      'limit': 25,
      'include_over_18': true,
    };

    sort = sort ?? "hot";
    subreddit = subreddit != null ? "/r/$subreddit" : "";

    final response = await http.get(Uri.parse(
        '$host$subreddit/$sort.json?${_mapToUrlParams(params..addAll(options ?? {}))}'));
    return _processResponse(response);
  }

  Future<RedditResponse> getDomainHot(
    String domain, {
    Map<String, dynamic>? options,
  }) async {
    final response = await http.get(Uri.parse(
        "$host/domain/$domain/hot.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<RedditResponse> getDomainBest(
    String domain, {
    Map<String, dynamic>? options,
  }) async {
    final response = await http.get(Uri.parse(
        "$host/domain/$domain/best.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<RedditResponse> getDomainTop(
    String domain, {
    Map<String, dynamic>? options,
  }) async {
    final response = await http.get(Uri.parse(
        "$host/domain/$domain/top.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<RedditResponse> getDomainNew(
    String domain, {
    Map<String, dynamic>? options,
  }) async {
    final response = await http.get(Uri.parse(
        "$host/domain/$domain/new.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<RedditResponse> getDomainRising(
    String domain, {
    Map<String, dynamic>? options,
  }) async {
    final response = await http.get(Uri.parse(
        "$host/domain/$domain/rising.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<RedditResponse> getDomainControversial(
    String domain, {
    Map<String, dynamic>? options,
  }) async {
    final response = await http.get(Uri.parse(
        "$host/domain/$domain/controversial.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<RedditResponse> getSubreddit(String subreddit) async {
    final response = await http.get(Uri.parse("$host/r/$subreddit/about.json"));
    return _processResponse(response);
  }

  Future<RedditResponse> getSubredditRules(String subreddit) async {
    final response =
        await http.get(Uri.parse("$host/r/$subreddit/about/rules.json"));
    return _processResponse(response);
  }

  Future<RedditResponse> getSubredditModerators(String subreddit) async {
    final response =
        await http.get(Uri.parse("$host/r/$subreddit/about/moderators.json"));
    return _processResponse(response);
  }

  Future<RedditResponse> getSubredditWikiPages(String subreddit) async {
    final response =
        await http.get(Uri.parse("$host/r/$subreddit/wiki/pages.json"));
    return _processResponse(response);
  }

  Future<RedditResponse> getSubredditWikiPage(
    String subreddit,
    String page,
  ) async {
    final response =
        await http.get(Uri.parse("$host/r/$subreddit/wiki/$page.json"));
    return _processResponse(response);
  }

  Future<RedditResponse> getSubredditWikiPageRevisions(
    String subreddit,
    String page,
  ) async {
    final response = await http
        .get(Uri.parse("$host/r/$subreddit/wiki/revisions$page.json"));
    return _processResponse(response);
  }

  Future<RedditResponse> getPopularSubreddits(
      {Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/subreddits/popular.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<RedditResponse> getNewSubreddits(
      {Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/subreddits/new.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<RedditResponse> getPremiumSubreddits(
      {Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/subreddits/premium.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<RedditResponse> getDefaultSubreddits(
      {Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/subreddits/default.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<RedditResponse> getPopularUsers(
      {Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/users/popular.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<RedditResponse> getNewUsers({Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/users/new.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<RedditResponse> searchSubmissions(
    String query, {
    Map<String, dynamic>? options,
  }) async {
    options = options ?? {};
    options['q'] = query;
    options['type'] = "link";

    final response = await http
        .get(Uri.parse("$host/search.json?${_mapToUrlParams(options)}"));
    return _processResponse(response);
  }

  Future<RedditResponse> searchSubreddits(
    String query, {
    Map<String, dynamic>? options,
  }) async {
    options = options ?? {};
    options['q'] = query;

    final response = await http.get(
        Uri.parse("$host/subreddits/search.json?${_mapToUrlParams(options)}"));
    return _processResponse(response);
  }

  Future<RedditResponse> searchUsers(
    String query, {
    Map<String, dynamic>? options,
  }) async {
    options = options ?? {};
    options['q'] = query;

    final response = await http
        .get(Uri.parse("$host/users/search.json?${_mapToUrlParams(options)}"));
    return _processResponse(response);
  }

  Future<RedditResponse> searchAll(
    String query, {
    String? subreddit,
    Map<String, dynamic>? options,
  }) async {
    options = options ?? {};
    options['q'] = query;
    subreddit = subreddit != null ? "/r/$subreddit" : "";

    final response = await http.get(
        Uri.parse("$host$subreddit/search.json?${_mapToUrlParams(options)}"));
    return _processResponse(response);
  }

  Future<RedditResponse> getSubmission(String id) async {
    final response = await http.get(Uri.parse("$host/comments/$id.json"));
    return _processResponse(response);
  }

  Future<RedditResponse> getSubmissionComments(
    String id, {
    Map<String, dynamic>? options,
  }) async {
    final url = Uri.parse(
        "$host/comments/$id.json?${_mapToUrlParams(options ?? parameters)}");
    final response = await http.get(url);
    return _processResponse(response);
  }

  Future<RedditResponse> getSubredditComments(
    String subreddit, {
    Map<String, dynamic>? options,
  }) async {
    final response = await http.get(Uri.parse(
        "$host/r/$subreddit/comments.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<RedditResponse> getUser(String username) async {
    final response =
        await http.get(Uri.parse("$host/user/$username/about.json"));
    return _processResponse(response);
  }

  Future<RedditResponse> getUserOverview(
    String username, {
    Map<String, dynamic>? options,
  }) async {
    final response = await http.get(Uri.parse(
        "$host/user/$username/overview.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<RedditResponse> getUserComments(
    String username, {
    Map<String, dynamic>? options,
  }) async {
    final response = await http.get(Uri.parse(
        "$host/user/$username/comments.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<RedditResponse> getUserSubmissions(
    String username, {
    Map<String, dynamic>? options,
  }) async {
    final response = await http.get(Uri.parse(
        "$host/user/$username/submitted.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<RedditResponse> getLiveThread(String id) async {
    final response = await http.get(Uri.parse("$host/live/$id/about.json"));
    return _processResponse(response);
  }

  Future<RedditResponse> getLiveThreadUpdates(
    String id, {
    Map<String, dynamic>? options,
  }) async {
    final response = await http.get(Uri.parse(
        "$host/live/$id.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<RedditResponse> getLiveThreadContributors(
    String id, {
    Map<String, dynamic>? options,
  }) async {
    final response = await http.get(Uri.parse(
        "$host/live/$id/contributors.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<RedditResponse> getLiveThreadDiscussions(
    String id, {
    Map<String, dynamic>? options,
  }) async {
    final response = await http.get(Uri.parse(
        "$host/live/$id/discussions.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<RedditResponse> getLiveThreadsNow(
      {Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/live/happening_now.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  String _mapToUrlParams(Map<String, dynamic> params) => params.entries
      .map((e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value.toString())}')
      .join('&');

  RedditResponse _processResponse(http.Response resp) {
    if (resp.statusCode != 200) {
      throw Exception('Error: ${resp.reasonPhrase} (${resp.statusCode})');
    }

    final json = jsonDecode(resp.body);
    final data = (json is List ? json.first : json)['data'];
    return RedditResponse.fromMap({
      'after': data['after'],
      'posts': data['children'],
    });
  }
}
