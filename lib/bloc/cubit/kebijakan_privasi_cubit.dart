import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telemedicine_pasien/injection_container.dart';
import 'package:telemedicine_pasien/model/kebijakan_privasi_model.dart';
import 'package:telemedicine_pasien/repositories/kebijakan_privasi_repository.dart';
import 'package:telemedicine_pasien/repository_impl/kebijakan_privasi_repository_impl.dart';
import 'package:telemedicine_pasien/utils/result.dart';
part 'kebijakan_privasi_state.dart';

class KebijakanPrivasiCubit extends Cubit<KebijakanPrivasiState> {
  final KebijakanPrivasiRepository _kebijakanPrivasiRepository =
      sl<KebijakanPrivasiImpl>();
  KebijakanPrivasiCubit() : super(const KebijakanPrivasiState());

  void init() {
    emit(const KebijakanPrivasiState());
    getKebijakanPrivasi();
  }

  void getKebijakanPrivasi() async {
    emit(state.copyWith(kebijakanprivasi: Result.loading()));
    print("loading");
    final response = await _kebijakanPrivasiRepository.getKebijakanPrivasi({
      'key': 'privacy_policy_member',
    });

    response.fold((failure) {
      print("failure ${failure.message}");
      emit(
        state.copyWith(
          kebijakanprivasi: Result.error(
            failure.message!,
            state.kebijakanprivasi?.data,
          ),
        ),
      );
    }, (data) {
      print("sukses");
      emit(
        state.copyWith(
          kebijakanprivasi: Result.completed(data),
        ),
      );
    });
  }
}
