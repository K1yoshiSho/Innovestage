import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:innovestage/src/app/router/router.dart';
import 'package:innovestage/src/common/services/page_model.dart';
import 'package:innovestage/src/common/utils/extensions/context_extension.dart';
import 'package:innovestage/src/core/assets/generated/assets.gen.dart';
import 'package:innovestage/src/core/assets/icons/rounded_corners.dart';

part 'view/registration_model.dart';
part 'view/registration_view.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  static const String name = "Registration";
  static const String routePath = "registration";

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late final _RegistrationPageModel _model;

  @override
  void initState() {
    _model = createModel(context, () => _RegistrationPageModel());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _model.dispose();
  }

  @override
  Widget build(BuildContext context) => _RegistrationView(
        formKey: _model.formKey,
        onRegisterTap: (email, login, password) {},
      );
}
