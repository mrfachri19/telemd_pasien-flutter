import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telemedicine_pasien/utils/result.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:telemedicine_pasien/injection_container.dart';

import '../../bloc/cubit/kebijakan_privasi_cubit.dart';

class KebijakanPrivasi extends StatefulWidget {
  const KebijakanPrivasi({super.key});

  @override
  State<KebijakanPrivasi> createState() => _KebijakanPrivasiState();
}

class _KebijakanPrivasiState extends State<KebijakanPrivasi> {
  @override
  void initState() {
    sl<KebijakanPrivasiCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kebijakan Privasi")),
      body: BlocBuilder<KebijakanPrivasiCubit, KebijakanPrivasiState>(
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
