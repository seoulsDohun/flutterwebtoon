import 'dart:convert';

import 'package:flutterwebtoon/model/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  List<WebtoonModel> webtoonInstance = [];
  final String basicUrl = 'https://webtoon-crawler.nomadcoders.workers.dev';
  final String todayUrl = 'today';

  Future<List<WebtoonModel>> getTodaysToons() async {
    final url = Uri.parse('$basicUrl/$todayUrl');
    final response = await http.get(url);

    // print('response > ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      var index = 0;

      for (var webtoon in webtoons) {
        webtoonInstance.add(WebtoonModel.fromJson(webtoon));

        print(
            'id > ${webtoonInstance[index].id} / title > ${webtoonInstance[index].title}');
        index++;
      }
      return webtoonInstance;
    }
    throw Error();
  }
}
