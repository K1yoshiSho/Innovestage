import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:innovestage/src/app/router/router.dart';
import 'package:innovestage/src/common/utils/extensions/context_extension.dart';
import 'package:innovestage/src/common/utils/extensions/string_extension.dart';
import 'package:innovestage/src/common/utils/global_variables.dart';
import 'package:innovestage/src/feature/auth/ui/pages/registration/registration.dart';
import 'package:innovestage/src/feature/home/state/counter.dart';
import 'package:innovestage/src/feature/inspector/inspector_page.dart';
import 'package:innovestage/src/feature/settings/ui/settings.dart';

part 'view/home_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String name = "Home";
  static const String routePath = "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    fToast.init(navigatorKey.currentContext!);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.pushNamed(RegistrationPage.name);
    });
  }

  @override
  Widget build(BuildContext context) => HomeView(
        onSettingsPressed: () {
          context.pushNamed(SettingsPage.name);
        },
        onLoggerPressed: () {
          context.pushNamed(InspectorPage.name);
        },
      );
}
