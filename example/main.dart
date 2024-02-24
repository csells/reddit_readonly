import 'package:reddit_readonly/reddit_readonly.dart';

void main() async {
  final client = RedditClient();
  // final domain = 'sellsbrothers.com';

  // final resp = await client.getSubmissions(subreddit: 'DungeonCrawlerCarl');
  // final resp = await client.getSubmission('1ayza19');
  // print(resp.posts![0].data!.id);
  // print(resp.posts![0].data!.title);
  // print(resp.posts![0].data!.selftext);
  // return;

  final futures = [
    // client.getSubmissionComments('18zyybw'),
    // client.getSubmissions(subreddit: 'programming'),
    // client.getDefaultSubreddits(),
    // client.getDomainBest(domain),
    // client.getDomainControversial(domain),
    // client.getDomainHot(domain),
    // client.getDomainNew(domain),
    // client.getDomainRising(domain),
    // client.getDomainTop(domain),
    // client.getLiveThread(id),
    // client.getSubmissionComments('1ayza19'),
    client.getSubmission('1ayza19')
  ];

  for (final future in futures) {
    final response = await future;
    print(response);
  }
}
