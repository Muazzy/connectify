import 'dart:convert';
import 'package:connectify/common/api.dart';
import 'package:connectify/model/post_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

final postServiceProvider = Provider((ref) => PostServiceImpl());

abstract class PostService {
  Future<List<PostModel>> getAllPosts();
  Future<PostModel?> insertPost(PostModel model);
}

class PostServiceImpl extends PostService {
  final _client = Client();

  @override
  Future<List<PostModel>> getAllPosts() async {
    try {
      final response = await _client.get(Uri.parse("$baseUrl/posts"));
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        print(data);
        return PostModel.fromJsonList(data);
      } else {
        throw Exception("Failed to load posts");
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<PostModel?> insertPost(PostModel model) async {
    try {
      final response = await _client.post(
        Uri.parse("$baseUrl/posts"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(model.toInsertJson()),
      );
      print('added new post: ${response.body}');
      if (response.statusCode != 201) {
        throw Exception("Failed to create post");
      }
      return PostModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
