import 'package:flutter/material.dart';
import 'package:flutterwebtoon/models/webtoon_model.dart';
import 'package:flutterwebtoon/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WebtoonModel> webtoons = [];
  bool isLoading = true;

  void waitForWebtoons() async {
    webtoons = await ApiService.getTodaysToons();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    waitForWebtoons();
  }

  @override
  Widget build(BuildContext context) {
    print(webtoons);
    print(isLoading);
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
      body: Container(),
    );
  }
}
