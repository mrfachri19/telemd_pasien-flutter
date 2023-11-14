import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telemedicine_pasien/model/artikel_model.dart';
import 'package:telemedicine_pasien/repositories/artikel_repository.dart';
import 'package:telemedicine_pasien/repository_impl/artikel_repository_impl.dart';
import '../../utils/result.dart';
import 'package:telemedicine_pasien/injection_container.dart';
part 'artikel_state.dart';

class ArtikelCubit extends Cubit<ArtikelState> {
  final ArtikelRepository _artikelRepository = sl<ArtikelImpl>();
  ArtikelCubit() : super(const ArtikelState());
  void init() {
    emit(const ArtikelState());
    getArtikel();
  }

  void getArtikel() async {
    emit(state.copyWith(artikel: Result.loading()));
    final response = await _artikelRepository.getArtikel();

    response.fold((failure) {
      print("failure ${failure.message}");
      emit(
        state.copyWith(
          artikel: Result.error(
            failure.message!,
            state.artikel?.data,
          ),
        ),
      );
    }, (data) {
      print("sukses");
      emit(
        state.copyWith(
          artikel: Result.completed(data),
        ),
      );
    });
  }
}
