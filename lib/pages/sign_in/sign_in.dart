import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume/common/layout/adaptive.dart';
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
            appBar: buildAppBar(context, 'ログイン'),
            body: SingleChildScrollView(child: _loginBody(context)),
          )));
    });
  }

  Widget _loginBody(BuildContext context) {
    final spaceHeight = responsiveSize(context, 5.h, 10);
    return Container(
      margin: EdgeInsets.only(
          top: 66.h,
          left: responsiveSize(context, 25.w, assignWidth(context, 0.25)),
          right: responsiveSize(context, 25.w, assignWidth(context, 0.25))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          reusableText(context, 'メール'),
          SizedBox(height: spaceHeight),
          buildTextField(context, 'メールを入力してください', 'email', 'user', (value) {
            context.read<SignInBloc>().add(EmailEvent(value));
          }),
          reusableText(context, 'パスワード'),
          SizedBox(height: spaceHeight),
          buildTextField(context, 'パスワードを入力してください', 'password', 'lock',
              (value) {
            context.read<SignInBloc>().add(PasswordEvent(value));
          }),
          buildLoginAndRegButton(context, 'ログイン', 'login', () {
            SignInController(context: context).handleSignIn();
          }),
          buildLoginAndRegButton(context, '登録', 'register', () {
            Navigator.of(context).pushNamed('/register');
          }),
        ],
      ),
    );
  }
}
