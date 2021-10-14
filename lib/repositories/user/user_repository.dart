import 'package:dw3_pizza_api/application/database/i_database_connection.dart';
import 'package:dw3_pizza_api/application/exceptions/database_error_exception.dart';
import 'package:dw3_pizza_api/modules/users/view_models/register_input_model.dart';
import 'package:injectable/injectable.dart';
import 'package:mysql1/mysql1.dart';

import './i_user_repository.dart';

@LazySingleton(as: IUserRepository)
class UserRepository implements IUserRepository {
  final IDatabaseConnection _connection;
  UserRepository(this._connection);

  @override
  Future<void> saveUser(RegisterInputModel model) async {
    final conn = await _connection.openConnection();

    try {
      await conn.query(
        'insert into usuario(nome, email, senha) values(?,?,?)',
        [model.name, model.email, model.password],
      );
    } on MySqlException catch (e) {
      print(e);
      throw DatabaseErrorException(message: 'Erro ao registrar usuário');
    }
    finally{
      await conn.close();
    }
  }
}
