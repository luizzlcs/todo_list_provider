import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_laos/app/exception/auth_exception.dart';

import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  FirebaseAuth _firebaseAuth;

  UserRepositoryImpl({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<User?> register(String email, String password) async {
    try {
      final userCreadential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCreadential.user;
    } on FirebaseAuthException catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      //email-already-in-use
      if (e.code == 'email-already-exists') {
        final loginType = await _firebaseAuth.fetchSignInMethodsForEmail(email);
        if (loginType.contains('password')) {
          throw AuthException(
              message: 'E-mail já utilizado, por favor escolha outro e-mail');
        } else {
          throw AuthException(
              message:
                  'Você se cadastrou no TodoList pelo google, por favor utilize ele para entrar!!!');
        }
      } else {
        throw AuthException(message: e.message ?? 'Erro ao registar usuário');
      }
    }
  }
}
