import 'package:flutter/material.dart';
import 'package:resume/common/layout/adaptive.dart';
import 'package:resume/common/values/values.dart';
import 'package:resume/common/widgets/animated_bubble_button.dart';
import 'package:resume/common/widgets/animated_positioned_text.dart';
import 'package:resume/common/widgets/animated_positioned_widget.dart';
import 'package:resume/common/widgets/animated_text_slide_box_transition.dart';
import 'package:resume/common/widgets/empty.dart';
import 'package:resume/common/widgets/project_item.dart';
import 'package:resume/common/widgets/spaces.dart';

List<String> titles = [
  StringConst.PLATFORM,
  StringConst.CATEGORY,
  StringConst.AUTHOR,
  StringConst.DESIGNER,
  StringConst.TECHNOLOGY_USED,
];

class Aboutproject extends StatefulWidget {
  const Aboutproject(
      {super.key,
      required this.controller,
      required this.projectDataController,
      required this.projectData,
      required this.width});

  final AnimationController controller;
  final AnimationController projectDataController;
  final ProjectItemData projectData;
  final double width;

  @override
  State<Aboutproject> createState() => _AboutprojectState();
}

class _AboutprojectState extends State<Aboutproject> {
  @override
  void initState() {
    widget.controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.projectDataController.forward();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double googlePlayButtonWidth = 150;
    double targetWidth = responsiveSize(context, 118, 150, md: 150);
    double initialWidth = responsiveSize(context, 36, 50, md: 50);
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? bodyTextStyle = textTheme.bodyText1?.copyWith(
        color: AppColors.grey750,
        fontSize: Sizes.TEXT_SIZE_18,
        fontWeight: FontWeight.w400,
        height: 2.0);
    double projectDataWidth = responsiveSize(
        context, widget.width, widget.width * 0.55,
        md: widget.width * 0.75);
    double projectDataSpacing =
        responsiveSize(context, widget.width * 0.1, 48, md: 36);
    double widthOfProjectItem = (projectDataWidth - projectDataSpacing) / 2;
    BorderRadiusGeometry borderRadius = BorderRadius.circular(100);
    TextStyle? buttonStyle = textTheme.bodyText1?.copyWith(
      fontSize: responsiveSize(context, Sizes.TEXT_SIZE_14, Sizes.TEXT_SIZE_16,
          sm: Sizes.TEXT_SIZE_15),
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    );
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AnimatedTextSlideBoxTransition(
            controller: widget.controller,
            text: StringConst.ABOUT_PROJECT,
            textStyle:
                textTheme.headline4?.copyWith(fontSize: Sizes.TEXT_SIZE_48)),
        SpaceH40(),
        AnimatedPositionedText(
            controller: CurvedAnimation(
                parent: widget.controller, curve: Animations.textSlideInCurve),
            text: widget.projectData.portfolioDescription,
            textStyle: bodyTextStyle),
        Container(
          width: projectDataWidth,
          child: Wrap(
            spacing: projectDataSpacing,
            runSpacing: responsiveSize(context, 30, 40),
            children: [
              ProjectData(
                controller: widget.projectDataController,
                title: StringConst.PLATFORM,
                subtitle: widget.projectData.platform,
                width: widthOfProjectItem,
              ),
              ProjectData(
                controller: widget.projectDataController,
                title: StringConst.CATEGORY,
                subtitle: widget.projectData.category,
                width: widthOfProjectItem,
              ),
              ProjectData(
                controller: widget.projectDataController,
                title: StringConst.AUTHOR,
                subtitle: StringConst.DEV_NAME,
                width: widthOfProjectItem,
              ),
            ],
          ),
        ),
        widget.projectData.designer != null ? SpaceH30() : const Empty(),
        widget.projectData.designer != null
            ? ProjectData(
                controller: widget.projectDataController,
                title: StringConst.DESIGNER,
                subtitle: widget.projectData.designer!,
              )
            : const Empty(),
        widget.projectData.technologyUsed != null ? SpaceH30() : const Empty(),
        widget.projectData.technologyUsed != null
            ? ProjectData(
                controller: widget.projectDataController,
                title: StringConst.TECHNOLOGY_USED,
                subtitle: widget.projectData.technologyUsed!,
              )
            : const Empty(),
        SpaceH30(),
        Row(
          children: [
            widget.projectData.isLive
                ? AnimatedPositionedWidget(
                    controller: CurvedAnimation(
                      parent: widget.projectDataController,
                      curve: Animations.textSlideInCurve,
                    ),
                    width: targetWidth,
                    height: initialWidth,
                    child: AnimatedBubbleButton(
                      title: StringConst.LAUNCH_APP,
                      color: AppColors.grey100,
                      imageColor: AppColors.black,
                      startBorderRadius: borderRadius,
                      startWidth: initialWidth,
                      height: initialWidth,
                      targetWidth: targetWidth,
                      titleStyle: buttonStyle,
                      onTap: () {},
                      startOffset: const Offset(0, 0),
                      targetOffset: const Offset(0.1, 0),
                    ),
                  )
                : const Empty(),
            widget.projectData.isLive ? const Spacer() : const Empty(),
            widget.projectData.isPublic
                ? AnimatedPositionedWidget(
                    controller: CurvedAnimation(
                      parent: widget.projectDataController,
                      curve: Animations.textSlideInCurve,
                    ),
                    width: targetWidth,
                    height: initialWidth,
                    child: AnimatedBubbleButton(
                      title: StringConst.SOURCE_CODE,
                      color: AppColors.grey100,
                      imageColor: AppColors.black,
                      startBorderRadius: borderRadius,
                      startWidth: initialWidth,
                      height: initialWidth,
                      targetWidth: targetWidth,
                      titleStyle: buttonStyle,
                      startOffset: const Offset(0, 0),
                      targetOffset: const Offset(0.1, 0),
                      onTap: () {},
                    ),
                  )
                : const Empty(),
            widget.projectData.isPublic ? const Spacer() : const Empty(),
          ],
        ),
        widget.projectData.isPublic || widget.projectData.isLive
            ? SpaceH30()
            : Empty(),
        widget.projectData.isOnPlayStore
            ? InkWell(
                onTap: () {},
                child: AnimatedPositionedWidget(
                  controller: CurvedAnimation(
                    parent: widget.projectDataController,
                    curve: Animations.textSlideInCurve,
                  ),
                  width: googlePlayButtonWidth,
                  height: 50,
                  child: Image.asset(
                    ImagePath.GOOGLE_PLAY,
                    width: googlePlayButtonWidth,
                    // fit: BoxFit.fitHeight,
                  ),
                ),
              )
            : const Empty(),
      ]),
    );
  }
}

class ProjectData extends StatelessWidget {
  const ProjectData({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.controller,
    this.width = double.infinity,
    this.titleStyle,
    this.subtitleStyle,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final double width;
  final AnimationController controller;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    TextStyle? defaultTitleStyle = textTheme.subtitle1?.copyWith(
      color: AppColors.black,
      fontSize: 17,
    );
    TextStyle? defaultSubtitleStyle = textTheme.bodyText1?.copyWith(
      fontSize: 15,
    );

    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedTextSlideBoxTransition(
            width: width,
            maxLines: 2,
            coverColor: AppColors.white,
            controller: controller,
            text: title,
            textStyle: titleStyle ?? defaultTitleStyle,
          ),
          SpaceH12(),
          AnimatedPositionedText(
            width: width,
            maxLines: 2,
            controller: CurvedAnimation(
              parent: controller,
              curve: Animations.textSlideInCurve,
            ),
            text: subtitle,
            textStyle: subtitleStyle ?? defaultSubtitleStyle,
          ),
        ],
      ),
    );
  }
}
