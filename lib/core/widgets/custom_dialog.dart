import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/core/widgets/custom_text_form_field.dart';
import 'package:medico/core/widgets/password_field.dart';

class CustomDialog {
  static Future<void> showSuccessDialog({
    required BuildContext context,
    required String title,
    required String message,
    String? buttonText,
    VoidCallback? onPressed,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          contentPadding: const EdgeInsets.all(24),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(Assets.imagesSuccessful, width: 60, height: 60),
              SizedBox(height: 16),

              // Title
              Text(
                title,
                style: TextStyles.font18Bold.copyWith(color: AppColor.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),

              // Message
              Text(
                message,
                style: TextStyles.font14Regular.copyWith(color: AppColor.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),

              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (onPressed != null) {
                      onPressed();
                    } else {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        context.pop();
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    buttonText ?? 'OK',
                    style: TextStyles.font16Medium.copyWith(
                      color: AppColor.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<void> showErrorDialog({
    required BuildContext context,
    required String title,
    required String message,
    String? buttonText,
    VoidCallback? onPressed,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          contentPadding: const EdgeInsets.all(24),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Error Icon
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColor.red.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.error, color: AppColor.red, size: 40),
              ),
              SizedBox(height: 16),

              // Title
              Text(
                title,
                style: TextStyles.font18Bold.copyWith(color: AppColor.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),

              // Message
              Text(
                message,
                style: TextStyles.font14Regular.copyWith(color: AppColor.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),

              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed ?? () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.red,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    buttonText ?? 'Try Again',
                    style: TextStyles.font16Medium.copyWith(
                      color: AppColor.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<bool?> showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String message,
    VoidCallback? onConfirm,
    String? confirmText,
    String? cancelText,
    Color? confirmColor,
    VoidCallback? onCancel,
  }) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          contentPadding: const EdgeInsets.all(24),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Warning Icon
              SvgPicture.asset(Assets.imagesSuccessful),
              const SizedBox(height: 16),

              // Title
              Text(
                title,
                style: TextStyles.font18Bold.copyWith(color: AppColor.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),

              // Message
              Text(
                message,
                style: TextStyles.font14Regular.copyWith(color: AppColor.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              // Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        dialogContext.pop(); // Close dialog first
                        if (onCancel != null) {
                          onCancel();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        cancelText ?? 'Cancel',
                        style: TextStyles.font16SemiBold.copyWith(
                          color: AppColor.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        dialogContext.pop(); // Close dialog first
                        if (onConfirm != null) {
                          onConfirm();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: confirmColor ?? AppColor.primary,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        confirmText ?? 'Confirm',
                        style: TextStyles.font16SemiBold.copyWith(
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<void> showLoadingDialog({
    required BuildContext context,
    String? message,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          contentPadding: const EdgeInsets.all(24),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(color: AppColor.primary),
              const SizedBox(height: 16),
              Text(
                message ?? 'Please wait...',
                style: TextStyles.font14Regular.copyWith(color: AppColor.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<String?> showMobileNumberDialog({
    required BuildContext context,
    required String walletName,
    required Color walletColor,
  }) async {
    final controller = TextEditingController();

    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: AppColor.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: const EdgeInsets.all(24),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Wallet Icon
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: walletColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.phone_android, color: walletColor, size: 30),
            ),
            SizedBox(height: 16),

            // Title
            Text(
              'Enter Mobile Number',
              style: TextStyles.font18Bold.copyWith(color: AppColor.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),

            // Subtitle
            Text(
              'Please enter your $walletName number',
              style: TextStyles.font14Regular.copyWith(color: AppColor.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Text Field
            CustomTextFormField(
              hintText: '01xxxxxxxxx',
              keyboardType: TextInputType.number,
              // ! controller: controller,
            ),
            SizedBox(height: 24),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(color: AppColor.grey),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyles.font16Medium.copyWith(
                        color: AppColor.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context, controller.text),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: walletColor,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Continue',
                      style: TextStyles.font16Medium.copyWith(
                        color: AppColor.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Generic scrollable list picker, e.g. for choosing a month or day from
  // a fixed set of options where some entries may be disabled (grayed out,
  // not tappable) rather than omitted.
  static Future<T?> showListPickerDialog<T>({
    required BuildContext context,
    required String title,
    required List<T> items,
    required String Function(T item) labelBuilder,
    required bool Function(T item) isEnabled,
    required bool Function(T item) isSelected,
  }) async {
    return showDialog<T>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          title: Text(
            title,
            style: TextStyles.font18Bold.copyWith(color: AppColor.black),
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final item = items[index];
                final enabled = isEnabled(item);
                final selected = isSelected(item);
                final isActive = enabled && selected;
                return GestureDetector(
                  onTap: enabled
                      ? () => Navigator.pop(dialogContext, item)
                      : null,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isActive ? AppColor.primary : AppColor.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isActive
                            ? AppColor.primary
                            : AppColor.veryLightGrey,
                      ),
                    ),
                    child: Text(
                      labelBuilder(item),
                      style: TextStyles.font14SemiBold.copyWith(
                        color: !enabled
                            ? AppColor.grey
                            : isActive
                            ? AppColor.white
                            : AppColor.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  static Future<(String oldPassword, String newPassword)?>
  showChangePasswordDialog({required BuildContext context}) async {
    final formKey = GlobalKey<FormState>();
    late String oldPassword, newPassword;

    return showDialog<(String, String)>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColor.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: const EdgeInsets.all(24),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColor.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.lock_outline,
                  color: AppColor.primary,
                  size: 30,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Change Password',
                style: TextStyles.font18Bold.copyWith(color: AppColor.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              PasswordField(
                hintText: 'Current password',
                onSaved: (value) => oldPassword = value!,
              ),
              const SizedBox(height: 12),
              PasswordField(
                hintText: 'New password',
                onSaved: (value) => newPassword = value!,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(dialogContext),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: AppColor.grey),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyles.font16Medium.copyWith(
                          color: AppColor.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          Navigator.pop(dialogContext, (
                            oldPassword,
                            newPassword,
                          ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primary,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Confirm',
                        style: TextStyles.font16Medium.copyWith(
                          color: AppColor.white,
                        ),
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
