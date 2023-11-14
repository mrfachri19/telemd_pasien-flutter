import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telemedicine_pasien/injection_container.dart';
import 'package:telemedicine_pasien/model/help_member_model.dart';
import 'package:telemedicine_pasien/repositories/help_member_repository.dart';
import 'package:telemedicine_pasien/repository_impl/help_member_impl.dart';
import 'package:telemedicine_pasien/utils/result.dart';

part 'help_member_state.dart';

class HelpMemberCubit extends Cubit<HelpMemberState> {
  final HelpMemberRepository _helpMemberRepository = sl<HelpMemberImpl>();
  HelpMemberCubit() : super(const HelpMemberState());

  void init() {
    emit(const HelpMemberState());
    getHelpMember();
  }

  void getHelpMember() async {
    emit(state.copyWith(helpmember: Result.loading()));
    print("loading");
    final response = await _helpMemberRepository.getHelpMember();

    response.fold((failure) {
      print("failure ${failure.message}");
      emit(
        state.copyWith(
          helpmember: Result.error(
            failure.message!,
            state.helpmember?.data,
          ),
        ),
      );
    }, (data) {
      print("sukses");
      emit(
        state.copyWith(
          helpmember: Result.completed(data),
        ),
      );
    });
  }
}
