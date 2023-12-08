import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:resume/common/layout/adaptive.dart';
import 'package:resume/common/utils/functions.dart';
import 'package:resume/common/values/values.dart';
import 'package:resume/common/widgets/animated_footer.dart';
import 'package:resume/common/widgets/animated_positioned_text.dart';
import 'package:resume/common/widgets/animated_slide_transtion.dart';
import 'package:resume/common/widgets/animated_text_slide_box_transition.dart';
import 'package:resume/common/widgets/custom_spacer.dart';
import 'package:resume/common/widgets/page_wrapper.dart';
import 'package:resume/common/widgets/project_item.dart';
import 'package:resume/common/widgets/spaces.dart';
import 'package:resume/pages/common_widgets.dart';
import 'package:resume/pages/home/widgets/home_page_header.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomePage extends StatefulWidget {
  static const String homePageRoute = StringConst.HOME_PAGE;

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  GlobalKey key = GlobalKey();
  ScrollController _scrollController = ScrollController();
  late AnimationController _viewProjectsController;
  late AnimationController _recentWorksController;
  late AnimationController _slideTextController;

  @override
  void initState() {
    _viewProjectsController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _slideTextController = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationLong,
    );
    _recentWorksController = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationLong,
    );

    super.initState();
  }

  @override
  void dispose() {
    _viewProjectsController.dispose();
    _slideTextController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double projectItemHeight = assignHeight(context, 0.4);
    double subHeight = (3 / 4) * projectItemHeight;
    double extra = projectItemHeight - subHeight;
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? textButtonStyle = textTheme.headlineMedium?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(context, 30, 40, md: 36, sm: 32),
      height: 2.0,
    );
    EdgeInsets margin = EdgeInsets.only(
      left: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.15),
        sm: assignWidth(context, 0.15),
      ),
    );

    return PageWrapper(
        selectedRoute: HomePage.homePageRoute,
        selectedPageName: StringConst.HOME,
        navBarAnimationController: _slideTextController,
        hasSideTitle: false,
        hasUnveilPageAnimation: true,
        onLoadingAnimationDone: () {
          _slideTextController.forward();
        },
        child: ListView(
          padding: EdgeInsets.zero,
          controller: _scrollController,
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            HomePageHeader(
                scrollToWorksKey: key, controller: _slideTextController),
            const CustomSpacer(heightFactor: 0.1),
            VisibilityDetector(
                key: const Key('recent-projects'),
                child: Container(
                  key: key,
                  margin: margin,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedTextSlideBoxTransition(
                        controller: _recentWorksController,
                        text: StringConst.CRAFTED_WITH_LOVE,
                        textStyle: textTheme.headlineMedium?.copyWith(
                          color: AppColors.black,
                          fontSize:
                              responsiveSize(context, 30, 48, md: 40, sm: 36),
                          height: 2.0,
                        ),
                      ),
                      SpaceH16(),
                      AnimatedPositionedText(
                          controller: CurvedAnimation(
                              parent: _recentWorksController,
                              curve: const Interval(0.6, 1.0,
                                  curve: Curves.fastOutSlowIn)),
                          text: StringConst.SELECTION,
                          textStyle: textTheme.bodyLarge?.copyWith(
                              fontSize: responsiveSize(context,
                                  Sizes.TEXT_SIZE_16, Sizes.TEXT_SIZE_18),
                              height: 2.0,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
                onVisibilityChanged: (visibilityInfo) {
                  if (visibilityInfo.visibleFraction > 0.45) {
                    _recentWorksController.forward();
                  }
                }),
            const CustomSpacer(heightFactor: 0.1),
            ResponsiveBuilder(builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;
              if (screenWidth <= RefinedBreakpoints().tabletSmall) {
                return Column(
                  children: buildProjectsForMobile(
                    context: context,
                    data: Data.recentWorks,
                    projectHeight: projectItemHeight.toInt(),
                    subHeight: subHeight.toInt(),
                  ),
                );
              } else {
                return Container(
                  height: (subHeight * (Data.recentWorks.length)) + extra,
                  child: Stack(
                    children: buildProjects(
                      context: context,
                      data: Data.recentWorks,
                      projectHeight: projectItemHeight.toInt(),
                      subHeight: subHeight.toInt(),
                    ),
                  ),
                );
              }
            }),
            const CustomSpacer(heightFactor: 0.05),
            Container(
              margin: margin,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConst.THERES_MORE.toUpperCase(),
                    style: textTheme.bodyText1?.copyWith(
                      fontSize: responsiveSize(context, 11, Sizes.TEXT_SIZE_12),
                      letterSpacing: 2,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SpaceH16(),
                  MouseRegion(
                    onEnter: (e) => _viewProjectsController.forward(),
                    onExit: (e) => _viewProjectsController.reverse(),
                    child: AnimatedSlideTranstion(
                      controller: _viewProjectsController,
                      beginOffset: Offset(0, 0),
                      targetOffset: Offset(0.05, 0),
                      child: TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              StringConst.VIEW_ALL_PROJECTS.toLowerCase(),
                              style: textButtonStyle,
                            ),
                            SpaceW12(),
                            Container(
                              margin: EdgeInsets.only(
                                  top: textButtonStyle!.fontSize! / 2),
                              child: Image.asset(
                                ImagePath.ARROW_RIGHT,
                                width: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const CustomSpacer(heightFactor: 0.15),
            const AnimatedFooter()
          ],
        ));
  }
}
