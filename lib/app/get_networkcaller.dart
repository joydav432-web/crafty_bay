import 'package:crafty_bay/app/providers/auth_controller.dart';

import '../core/service/network_caller/network_caller.dart';

NetworkCaller networkCaller() {
  return NetworkCaller(
    headers: () {
      print('Access Token: ${AuthController.accessToken}');

      return {
        'content-type': 'application/json',
        if (AuthController.accessToken != null)
          'token': AuthController.accessToken!,
      };
    },
  );
}
