import 'dart:async';
import 'dart:convert';
import 'package:dw3_pizza_api/modules/orders/controller/mapper/save_order_input_model_mapper.dart';
import 'package:dw3_pizza_api/services/orders/orders_service.dart';
import 'package:injectable/injectable.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'orders_controller.g.dart';

@Injectable()
class OrdersController {

  final OrdersService _service;
  OrdersController(this._service);

  @Route.post('/')
  Future<Response> saveOrder(Request request) async {

    final inputModel = SaveOrderInputModelMapper(await request.readAsString()).mapper();

    await _service.saveOrder(inputModel);

    return Response.ok(jsonEncode(''));
  }

  Router get router => _$OrdersControllerRouter(this);
}

parei em 29 minutos da aula 3