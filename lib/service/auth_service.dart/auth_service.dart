import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service.g.dart';

@riverpod
AuthService authService(AuthServiceRef ref) {
  return AuthService(FirebaseAuth.instance);
}

@riverpod
Stream<User?> authStateChanges(AuthStateChangesRef ref) =>
    ref.watch(authServiceProvider).authStateChanges();

@riverpod
bool isAuthenticated(IsAuthenticatedRef ref) {
  return ref.watch(authServiceProvider).currentUser != null;
}

class AuthService {
  final FirebaseAuth auth;

  AuthService(this.auth);
  User? get currentUser => auth.currentUser;
  Stream<User?> authStateChanges() => auth.authStateChanges();

  Future<void> singInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await auth.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    auth.signOut();
  }

  Future<void> signInAnonymously() async {
    await auth.signInAnonymously();
  }
}
