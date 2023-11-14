import 'package:dartz/dartz.dart';
import 'package:telemedicine_pasien/api/error/failures.dart';
import 'package:telemedicine_pasien/model/artikel_model.dart';

abstract class ArtikelRepository {
  Future<Either<Failure, List<ArtikelModel>?>> getArtikel();
}
