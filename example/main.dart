import 'package:reddit_readonly/reddit_readonly.dart' as reddit;

void main() async {
  final client = reddit.Client();
  // final domain = 'sellsbrothers.com';

  final futures = [
    client.getSubmissions(subreddit: 'programming'),
    // client.getDefaultSubreddits(),
    // client.getDomainBest(domain),
    // client.getDomainControversial(domain),
    // client.getDomainHot(domain),
    // client.getDomainNew(domain),
    // client.getDomainRising(domain),
    // client.getDomainTop(domain),
    // client.getLiveThread(id),
    // client.getSubmissionComments('14yltyd'),
  ];

  for (final future in futures) {
    final response = await future;
    print(response);
  }
}
