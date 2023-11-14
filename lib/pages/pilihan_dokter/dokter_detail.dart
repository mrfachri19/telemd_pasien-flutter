import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telemedicine_pasien/bloc/cubit/schedule_dokter_cubit.dart';
import 'package:telemedicine_pasien/injection_container.dart';
import 'package:telemedicine_pasien/model/list_dokter_chat_model.dart';
import 'package:telemedicine_pasien/model/schedule_dokter_model.dart';
import 'package:telemedicine_pasien/routes/app_pages.dart';
import 'package:telemedicine_pasien/utils/result.dart';

class DokterPage extends StatefulWidget {
  final ListDokterChatModel listDokterChatModel;
  const DokterPage({super.key, required this.listDokterChatModel});

  @override
  State<DokterPage> createState() => _DokterPageState();
}

class _DokterPageState extends State<DokterPage> {
  int? idservice;
  int? groupValue = 0;
  Future<void> getService() async {
    idservice = sl<SharedPreferences>().getInt('service');
  }

  @override
  void initState() {
    getService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sl<ScheduleDokterCubit>().init(widget.listDokterChatModel.id ?? 0);
    sl<ScheduleDokterCubit>().service = idservice.toString() == "1"
        ? "tmdchat"
        : idservice.toString() == "2"
            ? "tmdvcall"
            : idservice.toString() == "3"
                ? "tmdvisit"
                : idservice.toString() == "4"
                    ? "televaccine"
                    : idservice.toString() == "5"
                        ? "telemeds"
                        : "telelab";

    String getMonthName(int month) {
      switch (month) {
        case 1:
          return "January";
        case 2:
          return "February";
        case 3:
          return "March";
        case 4:
          return "April";
        case 5:
          return "May";
        case 6:
          return "June";
        case 7:
          return "July";
        case 8:
          return "August";
        case 9:
          return "September";
        case 10:
          return "October";
        case 11:
          return "November";
        case 12:
          return "December";
        default:
          return "Invalid Month";
      }
    }

// Define a method to calculate the total price
    String getTotalPrice() {
      // Get the adminFee and price from widget.listDokterChatModel
      num adminFee = widget.listDokterChatModel.adminFee ?? 0.0;
      num price = widget.listDokterChatModel.price ?? 0.0;

      // Calculate the total price by adding adminFee and price
      num totalPrice = adminFee + price;
      print(totalPrice.toStringAsFixed(2));
      // Return the total price as a formatted string
      if (price == 0) {
        return 'Gratis!';
      }
      return totalPrice
          .toStringAsFixed(2); // Format as currency with 2 decimal places
    }

    DateTime now = DateTime.now();
    int currentMonth = now.month;
    String monthName = getMonthName(currentMonth);
    return BlocBuilder<ScheduleDokterCubit, ScheduleDokterState>(
      buildWhen: (previous, current) =>
          previous.scheduledokter != current.scheduledokter,
      builder: (context, state) {
        final data = (state.scheduledokter?.data ?? []).toList();
        List<ScheduleDokterModel> filteredData =
            data.where((day) => day.type == "main").toList();
        // List<ScheduleDokterModel> filteredDatas = [filteredData[groupValue ?? 0]];

        if (state.scheduledokter?.status == Status.LOADING) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.scheduledokter?.status == Status.COMPLETED) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Detail Dokter"),
              toolbarHeight: 40,
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                Stack(
                  children: [
                    Image.network(
                      widget.listDokterChatModel.pictureUrl ?? "-",
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/images/default-doctor.png',
                        fit: BoxFit.fill,
                        height: 400,
                        width: double.infinity,
                      ),
                      fit: BoxFit.fill,
                      height: 400,
                      width: double.infinity,
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 250, left: 50, right: 50),
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                                color: Colors.black54,
                                blurRadius: 15.0,
                                offset: Offset(0.0, 0.75))
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text(
                              widget.listDokterChatModel.name ?? "-",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                  'dokter ${widget.listDokterChatModel.type}')),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  child: Icon(Icons.circle,
                                      size: 15,
                                      color:
                                          widget.listDokterChatModel.status ==
                                                  "0|online"
                                              ? Colors.green
                                              : Colors.red),
                                ),
                                Text(widget.listDokterChatModel.status ==
                                        "0|online"
                                    ? "online"
                                    : "offline"),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Divider(
                              height: 1, // Height of the divider
                              thickness: 2, // Thickness of the divider
                              color: Colors.grey, // Color of the divider
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    child: Column(
                                  children: [
                                    Text(
                                      widget.listDokterChatModel.experience ??
                                          "-",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                        margin: const EdgeInsets.only(top: 5),
                                        child: const Text('Pengalaman'))
                                  ],
                                )),
                                Container(
                                  width: 2,
                                  height: 40,
                                  color: Colors
                                      .grey, // Color of the separator line
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        Text(
                                            widget.listDokterChatModel.rating ??
                                                "-"),
                                      ],
                                    ),
                                    const Text('Penilaian')
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, right: 20, left: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Jadwal Praktik',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        Text(monthName,
                            style: const TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.w500,
                                fontSize: 15)),
                      ]),
                ),
                SizedBox(
                  width: 500,
                  child: CupertinoSegmentedControl<int>(
                      padding: const EdgeInsets.all(15),
                      groupValue: groupValue,
                      selectedColor: Colors.blue,
                      unselectedColor: Colors.white,
                      borderColor: Colors.blue,
                      pressedColor: Colors.blue,
                      children: filteredData.asMap().map((index, e) {
                        return MapEntry(
                          index,
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              e.day?.substring(0, 3) ?? "",
                              style: TextStyle(
                                color: groupValue == index
                                    ? Colors.white
                                    : Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }),
                      onValueChanged: (int? newValue) {
                        setState(() {
                          groupValue = newValue;
                          print(groupValue);
                        });
                      }),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black38),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Row(
                          children: [
                            Text(filteredData[groupValue ?? 0].startTime ?? ''),
                            Container(
                                margin:
                                    const EdgeInsets.only(left: 3, right: 3),
                                child: const Text('-')),
                            Text(filteredData[groupValue ?? 0].endTime ?? ''),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                  width: double.infinity,
                  child: Container(
                    color: Colors
                        .black26, // Replace with the "slate" color you want
                    // Add child widgets here if needed
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, right: 20, left: 20),
                  alignment: Alignment.topLeft,
                  child: const Text('Pendidikan',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 10, right: 20, left: 20, bottom: 30),
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const Icon(
                            Icons.apartment_sharp,
                            color: Colors.blue,
                          )),
                      Expanded(
                        child: Text(
                            widget.listDokterChatModel.university ?? "-",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 18)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                  width: double.infinity,
                  child: Container(
                    color: Colors
                        .black26, // Replace with the "slate" color you want
                    // Add child widgets here if needed
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 30,
                    right: 20,
                    left: 20,
                  ),
                  alignment: Alignment.topLeft,
                  child: const Text('Praktik',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 10, right: 20, left: 20, bottom: 30),
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const Icon(
                            Icons.home_work_sharp,
                            color: Colors.blue,
                          )),
                      Expanded(
                        child: Text(widget.listDokterChatModel.clinic ?? "-",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 18)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                  width: double.infinity,
                  child: Container(
                    color: Colors
                        .black26, // Replace with the "slate" color you want
                    // Add child widgets here if needed
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 30,
                    right: 20,
                    left: 20,
                  ),
                  alignment: Alignment.topLeft,
                  child: const Text('Biaya Konsultasi',
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 30, right: 20, left: 20, bottom: 30),
                  alignment: Alignment.topLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: Text(
                            getTotalPrice(),
                            style: const TextStyle(
                                color: Colors.redAccent, fontSize: 20),
                          )),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 24, 19, 148)),
                          onPressed: () {
                            // Navigator.pushNamed(context, Routes.chat);
                          },
                          child: const Text("Konsultasi")),
                    ],
                  ),
                ),
              ]),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
