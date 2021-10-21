import 'package:dw3_pizza_api/application/database/i_database_connection.dart';
import 'package:dw3_pizza_api/application/exceptions/database_error_exception.dart';
import 'package:dw3_pizza_api/modules/orders/view_models/save_order_input_model.dart';
import 'package:injectable/injectable.dart';
import 'package:mysql1/mysql1.dart';

import './i_orders_repository.dart';

@LazySingleton(as: IOrdersRepository)
class OrdersRepository implements IOrdersRepository {
  final IDatabaseConnection _connection;
  OrdersRepository(this._connection);

  @override
  Future<void> saveOrder(SaveOrderInputModel saveOrder) async {
    final conn = await _connection.openConnection();

    // Inserção em duas tabelas: pedido  e pedido_item
    // Assim deve-ser criar uma transação, que fará todo o processo de uma vez
    // e caso dê algum erro em alguma query todo o processo será desfeito.
    try {
      await conn.transaction(
        (_) async {
          final resultOrder = await conn.query(
            '''
          insert into pedido(
            id_pedido,
            forma_pagamento,
            endereco_entrega
          ) values (
            ?,
            ?,
            ?
          )
        ''',
            [
              saveOrder.userId,
              saveOrder.paymentType,
              saveOrder.address,
            ],
          );
      
          final orderId = resultOrder.insertId;
      
          await conn.queryMulti(
            '''
            insert into pedido_item(
              id_pedido,
              id_cardapio_grupo_item
            ) values(?,?)
           ''',
            saveOrder.itemsId!.map((item) => [orderId, item]));
        },
      );
    } on MySqlException catch (e) {
      print(e);
      throw DatabaseErrorException(message: 'Erro ao inserir order');
    } finally{
      await conn.close();
    }
  }
}
