// unify BlocProvider and routes anf pages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/common/routes/names.dart';
import 'package:resume/pages/home/home_page.dart';
import 'package:resume/pages/project_detail/project_detail_page.dart';
import 'package:resume/pages/register/bloc/register_blocs.dart';
import 'package:resume/pages/register/register.dart';
import 'package:resume/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:resume/pages/sign_in/sign_in.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.SIGN_IN,
          page: const SignIn(),
          bloc: BlocProvider(create: (_) => SignInBloc())),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: const Register(),
          bloc: BlocProvider(create: (_) => RegisterBloc())),
      PageEntity(
        route: AppRoutes.HOME,
        page: const HomePage(),
      ),
      PageEntity(
        route: AppRoutes.PROJECT_DETAIL,
        page: const ProjectDetailPage(),
      ),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      if (bloc.bloc != null) {
        blocProviders.add(bloc.bloc);
      }
    }
    return blocProviders;
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    PageEntity? pageEntity = routes().firstWhere(
        (element) => element.route == settings.name,
        orElse: () => PageEntity(route: '', page: const SignIn()));
    return MaterialPageRoute(
        builder: (_) => pageEntity.page, settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
