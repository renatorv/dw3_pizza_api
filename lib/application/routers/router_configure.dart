import 'package:dw3_pizza_api/modules/users/users_router.dart';
import 'package:shelf_router/src/router.dart';

import './i_router_configure.dart';

class RouterConfigure {
  final Router _router;
  RouterConfigure(this._router);

  final List<IRouterConfigure> routers = [
    UsersRouter(),
  ];

  void configure() => routers.forEach((r) => r.configure(_router));
}
