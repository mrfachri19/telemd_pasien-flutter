import 'package:get_it/get_it.dart';
import 'package:telemedicine_pasien/bloc/cubit/artikel_cubit.dart';
import 'package:telemedicine_pasien/bloc/cubit/faq_cubit.dart';
import 'package:telemedicine_pasien/bloc/cubit/help_member_cubit.dart';
import 'package:telemedicine_pasien/bloc/cubit/kategori_spesialis_cubit.dart';
import 'package:telemedicine_pasien/bloc/cubit/kebijakan_privasi_cubit.dart';
import 'package:telemedicine_pasien/bloc/cubit/list_dokter_chat_cubit.dart';
import 'package:telemedicine_pasien/bloc/cubit/list_dokter_chat_v2_cubit.dart';
import 'package:telemedicine_pasien/bloc/cubit/list_inbox_cubit.dart';
import 'package:telemedicine_pasien/bloc/cubit/login_email_cubit.dart';
import 'package:telemedicine_pasien/bloc/cubit/promo_banner_cubit.dart';
import 'package:telemedicine_pasien/bloc/cubit/schedule_dokter_cubit.dart';
import 'package:telemedicine_pasien/bloc/cubit/service_category_cubit.dart';
import 'package:telemedicine_pasien/bloc/cubit/term_condition_cubit.dart';
import 'package:telemedicine_pasien/repositories/artikel_repository.dart';
import 'package:telemedicine_pasien/repositories/help_member_repository.dart';
import 'package:telemedicine_pasien/repositories/kategori_spesialis_repository.dart';
import 'package:telemedicine_pasien/repositories/kebijakan_privasi_repository.dart';
import 'package:telemedicine_pasien/repositories/list_dokter_chat_repository.dart';
import 'package:telemedicine_pasien/repositories/list_dokter_chat_v2_repository.dart';
import 'package:telemedicine_pasien/repositories/list_inbox_repository.dart';
import 'package:telemedicine_pasien/repositories/login_email_repository.dart';
import 'package:telemedicine_pasien/repositories/promo_banner_repository.dart';
import 'package:telemedicine_pasien/repositories/schedule_dokter_repository.dart';
import 'package:telemedicine_pasien/repositories/service_category_repository.dart';
import 'package:telemedicine_pasien/repositories/term_condition_repository.dart';
import 'package:telemedicine_pasien/repository_impl/artikel_repository_impl.dart';
import 'package:telemedicine_pasien/repository_impl/help_member_impl.dart';
import 'package:telemedicine_pasien/repository_impl/kategori_spesialis_impl.dart';
import 'package:telemedicine_pasien/repository_impl/kebijakan_privasi_repository_impl.dart';
import 'package:telemedicine_pasien/repository_impl/list_dokter_chat_impl.dart';
import 'package:telemedicine_pasien/repository_impl/list_dokter_chat_v2_impl.dart';
import 'package:telemedicine_pasien/repository_impl/list_inbox_impl.dart';
import 'package:telemedicine_pasien/repository_impl/login_email_repository_impl.dart';
import 'package:telemedicine_pasien/repository_impl/promo_banner_impl.dart';
import 'package:telemedicine_pasien/repository_impl/schedule_dokter_impl.dart';
import 'package:telemedicine_pasien/repository_impl/service_category_repository_impl.dart';
import 'package:telemedicine_pasien/repository_impl/term_condition_repository_impl.dart';
import 'package:telemedicine_pasien/utils/network_info.dart';
import 'package:telemedicine_pasien/api/remote_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telemedicine_pasien/api/api_client.dart';

final sl = GetIt.instance;

