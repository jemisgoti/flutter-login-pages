import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

extension BuildContextExtension on BuildContext {
  AppLocalizations get localizeData => AppLocalizations.of(this)!;
}
