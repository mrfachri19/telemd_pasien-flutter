import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:telemedicine_pasien/bloc/cubit/faq_cubit.dart';
import 'package:telemedicine_pasien/injection_container.dart';
import 'package:telemedicine_pasien/utils/result.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  void initState() {
    sl<FaqCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("F.A.Q")),
      body: BlocBuilder<FaqCubit, FaqState>(
        buildWhen: (previous, current) =>
            previous.kebijakanprivasi != current.kebijakanprivasi,
        builder: (context, state) {
          if (state.kebijakanprivasi?.status == Status.LOADING) {
            const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.kebijakanprivasi?.status == Status.COMPLETED) {
            return Scaffold(
              body: ListView(
                children: [
                  Html(data: state.kebijakanprivasi?.data?.value),
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
