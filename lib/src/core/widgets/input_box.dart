import 'package:flutter/material.dart';
import 'package:flutter_login_pages/src/core/widgets/text_fields.dart';
import 'package:intl/intl.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({
    required this.controller,
    this.textInputAction,
    this.textInputType = TextInputType.emailAddress,
    this.prefixIcon,
    this.placeHolder,
    this.primaryColor,
    super.key,
    this.maxLength,
    this.onTap,
    this.height,
  });

  /// Controller for the input.
  final InputBoxController controller;

  /// [TextInputType] keyboardType.
  final TextInputType? textInputType;

  /// [TextInputAction] text input action.
  final TextInputAction? textInputAction;

  /// [Widget] prefix icon of the field.
  final Widget? prefixIcon;

  /// Text for the placeholder.
  final String? placeHolder;

  /// Primary color.
  final Color? primaryColor;

  /// Max length.
  final int? maxLength;

  /// Provide callback when the user taps on the text field.
  final VoidCallback? onTap;

  /// Height of the input field.
  final double? height;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height,
        child: AppTextField(
          controller: controller,
          placeHolder: placeHolder,
          key: key,
          maxLength: maxLength,
          onTap: onTap,
          prefixIcon: prefixIcon,
          primaryColor: primaryColor,
          borderRadius: 12,
          backgroundColor: const Color(0xFFF6FAFF),
          textTheme: const TextStyle(
            color: Color(0xFF8796AD),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Color(0xFFD3D7E3),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          textInputAction: textInputAction,
          textInputType: textInputType,
        ),
      );
}

class PasswordInput extends StatefulWidget {
  const PasswordInput({
    required this.controller,
    this.textInputAction,
    this.textInputType = TextInputType.text,
    this.prefixIcon,
    this.placeHolder,
    this.primaryColor,
    super.key,
    this.maxLength,
    this.onTap,
    this.height,
  });

  /// Controller for the input.
  final InputBoxController controller;

  /// [TextInputType] keyboardType.
  final TextInputType? textInputType;

  /// [TextInputAction] text input action.
  final TextInputAction? textInputAction;

  /// [Widget] prefix icon of the field.
  final Widget? prefixIcon;

  /// Text for the placeholder.
  final String? placeHolder;

  /// Primary color.
  final Color? primaryColor;

  /// Max length.
  final int? maxLength;

  /// Provide callback when the user taps on the text field.
  final VoidCallback? onTap;

  /// Height of the input field.
  final double? height;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _hideText = true;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: widget.height,
        child: AppTextField(
          controller: widget.controller,
          placeHolder: widget.placeHolder,
          key: widget.key,
          maxLength: widget.maxLength,
          onTap: widget.onTap,
          obscureText: _hideText,
          prefixIcon: widget.prefixIcon,
          primaryColor: widget.primaryColor,
          borderRadius: 12,
          backgroundColor: const Color(0xFFF6FAFF),
          textTheme: const TextStyle(
            color: Color(0xFF8796AD),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Color(0xFFD3D7E3),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              _hideText = !_hideText;
              setState(() {});
            },
            child: Icon(
              _hideText ? Icons.visibility_off : Icons.visibility,
            ),
          ),
          textInputAction: widget.textInputAction,
          textInputType: widget.textInputType,
        ),
      );
}

class DateInput extends StatefulWidget {
  const DateInput({
    required this.controller,
    required this.firstDate,
    required this.lastDate,
    this.textInputAction,
    this.textInputType = TextInputType.text,
    this.prefixIcon,
    this.placeHolder,
    this.primaryColor,
    super.key,
    this.maxLength,
    this.onTap,
    this.currentDate,
    this.height,
  });

  /// Controller for the input.
  final InputBoxController controller;

  /// [TextInputType] keyboardType.
  final TextInputType? textInputType;

  /// [TextInputAction] text input action.
  final TextInputAction? textInputAction;

  /// [Widget] prefix icon of the field.
  final Widget? prefixIcon;

  /// Text for the placeholder.
  final String? placeHolder;

  /// Primary color.
  final Color? primaryColor;

  /// Max length.
  final int? maxLength;

  /// Provide callback when the user taps on the text field.
  final VoidCallback? onTap;

  /// First date.
  final DateTime firstDate;

  /// Last date.
  final DateTime lastDate;

  /// Current date.
  final DateTime? currentDate;

  /// Height of the input field.
  final double? height;

  @override
  State<DateInput> createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  DateTime? dateTime;

  @override
  void initState() {
    dateTime = widget.currentDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          showDatePicker(
            context: context,
            firstDate: widget.firstDate,
            lastDate: widget.lastDate,
            currentDate: dateTime,
          ).then((DateTime? value) {
            widget.controller.removeError();
            if (value != null) {
              dateTime = value;
              widget.controller.text =
                  DateFormat('yyyy-MM-dd').format(dateTime!);
              setState(() {});
            }
          });
        },
        child: Container(
          height: widget.height,
          decoration: BoxDecoration(
            color: const Color(0xFFF7F8F9),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: widget.controller.hasError
                  ? Theme.of(context).colorScheme.error
                  : const Color(0xFFE8ECF4),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Text(
            widget.controller.text.isEmpty
                ? widget.placeHolder!
                : widget.controller.text,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Color(0xff8391a1),
              height: 19 / 15,
            ),
          ),
        ),
      );
}
