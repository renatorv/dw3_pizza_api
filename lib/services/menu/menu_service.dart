import 'package:dw3_pizza_api/entities/menu.dart';
import 'package:dw3_pizza_api/repositories/menu/i_menu_repository.dart';
import 'package:injectable/injectable.dart';

import './i_menu_service.dart';

@LazySingleton(as: IMenuService)
class MenuService implements IMenuService {
  final IMenuRepository _repository;
  MenuService(this._repository);

  @override
  Future<List<Menu>> getAllMenus() {
    return _repository.findAll();
  }
}