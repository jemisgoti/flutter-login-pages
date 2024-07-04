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

class LoginPage2 extends StatelessWidget {
  const LoginPage2({super.key});

  @override
  Widget build(BuildContext context) {
    var gradient = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0, 0.85, 1],
        colors: [Color(0xFF0575E6), Color(0xFF02298A), Color(0xFF021B79)]);
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          var size = constraints.biggest;

          var maxWidth =
              (size.width > 460 ? 460 : size.width) - mainMarginDouble;
          var wf = size.isTablet ? size.width * .5 : size.width * 0.6;
          bool showBox = (size.isSmallMobile || size.isMobile || size.isTablet);
          return Row(
            children: [
              if (size.isDesktop || size.isLargeDesktop)
                SizedBox(
                  width: wf,
                  height: size.height,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(gradient: gradient),
                          width: wf,
                          height: size.height,
                        ),
                      ),
                      Positioned(
                          width: 557,
                          height: 557,
                          left: -227,
                          bottom: -557 / 2,
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 1, color: const Color(0xFF0575E6))),
                          )),
                      Positioned(
                          width: 557,
                          height: 557,
                          left: -126,
                          bottom: (-557 / 2) - 26,
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 1, color: const Color(0xFF0575E6))),
                          )),
                      Positioned(
                          child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "GoFinance",
                              style: GoogleFonts.poppins(
                                  fontSize: 40,
                                  height: 60 / 40,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "The most popular peer to peer lending at SEA",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  height: 27 / 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            const Gap(20),
                            Container(
                              height: 37,
                              width: 135,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 21),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFF0575E6)),
                              child: Center(
                                child: Text(
                                  "Read More",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              Expanded(
                  child: AnimatedContainer(
                padding: const EdgeInsets.all(16),
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
                height: size.height,
                decoration: BoxDecoration(gradient: showBox ? gradient : null),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(showBox ? 16 : 0),
                      decoration: BoxDecoration(
                          color: showBox ? Colors.white : null,
                          borderRadius: BorderRadius.circular(16)),
                      child: LoginForm(
                        maxWidth: maxWidth,
                      ),
                    ),
                  ],
                ),
              )),
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Hello Again!",
            style: GoogleFonts.poppins(
                fontSize: 26,
                height: 39 / 26,
                color: const Color(0xFF333333),
                fontWeight: FontWeight.bold),
          ),
          Text(
            "Welcome Back",
            style: GoogleFonts.poppins(
                fontSize: 18,
                height: 27 / 18,
                color: const Color(0xFF333333),
                fontWeight: FontWeight.w500),
          ),
          const Gap(35),
          EmailInput(
            controller: emailController,
          ),
          const Gap(16),
          PasswordInput(
            controller: passwordController,
          ),
          const Gap(16),
          const PrimaryButton(
            title: "Login",
          ),
          const Gap(16),
          Center(
            child: Opacity(
              opacity: 0.7,
              child: Text(
                localizeData.forgotPassword,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  const EmailInput({
    required this.controller,
    super.key,
  });

  /// Controller for the input.
  final InputBoxController controller;

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 60,
      child: StreamBuilder<dynamic>(
        stream: controller.rebuildStream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          var activeColor = const Color(0xFF0575E6);
          var greyColor = const Color(0xFF333333).withOpacity(0.3);
          return DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              onChanged: (String value) {
                controller.removeError();
              },
              onTapOutside: (PointerDownEvent event) {
                FocusScope.of(context).unfocus();
              },
              onEditingComplete: () {
                FocusScope.of(context).nextFocus();
              },
              controller: controller,
              cursorColor: activeColor,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              enableInteractiveSelection: true,
              autovalidateMode: AutovalidateMode.disabled,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 24, vertical: (60 - 14) / 2),
                focusColor: activeColor,
                fillColor: activeColor,
                hintText: context.localizeData.emailAddress,
                hoverColor: activeColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: activeColor),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 8),
                  child: Icon(
                    Icons.email_outlined,
                    color: greyColor,
                    size: 20,
                  ),
                ),
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  color: greyColor,
                  fontWeight: FontWeight.w400,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: activeColor,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: greyColor,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                error: controller.hasError ? const SizedBox.shrink() : null,
                errorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.error),
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          );
        },
      ));
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    required this.controller,
    super.key,
  });

  /// Controller for the input.
  final InputBoxController controller;

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 60,
      child: StreamBuilder<dynamic>(
        stream: controller.rebuildStream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          var activeColor = const Color(0xFF0575E6);
          var greyColor = const Color(0xFF333333).withOpacity(0.3);
          return DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              onChanged: (String value) {
                controller.removeError();
              },
              onTapOutside: (PointerDownEvent event) {
                FocusScope.of(context).unfocus();
              },
              onEditingComplete: () {
                FocusScope.of(context).nextFocus();
              },
              obscureText: true,
              obscuringCharacter: "*",
              controller: controller,
              cursorColor: activeColor,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              enableInteractiveSelection: true,
              autovalidateMode: AutovalidateMode.disabled,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 24, vertical: (60 - 14) / 2),
                focusColor: activeColor,
                fillColor: activeColor,
                hintText: context.localizeData.password,
                hoverColor: activeColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: activeColor),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 8),
                  child: Icon(
                    Icons.lock,
                    color: greyColor,
                    size: 20,
                  ),
                ),
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  color: greyColor,
                  fontWeight: FontWeight.w400,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: activeColor,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: greyColor,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                error: controller.hasError ? const SizedBox.shrink() : null,
                errorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.error),
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          );
        },
      ));
}

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({super.key, required this.title});
  final String title;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool focused = false;
  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      onFocusChange: (value) {
        setState(() {
          focused = value;
        });
      },
      mouseCursor: SystemMouseCursors.click,
      onShowFocusHighlight: (value) {
        log(value.toString());
      },
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 21),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color(0xFF0575E6)),
        child: Center(
          child: Text(
            widget.title,
            style: GoogleFonts.poppins(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}
