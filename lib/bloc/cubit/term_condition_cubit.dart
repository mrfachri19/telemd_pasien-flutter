import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telemedicine_pasien/injection_container.dart';
import 'package:telemedicine_pasien/repository_impl/term_condition_repository_impl.dart';
import 'package:telemedicine_pasien/model/term_condition.dart';
import 'package:telemedicine_pasien/utils/result.dart';
import 'package:telemedicine_pasien/repositories/term_condition_repository.dart';
part 'term_condition_state.dart';

class TermConditionCubit extends Cubit<TermConditionState> {
  final TermConditionRepository _termConditionRepository =
      sl<TermConditionImpl>();
  TermConditionCubit() : super(const TermConditionState());

  void init() {
    emit(const TermConditionState());
    getTermCondition();
  }

  void getTermCondition() async {
    emit(state.copyWith(termcondition: Result.loading()));
    final response = await _termConditionRepository.getTermCondition();

    response.fold((failure) {
      print("failure ${failure.message}");
      emit(
        state.copyWith(
          termcondition: Result.error(
            failure.message!,
            state.termcondition?.data,
          ),
        ),
      );
    }, (data) {
      print("sukses");
      emit(
        state.copyWith(
          termcondition: Result.completed(data),
        ),
      );
    });
  }
}
