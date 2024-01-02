import 'dart:convert';

import 'package:flutterwebtoon/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String basicUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev';
  static const String todayUrl = 'today';

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstance = [];
    final url = Uri.parse('$basicUrl/$todayUrl');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstance.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstance;
    }
    throw Error();
  }
}
