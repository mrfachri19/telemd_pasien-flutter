import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:telemedicine_pasien/bloc/cubit/help_member_cubit.dart';
import 'package:telemedicine_pasien/injection_container.dart';
import 'package:telemedicine_pasien/utils/dimensions.dart';
import 'package:telemedicine_pasien/utils/result.dart';

class HelpMemberPage extends StatefulWidget {
  const HelpMemberPage({super.key});

  @override
  State<HelpMemberPage> createState() => _HelpMemberPageState();
}

class _HelpMemberPageState extends State<HelpMemberPage> {
  @override
  void initState() {
    sl<HelpMemberCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bantuan")),
      body: BlocBuilder<HelpMemberCubit, HelpMemberState>(
        buildWhen: (previous, current) =>
            previous.helpmember != current.helpmember,
        builder: (context, state) {
          if (state.helpmember?.status == Status.LOADING) {
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
          if (state.helpmember?.status == Status.COMPLETED) {
            return Scaffold(
              body: ListView(
                children: [
                  Html(data: state.helpmember?.data?.value),
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
