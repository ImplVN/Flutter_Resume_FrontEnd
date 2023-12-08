import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:resume/common/layout/adaptive.dart';
import 'package:resume/common/routes/names.dart';
import 'package:resume/common/values/values.dart';
import 'package:resume/common/widgets/animated_bubble_button.dart';
import 'package:resume/common/widgets/animated_flipping_icon.dart';
import 'package:resume/common/widgets/animated_line_through_text.dart';
import 'package:resume/common/widgets/animated_positioned_text.dart';
import 'package:resume/common/widgets/animated_positioned_widget.dart';
import 'package:resume/common/widgets/animated_text_slide_box_transition.dart';
import 'package:resume/common/widgets/spaces.dart';

const kDuration = Duration(milliseconds: 600);

class HomePageHeader extends StatefulWidget {
  const HomePageHeader(
      {super.key, required this.scrollToWorksKey, required this.controller});

  final GlobalKey scrollToWorksKey;
  final AnimationController controller;

  @override
  State<HomePageHeader> createState() => _HomePageHeaderState();
}

class _HomePageHeaderState extends State<HomePageHeader>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController rotationController;
  late AnimationController flipController;
  late Animation<Offset> animation;

  @override
  void initState() {
    rotationController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
    flipController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..repeat();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
    animation = Tween<Offset>(
      begin: const Offset(0, 0.05),
      end: const Offset(0, -0.05),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    rotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        rotationController.reset();
        rotationController.forward();
      }
    });
    flipController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        flipController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        flipController.forward();
      }
    });
    controller.forward();
    rotationController.forward();
    flipController.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    rotationController.dispose();
    flipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = widthOfScreen(context);
    final double screenHeight = heightOfScreen(context);
    final double imageWidth = screenWidth - screenWidth * 0.2;
    final EdgeInsets textMargin = EdgeInsets.only(
      left: responsiveSize(
        context,
        20,
        screenWidth * 0.15,
        sm: screenWidth * 0.15,
      ),
      top: responsiveSize(
        context,
        60,
        screenHeight * 0.35,
        sm: screenHeight * 0.35,
      ),
      bottom: responsiveSize(context, 20, 40),
    );
    final EdgeInsets padding = EdgeInsets.symmetric(
      horizontal: screenWidth * 0.1,
      vertical: screenHeight * 0.1,
    );
    final EdgeInsets imageMargin = EdgeInsets.only(
      right: responsiveSize(
        context,
        20,
        screenWidth * 0.05,
        sm: screenWidth * 0.05,
      ),
      top: responsiveSize(
        context,
        30,
        screenHeight * 0.25,
        sm: screenHeight * 0.25,
      ),
      bottom: responsiveSize(context, 20, 40),
    );
    return Container(
      width: screenWidth,
      color: AppColors.accentColor2.withOpacity(0.35),
      child: Stack(
        children: [
          ResponsiveBuilder(builder: (context, sizingInformation) {
            double screenWidth = sizingInformation.screenSize.width;
            if (screenWidth < const RefinedBreakpoints().tabletNormal) {
              return Column(
                children: [
                  Container(
                    padding: padding,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(imageWidth / 2),
                          child: Image.asset(
                            ImagePath.IMAGE_MESSI,
                            width: imageWidth,
                            height: imageWidth,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SpaceH4(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            AnimatedFlippingIcon(
                                controller: flipController,
                                width: 30,
                                height: 30,
                                imageUrl: ImagePath.ICONS_SWIFT),
                            AnimatedFlippingIcon(
                                controller: flipController,
                                width: 30,
                                height: 30,
                                imageUrl: ImagePath.ICONS_PHP),
                            AnimatedFlippingIcon(
                                controller: flipController,
                                width: 30,
                                height: 30,
                                imageUrl: ImagePath.ICONS_RUBY),
                            AnimatedFlippingIcon(
                                controller: flipController,
                                width: 30,
                                height: 30,
                                imageUrl: ImagePath.ICONS_REACT),
                            AnimatedFlippingIcon(
                                controller: flipController,
                                width: 30,
                                height: 30,
                                imageUrl: ImagePath.ICONS_FLUTTER),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: padding.copyWith(top: 0),
                    child: Container(
                      width: screenWidth,
                      child: AboutDev(
                          controller: widget.controller, width: screenWidth),
                    ),
                  ),
                ],
              );
            } else {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: textMargin,
                    child: Container(
                      width: screenWidth * 0.40,
                      child: AboutDev(
                        controller: widget.controller,
                        width: screenWidth * 0.40,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  Container(
                    margin: imageMargin,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.35 / 2),
                          child: Image.asset(
                            ImagePath.IMAGE_MESSI,
                            width: screenWidth * 0.35,
                            height: screenWidth * 0.35,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SpaceH4(),
                        SizedBox(
                          width: screenWidth * 0.35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AnimatedFlippingIcon(
                                  controller: flipController,
                                  width: 30,
                                  height: 30,
                                  imageUrl: ImagePath.ICONS_SWIFT),
                              AnimatedFlippingIcon(
                                  controller: flipController,
                                  width: 30,
                                  height: 30,
                                  imageUrl: ImagePath.ICONS_PHP),
                              AnimatedFlippingIcon(
                                  controller: flipController,
                                  width: 30,
                                  height: 30,
                                  imageUrl: ImagePath.ICONS_RUBY),
                              AnimatedFlippingIcon(
                                  controller: flipController,
                                  width: 30,
                                  height: 30,
                                  imageUrl: ImagePath.ICONS_REACT),
                              AnimatedFlippingIcon(
                                  controller: flipController,
                                  width: 30,
                                  height: 30,
                                  imageUrl: ImagePath.ICONS_FLUTTER),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          }),
        ],
      ),
    );
  }
}

class AboutDev extends StatefulWidget {
  const AboutDev({
    Key? key,
    required this.controller,
    required this.width,
  }) : super(key: key);

  final AnimationController controller;
  final double width;

  @override
  _AboutDevState createState() => _AboutDevState();
}

class _AboutDevState extends State<AboutDev> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    EdgeInsetsGeometry margin = const EdgeInsets.only(left: 16);
    final CurvedAnimation curvedAnimation = CurvedAnimation(
      parent: widget.controller,
      curve: const Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
    );
    double headerFontSize = responsiveSize(context, 28, 48, md: 36, sm: 32);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: margin,
          child: AnimatedTextSlideBoxTransition(
            controller: widget.controller,
            text: StringConst.HI,
            width: widget.width,
            maxLines: 3,
            textStyle: textTheme.displayMedium?.copyWith(
              color: AppColors.black,
              fontSize: headerFontSize,
            ),
          ),
        ),
        SpaceH12(),
        Container(
          margin: margin,
          child: AnimatedTextSlideBoxTransition(
            controller: widget.controller,
            text: StringConst.DEV_INTRO,
            width: widget.width,
            maxLines: 3,
            textStyle: textTheme.displayMedium?.copyWith(
              color: AppColors.black,
              fontSize: headerFontSize,
            ),
          ),
        ),
        SpaceH12(),
        Container(
          margin: margin,
          child: AnimatedTextSlideBoxTransition(
            controller: widget.controller,
            text: StringConst.DEV_TITLE,
            width: responsiveSize(
              context,
              widget.width * 0.75,
              widget.width,
              md: widget.width,
              sm: widget.width,
            ),
            maxLines: 3,
            textStyle: textTheme.displayMedium?.copyWith(
              color: AppColors.black,
              fontSize: headerFontSize,
            ),
          ),
        ),
        SpaceH30(),
        Container(
          margin: margin,
          child: AnimatedPositionedText(
            controller: curvedAnimation,
            width: widget.width,
            maxLines: 3,
            factor: 2,
            text: StringConst.DEV_DESC,
            textStyle: textTheme.bodyLarge?.copyWith(
              fontSize: responsiveSize(
                context,
                Sizes.TEXT_SIZE_16,
                Sizes.TEXT_SIZE_18,
              ),
              height: 2,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SpaceH30(),
        AnimatedPositionedWidget(
          controller: curvedAnimation,
          width: 200,
          height: 60,
          child: AnimatedBubbleButton(
            color: AppColors.grey100,
            imageColor: AppColors.black,
            startOffset: Offset(0, 0),
            targetOffset: Offset(0.1, 0),
            targetWidth: 200,
            startBorderRadius: const BorderRadius.all(
              Radius.circular(100.0),
            ),
            title: StringConst.SEE_MY_WORKS.toUpperCase(),
            titleStyle: textTheme.bodyLarge?.copyWith(
              color: AppColors.black,
              fontSize: responsiveSize(
                context,
                Sizes.TEXT_SIZE_14,
                Sizes.TEXT_SIZE_16,
                sm: Sizes.TEXT_SIZE_15,
              ),
              fontWeight: FontWeight.w500,
            ),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.PROJECT_LIST);
            },
          ),
        ),
        SpaceH40(),
        Container(
          margin: margin,
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            children: _buildSocials(
              context: context,
              data: Data.socialData1,
            ),
          ),
        )
      ],
    );
  }

  List<Widget> _buildSocials({
    required BuildContext context,
    required List<SocialData> data,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = textTheme.bodyLarge?.copyWith(color: AppColors.grey750);
    TextStyle? slashStyle = textTheme.bodyLarge?.copyWith(
      color: AppColors.grey750,
      fontWeight: FontWeight.w400,
      fontSize: 18,
    );
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        AnimatedLineThroughText(
          text: data[index].name,
          isUnderlinedByDefault: true,
          controller: widget.controller,
          hasSlideBoxAnimation: true,
          hasOffsetAnimation: true,
          isUnderlinedOnHover: false,
          onTap: () {},
          textStyle: style,
        ),
      );

      if (index < data.length - 1) {
        items.add(
          Text('/', style: slashStyle),
        );
      }
    }

    return items;
  }
}
