import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/widgets/custom_button.dart';
import 'package:medico/features/profile/presentation/views/widgets/name_and_text_filed.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          NameAndTextField(
            title: 'Name',
            value: 'Ziad',

            keyboardType: TextInputType.name,
          ),
          NameAndTextField(
            title: 'Email',
            value: 'ziad@gmail.com',
            keyboardType: TextInputType.emailAddress,
          ),
          NameAndTextField(
            title: 'Phone',
            value: '01012345678',
            keyboardType: TextInputType.number,
          ),
          NameAndTextField(
            title: 'Gender',
            value: 'male',
            keyboardType: TextInputType.text,
          ),
          NameAndTextField(
            title: 'Password',
            value: '*******',
            keyboardType: TextInputType.text,
            obscureText: !isVisible,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              icon: isVisible
                  ? SvgPicture.asset(Assets.imagesVisible)
                  : SvgPicture.asset(Assets.imagesInVisible),
              color: Color(0xffC9CECF),
            ),
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: CustomButton(text: 'Save Changes', onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
