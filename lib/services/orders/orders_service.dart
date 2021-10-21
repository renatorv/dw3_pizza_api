import 'package:dw3_pizza_api/modules/orders/view_models/save_order_input_model.dart';
import 'package:dw3_pizza_api/repositories/orders/orders_repository.dart';
import 'package:injectable/injectable.dart';

import './i_orders_service.dart';

@LazySingleton(as: IOrdersService)
class OrdersService implements IOrdersService {
  final OrdersRepository _repository;
  OrdersService(this._repository);

  @override
  Future<void> saveOrder(SaveOrderInputModel saveOrder) async {
    await _repository.saveOrder(saveOrder);
  }
}
