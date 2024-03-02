import 'package:bayad_system/utils/constants/colors.dart';
import 'package:bayad_system/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:bayad_system/utils/constants/image_strings.dart';
import 'package:bayad_system/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/styles/spacing_styles.dart';
import '../../../utils/helpers/helper_functions.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: CustomSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //* Logo, Title, and Subtitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Image(
                    height: 150,
                    image: AssetImage(dark ? Images.appLogo : Images.appLogo),
                  ),
                  Text('Welcome Back Transaqtor!', style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: CustomSizes.sm),
                  Text('Please login to continue.', style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),

              //* Form 
              Form(child: Padding(
                padding: const EdgeInsets.symmetric(vertical: CustomSizes.spaceBetweenSections),
                child: Column(
                    children: [
                      //* Email
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.direct_right), 
                          labelText: Texts.email
                        )
                      ),
                      const SizedBox(height: CustomSizes.spaceBetweenInputFields),
                
                      //* Password
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.password_check), 
                          labelText: Texts.password, 
                          suffixIcon: Icon(Iconsax.eye_slash),
                        )
                      ),
                      const SizedBox(height: CustomSizes.spaceBetweenInputFields/2),
                
                      //* Remember me and Forget password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //* Remember me
                          Row(
                            children: [
                              Checkbox(value: true, onChanged: (value) {}),
                              const Text(Texts.rememberMe),
                            ],
                          ),
                
                          //* Forget password
                            TextButton(onPressed: (){}, child: const Text(Texts.forgetPassword)),
                        ],
                      ),
                      const SizedBox(height: CustomSizes.spaceBetweenSections),
                
                      //* Sign in button
                      SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text(Texts.signIn))),
                      const SizedBox(height: CustomSizes.spaceBetweenItems),
                
                      //* Create account button
                      SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () {}, child: const Text(Texts.createAccount))),
                      const SizedBox(height: CustomSizes.spaceBetweenItems),
                    ],
                  ),
                )
              ),

              //* Divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: Divider(color: dark ? CustomColors.darkGrey : CustomColors.grey, thickness: 0.5, indent: 60, endIndent: 5)),
                  Text(Texts.orSignInWith, style: Theme.of(context).textTheme.labelMedium),
                  Flexible(child: Divider(color: dark ? CustomColors.darkGrey : CustomColors.grey, thickness: 0.5, indent: 5, endIndent: 60)),
                ],
              ),
              
              const SizedBox(height: CustomSizes.spaceBetweenSections),

              //* Footer
              Row(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}