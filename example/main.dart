import 'package:reddit_readonly/reddit_readonly.dart';
import 'package:reddit_readonly/src/reddit_response.dart';

void main() async {
  final client = RedditClient();
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
