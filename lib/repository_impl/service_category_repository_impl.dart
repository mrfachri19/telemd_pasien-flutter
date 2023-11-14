import 'package:telemedicine_pasien/api/error/exception.dart';
import 'package:telemedicine_pasien/api/remote_datasource.dart';
import 'package:telemedicine_pasien/api/error/failures.dart';
import 'package:telemedicine_pasien/model/service_category_model.dart';
import 'package:telemedicine_pasien/repositories/service_category_repository.dart';
import 'package:telemedicine_pasien/utils/network_info.dart';
import 'package:dartz/dartz.dart';

class ServiceCategoryImpl implements ServiceCategoryRepository {
  final NetworkInfoImpl networkInfo;
  final RemoteDataSource remoteDataSource;

  ServiceCategoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<ServiceCategoryModel>?>>
      getServiceCategory() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.getServiceCategory();
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
