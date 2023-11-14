import 'package:telemedicine_pasien/api/error/exception.dart';
import 'package:telemedicine_pasien/api/remote_datasource.dart';
import 'package:telemedicine_pasien/model/kebijakan_privasi_model.dart';
import 'package:telemedicine_pasien/api/error/failures.dart';
import 'package:telemedicine_pasien/repositories/kebijakan_privasi_repository.dart';
import 'package:telemedicine_pasien/utils/network_info.dart';
import 'package:dartz/dartz.dart';

class KebijakanPrivasiImpl implements KebijakanPrivasiRepository {
  final NetworkInfoImpl networkInfo;
  final RemoteDataSource remoteDataSource;

  KebijakanPrivasiImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, KebijakanPrivasi?>> getKebijakanPrivasi(
      Map<String, dynamic> params) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.getKebijakanPrivasi(params);
        return Right(remoteData.data[0]);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return const Left(
        ServerFailure('Tidak ada koneksi internet'),
      );
    }
  }
}
