import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class AccountInformationItem extends StatelessWidget {
  const AccountInformationItem({
    super.key,
    required this.icon,
    required this.title,
    this.value,
    this.onTap,
    this.textColor = AppColor.black,
  });
  final Widget icon;
  final String title;
  final String? value;
  final void Function()? onTap;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          icon,
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyles.font18Medium.copyWith(color: textColor),
          ),
          Spacer(),
          value != null
              ? Text(value!, style: TextStyles.font16Bold)
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
