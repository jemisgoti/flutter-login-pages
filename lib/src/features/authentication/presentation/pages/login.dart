import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_login_pages/src/core/extensions/context_extension.dart';
import 'package:flutter_login_pages/src/core/extensions/size_extension.dart';
import 'package:flutter_login_pages/src/core/theme/assets_path.dart';
import 'package:flutter_login_pages/src/core/theme/dimensions.dart';
import 'package:flutter_login_pages/src/core/widgets/buttons.dart';
import 'package:flutter_login_pages/src/core/widgets/input_box.dart';
import 'package:flutter_login_pages/src/core/widgets/text_fields.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          var size = constraints.biggest;
     
          var maxWidth =
              (size.width > 460 ? 460 : size.width) - mainMarginDouble;
          var wf = size.isTablet ? size.width * .4 : size.width * 0.5;

          return Row(
            children: [
              Expanded(
                  child: Center(
                child: LoginForm(
                  maxWidth: maxWidth,
                ),
              )),
              if (size.isDesktop || size.isLargeDesktop)
                SizedBox(
                  width: wf,
                  height: size.height,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: mainMargin, bottom: mainMargin, top: mainMargin),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(mainMargin),
                      child: Image.asset(
                        ImageAssetPath.loginArt2,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.maxWidth});
  final double maxWidth;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  InputBoxController emailController = InputBoxController();
  InputBoxController passwordController = InputBoxController();
  ButtonController loginController = ButtonController();
  @override
  Widget build(BuildContext context) {
    var localizeData = context.localizeData;
    return Container(
      constraints: BoxConstraints(maxWidth: widget.maxWidth),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: localizeData.welcomeBack,
                      style: GoogleFonts.ubuntu(
                        color: const Color(0xFF0B1420),
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 36 * 0.01,
                      ),
                    ),
                    TextSpan(
                      text: ' 👋',
                      style: GoogleFonts.ubuntu(
                        color: const Color(0xFF0B1420),
                        fontSize: 36,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.36,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const Gap(28),
          Text(
            localizeData.logInWelcomeMessage,
            style: GoogleFonts.ubuntu(
              color: const Color(0xFF313957),
              fontSize: 20,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.20,
            ),
          ),
          const Gap(48),
          Text(
            localizeData.email,
            style: const TextStyle(
              color: Color(0xFF0B1420),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.16,
            ),
          ),
          EmailInput(
            controller: emailController,
            placeHolder: 'example@email.com',
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.emailAddress,
          ),
          const Gap(24),
          Text(
            localizeData.password,
            style: const TextStyle(
              color: Color(0xFF0B1420),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.16,
            ),
          ),
          PasswordInput(
            controller: emailController,
            placeHolder: 'example@email.com',
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.emailAddress,
          ),
          Text(
            localizeData.forgotPassword,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF1D4AE8),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.16,
            ),
          ),
          const Gap(24),
          PrimaryButton(
            controller: loginController,
            color: const Color(0xFF162D3A),
            title: localizeData.signIn,
            textColor: Colors.white,
            height: 52,
            onTap: () {},
            radius: 12,
          ),
          const Gap(48),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 388,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Divider(
                        height: 1,
                        color: Color(0xFFCEDFE2),
                      ),
                    ),
                    const Gap(16),
                    Text(
                      localizeData.or,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF294956),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.16,
                      ),
                    ),
                    const Gap(16),
                    const Expanded(
                      child: Divider(
                        height: 1,
                        color: Color(0xFFCEDFE2),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(24),
              PrimaryButton(
                controller: loginController,
                color: const Color(0xFF162D3A),
                title: localizeData.signInWithGoogle,
                textColor: Colors.white,
                height: 52,
                icon: Image.asset(
                  ImageAssetPath.google,
                  width: 24,
                  height: 24,
                ),
                iconSize: 24,
                iconGap: 24,
                onTap: () {},
                radius: 12,
              ),
              const Gap(16),
              PrimaryButton(
                controller: loginController,
                color: const Color(0xFF162D3A),
                title: localizeData.signInWithFacebook,
                textColor: Colors.white,
                height: 52,
                icon: Image.asset(
                  ImageAssetPath.facebook,
                  width: 24,
                  height: 24,
                ),
                iconSize: 24,
                iconGap: 24,
                onTap: () {},
                radius: 12,
              ),
            ],
          ),
          const Gap(48),
          SizedBox(
            width: 382,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: localizeData.donTYouHaveAnAccount,
                    style: const TextStyle(
                      color: Color(0xFF313957),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.18,
                    ),
                  ),
                  TextSpan(
                    text: localizeData.signUp,
                    style: const TextStyle(
                      color: Color(0xFF1D4AE8),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.18,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Gap(48),
          SizedBox(
            width: 382,
            child: Text(
              '© 2023${localizeData.allRightsReserved}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF959CB5),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
