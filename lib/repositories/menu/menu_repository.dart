import 'package:dw3_pizza_api/application/database/i_database_connection.dart';
import 'package:dw3_pizza_api/application/exceptions/database_error_exception.dart';
import 'package:dw3_pizza_api/entities/menu.dart';
import 'package:dw3_pizza_api/entities/menu_item.dart';
import 'package:injectable/injectable.dart';
import 'package:mysql1/mysql1.dart';

import './i_menu_repository.dart';

@LazySingleton(as: IMenuRepository)
class MenuRepository implements IMenuRepository {
  final IDatabaseConnection _connection;
  MenuRepository(this._connection);

  @override
  Future<List<Menu>> findAll() async {
    final conn = await _connection.openConnection();

    try {
      final result = await conn.query('SELECT * FROM pizza_delivery.cardapio_grupo;');
      
      if (result.isNotEmpty) {
        final menus = result.map<Menu>((row) {
          return Menu(
            id: row['id_cardapio_grupo'] as int,
            name: row['nome_grupo'] as String,
          );
        }).toList();
      
        for (var menu in menus) {
          final resultItens = await conn.query(
            'SELECT * FROM pizza_delivery.cardapio_grupo_item where id_cardapio_grupo = ?',
            [menu.id],
          );
      
      
          if (resultItens.isNotEmpty) {
            final items = resultItens.map<MenuItem>((row) {
              return MenuItem(
                id: row['id_cardapio_grupo_item'] as int,
                name: row['nome'] as String,
                price: row['valor'] as double,
              );
            }).toList();
            menu.items = items;
          }
        }
        return menus;
      }
      
      return [];

    } on MySqlException catch (e) {
      print(e);
      throw DatabaseErrorException();
    } finally{
      await conn.close(); 
    }
  }
}
