part of 'service_category_cubit.dart';

class ServiceCategoryState {
  final Result<List<ServiceCategoryModel>>? servicecategory;

  const ServiceCategoryState({
    this.servicecategory,
  });

  ServiceCategoryState copyWith({
    Result<List<ServiceCategoryModel>>? servicecategory,
  }) {
    return ServiceCategoryState(
      servicecategory: servicecategory ?? this.servicecategory,
    );
  }
}
