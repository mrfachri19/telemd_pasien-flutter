import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telemedicine_pasien/injection_container.dart';
import 'package:telemedicine_pasien/model/promo_banner_model.dart';
import 'package:telemedicine_pasien/repositories/promo_banner_repository.dart';
import 'package:telemedicine_pasien/repository_impl/promo_banner_impl.dart';
import 'package:telemedicine_pasien/utils/result.dart';
part 'promo_banner_state.dart';

class PromoBannerCubit extends Cubit<PromoBannerState> {
  final PromoBannerRepository _promoBannerRepository = sl<PromoBannerImpl>();
  PromoBannerCubit() : super(const PromoBannerState());

  void init() {
    emit(const PromoBannerState());
    getPromoBanner();
  }

  void getPromoBanner() async {
    emit(state.copyWith(promobanner: Result.loading()));
    final response = await _promoBannerRepository.getPromoBanner();

    response.fold((failure) {
      print("failure ${failure.message}");
      emit(
        state.copyWith(
          promobanner: Result.error(
            failure.message!,
            state.promobanner?.data,
          ),
        ),
      );
    }, (data) {
      print("sukses");
      emit(
        state.copyWith(
          promobanner: Result.completed(data),
        ),
      );
    });
  }
}
