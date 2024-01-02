import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
            return ListView.builder(
              itemCount: data.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data.data![index].title),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
