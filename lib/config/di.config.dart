// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../api/api_services.dart' as _i124;
import '../api/data_sources/remote/auth/auth_data_source_impl.dart' as _i780;
import '../api/dio_module/dio_module.dart' as _i624;
import '../data/data_sources/remote/auth_repository_data_source.dart' as _i506;
import '../data/repositories/auth/auth_repository_impl.dart' as _i27;
import '../domain/repositories/auth/auth_repository.dart' as _i1064;
import '../domain/usecases/login_usecase.dart' as _i634;
import '../domain/usecases/register_usecase.dart' as _i535;
import '../feature/ui/auth/login/cubit/login_view_model.dart' as _i702;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.singleton<_i361.BaseOptions>(() => getItModule.provideBaseOption());
    gh.singleton<_i528.PrettyDioLogger>(
      () => getItModule.providePrettyDioLogger(),
    );
    gh.singleton<_i361.Dio>(
      () => getItModule.providedDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.singleton<_i124.ApiServices>(
      () => getItModule.providedApiServices(gh<_i361.Dio>()),
    );
    gh.factory<_i506.AuthRemoteDataSource>(
      () =>
          _i780.AuthRemoteDataSourceImpl(apiServices: gh<_i124.ApiServices>()),
    );
    gh.factory<_i1064.AuthRepository>(
      () => _i27.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i506.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i634.LoginUseCase>(
      () => _i634.LoginUseCase(authRepository: gh<_i1064.AuthRepository>()),
    );
    gh.factory<_i535.RegisterUseCase>(
      () => _i535.RegisterUseCase(authRepository: gh<_i1064.AuthRepository>()),
    );
    gh.factory<_i702.LoginViewModel>(
      () => _i702.LoginViewModel(loginUseCase: gh<_i634.LoginUseCase>()),
    );
    return this;
  }
}

class _$GetItModule extends _i624.GetItModule {}
