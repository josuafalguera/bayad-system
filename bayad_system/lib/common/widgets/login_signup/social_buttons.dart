import 'package:bayad_system/utils/constants/colors.dart';
import 'package:bayad_system/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:bayad_system/utils/constants/image_strings.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: CustomColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: CustomSizes.iconMD,
              height: CustomSizes.iconMD,
              image: AssetImage(Images.googleLogo),
            ),
          ),
        ),
        const SizedBox(width: CustomSizes.spaceBetweenItems),
        Container(
          decoration: BoxDecoration(border: Border.all(color: CustomColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: CustomSizes.iconMD,
              height: CustomSizes.iconMD,
              image: AssetImage(Images.facebookLogo),
            ),
          ),
        ),
      ],
    );
  }
}