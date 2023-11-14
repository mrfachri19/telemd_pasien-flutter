import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telemedicine_pasien/bloc/cubit/list_dokter_chat_v2_cubit.dart';
import 'package:telemedicine_pasien/injection_container.dart';
import 'package:telemedicine_pasien/model/list_dokter_chat_model.dart';
import 'package:telemedicine_pasien/pages/pilihan_dokter/dokter_detail.dart';
// import 'package:telemedicine_pasien/routes/app_pages.dart';
import 'package:telemedicine_pasien/utils/result.dart';

class ListDokter extends StatefulWidget {
  final ListDokterChatModel listDokterChatModel;
  const ListDokter({super.key, required this.listDokterChatModel});

  @override
  State<ListDokter> createState() => _ListDokterState();
}

class _ListDokterState extends State<ListDokter> {
  @override
  void initState() {
    super.initState();
    sl<ListDokterChatCubitV2>().init();
  }

  // final TextEditingController _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Telemedicine Chat"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 30, bottom: 30),
                height: size.height / 14,
                width: size.width,
                alignment: Alignment.center,
                child: Container(
                  height: size.height / 14,
                  width: size.width / 1.2,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "search",
                        labelText: "Cari dokter umum",
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onChanged: (value) {
                      sl<ListDokterChatCubitV2>().name = value;
                      EasyDebounce.debounce(
                          'my-debouncer', // <-- An ID for this particular debouncer
                          const Duration(
                              milliseconds: 500), // <-- The debounce duration
                          sl<ListDokterChatCubitV2>()
                              .getListDokterChatV2 // <-- The target method
                          );
                    },
                  ),
                )),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: ListDokterChat(),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget ListDokterChat() {
    return BlocBuilder<ListDokterChatCubitV2, ListDokterChatStateV2>(
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DokterPage(
                              listDokterChatModel: datadokterumum[index],
                            )));
                  },
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
                            datadokterumum[index].pictureUrl ?? '',
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset('assets/images/default-doctor.png'),
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
                                    const Icon(Icons.grade,
                                        color: Colors.yellow),
                                    Text(datadokterumum[index].rating ?? ""),
                                    Container(
                                      margin: const EdgeInsets.only(left: 20),
                                      child: Row(
                                        children: [
                                          Icon(Icons.circle,
                                              size: 15,
                                              color: datadokterumum[index]
                                                          .status ==
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
                                margin: const EdgeInsets.only(top: 15),
                                child: Text(
                                    datadokterumum[index].price == 0
                                        ? "Gratis"
                                        : datadokterumum[index]
                                            .price
                                            .toString(),
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
                ),
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
