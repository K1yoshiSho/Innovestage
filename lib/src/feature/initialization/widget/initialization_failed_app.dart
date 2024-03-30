import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:innovestage/src/common/ui/widgets/expandable_text/expandable_text.dart';
import 'package:innovestage/src/common/utils/extensions/context_extension.dart';
import 'package:innovestage/src/common/utils/extensions/string_extension.dart';
import 'package:innovestage/src/common/utils/global_variables.dart';
import 'package:innovestage/src/core/localization/localization.dart';

/// InitializationFailedScreen widget
class InitializationFailedApp extends StatefulWidget {
  /// The error that caused the initialization to fail.
  final Object error;

  /// The stack trace of the error that caused the initialization to fail.
  final StackTrace stackTrace;

  /// The callback that will be called when the retry button is pressed.
  ///
  /// If null, the retry button will not be shown.
  final Future<void> Function()? retryInitialization;

  const InitializationFailedApp({
    required this.error,
    required this.stackTrace,
    this.retryInitialization,
    super.key,
  });

  @override
  State<InitializationFailedApp> createState() =>
      _InitializationFailedAppState();
}

class _InitializationFailedAppState extends State<InitializationFailedApp> {
  /// Whether the initialization is in progress.
  final _inProgress = ValueNotifier<bool>(false);

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _inProgress.dispose();
    super.dispose();
  }

  Future<void> _retryInitialization() async {
    _inProgress.value = true;
    await widget.retryInitialization!();
    _inProgress.value = false;
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        navigatorKey: navigatorKey,
        localizationsDelegates: Localization.localizationDelegates,
        supportedLocales: Localization.supportedLocales,
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Initialization failed',
              style: context.theme.textTheme.titleLarge?.copyWith(
                color: context.theme.colorScheme.error,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ExpandableText(
                  'Error type: ${widget.error}',
                  maxLines: 4,
                  style: context.theme.textTheme.bodyLarge?.copyWith(
                    color: context.theme.colorScheme.error,
                    fontWeight: FontWeight.w500,
                  ),
                  expandText:
                      navigatorKey.currentContext?.l10n.more.capitalize() ?? "",
                  collapseText:
                      navigatorKey.currentContext?.l10n.less.capitalize() ?? "",
                ),
                const Gap(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.retryInitialization != null)
                      ElevatedButton(
                        onPressed: _retryInitialization,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: context.theme.colorScheme.error,
                        ),
                        child: const Row(
                          children: [
                            Text(
                              'Retry',
                              style: TextStyle(color: Colors.white),
                            ),
                            Gap(8),
                            Icon(
                              Icons.refresh_rounded,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                const Gap(16),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.theme.colorScheme.error,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${widget.stackTrace}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 50,
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                          color: context.theme.colorScheme.error,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
