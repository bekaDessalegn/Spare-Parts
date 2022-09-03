import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spare_parts/InternetConnection/internet_connection_page.dart';
import 'package:spare_parts/LoggedIn/LoggedInSplashView.dart';
import 'package:spare_parts/LoggedIn/LoginPage.dart';
import 'package:spare_parts/LoggedIn/shared_preference_service.dart';
import 'package:spare_parts/MultipleSignup/SignIn.dart';
import 'package:spare_parts/NavigationPrac/bloc/data_bloc.dart';
import 'package:spare_parts/NavigationPrac/bloc/data_event.dart';
import 'package:spare_parts/NavigationPrac/data_provider/dataprovider.dart';
import 'package:spare_parts/NavigationPrac/model/box_content.dart';
import 'package:spare_parts/NavigationPrac/repositiory/data_repo.dart';
import 'package:spare_parts/NavigationPrac/screeens/nav_content_details.dart';
import 'package:spare_parts/NavigationPrac/screeens/nav_home.dart';
import 'package:spare_parts/OnBoarding/homepage.dart';
import 'package:spare_parts/OnBoarding/onBoardingPage.dart';
import 'package:spare_parts/Responsive%20Dashboard/resp_dash_home.dart';
import 'package:spare_parts/SignInandOut/signin.dart';
import 'package:spare_parts/TabBar/Tab%20Bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  // for the on boarding
  final showHome = prefs.getBool("showHome") ?? false;

  // runApp(MyApp(showHome: showHome,));
  runApp(TheApp());
}

class TheApp extends StatelessWidget {
  final router = GoRouter(
    initialLocation: '/Internet',
    urlPathStrategy: UrlPathStrategy.path,
      routes: [
        GoRoute(
            path: '/Internet',
            pageBuilder: (context, state) =>
                MaterialPage(key: state.pageKey, child: InternetChecker())
        ),
        GoRoute(
            path: '/',
            routes: [
              GoRoute(
                  path: ':id',
                  name: 'details',
                  pageBuilder: (context, state)
                  {
                    final box_id = state.params['id']!;
                    final box_contents = jsonEncode(boxContent.map((box_content) => BoxContent.fromJson(box_content)).where((element) => element.id.toString() == box_id).first.toJson());

                    return MaterialPage(
                        key: state.pageKey,
                        child: NavDetails(id: box_contents));
                  })
            ],
            pageBuilder: (context, state) =>
                MaterialPage(key: state.pageKey, child: NavHomePage())),
      ],
      errorPageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: Scaffold(
            body: Center(
              child: Text(
                state.error.toString(),
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          )));

  final contentRepository = DataRepository(DataProvider());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BoxContentBloc(contentRepository)..add(LoadAllBoxContents())),
      ],
      child: OverlaySupport.global(
        child: MaterialApp.router(
          routeInformationProvider: router.routeInformationProvider,
          routerDelegate: router.routerDelegate,
          routeInformationParser: router.routeInformationParser,
          debugShowCheckedModeBanner: false,
          title: 'Spare Parts',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        ),
      ),
    );
  }
}


class MyApp extends StatelessWidget {

  final showHome;

  MyApp({required this.showHome});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // routerDelegate: router.routerDelegate,
      // routeInformationParser: router.routeInformationParser,
      debugShowCheckedModeBanner: false,
      title: 'Spare Parts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // home: NavHomePage(),
      // ********** ORIGINAL ************
      // MaterialApp(
      // debugShowCheckedModeBanner: false,
      // title: 'Spare Parts',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      // home: NavHomePage(),

      // For the Log in and out
      // LoggedInSplashView()

      // for the on boarding
      // home: showHome ? OnBoardingHompePage() : OnBoardingScreen(),
    );
  }
}
