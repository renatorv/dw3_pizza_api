import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'package:dw3_pizza_api/modules/users/controller/mappers/register_input_model_mapper.dart';
import 'package:dw3_pizza_api/services/user/i_user_service.dart';

part 'user_controller.g.dart';

@Injectable()
class UserController {
  final IUserService _service;
  UserController(
    this._service,
  );

  @Route.post('/')
  Future<Response> register(Request request) async {
    // request.readAsString() é uma String assim é possível passar para um Map<String , dynamic>
    try {
      final requestMap = jsonDecode(await request.readAsString());

      // request: chega como String no Shelf
      final inputModel = RegisterInputModelMapper(requestMap).mapper();

      await _service.register(inputModel);

      return Response.ok(
        jsonEncode(
          {'message': 'Usuário registrado com sucesso!!'},
        ),
      );
    } catch (e) {
      return Response.internalServerError(
        body: jsonEncode(
          {
            'message': 'Erro ao registrar usuário!',
          },
        ),
      );
    }
  }

  Router get router => _$UserControllerRouter(this);
}
