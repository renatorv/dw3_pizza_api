import 'package:dw3_pizza_api/application/config/database_connectionConfiguration.dart';
import 'package:injectable/injectable.dart';
import 'package:mysql1/mysql1.dart';
import './i_database_connection.dart';

@Injectable(as: IDatabaseConnection)
class IDatabaseConnectionImpl implements IDatabaseConnection {
  final DatabaseConnectionconfiguration _configuration;
  IDatabaseConnectionImpl(this._configuration);

  @override
  Future<MySqlConnection> openConnection() {
    return MySqlConnection.connect(
      ConnectionSettings(
        host: _configuration.host.toString(),
        port: int.parse(_configuration.port ?? 3306.toString()),
        user: _configuration.user,
        password: _configuration.password,
        db: _configuration.databaseName,
      ),
    );
  }
}
