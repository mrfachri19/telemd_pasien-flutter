import 'package:telemedicine_pasien/api/error/exception.dart';
import 'package:telemedicine_pasien/api/remote_datasource.dart';
import 'package:telemedicine_pasien/model/login.dart';
import 'package:telemedicine_pasien/api/error/failures.dart';
import 'package:telemedicine_pasien/repositories/login_email_repository.dart';
import 'package:telemedicine_pasien/utils/network_info.dart';
import 'package:dartz/dartz.dart';

class LoginEmailRepositoryImpl implements LoginEmailRepository {
  final NetworkInfoImpl networkInfo;
  final RemoteDataSource remoteDataSource;

  LoginEmailRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Login>> login([Map<String, dynamic>? params]) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await remoteDataSource.login(params);
        return Right(user.data);
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
