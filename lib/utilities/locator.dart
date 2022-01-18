import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:safe_form/networking/section_networking.dart';
import 'package:safe_form/networking/status_validator.dart';
import 'package:safe_form/services/api_service.dart';
import 'package:safe_form/services/navigation_service.dart';

GetIt locator = GetIt.I;

Future<void> setupLocator() async {
  // Lazy Singletons
  GetIt.I.registerLazySingleton(
    () => NavigationService(),
  );
  GetIt.I.registerLazySingleton<ApiService>(
    () => ApiService(client: locator()),
  );

  GetIt.I.registerLazySingleton<Dio>(() {
    final dioClient = Dio(
      BaseOptions(
        baseUrl: 'http://localhost:3004',
      ),
    );
    final interceptors = <Interceptor>[
      StatusValidationInterceptor(),
    ];

    dioClient.interceptors.addAll(interceptors);
    return dioClient;
  });

  GetIt.I.registerFactory(
    () => SectionNetworking(),
  );

  return GetIt.I.allReady();
}
