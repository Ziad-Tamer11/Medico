import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/payment/domain/entities/payment_method.dart';

class PaymentMethodTile extends StatelessWidget {
  const PaymentMethodTile({
    super.key,
    required this.method,
    required this.isSelected,
    required this.onTap,
  });

  final PaymentMethod method;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isActive = isSelected && method.isAvailable;
    return Opacity(
      opacity: method.isAvailable ? 1 : 0.45,
      child: GestureDetector(
        onTap: method.isAvailable ? onTap : null,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: ShapeDecoration(
            color: isActive ? AppColor.veryLightGrey : AppColor.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: isActive ? 1.4 : 1,
                color: isActive ? AppColor.primary : AppColor.blueGrey,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: Row(
            children: [
              _RadioCircle(isActive: isActive),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  method.isAvailable
                      ? method.label
                      : '${method.label} (Coming soon)',
                  style: TextStyles.font14SemiBold,
                ),
              ),
              SvgPicture.asset(method.iconAsset, width: 36, height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _RadioCircle extends StatelessWidget {
  const _RadioCircle({required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? AppColor.primary : Colors.transparent,
        border: Border.all(
          color: isActive ? AppColor.primary : AppColor.grey,
          width: 1.4,
        ),
      ),
      child: isActive
          ? const Icon(Icons.check, size: 14, color: AppColor.white)
          : null,
    );
  }
}
