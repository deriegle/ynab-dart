import 'package:ynab/ynab.dart';

void main(List<String> arguments) async {
  final ynab = YNABClient(
      '1a4a5a850e217a8aba0279e4ee64af03fc968a594c0864e18cb94397580ebaa0');

  final res = await ynab.user.getUser();

  if (res.isSuccess) {
    print('success');
    print(res.data);
  } else {
    print('error');
    print(res.error);
  }

  print('rate limited');
  print(res.rateLimited);

  print('rate limit count');
  print(res.rateLimitCount);

  print('rate limit max');
  print(res.rateLimitMax);
}
