import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reddit_readonly/src/response.dart';

class Client {
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

  Future<Response> getSubmissions({
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

  Future<Response> getDomainHot(
    String domain, {
    Map<String, dynamic>? options,
  }) async {
    final response = await http.get(Uri.parse(
        "$host/domain/$domain/hot.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Response> getDomainBest(
    String domain, {
    Map<String, dynamic>? options,
  }) async {
    final response = await http.get(Uri.parse(
        "$host/domain/$domain/best.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Response> getDomainTop(
    String domain, {
    Map<String, dynamic>? options,
  }) async {
    final response = await http.get(Uri.parse(
        "$host/domain/$domain/top.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Response> getDomainNew(
    String domain, {
    Map<String, dynamic>? options,
  }) async {
    final response = await http.get(Uri.parse(
        "$host/domain/$domain/new.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Response> getDomainRising(
    String domain, {
    Map<String, dynamic>? options,
  }) async {
    final response = await http.get(Uri.parse(
        "$host/domain/$domain/rising.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Response> getDomainControversial(
    String domain, {
    Map<String, dynamic>? options,
  }) async {
    final response = await http.get(Uri.parse(
        "$host/domain/$domain/controversial.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Response> getSubreddit(String subreddit) async {
    final response = await http.get(Uri.parse("$host/r/$subreddit/about.json"));
    return _processResponse(response);
  }

  Future<Response> getSubredditRules(String subreddit) async {
    final response =
        await http.get(Uri.parse("$host/r/$subreddit/about/rules.json"));
    return _processResponse(response);
  }

  Future<Response> getSubredditModerators(String subreddit) async {
    final response =
        await http.get(Uri.parse("$host/r/$subreddit/about/moderators.json"));
    return _processResponse(response);
  }

  Future<Response> getSubredditWikiPages(String subreddit) async {
    final response =
        await http.get(Uri.parse("$host/r/$subreddit/wiki/pages.json"));
    return _processResponse(response);
  }

  Future<Response> getSubredditWikiPage(
    String subreddit,
    String page,
  ) async {
    final response =
        await http.get(Uri.parse("$host/r/$subreddit/wiki/$page.json"));
    return _processResponse(response);
  }

  Future<Response> getSubredditWikiPageRevisions(
    String subreddit,
    String page,
  ) async {
    final response = await http
        .get(Uri.parse("$host/r/$subreddit/wiki/revisions$page.json"));
    return _processResponse(response);
  }

  Future<Response> getPopularSubreddits({Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/subreddits/popular.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Response> getNewSubreddits({Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/subreddits/new.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Response> getPremiumSubreddits({Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/subreddits/premium.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Response> getDefaultSubreddits({Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/subreddits/default.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Response> getPopularUsers({Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/users/popular.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Response> getNewUsers({Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/users/new.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Response> searchSubmissions(
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

  Future<Response> searchSubreddits(
    String query, {
    Map<String, dynamic>? options,
  }) async {
    options = options ?? {};
    options['q'] = query;

    final response = await http.get(
        Uri.parse("$host/subreddits/search.json?${_mapToUrlParams(options)}"));
    return _processResponse(response);
  }

  Future<Response> searchUsers(
    String query, {
    Map<String, dynamic>? options,
  }) async {
    options = options ?? {};
    options['q'] = query;

    final response = await http
        .get(Uri.parse("$host/users/search.json?${_mapToUrlParams(options)}"));
    return _processResponse(response);
  }

  Future<Response> searchAll(
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

  Future<Response> getSubmission(String id) async {
    final response = await http.get(Uri.parse("$host/by_id/$id.json"));
    return _processResponse(response);
  }

  Future<Response> getSubmissionComments(
    String id, {
    Map<String, dynamic>? options,
  }) async {
    final response = await http.get(Uri.parse(
        "$host/comments/$id.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Response> getSubredditComments(
    String subreddit, {
    Map<String, dynamic>? options,
  }) async {
    final response = await http.get(Uri.parse(
        "$host/r/$subreddit/comments.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Response> getUser(String username) async {
    final response =
        await http.get(Uri.parse("$host/user/$username/about.json"));
    return _processResponse(response);
  }

  Future<Response> getUserOverview(
    String username, {
    Map<String, dynamic>? options,
  }) async {
    final response = await http.get(Uri.parse(
        "$host/user/$username/overview.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Response> getUserComments(
    String username, {
    Map<String, dynamic>? options,
  }) async {
    final response = await http.get(Uri.parse(
        "$host/user/$username/comments.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Response> getUserSubmissions(
    String username, {
    Map<String, dynamic>? options,
  }) async {
    final response = await http.get(Uri.parse(
        "$host/user/$username/submitted.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Response> getLiveThread(String id) async {
    final response = await http.get(Uri.parse("$host/live/$id/about.json"));
    return _processResponse(response);
  }

  Future<Response> getLiveThreadUpdates(
    String id, {
    Map<String, dynamic>? options,
  }) async {
    final response = await http.get(Uri.parse(
        "$host/live/$id.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Response> getLiveThreadContributors(
    String id, {
    Map<String, dynamic>? options,
  }) async {
    final response = await http.get(Uri.parse(
        "$host/live/$id/contributors.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Response> getLiveThreadDiscussions(
    String id, {
    Map<String, dynamic>? options,
  }) async {
    final response = await http.get(Uri.parse(
        "$host/live/$id/discussions.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Response> getLiveThreadsNow({Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/live/happening_now.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  String _mapToUrlParams(Map<String, dynamic> params) => params.entries
      .map((e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value.toString())}')
      .join('&');

  Response _processResponse(http.Response response) {
    if (response.statusCode != 200) throw Exception('Failed to load data');

    final json = jsonDecode(response.body);
    final data = json['data'];
    return Response.fromMap({
      'after': data['after'],
      'children': data['children'],
    });
  }
}
