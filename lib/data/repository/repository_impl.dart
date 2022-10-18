// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cv_pdf/data/data_source/remote_data_source.dart';
import 'package:cv_pdf/data/network/error_handler.dart';
import 'package:cv_pdf/data/network/failure.dart';
import 'package:cv_pdf/data/network/network_info.dart';
import 'package:cv_pdf/data/network/requests.dart';
import 'package:cv_pdf/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  RepositoryImpl(
    this._remoteDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, String>> getMessage(MessageRequest sendMessage) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet , its safe to call API
      try {
        final response = await _remoteDataSource.message(sendMessage);
        if (response.statusCode == ResponseCode.success) {
          // success
          // return  either right
          // return data
          // save home response to cache
          // save response in cache (local data source)
          return Right(response.data);
        } else {
          // failure -- return business error
          // return either left
          return Left(
              Failure(response.statusCode!, response.statusMessage ?? ResponseMessage.unKnown));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}
