import '../response/responses.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'app_api_impl.dart';

abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  Future<Response<dynamic>> sendMessage({
    @Field("service_id") String serviceId = "service_miyucdq",
    @Field("template_id") String templateId = "template_vgttlyp",
    @Field("user_id") String userId = "o2FltIybD5CL9MhA1",
    @Field("user_subject") required String userSubject,
    @Field("user_message") required String userMessage,
  });
}
