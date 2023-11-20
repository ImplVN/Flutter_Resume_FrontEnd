import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layout/layout.dart';
import 'package:resume/app_theme.dart';
import 'package:resume/common/routes/pages.dart';
import 'package:resume/global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
          builder: (context, child) => Layout(
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: AppTheme.lightThemeData,
                  onGenerateRoute: AppPages.generateRouteSettings,
                ),
              )),
    );
  }
}
