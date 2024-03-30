import 'package:flutter/material.dart';
import 'package:innovestage/src/app/model/app_theme.dart';
import 'package:innovestage/src/feature/initialization/logic/base_config.dart';
import 'package:innovestage/src/feature/settings/state/app_config.dart';
import 'package:performance/performance.dart';

class PerformanceOverlayBuilder extends StatelessWidget {
  final BaseConfig config;
  final AppConfigsState appConfigState;
  final AppTheme theme;
  final Widget child;
  const PerformanceOverlayBuilder({
    required this.config,
    required this.appConfigState,
    required this.theme,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Directionality(
        textDirection: TextDirection.ltr,
        child: CustomPerformanceOverlay(
          enabled: config.isDev && appConfigState.isPerformanceTrackingEnabled,
          alignment: Alignment.topCenter,
          backgroundColor: theme.computeTheme().colorScheme.background,
          child: child,
        ),
      );
}
