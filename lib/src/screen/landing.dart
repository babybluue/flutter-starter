import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_starter/src/provider/bing_image_provider.dart';
import 'package:flutter_starter/src/router/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});
  @override
  State<LandingScreen> createState() => _LandingState();
}

class _LandingState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    Provider.of<BingImageProvider>(context, listen: false).fetchBingImage();
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (!mounted) {
      return;
    }
    if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, AppRoutes.onboard);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, BingImageProvider bingImgProvider, _) {
        final bingImage = bingImgProvider.bingImage;
        return Container(
          decoration: BoxDecoration(
            image: bingImage?.url == null
                ? null
                : DecorationImage(
                    fit: BoxFit.cover,
                    image:
                        NetworkImage("https://www.bing.com/${bingImage?.url}")),
          ),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Positioned(
                bottom: 20.h,
                child: Center(
                  child: Text(
                    bingImage?.title ?? "",
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
