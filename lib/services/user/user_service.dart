import 'package:dw3_pizza_api/application/helpers/cripty_helper.dart';
import 'package:dw3_pizza_api/modules/users/view_models/register_input_model.dart';
import 'package:dw3_pizza_api/repositories/user/i_user_repository.dart';
import 'package:injectable/injectable.dart';

import './i_user_service.dart';

@LazySingleton(as: IUserService)
class UserService implements IUserService {
  final IUserRepository _repository;
  UserService(
    this._repository,
  );

  @override
  Future<void> register(RegisterInputModel inputModel) async {
    // Criptografar a senha aqui
    final passwordCrypt = CriptyHelper.generateSHA256Hash(inputModel.password);
    inputModel.password = passwordCrypt;

    await _repository.saveUser(inputModel);
  }
}
