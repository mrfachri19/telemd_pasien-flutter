import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telemedicine_pasien/bloc/cubit/login_email_cubit.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart' as gets;
import 'package:get/get.dart';
// import 'package:telemedicine_pasien/pages/home/home.dart';
import 'package:telemedicine_pasien/pages/main_page/main_page.dart';

import '../../injection_container.dart';
import '../../utils/result.dart';

class LoginEmail extends StatefulWidget {
  const LoginEmail({super.key});

  @override
  State<LoginEmail> createState() => _LoginEmailState();
}

class _LoginEmailState extends State<LoginEmail> {
  bool _isObscure = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String? appId;
  String? deviceName;

  final _btnController = RoundedLoadingButtonController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _deviceDetails() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        setState(() {
          deviceName = build.model.toString();
          // deviceVersion = build.version.toString();
          // identifier = build.androidId;

          appId = "35"
              '${build.board.length % 10}'
              '${build.brand.length % 10}'
              '${build.device.length % 10}'
              '${build.display.length % 10}'
              '${build.host.length % 10}'
              '${build.id.length % 10}'
              '${build.manufacturer.length % 10}'
              '${build.model.length % 10}'
              '${build.product.length % 10}'
              '${build.tags.length % 10}'
              '${build.type.length % 10}';
        });
        // print("GADGETIDANDRO: $appId");
        //UUID for Android
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        setState(() {
          // deviceName = data.name;
          // deviceVersion = data.systemVersion;
          // identifier = data.identifierForVendor;
          appId = "36"
              '${data.name!.length % 10}'
              '${data.systemName!.length % 10}'
              '${data.systemVersion!.length % 10}'
              '${data.model!.length % 10}'
              '${data.localizedModel!.length % 10}'
              '${data.utsname.machine!.length % 10}'
              '${data.utsname.nodename!.length % 10}'
              '${data.utsname.release!.length % 10}'
              '${data.utsname.sysname!.length % 10}'
              '${data.utsname.version!.length % 10}'
              '${data.identifierForVendor!.length % 10}';
        });
        // print("GADGETIDIOS: $appId");
//UUID for iOS
      }
    } on PlatformException {
      // print('Failed to get platform version');
    }
  }

  @override
  void initState() {
    email.text = ""; //innitail value of text field
    password.text = "";
    _deviceDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginEmailCubit, LoginEmailState>(
      listener: (context, state) async {
        // TODO: implement listener
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (state.users?.status == Status.COMPLETED) {
          if (prefs.getInt('loginAnimation') == 1) {
            Get.off(() => const MainPage(),
                transition: gets.Transition.circularReveal,
                duration: const Duration(milliseconds: 2500));
          } else {
            Get.off(() => const MainPage(),
                transition: gets.Transition.circularReveal,
                duration: const Duration(milliseconds: 2500));
          }
          _btnController.success();
        } else if (state.users?.status == Status.ERROR) {
          _btnController.reset();
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.users?.message ?? ''),
            ),
          );
        }
      },
      buildWhen: (previous, current) => previous.users != current.users,
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Login Email"),
              // backgroundColor: Colors.deepOrangeAccent,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      width: 200,
                      margin: const EdgeInsets.only(top: 5, bottom: 10),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 238, 247, 247),
                          borderRadius: BorderRadius.circular(100)),
                      child: Image.asset('assets/images/1.Screen.png'),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        bottom: 30,
                        top: 20,
                      ),
                      child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email tidak boleh kosong';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            labelText: "Email",
                            prefixIcon: Icon(Icons.people),
                            // icon: Icon(Icons.mail_outline), //icon at head of input
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      child: TextFormField(
                          keyboardType: _isObscure
                              ? TextInputType.visiblePassword
                              : TextInputType.text,
                          obscureText: _isObscure,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password tidak boleh kosong';
                            }
                            return null;
                          },
                          controller: password,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              // icon: Icon(Icons.lock), //icon at head of input
                              prefixIcon: const Icon(Icons
                                  .lock), //you can use prefixIcon property too.
                              labelText: "Password",
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                                child: Icon(
                                  _isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              )
                              //icon at tail of input
                              )),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 20.0),
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              sl<LoginEmailCubit>().login({
                                'email': email.text,
                                'password': password.text,
                                'device_info': appId,
                                'device': deviceName,
                                'type': "patient",
                              });
                            } else {
                              _btnController.reset();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
