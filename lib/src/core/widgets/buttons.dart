import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Primary button of the app
class PrimaryButton extends StatelessWidget {
  /// Initialize the widget
  const PrimaryButton({
    super.key,
    this.onTap,
    this.controller,
    this.title = '',
    this.color,
    this.textColor,
    this.height = 54,
    this.radius = 24,
    this.width,
    this.icon,
    this.iconSize,
    this.iconGap = 8.0,
  });

  final double radius;

  /// Provide callback when user taps on the button
  final VoidCallback? onTap;

  /// Controller for the button
  final ButtonController? controller;

  /// Title of the button
  final String title;

  final Color? color;
  final Color? textColor;
  final double height;
  final double? width;

  /// Icon for the button
  final Widget? icon;

  /// Size of the icon
  final double? iconSize;

  /// Gap between the icon and the title
  final double iconGap;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: const Offset(0, 40),
              blurRadius: 40,
              color: const Color(0xFF000000).withOpacity(0.1),
            ),
          ],
        ),
        child: MaterialButton(
          height: height,
          mouseCursor: SystemMouseCursors.click,
          minWidth: width ?? MediaQuery.of(context).size.width,
          color: color ?? Theme.of(context).colorScheme.onSurface,
          splashColor: color ?? Theme.of(context).colorScheme.onSurface,
          onPressed: onTap,
          elevation: 0,
          enableFeedback: false,
          focusElevation: 0,
          hoverElevation: 0,
          clipBehavior: Clip.hardEdge,
          focusColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          child: controller != null
              ? ValueListenableBuilder<bool>(
                  valueListenable: controller!.isLoading,
                  builder: (
                    BuildContext context,
                    bool isLoading,
                    Widget? child,
                  ) =>
                      isLoading
                          ? SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Theme.of(context).colorScheme.surface,
                                strokeWidth: 2.5,
                              ),
                            )
                          : _buildContent(context),
                )
              : _buildContent(context),
        ),
      );

  Widget _buildContent(BuildContext context) {
    final textWidget = Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: textColor ?? Theme.of(context).colorScheme.surface,
        height: 28 / 24,
      ),
      textAlign: TextAlign.center,
    );

    if (icon == null) {
      return textWidget;
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconTheme(
            data: IconThemeData(
              size: iconSize,
              color: textColor ?? Theme.of(context).colorScheme.surface,
            ),
            child: icon!,
          ),
          SizedBox(width: iconGap),
          textWidget,
        ],
      );
    }
  }
}

///primary button of the app
class SecondaryButton extends StatelessWidget {
  ///initialize the widget
  const SecondaryButton(
      {super.key,
      this.onTap,
      this.controller,
      this.title = '',
      this.color,
      this.icon,
      this.iconSize = 24,
      this.width,
      this.radius = 24,
      this.height = 58,
      this.fontSize = 16,
      this.iconGap = 8});

  ///provide callback when user tap on the button
  final VoidCallback? onTap;

  ///controller for then button
  final ButtonController? controller;

  ///title of button
  final String title;

  ///color of the button
  final Color? color;

  ///icon of the Button
  final Widget? icon;
  final double? iconSize;
  final double iconGap;
  final double? width;
  final double radius;
  final double height;
  final double fontSize;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            height: height,
            width: width ?? MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(
                color: color ?? Theme.of(context).colorScheme.primary,
              ),
              borderRadius: BorderRadius.circular(radius),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  offset: const Offset(0, 40),
                  blurRadius: 40,
                  color: const Color(0xFF000000).withOpacity(0.1),
                ),
              ],
            ),
            child: Center(
              child: ValueListenableBuilder<bool>(
                valueListenable: controller?.isLoading ?? ValueNotifier(false),
                builder: (
                  BuildContext context,
                  bool isLoading,
                  Widget? child,
                ) =>
                    isLoading
                        ? SizedBox(
                            width: iconSize,
                            height: iconSize,
                            child: CircularProgressIndicator(
                              color: color ??
                                  Theme.of(context).colorScheme.primary,
                              strokeWidth: 2.5,
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              if (icon != null) ...[
                                SizedBox(
                                  width: iconSize,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      icon!,
                                    ],
                                  ),
                                ),
                                SizedBox(width: iconGap),
                              ],
                              Flexible(
                                child: Center(
                                  child: Text(
                                    title,
                                    style: GoogleFonts.inter(
                                      fontSize: fontSize,
                                      fontWeight: FontWeight.w600,
                                      color: color ??
                                          Theme.of(context).colorScheme.primary,
                                      height: 20 / 16,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
              ),
            ),
          ),
        ),
      );
}

///controller for the button
class ButtonController {
  ///loading notifier
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  ///set loading as true
  void setLoading() {
    isLoading.value = true;
  }

  ///reset loading to false
  void resetLoading() {
    isLoading.value = false;
  }

  ///toggle value of the loading
  void toggleLoading() {
    isLoading.value = !isLoading.value;
  }

  ///dispose the value
  void dispose() {
    isLoading.dispose();
  }
}
