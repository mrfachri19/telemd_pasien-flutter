import 'package:telemedicine_pasien/api/error/exception.dart';
import 'package:telemedicine_pasien/api/remote_datasource.dart';
import 'package:telemedicine_pasien/api/error/failures.dart';
import 'package:telemedicine_pasien/model/promo_banner_model.dart';
import 'package:telemedicine_pasien/repositories/promo_banner_repository.dart';
import 'package:telemedicine_pasien/utils/network_info.dart';
import 'package:dartz/dartz.dart';

class PromoBannerImpl implements PromoBannerRepository {
  final NetworkInfoImpl networkInfo;
  final RemoteDataSource remoteDataSource;

  PromoBannerImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<PromoBannerModel>?>> getPromoBanner() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.getPromoBanner();
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
