import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:telemedicine_pasien/pages/home/home.dart';
// import 'package:telemedicine_pasien/pages/order/order.dart';
import 'package:telemedicine_pasien/pages/pages.dart';
import 'package:telemedicine_pasien/widgets/widgets.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  List<Widget> pages = [HomePage(), OrderPage(), InboxPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: CostomNavbar(
        onClick: (i) {
          setState(() {
            currentIndex = i;
          });
        },
      ),
    );
  }
}
