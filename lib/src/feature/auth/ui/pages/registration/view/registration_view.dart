part of '../registration.dart';

class _RegistrationView extends StatelessWidget {
  final Key formKey;
  final Function(String login, String email, String password) onRegisterTap;
  const _RegistrationView({required this.onRegisterTap, required this.formKey});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(RoundedCorners.outlined_angle_small_left),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(context.l10n.sign_up),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: formKey,
            child: const Column(
              children: [
                OutlinedTextfield(
                  textController: null,
                  hintText: "login",
                  labelText: "",
                  maxLines: 1,
                  contentPadding:
                      EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 12, right: 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "istage.app/",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
