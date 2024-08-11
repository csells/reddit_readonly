// ignore_for_file: avoid_print

import 'package:reddit_readonly/reddit_readonly.dart';

void main() async {
  final client = RedditClient();
  const domain = 'sellsbrothers.com';

  // paged submissions
  final resp = await client.getSubmissions(subreddit: 'DungeonCrawlerCarl');
  for (final post in resp.posts!) {
    print('${post.data!.id}: ${post.data!.title!}');
  }

  final after = '${resp.posts!.last.kind!.name}_${resp.posts!.last.data!.id}';
  print('---');
  print(resp.after);
  print(after);
  print('---');

  final resp2 = await client.getSubmissions(
      subreddit: 'DungeonCrawlerCarl', options: {'after': resp.after});
  // final resp2 = await client.getSubmissions(
  //     subreddit: 'DungeonCrawlerCarl', options: {'after': after});
  for (final post in resp2.posts!) {
    print('${post.data!.id}: ${post.data!.title!}');
  }
  final resp3 = await client.getSubmission('1ayza19');
  print(resp3.posts![0].data!.id);
  print(resp3.posts![0].data!.title);
  print(resp3.posts![0].data!.selftext);

  // search subreddit
  final resp4 = await client.getSubmissions(subreddit: 'programming');
  final authorId = resp4.posts![0].data!.author!;
  final resp5 = await client.searchSubmissions(
    authorId,
    subreddit: 'programming',
  );
  print(resp5);

  final futures = [
    client.getSubmissionComments('18zyybw'),
    client.getSubmissions(subreddit: 'programming'),
    client.getDefaultSubreddits(),
    client.getDomainBest(domain),
    client.getDomainControversial(domain),
    client.getDomainHot(domain),
    client.getDomainNew(domain),
    client.getDomainRising(domain),
    client.getDomainTop(domain),
    client.getSubmissionComments('1ayza19'),
    client.getSubmission('1ayza19'),
    client.getUserSubmissions('csells'),
  ];

  for (final future in futures) {
    final response = await future;
    print(response);
  }
}
