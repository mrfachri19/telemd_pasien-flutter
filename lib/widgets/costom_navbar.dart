import 'package:flutter/material.dart';
// import 'package:telemedicine_pasien/routes/app_pages.dart';

class CostomNavbar extends StatelessWidget {
  const CostomNavbar({
    super.key,
    required this.onClick,
  });

  final void Function(int index) onClick;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: SizedBox(
        height: 70,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, Routes.home);
                        onClick(0);
                      },
                      icon: const Icon(
                        Icons.home,
                        color: Color.fromARGB(255, 103, 102, 102),
                      ),
                    ),
                    const Text("Beranda",
                        style: TextStyle(
                          color: Color.fromARGB(255, 103, 102, 102),
                          fontWeight: FontWeight.w700,
                        )),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, Routes.order);
                        onClick(1);
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Color.fromARGB(255, 103, 102, 102),
                      ),
                    ),
                    const Text("Order",
                        style: TextStyle(
                          color: Color.fromARGB(255, 103, 102, 102),
                          fontWeight: FontWeight.w700,
                        )),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, '/inbox');
                        onClick(2);
                      },
                      icon: const Icon(
                        Icons.inbox_rounded,
                        color: Color.fromARGB(255, 103, 102, 102),
                      ),
                    ),
                    const Text("Inbox",
                        style: TextStyle(
                          color: Color.fromARGB(255, 103, 102, 102),
                          fontWeight: FontWeight.w700,
                        )),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, Routes.profile);
                        onClick(3);
                      },
                      icon: const Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 103, 102, 102),
                      ),
                    ),
                    const Text("Profile",
                        style: TextStyle(
                          color: Color.fromARGB(255, 103, 102, 102),
                          fontWeight: FontWeight.w700,
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
