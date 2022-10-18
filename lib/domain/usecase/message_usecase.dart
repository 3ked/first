// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:cv_pdf/data/network/failure.dart';
import 'package:cv_pdf/data/network/requests.dart';
import 'package:cv_pdf/domain/repository/repository.dart';
import 'package:cv_pdf/domain/usecase/base_usecase.dart';

class MessageUseCase implements BaseUseCase<MessageUseCaseInput, String> {
  final Repository _repository;
  MessageUseCase(this._repository);
  @override
  Future<Either<Failure, String>> execute(MessageUseCaseInput input) async {
    return await _repository
        .getMessage(MessageRequest(userSubject: input.subject, userMessage: input.message));
  }
}

class MessageUseCaseInput {
  String subject;
  String message;
  MessageUseCaseInput({
    required this.subject,
    required this.message,
  });
}
