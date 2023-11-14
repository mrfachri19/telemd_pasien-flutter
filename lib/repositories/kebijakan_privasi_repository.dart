import 'package:dartz/dartz.dart';
import 'package:telemedicine_pasien/api/error/failures.dart';
import 'package:telemedicine_pasien/model/kebijakan_privasi_model.dart';

abstract class KebijakanPrivasiRepository {
  Future<Either<Failure, KebijakanPrivasi?>> getKebijakanPrivasi(
      Map<String, dynamic> params);
}
