import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telemedicine_pasien/injection_container.dart';
import 'package:telemedicine_pasien/model/kebijakan_privasi_model.dart';
import 'package:telemedicine_pasien/repositories/kebijakan_privasi_repository.dart';
import 'package:telemedicine_pasien/repository_impl/kebijakan_privasi_repository_impl.dart';
import 'package:telemedicine_pasien/utils/result.dart';
part 'faq_state.dart';

class FaqCubit extends Cubit<FaqState> {
  final KebijakanPrivasiRepository _kebijakanPrivasiRepository =
      sl<KebijakanPrivasiImpl>();
  FaqCubit() : super(const FaqState());

  void init() {
    emit(const FaqState());
    getKebijakanPrivasi();
  }

  void getKebijakanPrivasi() async {
    emit(state.copyWith(kebijakanprivasi: Result.loading()));
    print("loading");
    final response = await _kebijakanPrivasiRepository.getKebijakanPrivasi({
      'key': 'faq_member',
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
