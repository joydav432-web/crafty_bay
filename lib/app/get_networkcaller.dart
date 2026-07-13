import 'package:crafty_bay/app/providers/auth_controller.dart';

import '../core/service/network_caller/network_caller.dart';

NetworkCaller networkCaller = NetworkCaller(
  headers: () => {
    'Content-Type': 'application/json',

    if (AuthController.accessToken != null)
      'token': AuthController.accessToken!,
  },
);
