import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/network/core_api_service.dart';
import '../../core/network/dio_error_handler.dart';
import '../../core/network/dio_interceptor.dart';
import '../../core/storage/token_storage.dart';
import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/get_profile_usecase.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/logout_usecase.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/posts/data/datasources/post_remote_datasource.dart';
import '../../features/posts/data/repositories/post_repository_impl.dart';
import '../../features/posts/domain/repositories/post_repository.dart';
import '../../features/posts/domain/usecases/get_posts_usecase.dart';
import '../../features/posts/presentation/bloc/post_list_bloc.dart';

final GetIt getIt = GetIt.instance;
T getDependency<T extends Object>() => getIt<T>();

Future<void> configureDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt
    ..registerSingleton<SharedPreferences>(sharedPreferences)
    ..registerLazySingleton<TokenStorage>(() => TokenStorageImpl(getIt<SharedPreferences>()))
    ..registerLazySingleton<DioErrorHandler>(() => const DioErrorHandler())
    ..registerLazySingleton<Dio>(() { final dio = Dio(); dio.interceptors.add(AuthInterceptor(tokenStorage: getIt<TokenStorage>())); return dio; })
    ..registerLazySingleton<CoreApiService>(() => CoreApiService(dio: getIt<Dio>(), dioErrorHandler: getIt<DioErrorHandler>()))
    ..registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(apiService: getIt<CoreApiService>()))
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(remoteDataSource: getIt<AuthRemoteDataSource>(), tokenStorage: getIt<TokenStorage>()))
    ..registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt<AuthRepository>()))
    ..registerLazySingleton<GetProfileUseCase>(() => GetProfileUseCase(getIt<AuthRepository>()))
    ..registerLazySingleton<LogoutUseCase>(() => LogoutUseCase(getIt<AuthRepository>()))
    ..registerFactory<AuthBloc>(() => AuthBloc(loginUseCase: getIt<LoginUseCase>(), getProfileUseCase: getIt<GetProfileUseCase>(), logoutUseCase: getIt<LogoutUseCase>()))
    ..registerLazySingleton<PostRemoteDataSource>(() => PostRemoteDataSourceImpl(apiService: getIt<CoreApiService>()))
    ..registerLazySingleton<PostRepository>(() => PostRepositoryImpl(remoteDataSource: getIt<PostRemoteDataSource>()))
    ..registerLazySingleton<GetPostsUseCase>(() => GetPostsUseCase(getIt<PostRepository>()))
    ..registerFactory<PostListBloc>(() => PostListBloc(getPostsUseCase: getIt<GetPostsUseCase>()));
}
