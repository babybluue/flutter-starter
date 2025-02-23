import 'package:flutter/material.dart';
import 'package:flutter_starter/src/screen/home.dart';
import 'package:flutter_starter/src/screen/settings.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardState();
}

// check if the app is in background or foreground => WidgetsBindingObserver
class _OnBoardState extends State<OnBoardScreen> with WidgetsBindingObserver {
  int _index = 0;

  final PageController _controller = PageController(initialPage: 0);

  void _onPageChanged(int index) {
    _controller.jumpToPage(index);
    setState(() {
      _index = index;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // 应用进入后台
      print("App is in background");
    } else if (state == AppLifecycleState.resumed) {
      // 应用从后台恢复到前台
      print("App is in foreground");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        // disabled horizontal scrolling
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: _onPageChanged,
        children: [
          HomeScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onPageChanged,
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(
              Icons.home_outlined,
              color: Colors.indigoAccent,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            activeIcon: Icon(
              Icons.settings_outlined,
              color: Colors.indigoAccent,
            ),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
