import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:phone_form_field/l10n/generated/phone_field_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spare_parts/Authentication/bloc/login_bloc.dart';
import 'package:spare_parts/Authentication/dataprovider/login_bloc_data.dart';
import 'package:spare_parts/Authentication/repository/login_bloc_repo.dart';
import 'package:spare_parts/Authentication/screen/login_page.dart';
import 'package:spare_parts/BottomNavigation/bottom_nav_home.dart';
import 'package:spare_parts/InternetConnection/internet_connection_page.dart';
import 'package:spare_parts/LoggedIn/LoggedInSplashView.dart';
import 'package:spare_parts/LoggedIn/LoginPage.dart';
import 'package:spare_parts/LoggedIn/shared_preference_service.dart';
import 'package:spare_parts/MultipleSignup/SignIn.dart';
import 'package:spare_parts/NavBar/header.dart';
import 'package:spare_parts/NavigationPrac/bloc/data_bloc.dart';
import 'package:spare_parts/NavigationPrac/bloc/data_event.dart';
import 'package:spare_parts/NavigationPrac/data_provider/dataprovider.dart';
import 'package:spare_parts/NavigationPrac/model/box_content.dart';
import 'package:spare_parts/NavigationPrac/repositiory/data_repo.dart';
import 'package:spare_parts/NavigationPrac/screeens/nav_content_details.dart';
import 'package:spare_parts/NavigationPrac/screeens/nav_home.dart';
import 'package:spare_parts/OnBoarding/homepage.dart';
import 'package:spare_parts/OnBoarding/onBoardingPage.dart';
import 'package:spare_parts/Pagination/pagination_screen.dart';
import 'package:spare_parts/Pagination/scroll_pagination.dart';
import 'package:spare_parts/PhoneValidator/phone_validator.dart';
import 'package:spare_parts/Responsive%20Dashboard/resp_dash_home.dart';
import 'package:spare_parts/SQLlite/blocs/sqlite_bloc.dart';
import 'package:spare_parts/SQLlite/blocs/sqlite_event.dart';
import 'package:spare_parts/SQLlite/datasource/sqlite_remote_data.dart';
import 'package:spare_parts/SQLlite/repository/sqlite_repository.dart';
import 'package:spare_parts/SQLlite/screen/sqflite_page.dart';
import 'package:spare_parts/ScorllableTab/scrollable_tab.dart';
import 'package:spare_parts/SideBar/sidebar_screen.dart';
import 'package:spare_parts/SignInandOut/signin.dart';
import 'package:spare_parts/TabBar/Tab%20Bar.dart';
import 'package:flutter/services.dart';
import 'package:spare_parts/WebImage/web_image.dart';
import 'package:spare_parts/ScorllableTab/scrollabelTab.dart';
import 'package:spare_parts/youtube_displayer/youtube_displayer.dart';
// import 'package:pushy_flutter/pushy_flutter.dart';

// void backgroundNotificationListener(Map<String, dynamic> data) {
//   // Print notification payload data
//   print('Received notification: $data');
//
//   // Notification title
//   String notificationTitle = 'MyApp';
//
//   // Attempt to extract the "message" property from the payload: {"message":"Hello World!"}
//   String notificationText = data['message'] ?? 'Hello World!';
//
//   // Android: Displays a system notification
//   // iOS: Displays an alert dialog
//   Pushy.notify(notificationTitle, notificationText, data);
//
//   // Clear iOS app badge number
//   Pushy.clearBadge();
// }

class LoginInfo{
  var isLoggedIn = false;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  // for the on boarding
  final showHome = prefs.getBool("showHome") ?? false;

  // runApp(MyApp(showHome: showHome,));
  runApp(TheApp());
}

final loginInfo = LoginInfo();

class TheApp extends StatefulWidget {
  @override
  State<TheApp> createState() => _TheAppState();
}

class _TheAppState extends State<TheApp> {

  // Future pushyRegister() async {
  //   try {
  //     // Register the user for push notifications
  //     String deviceToken = await Pushy.register();
  //
  //     // Print token to console/logcat
  //     print('Device token: $deviceToken');
  //
  //     // Display an alert with the device token
  //     showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //               title: Text('Pushy'),
  //               content: Text('Pushy device token: $deviceToken'),
  //               actions: [ TextButton( child: Text('OK'), onPressed: () { Navigator.of(context, rootNavigator: true).pop('dialog'); } )]
  //           );
  //         }
  //     );
  //
  //     // Optionally send the token to your backend server via an HTTP GET request
  //     // ...
  //   } on PlatformException catch (error) {
  //     // Display an alert with the error message
  //     showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //               title: Text('Error'),
  //               content: Text("${error.message}"),
  //               actions: [ TextButton( child: Text('OK'), onPressed: () { Navigator.of(context, rootNavigator: true).pop('dialog'); } )]
  //           );
  //         }
  //     );
  //   }
  // }

