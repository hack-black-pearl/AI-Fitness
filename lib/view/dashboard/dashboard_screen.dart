
import 'dart:io';
import 'package:fitnessapp/utils/app_colors.dart';
import 'package:fitnessapp/view/activity/activity_screen.dart';
import 'package:fitnessapp/view/camera/camera_screen.dart';
import 'package:fitnessapp/view/profile/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../home/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  static String routeName = "/DashboardScreen";

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectTab = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const ActivityScreen(),
    CameraScreen(),
    const UserProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: _launchWebView,
        child: SizedBox(
          width: 70,
          height: 70,
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: AppColors.primaryG),
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(color: Colors.black, blurRadius: 2)
                ]),
            child: const Icon(Icons.chat_bubble,
                color: AppColors.whiteColor, size: 32),
          ),
        ),
      ),
      body: IndexedStack(
        index: selectTab,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomAppBar(
        height: Platform.isIOS ? 70 : 65,
        color: Colors.white,
        padding: const EdgeInsets.all(0),
        child: Container(
          height: Platform.isIOS ? 70 : 65,
          decoration: const BoxDecoration(
              color: Colors.black54,
              boxShadow: [
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 2,
                    offset: Offset(0, -2))
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TabButton(
                  icon: "assets/icons/home_icon.png",
                  selectIcon: "assets/icons/home_select_icon.png",
                  isActive: selectTab == 0,
                  onTap: () {
                    if (mounted) {
                      setState(() {
                        selectTab = 0;
                      });
                    }
                  }),
              TabButton(
                  icon: "assets/icons/activity_icon.png",
                  selectIcon: "assets/icons/activity_select_icon.png",
                  isActive: selectTab == 1,
                  onTap: () {
                    if (mounted) {
                      setState(() {
                        selectTab = 1;
                      });
                    }
                  }),
              const SizedBox(width: 30),
              TabButton(
                  icon: "assets/icons/camera_icon.png",
                  selectIcon: "assets/icons/camera_select_icon.png",
                  isActive: selectTab == 2,
                  onTap: () {
                    if (mounted) {
                      setState(() {
                        selectTab = 2;
                      });
                    }
                  }),
              TabButton(
                  icon: "assets/icons/user_icon.png",
                  selectIcon: "assets/icons/user_select_icon.png",
                  isActive: selectTab == 3,
                  onTap: () {
                    if (mounted) {
                      setState(() {
                        selectTab = 3;
                      });
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  void _launchWebView() {
    final url = "https://ella-200.web.app/";
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EllaWebView(url: url)),
    );
  }
}

class EllaWebView extends StatelessWidget {
  final String url;

  const EllaWebView({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          
        title: Center(child: Text("Ella A.I             ")),
    flexibleSpace: Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(
    colors: [Color.fromRGBO(252, 107, 244, 1.0), Color.fromRGBO(
        255, 199, 199, 1.0)], // Pink to Peach gradient
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    ),
    ),
    ),
        ),
      //
      //
      // Bot
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),

    );
  }
}

class TabButton extends StatelessWidget {
  final String icon;
  final String selectIcon;
  final bool isActive;
  final VoidCallback onTap;

  const TabButton({
    Key? key,
    required this.icon,
    required this.selectIcon,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            isActive ? selectIcon : icon,
            width: 25,
            height: 25,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(height: isActive ? 8 : 12),
          Visibility(
            visible: isActive,
            child: Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: AppColors.primaryG),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          )
        ],
      ),
    );
  }
}




