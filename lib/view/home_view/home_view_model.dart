import 'dart:async';
import 'dart:io';

import 'package:connectify/model/post_model.dart';
import 'package:connectify/service/post_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewModelProvider = Provider((ref) => HomeViewModel(ref));

class HomeViewModel {
  final Ref ref;
  HomeViewModel(this.ref);

  List<PostModel> get posts => ref.watch(postsProvider);

  List<BottomNavbarIconModel> bottomNavbarIcons = [
    BottomNavbarIconModel(
      activeIcon: Icons.home,
      inactiveIcon: Icons.home_outlined,
    ),
    BottomNavbarIconModel(
      activeIcon: Icons.explore,
      inactiveIcon: Icons.explore_outlined,
    ),
    BottomNavbarIconModel(
      activeIcon: Icons.add,
      inactiveIcon: Icons.add,
    ),
    BottomNavbarIconModel(
      activeIcon: Icons.people,
      inactiveIcon: Icons.people_outline,
    ),
    BottomNavbarIconModel(
      activeIcon: Icons.message,
      inactiveIcon: Icons.message_outlined,
    ),
  ];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  int selectedTab = 0;

  final indexBottomNavbarProvider = StateProvider<int>((ref) {
    return 0;
  });

  final postsProvider = StateProvider<List<PostModel>>((ref) => []);

  List<String> stories = [
    'Selena',
    'Clara',
    'Sara',
    'Lara',
    'Marta',
    'Julieta',
    'Fernanda',
    'Fabian',
    'Mariana',
  ];

  Future<List<PostModel>> getAllPosts() async {
    try {
      final res = await ref.read(postServiceProvider).getAllPosts();
      ref.read(postsProvider.notifier).update((state) => res);
      ref
          .read(postsProvider.notifier)
          .update((state) => state.reversed.toList());
      return posts;
    } on SocketException catch (_) {
      print('no internet');
      rethrow;
    } on TimeoutException catch (_) {
      print('timeout');

      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<PostModel?> insertPost() async {
    try {
      final res = await ref.read(postServiceProvider).insertPost(
            PostModel(
              title: titleController.text,
              body: contentController.text,
              userId: 1,
            ),
          );

      if (res != null) {
        print('res is not null in insert post');
        ref.read(postsProvider.notifier).update((state) => state..add(res));
        ref
            .read(postsProvider.notifier)
            .update((state) => state.reversed.toList());

        return res;
      }
    } on SocketException catch (_) {
      print('no internet');
      rethrow;
    } on TimeoutException catch (_) {
      print('timeout');
      rethrow;
    } catch (e) {
      rethrow;
    } finally {
      clearControllers();
    }
    return null;
  }

  clearControllers() {
    titleController.clear();
    contentController.clear();
  }
}

class BottomNavbarIconModel {
  final IconData activeIcon;
  final IconData inactiveIcon;

  BottomNavbarIconModel({required this.activeIcon, required this.inactiveIcon});
}
