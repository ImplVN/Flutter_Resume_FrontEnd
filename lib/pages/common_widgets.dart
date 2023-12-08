import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume/common/layout/adaptive.dart';
import 'package:resume/common/utils/functions.dart';
import 'package:resume/common/values/values.dart';
import 'package:resume/common/widgets/custom_spacer.dart';
import 'package:resume/common/widgets/project_item.dart';

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

List<Widget> buildProjects({
  required BuildContext context,
  required List<ProjectItemData> data,
  required int projectHeight,
  required int subHeight,
}) {
  List<Widget> items = [];
  int margin = subHeight * (data.length - 1);
  for (int index = data.length - 1; index >= 0; index--) {
    items.add(
      Container(
        margin: EdgeInsets.only(top: margin.toDouble()),
        child: ProjectItemLg(
          projectNumber: index + 1 > 9 ? "${index + 1}" : "0${index + 1}",
          imageUrl: data[index].image,
          projectItemheight: projectHeight.toDouble(),
          subheight: subHeight.toDouble(),
          backgroundColor: AppColors.accentColor2.withOpacity(0.35),
          title: data[index].title.toLowerCase(),
          subtitle: data[index].category,
          containerColor: data[index].primaryColor,
          onTap: () {
            Functions.navigateToProject(
              context: context,
              dataSource: data,
              currentProject: data[index],
              currentProjectIndex: index,
            );
          },
        ),
      ),
    );
    margin -= subHeight;
  }
  return items;
}

List<Widget> buildProjectsForMobile({
  required BuildContext context,
  required List<ProjectItemData> data,
  required int projectHeight,
  required int subHeight,
}) {
  List<Widget> items = [];

  for (int index = 0; index < data.length; index++) {
    items.add(
      ProjectItemSm(
        projectNumber: index + 1 > 9 ? "${index + 1}" : "0${index + 1}",
        imageUrl: data[index].image,
        title: data[index].title.toLowerCase(),
        subtitle: data[index].category,
        containerColor: data[index].primaryColor,
        onTap: () {
          Functions.navigateToProject(
            context: context,
            dataSource: data,
            currentProject: data[index],
            currentProjectIndex: index,
          );
        },
      ),
    );
    items.add(const CustomSpacer(
      heightFactor: 0.10,
    ));
  }
  return items;
}
