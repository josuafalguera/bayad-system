import 'package:bayad_system/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:bayad_system/utils/constants/sizes.dart';
import 'package:bayad_system/utils/constants/text_strings.dart';

class TermsAndConditionCheckbox extends StatelessWidget {
  const TermsAndConditionCheckbox({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(value: true, onChanged: (value) {})),
        const SizedBox(width: CustomSizes.spaceBetweenItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: '${Texts.iAgreeTo} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: Texts.privacyPolicy,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark
                            ? CustomColors.white
                            : CustomColors.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: dark
                            ? CustomColors.white
                            : CustomColors.primaryColor,
                      )),
              TextSpan(
                  text: ' ${Texts.and} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: Texts.termsOfUse,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark
                            ? CustomColors.white
                            : CustomColors.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: dark
                            ? CustomColors.white
                            : CustomColors.primaryColor,
                      )),
            ],
          ),
        ),
      ],
    );
  }
}
