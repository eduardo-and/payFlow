import 'package:flutter/material.dart';
import 'package:payflow/modules/login/login_controller.dart';
import 'package:payflow/modules/login/widgets/social_login_button.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ctrl = LoginController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: AppColors.background,
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Container(
                color: AppColors.primary,
                height: size.height * 0.36,
                width: size.width,
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 45,
                child: Image.asset(AppImages.person,
                    width: 208, height: size.height * 0.40),
              ),
              Positioned(
                top: size.height * 0.45,
                width: size.width,
                height: size.height * 0.55,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 55, top: 35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AppImages.logomini),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 35),
                        child: Text(
                          "Organize seus boletos em um só lugar",
                          style: AppTextStyles.titleHome,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SocialLoginButton(onTap: () {
                        ctrl.googleSignIn(context);
                      })
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
