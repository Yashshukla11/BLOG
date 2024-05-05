import 'package:blog_it/core/error/failure.dart';
import 'package:blog_it/features/auth/domain/repository/auth_repositary.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/exception.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRepository remoteDataSource;

  const AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, String>> loginwithEmailPassword(
      {required String name, required String email, required String password}) {
    // TODO: implement loginwithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signupwithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userId = await remoteDataSource.signupwithEmailPassword(
        name: name,
        email: email,
        password: password,
      );
      return right(userId as String);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
