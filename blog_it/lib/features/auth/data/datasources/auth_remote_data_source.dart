import 'package:blog_it/core/error/exception.dart';
import 'package:blog_it/core/secrets/app_secrets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final supabaseClient =
          SupabaseClient(AppSecrets.supabaseURL, AppSecrets.anonkey);
      final response = await supabaseClient.auth
          .signUp(password: password, email: email, data: {
        'name': name,
      });
      if (response.user == null) {
        throw const ServerException('user is null!');
      }
      return response.user!.id;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
