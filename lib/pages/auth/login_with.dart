import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../routes/app_pages.dart';

class LoginWith extends StatefulWidget {
  const LoginWith({super.key});
  @override
  State<LoginWith> createState() => _LoginWithState();
}

class _LoginWithState extends State<LoginWith> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 200,
                margin: const EdgeInsets.only(top: 100, bottom: 50),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 238, 247, 247),
                    borderRadius: BorderRadius.circular(100)),
                child: Image.asset('assets/images/1.Screen.png'),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 20.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.loginemail);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      foregroundColor: Colors.black87,
                      backgroundColor: const Color.fromARGB(255, 77, 174, 96),
                    ),
                    child: const Text(
                      'Masuk dengan Email',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 20.0),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text(
                      'Masuk dengan No. Handphone',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 20.0),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text(
                      'Masuk dengan Email Otp',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              // Container(
              //   width: double.infinity,
              //   margin: const EdgeInsets.only(bottom: 20.0),
              //   child: ElevatedButton.icon(
              //     onPressed: () {},
              //     icon: const Icon(Icons.apple), //icon data for elevated button
              //     label: const Text("Masuk dengan Apple"), //label text
              //     style: ElevatedButton.styleFrom(
              //         padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(20.0),
              //         ),
              //         foregroundColor: Colors.white,
              //         backgroundColor: Colors.black87),
              //   ),
              // ),
              // Container(
              //   width: double.infinity,
              //   margin: const EdgeInsets.only(bottom: 20.0),
              //   child: ElevatedButton.icon(
              //     onPressed: () {},
              //     icon:
              //         const Icon(Icons.facebook), //icon data for elevated button
              //     label: const Text("Masuk dengan Facebook"), //label text
              //     style: ElevatedButton.styleFrom(
              //         padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(20.0),
              //         ),
              //         foregroundColor: Colors.white,
              //         backgroundColor: const Color.fromARGB(255, 65, 87, 146)),
              //   ),
              // ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 40.0),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      backgroundColor: Color.fromARGB(255, 102, 155, 226),
                    ),
                    child: const Text(
                      'Masuk dengan Google',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: RichText(
                  textAlign: TextAlign.center,
                  text:
                      TextSpan(style: const TextStyle(fontSize: 15), children: [
                    const TextSpan(
                        text: "Tidak Memiliki akun? ",
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        text: "Daftar disini ",
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ]),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: RichText(
                  textAlign: TextAlign.center,
                  text:
                      TextSpan(style: const TextStyle(fontSize: 15), children: [
                    const TextSpan(
                        text: "Dengan masuk atau mendaftar, Anda menyetujui",
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, Routes.termcondition);
                          },
                        text: " Ketentuan layanan ",
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    const TextSpan(
                        text: "dan", style: TextStyle(color: Colors.black)),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(
                                context, Routes.kebijakanprivasi);
                          },
                        text: " Kebijakan Privasi ",
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    const TextSpan(
                        text: "kami.", style: TextStyle(color: Colors.black)),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
