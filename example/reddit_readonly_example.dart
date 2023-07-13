import 'package:reddit_readonly/src/reddit_readonly_base.dart';

void main() async {
  final reddit = Reddit();
  final obj1 = await reddit.getSubmissions();
  print(obj1);
  final obj2 = await reddit.getDefaultSubreddits();
  print(obj2);
  final obj3 = await reddit.getDomainBest('sellsbrothers.com');
  print(obj3);
}
