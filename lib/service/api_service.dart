import 'package:http/http.dart' as http;

class ApiService {
  final String basicUrl = 'https://webtoon-crawler.nomadcoders.workers.dev';
  final String todayUrl = 'today';

  void getTodaysToons() async {
    final url = Uri.parse('$basicUrl/$todayUrl');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);
      return;
    }
    throw Error();
  }
}
