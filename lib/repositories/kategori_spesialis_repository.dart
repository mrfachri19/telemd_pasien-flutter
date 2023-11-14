import 'package:dartz/dartz.dart';
import 'package:telemedicine_pasien/api/error/failures.dart';
import 'package:telemedicine_pasien/model/kategori_spesialis_model.dart';

abstract class KategoriSpesialisRepository {
  Future<Either<Failure, List<KategoriSpesialisModel>?>> getKategoriSpesialis();
}
