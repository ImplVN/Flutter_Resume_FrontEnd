import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/common/widgets/flutter_toast.dart';
import 'package:resume/pages/register/bloc/register_blocs.dart';

class RegisterController {
  final BuildContext context;

  RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: 'ユーザー名を入力してください');
      return;
    }

    if (email.isEmpty) {
      toastInfo(msg: 'メールを入力してください');
      return;
    }

    if (password.isEmpty) {
      toastInfo(msg: 'パスワードを入力してください');
      return;
    }

    if (rePassword.isEmpty) {
      toastInfo(msg: 'パスワードを入力してください');
      return;
    }

    if (password != rePassword) {
      toastInfo(msg: 'パスワードが一致しません');
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        await credential.user?.updateDisplayName(userName);
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: 'パスワードが弱すぎます');
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: 'メールが既に存在しています');
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: 'メールが間違っています');
      } else {
        print(e);
        toastInfo(msg: 'エラーが発生しました');
      }
    } catch (e) {
      print(e);
      toastInfo(msg: 'エラーが発生しました');
    }
  }
}
