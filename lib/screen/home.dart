import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  int _index = 0;

  final PageController _controller = PageController(initialPage: 0);

  void _onPageChanged(int index) {
    _controller.jumpToPage(index);
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: PageView(
        controller: _controller,
        // disabled horizontal scrolling
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: _onPageChanged,
        children: [
          const Center(child: Text('Home Screen')),
          const Center(child: Text('Settings Screen'))
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
