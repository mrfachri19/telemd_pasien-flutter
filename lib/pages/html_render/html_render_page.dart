import 'package:flutter/material.dart';
import 'package:telemedicine_pasien/bloc/cubit/term_condition_cubit.dart';
import 'package:telemedicine_pasien/injection_container.dart';
import 'package:telemedicine_pasien/utils/dimensions.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:telemedicine_pasien/utils/result.dart';

import '../../routes/app_pages.dart';

class HtmlRenderPage extends StatefulWidget {
  const HtmlRenderPage({super.key});

  @override
  State<HtmlRenderPage> createState() => _HtmlRenderPageState();
}

class _HtmlRenderPageState extends State<HtmlRenderPage> {
  @override
  void initState() {
    sl<TermConditionCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Syarat dan Ketentuan")),
      body: BlocBuilder<TermConditionCubit, TermConditionState>(
        buildWhen: (previous, current) =>
            previous.termcondition != current.termcondition,
        builder: (context, state) {
          if (state.termcondition?.status == Status.LOADING) {
            SkeletonAnimation(
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: Dimensions.height15,
                  );
                },
                itemBuilder: (itemBuilder, index) {
                  return Container(
                    height: Dimensions.height100 + Dimensions.height40,
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      top: Dimensions.height15,
                      bottom: Dimensions.height10,
                      left: Dimensions.width10,
                      right: Dimensions.width45,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(
                        Dimensions.radius10,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset:
                              const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
          if (state.termcondition?.status == Status.COMPLETED) {
            return Scaffold(
              body: ListView(
                children: [
                  Html(data: state.termcondition?.data?.value),
                  Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, Routes.loginwith);
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black87,
                                padding:
                                    const EdgeInsets.fromLTRB(50, 10, 50, 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: const Text(
                                'Setuju',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black87,
                                backgroundColor:
                                    const Color.fromARGB(255, 235, 12, 12),
                                padding:
                                    const EdgeInsets.fromLTRB(50, 10, 50, 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: const Text(
                                'Tolak',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      )),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
