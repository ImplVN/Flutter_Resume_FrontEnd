import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume/common/layout/adaptive.dart';
import 'package:resume/common/values/values.dart';

AppBar buildAppBar(BuildContext context, String title) {
  final fontSize = responsiveSize(context, 16.sp, 20, md: 20);
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 1.0,
      ),
    ),
    title: Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

// We need context for accessing the bloc
Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
      margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _reusableIcons('assets/icons/google.png'),
          _reusableIcons('assets/icons/apple.png'),
          _reusableIcons('assets/icons/facebook.png'),
        ],
      ));
}

Widget _reusableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset(iconName),
    ),
  );
}

Widget reusableText(BuildContext context, String text) {
  final fontSize = responsiveSize(context, 14.sp, 20, md: 20);
  return Container(
    margin: const EdgeInsets.only(bottom: 5),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey.withOpacity(0.5),
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

Widget buildTextField(BuildContext context, String hintText, String textType,
    String iconName, void Function(String value)? func) {
  return Container(
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.w),
      border: Border.all(
        color: Colors.black,
      ),
    ),
    child: Row(
      children: [
        Container(
          width: 16.w,
          height: 16.w,
          margin: const EdgeInsets.only(left: 17),
          child: Image.asset('assets/icons/$iconName.png'),
        ),
        Container(
          width: responsiveSize(context, 220.w, assignWidth(context, 0.35)),
          height: 50.h,
          child: TextField(
            onChanged: (value) => func!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                fontSize: responsiveSize(context, 14.sp, 16, md: 16),
                fontWeight: FontWeight.normal,
              ),
            ),
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Avenir',
              fontSize: responsiveSize(context, 12.sp, 14, md: 14),
              fontWeight: FontWeight.normal,
            ),
            obscureText: textType == 'password' ? true : false,
            autocorrect: false,
          ),
        )
      ],
    ),
  );
}

Widget forgotPassword() {
  return Container(
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        'Forgot password',
        style: TextStyle(
          color: Colors.black,
          fontSize: 12.sp,
          decoration: TextDecoration.underline,
          decorationColor: Colors.blue,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  );
}

Widget buildLoginAndRegButton(BuildContext context, String buttonName,
    String type, void Function()? func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(top: type == 'login' ? 40.h : 20.h),
      decoration: BoxDecoration(
        color: type == 'login'
            ? AppColors.primaryElement
            : AppColors.primarySecondaryElementText,
        borderRadius: BorderRadius.circular(15.w),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Center(
          child: Text(
        buttonName,
        style: TextStyle(
          color: Colors.white,
          fontSize: responsiveSize(context, 16.sp, 20, md: 20),
          fontWeight: FontWeight.normal,
        ),
      )),
    ),
  );
}
