// ignore_for_file: avoid_print

import 'package:reddit_readonly/reddit_readonly.dart';

void main() async {
  final client = RedditClient();

  // paged submissions
  final resp = await client.getSubmissions(subreddit: 'incestconfessions');
  dumpResponse(resp);

  final after = '${resp.posts!.last.kind!.name}_${resp.posts!.last.data!.id}';
  print('---');
  print(resp.after);
  print(after);
  print('---');

  final resp2 = await client.getSubmissions(
    subreddit: 'DungeonCrawlerCarl',
    options: {'after': resp.after},
  );
  // final resp2 = await client.getSubmissions(
  //     subreddit: 'DungeonCrawlerCarl', options: {'after': after});
  for (final post in resp2.posts!) {
    final created = DateTime.fromMillisecondsSinceEpoch(
      (post.data!.created! * 1000).toInt(),
    );
    print('${post.data!.id}: ${post.data!.title!} ($created)');
  }
  final resp3 = await client.getSubmission('1ayza19');
  print(resp3.posts![0].data!.id);
  print(resp3.posts![0].data!.title);
  print(resp3.posts![0].data!.selftext);

  // get author submissions
  // final resp4 = await client.getSubmissions(subreddit: 'programming');
  // final authorId = resp4.posts![1].data!.author!;
  const authorId = 'csells';
  String? after2;
  do {
    final resp = await client.getUserSubmissions(
      authorId,
      subreddit: 'programming',
      options: {'sort': 'new', if (after2 != null) 'after': after2},
    );

    dumpResponse(resp);
    after2 = resp.after;
  } while (after2 != null);

  // search submissions
  final resp6 = await client.searchSubmissions(
    'dart',
    subreddit: 'programming',
  );
  dumpResponse(resp6);

  const domain = 'sellsbrothers.com';
  final futures = <Future<RedditResponse>>[
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

void dumpPost(RedditPost post) {
  final created = DateTime.fromMillisecondsSinceEpoch(
    (post.data!.created! * 1000).toInt(),
  );

  print(
    '$created: ${post.data!.title!} '
    '(${post.data!.subreddit}/${post.data!.id})',
  );
}

void dumpResponse(RedditResponse resp) => resp.posts!.forEach(dumpPost);
