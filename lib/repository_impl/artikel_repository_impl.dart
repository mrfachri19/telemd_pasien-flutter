import 'package:telemedicine_pasien/api/error/exception.dart';
import 'package:telemedicine_pasien/api/remote_datasource.dart';
import 'package:telemedicine_pasien/api/error/failures.dart';
import 'package:telemedicine_pasien/model/artikel_model.dart';
import 'package:telemedicine_pasien/repositories/artikel_repository.dart';
import 'package:telemedicine_pasien/utils/network_info.dart';
import 'package:dartz/dartz.dart';

class ArtikelImpl implements ArtikelRepository {
  final NetworkInfoImpl networkInfo;
  final RemoteDataSource remoteDataSource;

  ArtikelImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<ArtikelModel>?>> getArtikel() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.getArtikel();
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
