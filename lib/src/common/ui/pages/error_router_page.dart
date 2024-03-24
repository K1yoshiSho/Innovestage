import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:innovestage/src/app/router/router.dart';
import 'package:innovestage/src/common/utils/extensions/context_extension.dart';
import 'package:innovestage/src/common/utils/global_variables.dart';
import 'package:innovestage/src/feature/home/ui/pages/home.dart';

part 'view/error_page_view.dart';

class RouterErrorPage extends StatelessWidget {
  final String error;
  const RouterErrorPage({required this.error, super.key});

  @override
  Widget build(BuildContext context) => _RouterErrorView(
        error: error,
        onGoHomePressed: () =>
            navigatorKey.currentContext?.goNamed(HomePage.name),
      );
}
