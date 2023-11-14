import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telemedicine_pasien/injection_container.dart';
import 'package:telemedicine_pasien/model/service_category_model.dart';
import 'package:telemedicine_pasien/repositories/service_category_repository.dart';
import 'package:telemedicine_pasien/repository_impl/service_category_repository_impl.dart';
import 'package:telemedicine_pasien/utils/result.dart';
part 'service_category_state.dart';

class ServiceCategoryCubit extends Cubit<ServiceCategoryState> {
  final ServiceCategoryRepository _serviceCategoryRepository =
      sl<ServiceCategoryImpl>();
  ServiceCategoryCubit() : super(const ServiceCategoryState());

  void init() {
    emit(const ServiceCategoryState());
    getServiceCategory();
  }

  void getServiceCategory() async {
    emit(state.copyWith(servicecategory: Result.loading()));
    final response = await _serviceCategoryRepository.getServiceCategory();

    response.fold((failure) {
      print("failure ${failure.message}");
      emit(
        state.copyWith(
          servicecategory: Result.error(
            failure.message!,
            state.servicecategory?.data,
          ),
        ),
      );
    }, (data) {
      // print("sukses");
      emit(
        state.copyWith(
          servicecategory: Result.completed(data),
        ),
      );
    });
  }
}
