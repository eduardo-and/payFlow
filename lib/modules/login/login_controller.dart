import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/shared/auth/auth_controller.dart';
import 'package:payflow/shared/models/user_model.dart';

class LoginController {
  Future<void> googleSignIn(BuildContext context) async {
    AuthController auth = AuthController();

    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      final user =
          UserModel(name: response!.displayName!, photoUrl: response.photoUrl);
      auth.setUser(context, user);
      print(response);
    } catch (error) {
      auth.setUser(context, null);
    }
  }
}
