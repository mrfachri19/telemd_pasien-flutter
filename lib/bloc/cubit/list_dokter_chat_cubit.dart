import 'package:bloc/bloc.dart';
import 'package:telemedicine_pasien/injection_container.dart';
import 'package:telemedicine_pasien/model/list_dokter_chat_model.dart';
import 'package:telemedicine_pasien/repositories/list_dokter_chat_repository.dart';
import 'package:telemedicine_pasien/repository_impl/list_dokter_chat_impl.dart';
import 'package:telemedicine_pasien/utils/result.dart';
part 'list_dokter_chat_state.dart';

class ListDokterChatCubit extends Cubit<ListDokterChatState> {
  final ListDokterChatRepository _listDokterChatRepository =
      sl<ListDokterChatImpl>();
  ListDokterChatCubit() : super(const ListDokterChatState());

  void init() {
    emit(const ListDokterChatState());
    getListDokterChat();
  }

  void getListDokterChat() async {
    emit(state.copyWith(listdokterchat: Result.loading()));
    final response = await _listDokterChatRepository.getListDokterChat();

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
