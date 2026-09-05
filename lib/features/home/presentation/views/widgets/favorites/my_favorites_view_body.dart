import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/doctors/domain/entities/doctor_entity.dart';
import 'package:medico/features/home/presentation/views/widgets/favorites/favorite_doctors_content.dart';

// Pure UI: renders whatever state MyFavoritesViewBodyBlocBuilder resolved.
class MyFavoritesViewBody extends StatelessWidget {
  const MyFavoritesViewBody({
    super.key,
    required this.isLoading,
    required this.errorMessage,
    required this.favoriteDoctors,
    required this.isClearAllChecked,
    required this.onClearAllTap,
  });

  final bool isLoading;
  final String? errorMessage;
  final List<DoctorEntity>? favoriteDoctors;
  final bool isClearAllChecked;
  final VoidCallback onClearAllTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: kHorizontalPadding,
            right: kHorizontalPadding,
            top: 24,
            bottom: 16,
          ),
          child: Row(
            children: [
              Text(
                'Favorite Doctors',
                style: TextStyles.font18Bold.copyWith(color: AppColor.black),
              ),
              Spacer(),
              GestureDetector(
                onTap: onClearAllTap,
                child: SvgPicture.asset(
                  isClearAllChecked
                      ? Assets.imagesSelectedCheckBox
                      : Assets.imagesNotSelectedCheckBox,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: FavoriteDoctorsContent(
            isLoading: isLoading,
            errorMessage: errorMessage,
            favoriteDoctors: favoriteDoctors,
          ),
        ),
      ],
    );
  }
}
