import 'package:flutter/material.dart';

import '../../widgets/costom_appbar.dart';

class OrderPage extends StatelessWidget {
  static const String routeName = '/order';
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => OrderPage(),
    );
  }

  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // body: CostomAppbar(),
        );
  }
}
