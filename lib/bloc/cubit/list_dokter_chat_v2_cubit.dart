import 'package:bloc/bloc.dart';
import 'package:telemedicine_pasien/injection_container.dart';
import 'package:telemedicine_pasien/model/list_dokter_chat_model.dart';
import 'package:telemedicine_pasien/repository_impl/list_dokter_chat_v2_impl.dart';
import 'package:telemedicine_pasien/utils/result.dart';
part 'list_dokter_chat_v2_state.dart';

class ListDokterChatCubitV2 extends Cubit<ListDokterChatStateV2> {
  final ListDokterChatImplV2 _listDokterChatRepositoryV2 =
      sl<ListDokterChatImplV2>();
  ListDokterChatCubitV2() : super(const ListDokterChatStateV2());
  var name = '';

  void init() {
    emit(const ListDokterChatStateV2());
    getListDokterChatV2();
  }

  void getListDokterChatV2() async {
    emit(state.copyWith(listdokterchat: Result.loading()));

    final params = <String, dynamic>{
      'type': 'umum',
      'page': '1',
      'limit': '10'
    };

    if (name.isNotEmpty) params['name'] = name;

    final response =
        await _listDokterChatRepositoryV2.getListDokterChatV2(params);

    response.fold((failure) {
      print("failure ${failure.message}");
      emit(
        state.copyWith(
          listdokterchat: Result.error(
            failure.message!,
            state.listdokterchat?.data,
          ),
        ),
      );
    }, (data) {
      // print("sukses");
      emit(
        state.copyWith(
          listdokterchat: Result.completed(data),
        ),
      );
    });
  }
}
