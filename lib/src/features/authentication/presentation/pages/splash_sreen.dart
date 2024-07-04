import 'package:flutter/material.dart';
import 'package:flutter_login_pages/src/core/routes/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed((Durations.long1))
        .then((value) => AppRouter.go(AppRoutes.login2));
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
