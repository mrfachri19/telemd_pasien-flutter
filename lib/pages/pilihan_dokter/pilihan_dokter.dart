import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telemedicine_pasien/bloc/cubit/kategori_spesialis_cubit.dart';
import 'package:telemedicine_pasien/bloc/cubit/list_dokter_chat_cubit.dart';
import 'package:telemedicine_pasien/injection_container.dart';
import 'package:telemedicine_pasien/routes/app_pages.dart';
import 'package:telemedicine_pasien/utils/result.dart';

class PilihanDokter extends StatefulWidget {
  const PilihanDokter({super.key});

  @override
  State<PilihanDokter> createState() => _PilihanDokterState();
}

class _PilihanDokterState extends State<PilihanDokter> {
  @override
  void initState() {
    super.initState();
    sl<ListDokterChatCubit>().init();
    sl<KategoriSpesialisCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Telemedicine Chat"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Pilih Dokter Umum',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.listdokter);
                        },
                        child: const Text('Lihat Semua',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                                fontSize: 15)))
                  ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .45,
              width: double.maxFinite,
              child: Row(
                children: [
                  Expanded(
                    child: ListDokterUmum(),
                  ),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Row(children: <Widget>[
                  Expanded(
                      child: Divider(
                    color: Colors.black45,
                  )),
                  Text(" Atau "),
                  Expanded(
                      child: Divider(
                    color: Colors.black45,
                  )),
                ])),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Kategori Spesialis',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                    Text('Lihat Semua',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 15)),
                  ]),
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 20, left: 10, right: 10, bottom: 50),
              child: Expanded(child: ListKategoriSpesialis()),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget ListDokterUmum() {
    return BlocBuilder<ListDokterChatCubit, ListDokterChatState>(
      buildWhen: (previous, current) =>
          previous.listdokterchat != current.listdokterchat,
      builder: (context, state) {
        final datadokterumum = state.listdokterchat?.data ?? [];

        if (state.listdokterchat?.status == Status.LOADING) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.listdokterchat?.status == Status.COMPLETED) {
          return ListView.separated(
            itemCount: datadokterumum.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Container(
                  height: 150,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Card(
                        child: Image.network(
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset('assets/images/default-doctor.png'),
                          datadokterumum[index].pictureUrl ?? '',
                          height: 145,
                          width: 145,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(datadokterumum[index].name ?? "",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  const Text("Dokter "),
                                  Text(datadokterumum[index].type ?? ""),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  const Icon(Icons.grade, color: Colors.yellow),
                                  Text(datadokterumum[index].rating ?? ""),
                                  Container(
                                    margin: const EdgeInsets.only(left: 20),
                                    child: Row(
                                      children: [
                                        Icon(Icons.circle,
                                            size: 15,
                                            color:
                                                datadokterumum[index].status ==
                                                        "0|online"
                                                    ? Colors.green
                                                    : Colors.red),
                                        Text(datadokterumum[index].status ==
                                                "0|online"
                                            ? "online"
                                            : "offline"),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              child: Text(
                                  datadokterumum[index].price == 0
                                      ? "Gratis"
                                      : datadokterumum[index].price.toString(),
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }

  // ignore: non_constant_identifier_names
  Widget ListKategoriSpesialis() {
    return BlocBuilder<KategoriSpesialisCubit, KategoriSpesialisState>(
      buildWhen: (previous, current) =>
          previous.kategorispesialis != current.kategorispesialis,
      builder: (context, state) {
        final dataKategoriSpesialis = state.kategorispesialis?.data ?? [];

        if (state.kategorispesialis?.status == Status.LOADING) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.kategorispesialis?.status == Status.COMPLETED) {
          return SingleChildScrollView(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: List.generate(dataKategoriSpesialis.length, (index) {
                return Image.network(
                  dataKategoriSpesialis[index].iconUrl ?? '',
                  width: 10,
                  height: 10,
                );
              }),
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
