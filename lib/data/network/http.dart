// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// Future<http.Response> sendMessage({required userSubject, required userMessage}) async {
//   String serviceId = "service_miyucdq";
//   String templateId = "template_vgttlyp";
//   String publicKey = "o2FltIybD5CL9MhA1";
//   Map<String, dynamic> templateParams = {
//     'user_subject': userSubject,
//     'user_message': userMessage,
//   };

//   final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
//   final response = await http.post(
//     url,
//     headers: {
//       "origin": "http://localhost",
//       "Content-Type": "application/json",
//     },
//     body: json.encode({
//       "service_id": serviceId,
//       "template_id": templateId,
//       "user_id": publicKey,
//       "template_params": templateParams
//     }),
//   );

//   return response;
// }

// Future dioSendMessage({required userSubject, required userMessage}) async {
//   Dio dio = Dio();
//   String serviceId = "service_miyucdq";
//   String templateId = "template_vgttlyp";
//   String publicKey = "o2FltIybD5CL9MhA1";
//   Map<String, dynamic> templateParams = {
//     'user_subject': userSubject,
//     'user_message': userMessage,
//   };

//   final response = await dio.post(
//     "https://api.emailjs.com/api/v1.0/email/send",
//     options: Options(
//       headers: {
//         "origin": "http://localhost",
//         "Content-Type": "application/json",
//       },
//     ),
//     data: json.encode({
//       "service_id": serviceId,
//       "template_id": templateId,
//       "user_id": publicKey,
//       "template_params": templateParams
//     }),
//   );
//   if (!kReleaseMode) {
//     // its debug mode so print app logs
//     dio.interceptors.add(PrettyDioLogger(
//       requestHeader: true,
//       requestBody: true,
//       responseHeader: true,
//     ));
//   }

//   return response.data;
// }
