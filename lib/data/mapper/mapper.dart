import '../../app/constants.dart';
import '../../domain/models/models.dart';
import '../response/responses.dart';
import '../../app/extension.dart';

extension MessageResponseMapper on MessageResponse? {
  SendMessage toDomainMessage() {
    return SendMessage(
      this?.userSubject.orEmpty() ?? Constants.empty,
      this?.userMessage.orEmpty() ?? Constants.empty,
    );
  }
}
