import 'package:fpdart/fpdart.dart';
import 'package:blog_it/core/error/failure.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signupwithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> loginwithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
}
