import 'package:bloc/bloc.dart';
import 'package:telemedicine_pasien/injection_container.dart';
import 'package:telemedicine_pasien/model/list_inbox_model.dart';
import 'package:telemedicine_pasien/repositories/list_inbox_repository.dart';
import 'package:telemedicine_pasien/repository_impl/list_inbox_impl.dart';
import 'package:telemedicine_pasien/utils/result.dart';
part 'list_inbox_state.dart';

class ListInboxCUbit extends Cubit<ListInboxState> {
  final ListInboxRepository _listInboxRepository = sl<ListInboxImpl>();
  ListInboxCUbit() : super(const ListInboxState());

  void init() {
    emit(const ListInboxState());
    getListInbox();
  }

  void getListInbox() async {
    emit(state.copyWith(listinbox: Result.loading()));
    final response = await _listInboxRepository.getListInbox();

    response.fold((failure) {
      print("failure ${failure.message}");
      emit(
        state.copyWith(
          listinbox: Result.error(
            failure.message!,
            state.listinbox?.data,
          ),
        ),
      );
    }, (data) {
      // print("sukses");
      emit(
        state.copyWith(
          listinbox: Result.completed(data),
        ),
      );
    });
  }
}
