import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telemedicine_pasien/bloc/cubit/list_inbox_cubit.dart';
import 'package:telemedicine_pasien/injection_container.dart';
import 'package:telemedicine_pasien/utils/result.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  void initState() {
    super.initState();
    sl<ListInboxCUbit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListInboxCUbit, ListInboxState>(
      buildWhen: (previous, current) => previous.listinbox != current.listinbox,
      builder: (context, state) {
        final data = (state.listinbox?.data ?? []).toList();

        if (state.listinbox?.status == Status.LOADING) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.listinbox?.status == Status.COMPLETED) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Inbox"),
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: data.map((e) {
                  return Container(
                      margin: const EdgeInsets.only(top: 30, left: 30),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.inbox_outlined,
                              size: 24,
                              color: e.isRead == true
                                  ? Colors.black54
                                  : Colors.black,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    e.title ?? "",
                                    style: TextStyle(
                                      color: e.isRead == true
                                          ? Colors.black54
                                          : Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Text(
                                  e.description ?? "",
                                  style: TextStyle(
                                    color: e.isRead == true
                                        ? Colors.black54
                                        : Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ));
                }).toList(),
              ),
            ),
          );
        }
        return const SizedBox(
          child: Center(child: Text("Kotak masuk Kosong")),
        );
      },
    );
  }
}
