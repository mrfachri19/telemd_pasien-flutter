import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telemedicine_pasien/bloc/cubit/artikel_cubit.dart';
import 'package:telemedicine_pasien/bloc/cubit/promo_banner_cubit.dart';
import 'package:telemedicine_pasien/bloc/cubit/service_category_cubit.dart';
import 'package:telemedicine_pasien/routes/app_pages.dart';
import 'package:telemedicine_pasien/utils/result.dart';

import '../injection_container.dart';

class CostomAppbar extends StatefulWidget {
  const CostomAppbar({super.key});

  @override
  State<CostomAppbar> createState() => _CostomAppbarState();
}

class _CostomAppbarState extends State<CostomAppbar> {
  String? stringValue;
  String? stringPhone;
  String? stringToken;
  Future<void> getUser() async {
    stringValue = sl<SharedPreferences>().getString('name');
    stringPhone = sl<SharedPreferences>().getString('phone');
    stringToken = sl<SharedPreferences>().getString('token');
  }

  void setPreferenceI(id) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt("idUser", id);
  }

  @override
  void initState() {
    getUser();
    super.initState();
    sl<ServiceCategoryCubit>().init();
    sl<PromoBannerCubit>().init();
    sl<ArtikelCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceCategoryCubit, ServiceCategoryState>(
      buildWhen: (previous, current) =>
          previous.servicecategory != current.servicecategory,
      builder: (context, state) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.blue,
                    child: Opacity(
                      opacity: 0.3,
                      child: Image.asset('assets/images/3.Home.png',
                          fit: BoxFit.cover),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 22, left: 20),
                            width: 70,
                            height: 70,
                            child: Image.asset('assets/images/rsudlogo.png'),
                          ),
                          const Spacer(),
                          if (stringToken != null)
                            (Container(
                              margin: const EdgeInsets.only(top: 22, right: 20),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 6),
                                          child: Text('$stringValue',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14)),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 6),
                                          child: Text('$stringPhone',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14)),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 6),
                                          child: const Text(
                                              'CS: 0877-7008-4589',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Image.asset(
                                      'assets/images/avatar.png',
                                      height: 70.0,
                                      width: 70.0,
                                    ),
                                  ),
                                ],
                              ),
                            ))
                          else
                            (ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 24, 19, 148)),
                                onPressed: () {
                                  Navigator.pushNamed(context, Routes.welcome);
                                },
                                child: const Text("Login")))
                        ],
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 28, left: 10, right: 10),
                        height: 150,
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
                        child: Row(
                          children: [Expanded(child: ListServiceCategory())],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, top: 30, bottom: 20),
                child: const Text('Promo menarik',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
              SizedBox(
                height: 100,
                width: double.maxFinite,
                child: Row(
                  children: [Expanded(child: ListpromoBanner())],
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 50),
                  height: 250,
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
                  child: Container(
                    margin: const EdgeInsets.only(right: 20, left: 10, top: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Artikel Terkini',
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
                        Expanded(
                          child: SingleChildScrollView(child: ListArtikel()),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

//======== list service ==========
  // ignore: non_constant_identifier_names
  Widget ListServiceCategory() {
    return BlocBuilder<ServiceCategoryCubit, ServiceCategoryState>(
      buildWhen: (previous, current) =>
          previous.servicecategory != current.servicecategory,
      builder: (context, state) {
        final data = (state.servicecategory?.data ?? []).where((element) {
          return element.isVisible ?? false;
        }).toList();

        if (state.servicecategory?.status == Status.LOADING) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.servicecategory?.status == Status.COMPLETED) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: data.map((e) {
                return Container(
                    margin:
                        const EdgeInsets.only(bottom: 30, top: 30, left: 30),
                    child: Column(
                      children: [
                        Image.network(
                          e.iconUrl ?? '',
                          width: 64,
                          height: 64,
                        ),
                        GestureDetector(
                            onTap: () async {
                              await sl<SharedPreferences>()
                                  .setInt('service', e.id!);
                              setPreferenceI(e.id);
                              Navigator.pushNamed(
                                  context, Routes.pilihandokter);
                            },
                            child: Text(e.nama ?? '')),
                      ],
                    ));
              }).toList(),
            ),
          );
        }
        return const SizedBox(
          child: Center(child: Text("silahkan login terlebih dahulu")),
        );
      },
    );
  }

  // ===== list promo banner =====
  // ignore: non_constant_identifier_names
  Widget ListpromoBanner() {
    return BlocBuilder<PromoBannerCubit, PromoBannerState>(
      buildWhen: (previous, current) =>
          previous.promobanner != current.promobanner,
      builder: (context, state) {
        final dataBanner = state.promobanner?.data ?? [];

        if (state.promobanner?.status == Status.LOADING) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.promobanner?.status == Status.COMPLETED) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: dataBanner.map((e) {
                return Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      e.imageUrl ?? '',
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        }
        return SizedBox();
      },
    );
  }

  // ===== list artikel =====
  // ignore: non_constant_identifier_names
  Widget ListArtikel() {
    return BlocBuilder<ArtikelCubit, ArtikelState>(
      buildWhen: (previous, current) => previous.artikel != current.artikel,
      builder: (context, state) {
        final dataArtikel = state.artikel?.data ?? [];
        if (state.artikel?.status == Status.LOADING) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.artikel?.status == Status.COMPLETED) {
          return Column(
            children: dataArtikel.map((e) {
              return Container(
                height: 100,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black26,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(children: [
                  Image.network(
                    e.imageUrl ?? '',
                    height: 80,
                    width: 90,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 20, bottom: 10, left: 20),
                          child: Text(e.title ?? "",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: Text(() {
                            final datetime =
                                DateTime.parse('2021-07-09T10:54:41.776Z');
                            final formatter = DateFormat('HH:mm:ss');
                            return formatter.format(datetime);
                          }()),
                        ),
                      ],
                    ),
                  )
                ]),
              );
            }).toList(),
          );
        }
        return SizedBox();
      },
    );
  }
}
