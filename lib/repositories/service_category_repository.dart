import 'package:dartz/dartz.dart';
import 'package:telemedicine_pasien/api/error/failures.dart';
import 'package:telemedicine_pasien/model/service_category_model.dart';

abstract class ServiceCategoryRepository {
  Future<Either<Failure, List<ServiceCategoryModel>?>> getServiceCategory();
}
