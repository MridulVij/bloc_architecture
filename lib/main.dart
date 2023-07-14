import 'package:flutter/material.dart';

import 'apis/features/home/home.dart';
import 'apis/features/posts/ui/posts_page.dart';
import 'features/home/ui/home.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostsPage(),
    );
  }
}
