import 'package:flutter/material.dart';
import 'package:flutterwebtoon/models/webtoon_model.dart';
import 'package:flutterwebtoon/services/api_service.dart';
import 'package:flutterwebtoon/widgets/webtoon_widget.dart';

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
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: makeList(snapshot),
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

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      itemBuilder: (context, index) {
        return Webtoon(
          id: snapshot.data![index].id,
          title: snapshot.data![index].title,
          thumb: snapshot.data![index].thumb,
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
