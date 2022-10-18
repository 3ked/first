part of 'app_api.dart';

class _AppServiceClient implements AppServiceClient {
  _AppServiceClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.emailjs.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Response<dynamic>> sendMessage(
      {serviceId = "service_mn5csz7",
      templateId = "template_vgttlyp",
      userId = "o2FltIybD5CL9MhA1",
      required userSubject,
      required userMessage}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'service_id': serviceId,
      'template_id': templateId,
      'user_id': userId,
      'template_params': {'user_subject': userSubject, 'user_message': userMessage}
    };
    final _result = await _dio.fetch(_setStreamType<MessageResponse>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/api/v1.0/email/send',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return _result;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
