import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service.g.dart';

class AuthService {
  final FirebaseAuth auth;

  Stream<User?> authStateChanges() => auth.authStateChanges();
  User? get currentUser => auth.currentUser;
  AuthService(this.auth);

  Future<void> singInWithGoogle() async {
    auth.signInWithProvider(GoogleAuthProvider());
  }

  Future<void> signOut() async {
    auth.signOut();
  }
}

@riverpod
Stream<User?> authStateChanges(AuthStateChangesRef ref) =>
    ref.watch(authServiceProvider).authStateChanges();

@riverpod
AuthService authService(AuthServiceRef ref) {
  return AuthService(FirebaseAuth.instance);
}

@riverpod
bool isAuthenticated(IsAuthenticatedRef ref) {
  return ref.watch(authServiceProvider).currentUser != null;
}
