import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_starter/src/provider/bing_image_provider.dart';
import 'package:flutter_starter/src/provider/user_provider.dart';
import 'package:flutter_starter/src/router/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsScreen> {
  void _logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("isLoggedIn");
    if (mounted) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.login,
        (route) => false,
      );
    }
  }

  void _checkBingImage() async {
    showBottomSheet(
        context: context,
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.75),
        builder: (BuildContext context) {
          return Consumer(
              builder: (context, BingImageProvider bingImageProvider, child) {
            final bingImage = bingImageProvider.bingImage;
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://www.bing.com/${bingImage?.url ?? ""}"),
                ),
              ),
              child: Center(
                child: Text(
                  bingImage?.title ?? "",
                ),
              ),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Column(
          spacing: 5.h,
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer(builder: (context, UserProvider userProvider, child) {
              return Text("Name: ${userProvider.user?.name ?? ""}");
            }),
            SizedBox(
              width: 200.w,
              child: ElevatedButton(
                  onPressed: _checkBingImage, child: Text("Check Bing Image")),
            ),
            SizedBox(
              width: 200.w,
              child: ElevatedButton(onPressed: _logout, child: Text("Logout")),
            )
          ],
        ),
      ),
    );
  }
}
