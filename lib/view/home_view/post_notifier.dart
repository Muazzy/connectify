import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectify/model/post_model.dart';
import 'package:connectify/service/post_service.dart';
import 'dart:async';
import 'dart:io';

class PostNotifier extends StateNotifier<List<PostModel>> {
  final PostService postService;

  PostNotifier(this.postService) : super([]);

  Future<void> fetchPosts() async {
    try {
      final posts = await postService.getAllPosts();
      state = posts;
    } on SocketException catch (_) {
    } on TimeoutException catch (_) {}
  }

  Future<void> addPost(PostModel model) async {
    try {
      await postService.insertPost(model);
      state = [model, ...state];
    } on SocketException catch (_) {
    } on TimeoutException catch (_) {}
  }

  void updatePosts(List<PostModel> updatedPosts) {
    state = updatedPosts;
  }
}
