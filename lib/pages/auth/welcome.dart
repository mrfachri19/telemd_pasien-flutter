import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:telemedicine_pasien/routes/app_pages.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 400,
              margin: const EdgeInsets.only(top: 18),
              child: Image.asset('assets/images/1.Screen.png'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Text(
                'Selamat datang di aplikasi Telemedicine RSUD Kita!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 18),
              child: const Text(
                'Healthcare services at your home.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.termcondition);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Text(
                          'Masuk',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                    OutlinedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Text(
                          'Daftar',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                )),
            Container(
              margin: const EdgeInsets.only(top: 40, left: 12, right: 12),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(style: const TextStyle(fontSize: 18), children: [
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
                          Navigator.pushNamed(context, Routes.kebijakanprivasi);
                        },
                      text: " Kebijakan Privasi ",
                      // recognizer: tapGestureRecognizer,
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
    );
  }
}
