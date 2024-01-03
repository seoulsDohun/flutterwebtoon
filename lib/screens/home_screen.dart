import 'package:flutter/material.dart';
import 'package:flutterwebtoon/models/webtoon_model.dart';
import 'package:flutterwebtoon/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2, // 그림자 제거
        centerTitle: true,
        backgroundColor: Colors.white, // 배경 색
        foregroundColor: Colors.green, // 글자 색
        title: const Text(
          '오늘의 웹툰',
          style: TextStyle(fontSize: 26),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, data) {
          if (data.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: makeList(data),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> data) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: data.data!.length,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              width: 150,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 15,
                    offset: const Offset(10, 10),
                  ),
                ],
              ),
              child: Image.network(
                data.data![index].thumb,
                headers: const {
                  "User-Agent":
                      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(data.data![index].title),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 20,
        );
      },
    );
  }
}
