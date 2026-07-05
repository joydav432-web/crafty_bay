


import '../core/service/network_caller/network_caller.dart';

NetworkCaller networkCaller = NetworkCaller(headers:
    () => {
      'Content-Type': 'application/json',
    },
);

