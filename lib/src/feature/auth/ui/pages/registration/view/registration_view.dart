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
            onPressed: () => context.pop(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  Assets.images.horizontalIcon.path,
                  width: 300,
                  fit: BoxFit.cover,
                ),
                const Gap(16),
                Text(
                  context.l10n.sign_up,
                  style: context.theme.textTheme.titleLarge?.copyWith(
                    fontSize: 46,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(4),
                Text(
                  context.l10n.sign_up_description,
                  style: context.theme.textTheme.labelLarge?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Gap(40),
                TextField(),
                // FilledTextfield(
                //   textController: null,
                //   hintText: "login",
                //   labelText: "",
                //   maxLines: 1,
                //   contentPadding: const EdgeInsets.only(
                //     top: 15,
                //     bottom: 15,
                //     left: 15,
                //     right: 15,
                //   ),
                //   prefixIcon: Padding(
                //     padding: const EdgeInsets.only(left: 12, right: 4),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Row(
                //           mainAxisSize: MainAxisSize.min,
                //           children: [
                //             Text(
                //               "istage.app",
                //               style: context.theme.textTheme.titleMedium
                //                   ?.copyWith(),
                //             ),
                //             Text(
                //               "/",
                //               style: context.theme.textTheme.titleMedium
                //                   ?.copyWith(fontFamily: "Roboto"),
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      );
}
