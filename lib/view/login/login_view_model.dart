import 'package:connectify/view/home_view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginViewModelProvider = Provider((ref) => LoginViewModel(ref));

class LoginViewModel {
  final Ref ref;
  LoginViewModel(this.ref);

  onClickLogin(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeView()));
  }
}
