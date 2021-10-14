// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../modules/users/controller/user_controller.dart' as _i10;
import '../../repositories/user/i_user_repository.dart' as _i6;
import '../../repositories/user/user_repository.dart' as _i7;
import '../../services/user/i_user_service.dart' as _i8;
import '../../services/user/user_service.dart' as _i9;
import '../database/i_database_connection.dart' as _i3;
import '../database/i_database_connection_impl.dart' as _i4;
import 'database_connectionConfiguration.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.IDatabaseConnection>(() =>
      _i4.IDatabaseConnectionImpl(get<_i5.DatabaseConnectionconfiguration>()));
  gh.lazySingleton<_i6.IUserRepository>(
      () => _i7.UserRepository(get<_i3.IDatabaseConnection>()));
  gh.lazySingleton<_i8.IUserService>(
      () => _i9.UserService(get<_i6.IUserRepository>()));
  gh.factory<_i10.UserController>(
      () => _i10.UserController(get<_i8.IUserService>()));
  return get;
}