Future<GetIt> init() async {
  // bloc
  if (!sl.isRegistered<TermConditionCubit>()) {
    sl.registerLazySingleton(() => TermConditionCubit());
  }
  if (!sl.isRegistered<KebijakanPrivasiCubit>()) {
    sl.registerLazySingleton(() => KebijakanPrivasiCubit());
  }
  if (!sl.isRegistered<HelpMemberCubit>()) {
    sl.registerLazySingleton(() => HelpMemberCubit());
  }
  if (!sl.isRegistered<FaqCubit>()) {
    sl.registerLazySingleton(() => FaqCubit());
  }
  if (!sl.isRegistered<LoginEmailCubit>()) {
    sl.registerLazySingleton(() => LoginEmailCubit());
  }
  if (!sl.isRegistered<ServiceCategoryCubit>()) {
    sl.registerLazySingleton(() => ServiceCategoryCubit());
  }
  if (!sl.isRegistered<PromoBannerCubit>()) {
    sl.registerLazySingleton(() => PromoBannerCubit());
  }
  if (!sl.isRegistered<ArtikelCubit>()) {
    sl.registerLazySingleton(() => ArtikelCubit());
  }
  if (!sl.isRegistered<ListDokterChatCubit>()) {
    sl.registerLazySingleton(() => ListDokterChatCubit());
  }
  if (!sl.isRegistered<ListDokterChatCubitV2>()) {
    sl.registerLazySingleton(() => ListDokterChatCubitV2());
  }
  if (!sl.isRegistered<KategoriSpesialisCubit>()) {
    sl.registerLazySingleton(() => KategoriSpesialisCubit());
  }
  if (!sl.isRegistered<ListInboxCUbit>()) {
    sl.registerLazySingleton(() => ListInboxCUbit());
  }
  if (!sl.isRegistered<ScheduleDokterCubit>()) {
    sl.registerLazySingleton(() => ScheduleDokterCubit());
  }
  // repository
  if (!sl.isRegistered<TermConditionRepository>()) {
    sl.registerLazySingleton(() => TermConditionImpl(
          networkInfo: sl<NetworkInfoImpl>(),
          remoteDataSource: sl<RemoteDataSource>(),
        ));
  }
  if (!sl.isRegistered<KebijakanPrivasiRepository>()) {
    sl.registerLazySingleton(() => KebijakanPrivasiImpl(
          networkInfo: sl<NetworkInfoImpl>(),
          remoteDataSource: sl<RemoteDataSource>(),
        ));
  }
  if (!sl.isRegistered<HelpMemberRepository>()) {
    sl.registerLazySingleton(() => HelpMemberImpl(
          networkInfo: sl<NetworkInfoImpl>(),
          remoteDataSource: sl<RemoteDataSource>(),
        ));
  }
  if (!sl.isRegistered<LoginEmailRepository>()) {
    sl.registerLazySingleton(
      () => LoginEmailRepositoryImpl(
        networkInfo: sl<NetworkInfoImpl>(),
        remoteDataSource: sl<RemoteDataSource>(),
      ),
    );
  }
  if (!sl.isRegistered<ServiceCategoryRepository>()) {
    sl.registerLazySingleton(
      () => ServiceCategoryImpl(
        networkInfo: sl<NetworkInfoImpl>(),
        remoteDataSource: sl<RemoteDataSource>(),
      ),
    );
  }
  if (!sl.isRegistered<ListDokterChatRepository>()) {
    sl.registerLazySingleton(
      () => ListDokterChatImpl(
        networkInfo: sl<NetworkInfoImpl>(),
        remoteDataSource: sl<RemoteDataSource>(),
      ),
    );
  }
  if (!sl.isRegistered<ListDokterChatRepositoryV2>()) {
    sl.registerLazySingleton(
      () => ListDokterChatImplV2(
        networkInfo: sl<NetworkInfoImpl>(),
        remoteDataSource: sl<RemoteDataSource>(),
      ),
    );
  }
  if (!sl.isRegistered<PromoBannerRepository>()) {
    sl.registerLazySingleton(
      () => PromoBannerImpl(
        networkInfo: sl<NetworkInfoImpl>(),
        remoteDataSource: sl<RemoteDataSource>(),
      ),
    );
  }
  if (!sl.isRegistered<ArtikelRepository>()) {
    sl.registerLazySingleton(
      () => ArtikelImpl(
        networkInfo: sl<NetworkInfoImpl>(),
        remoteDataSource: sl<RemoteDataSource>(),
      ),
    );
  }
  if (!sl.isRegistered<KategoriSpesialisRepository>()) {
    sl.registerLazySingleton(() => KategoriSpesialisImpl(
          networkInfo: sl<NetworkInfoImpl>(),
          remoteDataSource: sl<RemoteDataSource>(),
        ));
  }
  if (!sl.isRegistered<ListInboxRepository>()) {
    sl.registerLazySingleton(() => ListInboxImpl(
          networkInfo: sl<NetworkInfoImpl>(),
          remoteDataSource: sl<RemoteDataSource>(),
        ));
  }
  if (!sl.isRegistered<ScheduleDokterRepository>()) {
    sl.registerLazySingleton(() => ScheduleDokterImpl(
          networkInfo: sl<NetworkInfoImpl>(),
          remoteDataSource: sl<RemoteDataSource>(),
        ));
  }
  //core
  if (!sl.isRegistered<ApiClient>()) {
    sl.registerLazySingleton(() => ApiClient());
  }

  //External
  final sharedPreferences = await SharedPreferences.getInstance();
  if (!sl.isRegistered<SharedPreferences>()) {
    sl.registerLazySingleton(() => sharedPreferences);
  }
  if (!sl.isRegistered<NetworkInfoImpl>()) {
    sl.registerLazySingleton(() => NetworkInfoImpl());
  }

  if (!sl.isRegistered<RemoteDataSource>()) {
    sl.registerLazySingleton(() => RemoteDataSource());
  }

  return sl;
}
