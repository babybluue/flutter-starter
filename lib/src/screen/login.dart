import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_starter/src/model/user.dart';
import 'package:flutter_starter/src/provider/bing_image_provider.dart';
import 'package:flutter_starter/src/provider/user_provider.dart';
import 'package:flutter_starter/src/router/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  String? _username;
  String? _password;

  void _onSubmit() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", true);
    if (mounted) {
      Provider.of<UserProvider>(context, listen: false)
          .updateUser(User(name: _username));
      Navigator.pushReplacementNamed(context, AppRoutes.onboard);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, BingImageProvider bingImgProvider, _) {
          final bingImage = bingImgProvider.bingImage;
          return Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image:
                      NetworkImage("https://www.bing.com/${bingImage!.url!}")),
            ),
            child: Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.black54,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10.h,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          labelText: "Username",
                          prefixIcon: Icon(Icons.person)),
                      onChanged: (value) {
                        _username = value;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: "Password", prefixIcon: Icon(Icons.lock)),
                      obscureText: true,
                      onChanged: (value) {
                        _password = value;
                      },
                    ),
                    ElevatedButton(
                      onPressed: _onSubmit,
                      child: Text("Login"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
