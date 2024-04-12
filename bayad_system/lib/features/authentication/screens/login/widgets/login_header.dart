import 'package:bayad_system/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:bayad_system/utils/constants/image_strings.dart';
import 'package:bayad_system/utils/constants/text_strings.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(dark ? Images.appLogo : Images.appLogo),
        ),
        Text("${Texts.loginTitle}, ${Texts.loginTitleSpan}!",
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: CustomSizes.sm),
        Text(Texts.loginSubtitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
