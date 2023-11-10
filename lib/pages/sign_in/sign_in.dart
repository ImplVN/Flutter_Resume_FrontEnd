import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume/pages/common_widgets.dart';
import 'package:resume/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:resume/pages/sign_in/bloc/sign_in_events.dart';
import 'package:resume/pages/sign_in/bloc/sign_in_states.dart';
import 'package:resume/pages/sign_in/sign_in_controller.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
          color: Colors.white,
          child: SafeArea(
              child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar('ログイン'),
            body: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildThirdPartyLogin(context),
                Center(child: reusableText('またはメールアカウントでログインしてください')),
                Container(
                  margin: EdgeInsets.only(top: 66.h),
                  padding: EdgeInsets.only(left: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText('メール'),
                      SizedBox(height: 5.h),
                      buildTextField('メールを入力してください', 'email', 'user', (value) {
                        context.read<SignInBloc>().add(EmailEvent(value));
                      }),
                      reusableText('パスワード'),
                      SizedBox(height: 5.h),
                      buildTextField('パスワードを入力してください', 'password', 'lock',
                          (value) {
                        context.read<SignInBloc>().add(PasswordEvent(value));
                      }),
                      buildLoginAndRegButton('ログイン', 'login', () {
                        SignInController(context: context).handleSignIn();
                      }),
                      buildLoginAndRegButton('登録', 'register', () {
                        Navigator.of(context).pushNamed('/register');
                      }),
                    ],
                  ),
                )
              ],
            )),
          )));
    });
  }
}
