import 'dart:convert';
import 'dart:developer';

import 'package:bloc_architecture/apis/features/posts/models/post_data_ui_model.dart';
import 'package:http/http.dart' as http;

class PostsRepo {
  static Future<List<PostDataUiModel>> fetchPost() async {
    var client = http.Client();
    List<PostDataUiModel> posts = [];
    try {
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      // print(response.body);

      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        PostDataUiModel post =
            PostDataUiModel.fromJson(result[i] as Map<String, dynamic>);
        posts.add(post);
      }
      print(posts);
      return posts;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
