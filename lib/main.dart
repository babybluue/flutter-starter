import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_starter/provider/bing_image_provider.dart';
import 'package:flutter_starter/provider/user_provider.dart';
import 'package:flutter_starter/router/routes.dart';
import 'package:flutter_starter/screen/landing.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BingImageProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider())
      ],
      child: MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          routes: AppRoutes.routes,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          theme: ThemeData(
            brightness: Brightness.dark,
            useMaterial3: true,
          ),
          home: LandingScreen(),
        );
      },
    );
  }
}
