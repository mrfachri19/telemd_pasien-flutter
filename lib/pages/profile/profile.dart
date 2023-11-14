import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telemedicine_pasien/bloc/cubit/login_email_cubit.dart';
import 'package:telemedicine_pasien/injection_container.dart';
import 'package:telemedicine_pasien/routes/app_pages.dart';
// import 'package:telemedicine_pasien/widgets/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? stringValue;
  String? stringPhone;
  String? stringToken;
  Future<void> getUser() async {
    stringValue = sl<SharedPreferences>().getString('name');
    stringPhone = sl<SharedPreferences>().getString('phone');
    stringToken = sl<SharedPreferences>().getString('token');
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: header(),
    );
  }

  void loginValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('loginAnimation', 1);
  }

  Widget header() {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.blue,
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.asset(
                      'assets/images/3.Home.png',
                      fit: BoxFit.fitHeight,
                      height: 300,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image.asset(
                              'assets/images/avatar.png',
                              height: 100.0,
                              width: 100.0,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Text('$stringValue',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 25, bottom: 20),
                          child: Text('$stringPhone',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14)),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 20),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 252, 252, 252)),
                                  onPressed: () {
                                    // Navigator.pushNamed(context, Routes.welcome);
                                  },
                                  child: Text(
                                    "Ubah Foto",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.8)),
                                  )),
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 252, 252, 252)),
                                onPressed: () {
                                  // Navigator.pushNamed(context, Routes.welcome);
                                },
                                child: Text(
                                  "Edit Profil",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.8)),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 280,
                  ),
                  padding: const EdgeInsets.only(top: 50),
                  height: double.maxFinite,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 15.0,
                            offset: Offset(0.0, 0.75))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      )),
                  child: Column(children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: const Icon(
                            Icons.person_outline_rounded,
                            color: Color.fromARGB(255, 103, 102, 102),
                            size: 35,
                          ),
                        ),
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.only(left: 15),
                            child: const Text("Pasien",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 103, 102, 102),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20)),
                          ),
                          onTap: () {
                            // print("Click event on Container");
                          },
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: const Icon(
                            Icons.map_outlined,
                            color: Color.fromARGB(255, 103, 102, 102),
                            size: 35,
                          ),
                        ),
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.only(left: 15),
                            child: const Text("Daftar Alamat",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 103, 102, 102),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20)),
                          ),
                          onTap: () {
                            // print("Click event on Container");
                          },
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: const Icon(
                            Icons.info_outline_rounded,
                            color: Color.fromARGB(255, 103, 102, 102),
                            size: 35,
                          ),
                        ),
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.only(left: 15),
                            child: const Text("F.A.Q",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 103, 102, 102),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20)),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, Routes.faq);
                          },
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: const Icon(
                            Icons.help_outline_outlined,
                            color: Color.fromARGB(255, 103, 102, 102),
                            size: 35,
                          ),
                        ),
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.only(left: 15),
                            child: const Text("Bantuan",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 103, 102, 102),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20)),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, Routes.helpmember);
                          },
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: const Icon(
                            Icons.insert_drive_file_outlined,
                            color: Color.fromARGB(255, 103, 102, 102),
                            size: 35,
                          ),
                        ),
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.only(left: 15),
                            child: const Text("Syarat & Ketentuan",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 103, 102, 102),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20)),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, Routes.termcondition);
                          },
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: const Icon(
                            Icons.privacy_tip_outlined,
                            color: Color.fromARGB(255, 103, 102, 102),
                            size: 35,
                          ),
                        ),
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.only(left: 15),
                            child: const Text("Kebijakan Privasi",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 103, 102, 102),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20)),
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.kebijakanprivasi);
                          },
                        ),
                      ],
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 25, left: 10, right: 10),
                      width: double.infinity,
                      height: 40,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        onPressed: () {
                          loginValue();
                          sl<LoginEmailCubit>().logout();
                          // ignore: use_build_context_synchronously
                          Navigator.popAndPushNamed(context, Routes.loginemail);
                        },
                        child: const Text(
                          'Keluar',
                          style:
                              TextStyle(fontSize: 20, color: Colors.redAccent),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 25),
                      child: const Text(
                        'Versi: 20101 (2.1.3)',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
