// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../modules/menu/controller/menu_controller.dart' as _i14;
import '../../modules/users/controller/user_controller.dart' as _i15;
import '../../repositories/menu/i_menu_repository.dart' as _i6;
import '../../repositories/menu/menu_repository.dart' as _i7;
import '../../repositories/user/i_user_repository.dart' as _i10;
import '../../repositories/user/user_repository.dart' as _i11;
import '../../services/menu/i_menu_service.dart' as _i8;
import '../../services/menu/menu_service.dart' as _i9;
import '../../services/user/i_user_service.dart' as _i12;
import '../../services/user/user_service.dart' as _i13;
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
  gh.lazySingleton<_i6.IMenuRepository>(
      () => _i7.MenuRepository(get<_i3.IDatabaseConnection>()));
  gh.lazySingleton<_i8.IMenuService>(
      () => _i9.MenuService(get<_i6.IMenuRepository>()));
  gh.lazySingleton<_i10.IUserRepository>(
      () => _i11.UserRepository(get<_i3.IDatabaseConnection>()));
  gh.lazySingleton<_i12.IUserService>(
      () => _i13.UserService(get<_i10.IUserRepository>()));
  gh.factory<_i14.MenuController>(
      () => _i14.MenuController(get<_i8.IMenuService>()));
  gh.factory<_i15.UserController>(
      () => _i15.UserController(get<_i12.IUserService>()));
  return get;
}