  @override
  void initState() {
    super.initState();

    // // Start the Pushy service
    // Pushy.listen();
    //
    // // Enable in-app notification banners (iOS 10+)
    // Pushy.toggleInAppBanner(true);
    //
    // // Listen for push notifications received
    // Pushy.setNotificationListener(backgroundNotificationListener);
    //
    // pushyRegister();
  }

  final router = GoRouter(
    // redirect: (GoRouterState state){
    //   final loggedIn = loginInfo.isLoggedIn;
    //   final isLogging = state.location == '/login_bloc';
    //
    //   if(!loggedIn && !isLogging) return '/login_bloc';
    //   if(loggedIn && isLogging) return '/sqlite';
    //
    //   return null;
    // },
    urlPathStrategy: UrlPathStrategy.path,
      initialLocation: '/phone',
      routes: [
        // GoRoute(
        //     path: '/internet',
        //     pageBuilder: (context, state) =>
        //         MaterialPage(key: state.pageKey, child: InternetChecker())
        // ),
        // GoRoute(
        //     path: '/web_image',
        //     pageBuilder: (context, state) =>
        //         MaterialPage(key: state.pageKey, child: WebImage())
        // ),
        // GoRoute(
        //     path: '/login_bloc',
        //     pageBuilder: (context, state) =>
        //         MaterialPage(key: state.pageKey, child: LoginBlocPage())
        // ),
        // GoRoute(
        //     path: '/sqlite',
        //     pageBuilder: (context, state) =>
        //         MaterialPage(key: state.pageKey, child: SQLitePage())
        // ),
        // GoRoute(
        //     path: '/resp_home',
        //     pageBuilder: (context, state) =>
        //         MaterialPage(key: state.pageKey, child: ResponsiveDashboard())
        // ),
        // GoRoute(
        //     path: '/bottom_nav',
        //     pageBuilder: (context, state) =>
        //         MaterialPage(key: state.pageKey, child: BottomNavHome())
        // ),
        // GoRoute(
        //     path: '/sidebar',
        //     pageBuilder: (context, state) =>
        //         MaterialPage(key: state.pageKey, child: SideBarScreen())
        // ),
        // GoRoute(
        //     path: '/header',
        //     pageBuilder: (context, state) =>
        //         MaterialPage(key: state.pageKey, child: Header())
        // ),
        // GoRoute(
        //     path: '/pagination',
        //     pageBuilder: (context, state) =>
        //         MaterialPage(key: state.pageKey, child: ScrollPaginationScreen())
        // ),
        // GoRoute(
        //     path: '/youtube_display',
        //     pageBuilder: (context, state) =>
        //         MaterialPage(key: state.pageKey, child: YoutubeDisplay())
        // ),
        GoRoute(
            path: '/phone',
            pageBuilder: (context, state) =>
                MaterialPage(key: state.pageKey, child: NewEntryPage())
        ),
        GoRoute(
            path: '/',
            routes: [
              GoRoute(
                  path: ':id',
                  name: 'details',
                  builder: (context, state)
                  {
                    final box_id = state.params['id']!;
                    final box_contents = jsonEncode(boxContent.map((box_content) => BoxContent.fromJson(box_content)).where((element) => element.id.toString() == box_id).first.toJson());

                    return NavDetails(id: box_contents);
                  })
            ],
            builder: (context, state) =>
                NavHomePage()),
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
  final loginRepository = LoginBlocRepository(LoginBlocData());
  final sqliteRepository = SQLiteRepository(SQLiteRemote());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BoxContentBloc(contentRepository)..add(LoadAllBoxContents())),
        BlocProvider(create: (_) => SQLiteBloc(sqliteRepository)..add(LoadSQliteEvent())),
        BlocProvider(create: (_) => LoginBloc(loginRepository))
      ],
      child: OverlaySupport.global(
        child: MaterialApp.router(
          localizationsDelegates: const [
            PhoneFieldLocalization.delegate
          ],
          supportedLocales: const [
            Locale('en', ''),
            Locale('fr', ''),
            Locale('es', ''),
            Locale('el', ''),
            Locale('de', ''),
            Locale('it', ''),
            Locale('ru', ''),
            Locale('sv', ''),
            Locale('tr', ''),
            Locale('zh', ''),
            // ...
          ],
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
