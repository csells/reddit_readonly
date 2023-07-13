import 'package:reddit_readonly/reddit_readonly.dart' as reddit;

void main() async {
  final client = reddit.Client();
  final calls = [
    client.getSubmissions(),
    client.getDefaultSubreddits(),
    client.getDomainBest('sellsbrothers.com'),
  ];
  for (final call in calls) {
    final response = await call;
    print(response);
  }
}
