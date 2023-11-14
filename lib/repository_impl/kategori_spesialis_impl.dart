import 'package:telemedicine_pasien/api/error/exception.dart';
import 'package:telemedicine_pasien/api/remote_datasource.dart';
import 'package:telemedicine_pasien/api/error/failures.dart';
import 'package:telemedicine_pasien/model/kategori_spesialis_model.dart';
import 'package:telemedicine_pasien/repositories/kategori_spesialis_repository.dart';
import 'package:telemedicine_pasien/utils/network_info.dart';
import 'package:dartz/dartz.dart';

class KategoriSpesialisImpl implements KategoriSpesialisRepository {
  final NetworkInfoImpl networkInfo;
  final RemoteDataSource remoteDataSource;

  KategoriSpesialisImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<KategoriSpesialisModel>?>>
      getKategoriSpesialis() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.getKategoriSpesialis();
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
