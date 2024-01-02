import 'package:flutter/material.dart';
import 'package:flutterwebtoon/service/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void apiTest() async {
    ApiService apiService = ApiService();
    await apiService.getTodaysToons();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Row(
              children: [
                IconButton(
                  onPressed: apiTest,
                  icon: const Icon(Icons.ac_unit_outlined),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
