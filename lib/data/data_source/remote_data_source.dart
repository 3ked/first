import 'package:dio/dio.dart';

import '../network/app_api.dart';
import '../network/requests.dart';

abstract class RemoteDataSource {
  Future<Response<dynamic>> message(MessageRequest messageRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;
  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<Response<dynamic>> message(MessageRequest messageRequest) {
    return _appServiceClient.sendMessage(
        userSubject: messageRequest.userSubject, userMessage: messageRequest.userMessage);
  }
}
