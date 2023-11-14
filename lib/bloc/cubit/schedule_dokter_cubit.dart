import 'package:bloc/bloc.dart';
import 'package:telemedicine_pasien/injection_container.dart';
import 'package:telemedicine_pasien/model/schedule_dokter_model.dart';
import 'package:telemedicine_pasien/repository_impl/schedule_dokter_impl.dart';
import 'package:telemedicine_pasien/utils/result.dart';
part 'schedule_dokter_state.dart';

class ScheduleDokterCubit extends Cubit<ScheduleDokterState> {
  final ScheduleDokterImpl _scheduleDokterRepository = sl<ScheduleDokterImpl>();
  ScheduleDokterCubit() : super(const ScheduleDokterState());
  var service = '';

  void init(final int id) {
    emit(const ScheduleDokterState());
    getScheduleDokter(id);
  }

  void getScheduleDokter(final int id) async {
    emit(state.copyWith(scheduledokter: Result.loading()));
    final params = <String, dynamic>{};
    if (service.isNotEmpty) params['service'] = service;
    final response =
        await _scheduleDokterRepository.getScheduleDokter(id, params);

    response.fold((failure) {
      print("failure ${failure.message}");
      emit(
        state.copyWith(
          scheduledokter: Result.error(
            failure.message!,
            state.scheduledokter?.data,
          ),
        ),
      );
    }, (data) {
      // print("sukses");
      emit(
        state.copyWith(
          scheduledokter: Result.completed(data),
        ),
      );
    });
  }
}
