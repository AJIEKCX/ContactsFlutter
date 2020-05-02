import 'package:contacts_flutter/data/db/database.dart';
import 'package:contacts_flutter/data/mapper/api_contact_mapper.dart';
import 'package:contacts_flutter/data/mapper/contact_mapper.dart';
import 'package:contacts_flutter/data/repository/contacts_repository.dart';
import 'package:contacts_flutter/data/service/contacts_service.dart';
import 'package:contacts_flutter/domain/interactor/contacts_interactor.dart';
import 'package:contacts_flutter/domain/repository/contacts_repository.dart';
import 'package:contacts_flutter/global/di/provider/dio_provider.dart';
import 'package:contacts_flutter/presentation/bloc/contacts/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  // Blocs
  sl.registerFactory<ContactsBloc>(() => ContactsBloc(interactor: sl()));

  // Interactors
  sl.registerLazySingleton<ContactsInteractor>(
      () => ContactsInteractor(repository: sl()));

  // Repositories
  sl.registerLazySingleton<ContactsRepository>(() =>
      ContactsRepositoryImpl(sl(), sl(), sl(), sl()));

  // Mapper
  sl.registerLazySingleton<ApiContactMapper>(() => ApiContactMapper());
  sl.registerLazySingleton<ContactMapper>(() => ContactMapper());

  // Services
  sl.registerLazySingleton<ContactsService>(() => ContactsService(dio: sl()));

  // Http client
  sl.registerLazySingleton<Dio>(() => DioProvider.get());

  // Database
  sl.registerLazySingleton<AppDatabase>(() => AppDatabase());
}
