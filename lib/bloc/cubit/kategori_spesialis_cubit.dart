import 'package:bloc/bloc.dart';
import 'package:telemedicine_pasien/injection_container.dart';
import 'package:telemedicine_pasien/model/kategori_spesialis_model.dart';
import 'package:telemedicine_pasien/repositories/kategori_spesialis_repository.dart';
import 'package:telemedicine_pasien/repository_impl/kategori_spesialis_impl.dart';
import 'package:telemedicine_pasien/utils/result.dart';
part 'kategori_spesialis_state.dart';

class KategoriSpesialisCubit extends Cubit<KategoriSpesialisState> {
  final KategoriSpesialisRepository _kategoriSpesialisRepository =
      sl<KategoriSpesialisImpl>();
  KategoriSpesialisCubit() : super(const KategoriSpesialisState());

  void init() {
    emit(const KategoriSpesialisState());
    getKategoriSpesialis();
  }

  void getKategoriSpesialis() async {
    emit(state.copyWith(kategorispesialis: Result.loading()));
    final response = await _kategoriSpesialisRepository.getKategoriSpesialis();

    response.fold((failure) {
      print("failure ${failure.message}");
      emit(
        state.copyWith(
          kategorispesialis: Result.error(
            failure.message!,
            state.kategorispesialis?.data,
          ),
        ),
      );
    }, (data) {
      // print("sukses");
      emit(
        state.copyWith(
          kategorispesialis: Result.completed(data),
        ),
      );
    });
  }
}
