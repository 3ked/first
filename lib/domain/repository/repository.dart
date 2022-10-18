import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, String>> getMessage(MessageRequest sendMessage);
}
