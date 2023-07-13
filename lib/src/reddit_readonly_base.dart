import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reddit_readonly/src/submissions.dart';
import 'package:reddit_readonly/src/subreddits.dart';

import 'domains.dart';

class Reddit {
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

  Future<Submissions> getSubmissions({
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
    return Submissions.fromMap(_processResponse(response));
  }

  Future<Map<String, dynamic>> getDomainHot(String domain,
      {Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/domain/$domain/hot.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Domains> getDomainBest(
    String domain, {
    Map<String, dynamic>? options,
  }) async {
    final response = await http.get(Uri.parse(
        "$host/domain/$domain/best.json?${_mapToUrlParams(options ?? parameters)}"));
    return Domains.fromMap(_processResponse(response));
  }

  Future<Map<String, dynamic>> getDomainTop(String domain,
      {Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/domain/$domain/top.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> getDomainNew(String domain,
      {Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/domain/$domain/new.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> getDomainRising(String domain,
      {Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/domain/$domain/rising.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> getDomainControversial(String domain,
      {Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/domain/$domain/controversial.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> getSubreddit(String subreddit) async {
    final response = await http.get(Uri.parse("$host/r/$subreddit/about.json"));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> getSubredditRules(String subreddit) async {
    final response =
        await http.get(Uri.parse("$host/r/$subreddit/about/rules.json"));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> getSubredditModerators(String subreddit) async {
    final response =
        await http.get(Uri.parse("$host/r/$subreddit/about/moderators.json"));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> getSubredditWikiPages(String subreddit) async {
    final response =
        await http.get(Uri.parse("$host/r/$subreddit/wiki/pages.json"));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> getSubredditWikiPage(
      String subreddit, String page) async {
    final response =
        await http.get(Uri.parse("$host/r/$subreddit/wiki/$page.json"));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> getSubredditWikiPageRevisions(
      String subreddit, String page) async {
    final response = await http
        .get(Uri.parse("$host/r/$subreddit/wiki/revisions$page.json"));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> getPopularSubreddits(
      {Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/subreddits/popular.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> getNewSubreddits(
      {Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/subreddits/new.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> getPremiumSubreddits(
      {Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/subreddits/premium.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Subreddits> getDefaultSubreddits({
    Map<String, dynamic>? options,
  }) async {
    final response = await http.get(Uri.parse(
        "$host/subreddits/default.json?${_mapToUrlParams(options ?? parameters)}"));
    return Subreddits.fromMap(_processResponse(response));
  }

  Future<Map<String, dynamic>> getPopularUsers(
      {Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/users/popular.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> getNewUsers(
      {Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/users/new.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> searchSubmissions(String query,
      {Map<String, dynamic>? options}) async {
    options = options ?? {};
    options['q'] = query;
    options['type'] = "link";

    final response = await http
        .get(Uri.parse("$host/search.json?${_mapToUrlParams(options)}"));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> searchSubreddits(String query,
      {Map<String, dynamic>? options}) async {
    options = options ?? {};
    options['q'] = query;

    final response = await http.get(
        Uri.parse("$host/subreddits/search.json?${_mapToUrlParams(options)}"));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> searchUsers(String query,
      {Map<String, dynamic>? options}) async {
    options = options ?? {};
    options['q'] = query;

    final response = await http
        .get(Uri.parse("$host/users/search.json?${_mapToUrlParams(options)}"));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> searchAll(String query,
      {String? subreddit, Map<String, dynamic>? options}) async {
    options = options ?? {};
    options['q'] = query;
    subreddit = subreddit != null ? "/r/$subreddit" : "";

    final response = await http.get(
        Uri.parse("$host$subreddit/search.json?${_mapToUrlParams(options)}"));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> getSubmission(String id) async {
    final response = await http.get(Uri.parse("$host/by_id/$id.json"));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> getSubmissionComments(String id,
      {Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/comments/$id.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> getSubredditComments(String subreddit,
      {Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/r/$subreddit/comments.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> getUser(String username) async {
    final response =
        await http.get(Uri.parse("$host/user/$username/about.json"));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> getUserOverview(String username,
      {Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/user/$username/overview.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> getUserComments(String username,
      {Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/user/$username/comments.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> getUserSubmissions(String username,
      {Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/user/$username/submitted.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> getLiveThread(String id) async {
    final response = await http.get(Uri.parse("$host/live/$id/about.json"));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> getLiveThreadUpdates(String id,
      {Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/live/$id.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> getLiveThreadContributors(String id,
      {Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/live/$id/contributors.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> getLiveThreadDiscussions(String id,
      {Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/live/$id/discussions.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> getLiveThreadsNow(
      {Map<String, dynamic>? options}) async {
    final response = await http.get(Uri.parse(
        "$host/live/happening_now.json?${_mapToUrlParams(options ?? parameters)}"));
    return _processResponse(response);
  }

  String _mapToUrlParams(Map<String, dynamic> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value.toString())}')
        .join('&');
  }

  Map<String, dynamic> _processResponse(http.Response response) {
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final data = json['data'];
      return {
        'after': data['after'],
        'posts': data['children'],
      };
    } else {
      throw Exception('Failed to load data');
    }
  }
}
