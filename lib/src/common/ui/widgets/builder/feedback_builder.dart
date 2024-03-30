import 'package:feedback_plus/feedback_plus.dart';
import 'package:flutter/material.dart';
import 'package:innovestage/src/app/model/app_theme.dart';
import 'package:innovestage/src/common/ui/widgets/other/feedback_body.dart';
import 'package:innovestage/src/core/localization/localization.dart';

TransitionBuilder betterFeedbackBuilder({
  required AppTheme theme,
  required Locale locale,
}) =>
    (
      context,
      child,
    ) =>
        BetterFeedback(
          themeMode: theme.mode,
          localizationsDelegates: Localization.localizationDelegates,
          localeOverride: locale,
          theme: FeedbackThemeData(
            background: Colors.grey[800]!,
            feedbackSheetColor: theme.lightTheme.colorScheme.surface,
            activeFeedbackModeColor: theme.lightTheme.colorScheme.primary,
            themeData: theme.lightTheme,
            cardColor: theme.lightTheme.scaffoldBackgroundColor,
            bottomSheetDescriptionStyle:
                theme.lightTheme.textTheme.bodyMedium!.copyWith(
              color: Colors.grey[800],
            ),
            dragHandleColor: Colors.grey[400],
            inactiveColor: Colors.grey[700]!,
            textColor: Colors.grey[800]!,
          ),
          darkTheme: FeedbackThemeData(
            background: Colors.grey[800]!,
            feedbackSheetColor: theme.darkTheme.colorScheme.surface,
            activeFeedbackModeColor: theme.darkTheme.colorScheme.primary,
            themeData: theme.darkTheme,
            cardColor: theme.darkTheme.scaffoldBackgroundColor,
            bottomSheetDescriptionStyle:
                theme.lightTheme.textTheme.bodyMedium!.copyWith(
              color: Colors.grey[300],
            ),
            dragHandleColor: Colors.grey[400],
            inactiveColor: Colors.grey[600]!,
            textColor: Colors.grey[300]!,
          ),
          mode: FeedbackMode.navigate,
          feedbackBuilder: (context, extras, scrollController) =>
              simpleFeedbackBuilder(
            context,
            extras,
            scrollController,
            theme.computeTheme(),
          ),
          child: child ?? const SizedBox(),
        );
