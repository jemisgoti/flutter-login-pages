import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Input box controller.
class InputBoxController extends TextEditingController {
  /// Initialize the controller.
  InputBoxController({
    super.text,
  });

  /// It will be true if the input box has an error.
  bool hasError = false;
  final StreamController<dynamic> _streamController =
      StreamController<dynamic>.broadcast();

  /// It will be true if the input box is readOnly.
  bool readOnly = false;

  /// Focus node of the input box.
  FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  /// Provide data when needed to rebuild.
  Stream<dynamic> get rebuildStream => _streamController.stream;

  /// It will set an error.
  void setError() {
    hasError = true;
    _streamController.sink.add(true);
  }

  /// It will remove an error.
  void removeError() {
    hasError = false;
    _streamController.sink.add(false);
  }

  /// It will set the input box as readOnly.
  void setReadOnly() {
    readOnly = true;
    _streamController.sink.add(true);
  }

  /// It will set the input box as editable.
  void removeReadOnly() {
    readOnly = false;
    _streamController.sink.add(false);
  }

  /// It will toggle the value of the readOnly in the controller.
  void toggleReadOnly() {
    if (readOnly) {
      removeReadOnly();
    } else {
      setReadOnly();
    }
  }

  /// Methods related to focus.
  bool get hasFocus => focusNode.hasFocus;

  /// Request focus for the field.
  void requestFocus([FocusNode? node]) => focusNode.requestFocus(node);

  /// It will check if the value of the controller is an email.
  bool get isEmail {
    const String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    final RegExp regExp = RegExp(p);

    return regExp.hasMatch(text);
  }

  /// Return date by parsing text to date.
  DateTime? get date => DateFormat('yyyy-MM-dd').parse(text);

  /// Calculate age by subtracting the birth year from the current year.
  int get age {
    final DateTime now = DateTime.now();
    final DateTime birthDate = date!;
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  /// It will notify the stream to update.
  void rebuild() {
    _streamController.sink.add(0);
  }
}

/// Input box for the input.
class AppTextField extends StatelessWidget {
  /// Initialize the widget.
  const AppTextField(
      {required this.controller,
      this.textInputAction,
      this.textInputType = TextInputType.text,
      this.prefixIcon,
      this.suffixIcon,
      this.placeHolder,
      this.primaryColor,
      super.key,
      this.maxLength,
      this.onTap,
      this.obscureText = false,
      this.obscuringCharacter = '•',
      this.minLines,
      this.maxLines,
      this.borderRadius = 24,
      this.backgroundColor,
      this.textColor,
      this.textTheme,
      this.focusBorder,
      this.enabledBorder,
      this.errorBorder,
      this.focusedErrorBorder});

  /// Controller for the input.
  final InputBoxController controller;

  /// [TextInputType] keyboardType.
  final TextInputType? textInputType;

  /// [TextInputAction] text input action.
  final TextInputAction? textInputAction;

  /// [Widget] prefix icon of the field.
  final Widget? prefixIcon;

  /// [Widget] suffix icon of the field.
  final Widget? suffixIcon;

  /// Text for the placeholder.
  final String? placeHolder;

  /// Primary color.
  final Color? primaryColor;

  /// Max length.
  final int? maxLength;

  /// Provide callback when the user taps on the text field.
  final VoidCallback? onTap;

  /// Pass true if you want to hide the text.
  final bool obscureText;

  /// Character for hiding text.
  final String obscuringCharacter;

  final int? minLines;
  final int? maxLines;
  final double borderRadius;

  /// Background color of the input box.
  final Color? backgroundColor;

  /// Text color inside the input box.
  final Color? textColor;

  /// Theme for the text inside the input box.
  final TextStyle? textTheme;

  /// Border for focus state.
  final InputBorder? focusBorder;

  /// Border for enabled state.
  final InputBorder? enabledBorder;

  /// Border for error state.
  final InputBorder? errorBorder;

  /// Border for focused error state.
  final InputBorder? focusedErrorBorder;

  @override
  Widget build(BuildContext context) => StreamBuilder<dynamic>(
        stream: controller.rebuildStream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          final Color activeColor =
              primaryColor ?? Theme.of(context).colorScheme.onSurface;

          return DecoratedBox(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              onTap: () => onTap,
              onChanged: (String value) {
                controller.removeError();
              },
              onTapOutside: (PointerDownEvent event) {
                FocusScope.of(context).unfocus();
              },
              obscureText: obscureText,
              obscuringCharacter: obscuringCharacter,
              controller: controller,
              cursorColor: activeColor,
              keyboardType: textInputType,
              textInputAction: textInputAction,
              maxLength: maxLength,
              maxLines: obscureText ? 1 : maxLines,
              minLines: minLines,
              enableInteractiveSelection: true,
              autovalidateMode: AutovalidateMode.disabled,
              style: textTheme ??
                  TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: textColor ?? activeColor,
                    height: 19 / 15,
                  ),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                focusColor: activeColor,
                fillColor: activeColor,
                hintText: placeHolder,
                hoverColor: activeColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: activeColor),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                prefixIconColor: activeColor,
                suffixIconColor: activeColor,
                hintStyle: textTheme ??
                    TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.onSurface,
                      height: 19 / 15,
                    ),
                focusedBorder: focusBorder ??
                    OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                enabledBorder: enabledBorder ??
                    OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                error: controller.hasError ? const SizedBox.shrink() : null,
                errorBorder: errorBorder ??
                    OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error),
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                focusedErrorBorder: focusedErrorBorder ??
                    OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
              ),
            ),
          );
        },
      );
}
