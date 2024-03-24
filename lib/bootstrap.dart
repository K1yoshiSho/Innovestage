import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:innovestage/src/app/logic/app_runner.dart';
import 'package:innovestage/src/common/utils/global_variables.dart';
import 'package:innovestage/src/common/utils/talker_logger.dart';
import 'package:innovestage/src/feature/initialization/logic/initialization_processor.dart';
import 'package:innovestage/src/feature/initialization/model/dependencies.dart';
import 'package:innovestage/src/feature/initialization/model/initialization_hook.dart';
import 'package:innovestage/src/feature/initialization/widget/initialization_failed_app.dart';

Future<void> bootstrap() async {
  InitializationHook? hook;
  hook = InitializationHook.setup(
    onInitializing: _onInitializing,
    onInitialized: _onInitialized,
    onError: (step, error, stackTrace) {
      _onErrorFactory(
        step,
        error,
        stackTrace,
        hook!,
      );
    },
    onInit: _onInit,
  );

  await runZonedGuarded(
    () => AppRunner().initializeAndRun(
      hook!,
    ),
    (error, stackTrace) {
      talker.handle(error, stackTrace);
    },
  );
}

void _onInitializing(InitializationStepInfo info) {
  final percentage = ((info.step / info.stepsCount) * 100).toInt();
  talker.info(
    '🌀 Inited ${info.stepName} in ${info.msSpent} ms | '
    'Progress: $percentage%',
  );
}

void _onInitialized(InitializationResult result) {
  talker
      .logTyped(GoodLog('🎉 Initialization completed in ${result.msSpent} ms'));
}

void _onErrorFactory(
  int step,
  Object error,
  StackTrace stackTrace,
  InitializationHook hook,
) {
  talker.error('❗️ Initialization failed on step $step with error: $error');
  FlutterNativeSplash.remove();
  runApp(
    InitializationFailedApp(
      error: error,
      stackTrace: stackTrace,
      retryInitialization: () => AppRunner().initializeAndRun(hook),
    ),
  );
}

void _onInit() {
  talker.info('🚀 Initialization started');
}
