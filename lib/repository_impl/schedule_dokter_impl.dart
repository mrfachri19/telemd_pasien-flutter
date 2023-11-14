import 'package:telemedicine_pasien/api/error/exception.dart';
import 'package:telemedicine_pasien/api/remote_datasource.dart';
import 'package:telemedicine_pasien/api/error/failures.dart';
import 'package:telemedicine_pasien/model/schedule_dokter_model.dart';
import 'package:telemedicine_pasien/repositories/schedule_dokter_repository.dart';
import 'package:telemedicine_pasien/utils/network_info.dart';
import 'package:dartz/dartz.dart';

class ScheduleDokterImpl implements ScheduleDokterRepository {
  final NetworkInfoImpl networkInfo;
  final RemoteDataSource remoteDataSource;

  ScheduleDokterImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<ScheduleDokterModel>?>> getScheduleDokter(
      final int id, Map<String, dynamic> params) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.getScheduleDokter(id, params);
        return Right(remoteData.data);
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
