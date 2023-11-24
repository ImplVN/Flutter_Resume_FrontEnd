import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume/common/layout/adaptive.dart';
import 'package:resume/pages/register/bloc/register_blocs.dart';
import 'package:resume/pages/register/bloc/register_events.dart';
import 'package:resume/pages/register/bloc/register_states.dart';
import 'package:resume/pages/register/register_controller.dart';

import '../common_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return Container(
          color: Colors.white,
          child: SafeArea(
              child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(context, '登録'),
            body: SingleChildScrollView(child: _registerBody(context)),
          )));
    });
  }

  Widget _registerBody(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 66.h,
          left: responsiveSize(context, 25.w, assignWidth(context, 0.25)),
          right: responsiveSize(context, 25.w, assignWidth(context, 0.25))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: responsiveSize(context, 10.h, 20),
          ),
          Center(child: reusableText(context, '以下の内容を入力して、アカウントを作成してください')),
          Container(
            margin: EdgeInsets.only(top: 66.h),
            padding: EdgeInsets.only(left: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                reusableText(context, 'ユーザー名'),
                buildTextField(context, 'ユーザー名を入力してください', 'name', 'user',
                    (value) {
                  context.read<RegisterBloc>().add(UserNameEvent(value));
                }),
                reusableText(context, 'メール'),
                buildTextField(context, 'メールを入力してください', 'email', 'user',
                    (value) {
                  context.read<RegisterBloc>().add(EmailEvent(value));
                }),
                reusableText(context, 'パスワード'),
                buildTextField(context, 'パスワードを入力してください', 'password', 'lock',
                    (value) {
                  context.read<RegisterBloc>().add(PasswordEvent(value));
                }),
                reusableText(context, 'パスワード確認'),
                buildTextField(context, 'パスワード確認を入力してください', 'password', 'lock',
                    (value) {
                  context.read<RegisterBloc>().add(RePasswordEvent(value));
                }),
                Container(
                  margin: EdgeInsets.only(right: 25.w),
                  child: reusableText(context,
                      'アカウントを作成するには、サービス利用規約とプライバシー ポリシーに同意する必要があります。'),
                ),
                buildLoginAndRegButton(context, '登録', 'login', () {
                  RegisterController(context: context).handleEmailRegister();
                }),
                SizedBox(
                  height: responsiveSize(context, 10.h, 20),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
