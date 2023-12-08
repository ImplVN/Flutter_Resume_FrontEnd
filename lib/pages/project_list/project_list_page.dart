import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:resume/common/layout/adaptive.dart';
import 'package:resume/common/routes/routes.dart';
import 'package:resume/common/values/values.dart';
import 'package:resume/common/widgets/animated_footer.dart';
import 'package:resume/common/widgets/custom_spacer.dart';
import 'package:resume/common/widgets/page_header.dart';
import 'package:resume/common/widgets/page_wrapper.dart';
import 'package:resume/pages/common_widgets.dart';

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({super.key});

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _headingTextController;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _headingTextController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _headingTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double projectItemHeight = assignHeight(context, 0.4);
    double subHeight = (3 / 4) * projectItemHeight;
    double extra = projectItemHeight - subHeight;

    EdgeInsetsGeometry padding = EdgeInsets.only(
      left: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.15),
      ),
      right: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.10),
      ),
    );

    return PageWrapper(
      selectedRoute: AppRoutes.PROJECT_LIST,
      selectedPageName: StringConst.PROJECTS,
      navBarAnimationController: _headingTextController,
      hasSideTitle: false,
      onLoadingAnimationDone: () {
        _headingTextController.forward();
      },
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          PageHeader(
            headingText: StringConst.PROJECTS,
            headingTextController: _headingTextController,
          ),
          ResponsiveBuilder(builder: (context, sizingInformation) {
            double screenWidth = sizingInformation.screenSize.width;
            if (screenWidth <= RefinedBreakpoints().tabletSmall) {
              return Column(
                children: buildProjectsForMobile(
                    context: context,
                    data: Data.projects,
                    projectHeight: projectItemHeight.toInt(),
                    subHeight: subHeight.toInt()),
              );
            } else {
              return SizedBox(
                height: (subHeight * (Data.projects.length)) + extra,
                child: Stack(
                  children: buildProjects(
                      context: context,
                      data: Data.projects,
                      projectHeight: projectItemHeight.toInt(),
                      subHeight: subHeight.toInt()),
                ),
              );
            }
          }),
          const CustomSpacer(heightFactor: 0.15),
          const AnimatedFooter(),
        ],
      ),
    );
  }
}
