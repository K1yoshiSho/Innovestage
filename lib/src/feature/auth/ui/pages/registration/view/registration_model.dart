part of '../registration.dart';

final class _RegistrationPageModel extends PageModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailController.dispose();
    loginController.dispose();
    passwordController.dispose();
  }
}
