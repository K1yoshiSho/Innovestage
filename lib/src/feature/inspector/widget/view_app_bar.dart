// ignore_for_file: implementation_imports, inference_failure_on_function_return_type, avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:innovestage/src/common/utils/extensions/context_extension.dart';
import 'package:talker_flutter/src/controller/controller.dart';
import 'package:talker_flutter/talker_flutter.dart';

class TalkerAppBar extends StatelessWidget {
  const TalkerAppBar({
    required this.title,
    required this.leading,
    required this.talker,
    required this.talkerTheme,
    required this.titlesController,
    required this.controller,
    required this.titles,
    required this.uniqTitles,
    required this.onMonitorTap,
    required this.onSettingsTap,
    required this.onActionsTap,
    required this.onToggleTitle,
    required this.focusNode,
    super.key,
  });

  final String? title;
  final Widget? leading;

  final Talker talker;
  final TalkerScreenTheme talkerTheme;
  final GroupButtonController titlesController;
  final TalkerViewController controller;

  final List<String?> titles;
  final List<String?> uniqTitles;

  final VoidCallback onMonitorTap;
  final VoidCallback onSettingsTap;
  final VoidCallback onActionsTap;

  final FocusNode focusNode;

  final Function(String title, bool selected) onToggleTitle;

  @override
  Widget build(BuildContext context) => SliverAppBar(
        backgroundColor: talkerTheme.backgroundColor,
        elevation: 0,
        pinned: true,
        floating: true,
        expandedHeight: 174,
        collapsedHeight: 60,
        toolbarHeight: 60,
        leading: leading,
        iconTheme: IconThemeData(color: talkerTheme.textColor),
        actions: [
          UnconstrainedBox(
            child: _MonitorButton(
              talker: talker,
              onPressed: onMonitorTap,
              talkerTheme: talkerTheme,
            ),
          ),
          UnconstrainedBox(
            child: IconButton(
              onPressed: onSettingsTap,
              icon: Icon(
                Icons.settings_rounded,
                color: talkerTheme.textColor,
              ),
            ),
          ),
          UnconstrainedBox(
            child: IconButton(
              onPressed: onActionsTap,
              icon: Icon(
                Icons.menu_rounded,
                color: talkerTheme.textColor,
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
        title: title != null
            ? Text(
                title!,
                style: TextStyle(
                  color: talkerTheme.textColor,
                ),
              )
            : null,
        flexibleSpace: FlexibleSpaceBar(
          background: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      scrollDirection: Axis.horizontal,
                      children: [
                        GroupButton(
                          controller: titlesController,
                          isRadio: false,
                          buttonBuilder: (selected, value, context) {
                            final count =
                                titles.where((e) => e == value).length;
                            return Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: selected
                                      ? context.isDark
                                          ? context.theme.colorScheme
                                              .primaryContainer
                                          : context.theme.colorScheme.primary
                                      : context.colors.border,
                                ),
                                color: selected
                                    ? context.isDark
                                        ? context
                                            .theme.colorScheme.primaryContainer
                                        : context.theme.colorScheme.primary
                                    : talkerTheme.cardColor,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    '$count  $value',
                                    style: context.theme.textTheme.bodyMedium!
                                        .copyWith(
                                      color: selected
                                          ? Colors.white
                                          : talkerTheme.textColor,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          onSelected: (_, i, selected) =>
                              _onToggle(uniqTitles[i], selected),
                          buttons: uniqTitles,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  _SearchTextField(
                    controller: controller,
                    focusNode: focusNode,
                    talkerTheme: talkerTheme,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  void _onToggle(String? title, bool selected) {
    if (title == null) return;
    onToggleTitle(title, selected);
  }
}

class _SearchTextField extends StatelessWidget {
  const _SearchTextField({
    required this.talkerTheme,
    required this.controller,
    required this.focusNode,
  });

  final TalkerScreenTheme talkerTheme;
  final TalkerViewController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        style: theme.textTheme.bodyLarge!.copyWith(
          color: talkerTheme.textColor,
          fontSize: 14,
        ),
        cursorColor: context.isDark
            ? context.theme.colorScheme.primaryContainer
            : context.theme.colorScheme.primary,
        focusNode: focusNode,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onTap: () {
          controller.update();
        },
        onChanged: controller.updateFilterSearchQuery,
        decoration: InputDecoration(
          fillColor: theme.cardColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.isDark
                  ? context.theme.colorScheme.primaryContainer
                  : context.theme.colorScheme.primary,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: context.colors.border),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: context.colors.border),
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          prefixIcon: Icon(
            Icons.search,
            color: focusNode == FocusScope.of(context).focusedChild
                ? context.isDark
                    ? context.theme.colorScheme.primaryContainer
                    : context.theme.colorScheme.primary
                : context.colors.border,
            size: 20,
          ),
          hintText: context.l10n.search,
          hintStyle: theme.textTheme.bodyLarge!.copyWith(
            color: talkerTheme.textColor,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class _MonitorButton extends StatelessWidget {
  const _MonitorButton({
    required this.talker,
    required this.onPressed,
    required this.talkerTheme,
  });

  final Talker talker;
  final TalkerScreenTheme talkerTheme;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => TalkerBuilder(
        talker: talker,
        builder: (context, data) {
          final haveErrors = data
              .where((e) => e is TalkerError || e is TalkerException)
              .isNotEmpty;
          return Stack(
            children: [
              Center(
                child: IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    Icons.monitor_heart_outlined,
                    color: talkerTheme.textColor,
                  ),
                ),
              ),
              if (haveErrors)
                Positioned(
                  right: 6,
                  top: 8,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    height: 7,
                    width: 7,
                  ),
                ),
            ],
          );
        },
      );
}
