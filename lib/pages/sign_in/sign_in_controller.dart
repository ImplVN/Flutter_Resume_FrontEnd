import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/common/widgets/flutter_toast.dart';
import 'package:resume/pages/sign_in/bloc/sign_in_blocs.dart';

class SignInController {
  final BuildContext context;

  SignInController({required this.context});

  Future<void> handleSignIn() async {
    try {
      final state = context.read<SignInBloc>().state;
      String email = state.email;
      String password = state.password;
      if (email.isEmpty) {
        toastInfo(msg: 'メールを入力してください');
        return;
      }

      if (password.isEmpty) {
        toastInfo(msg: 'パスワードを入力してください');
        return;
      }
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        var user = credential.user;
        if (user != null) {
          //
          print('User is exist');
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/home', (route) => false);
        } else {
          toastInfo(msg: 'ユーザーが存在しません');
          return;
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          //
          toastInfo(msg: 'ユーザーが存在しません');
        } else if (e.code == 'wrong-password') {
          //
          toastInfo(msg: 'パスワードが間違っています');
        } else if (e.code == 'invalid-email') {
          //
          toastInfo(msg: 'メールが間違っています');
        } else {
          print(e);
          toastInfo(msg: 'エラーが発生しました');
        }
      }
    } catch (e) {
      print(e);
      toastInfo(msg: 'エラーが発生しました');
    }
  }
}
