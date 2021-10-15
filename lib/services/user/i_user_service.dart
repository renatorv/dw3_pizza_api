import 'package:dw3_pizza_api/entities/user.dart';
import 'package:dw3_pizza_api/modules/users/view_models/register_input_model.dart';
import 'package:dw3_pizza_api/modules/users/view_models/user_login_model.dart';

abstract class IUserService {
  Future<void> register(RegisterInputModel model);

  Future<User> login(UserLoginModel viewModel);
}
