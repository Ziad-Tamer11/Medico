import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/widgets/custom_dialog.dart';
import 'package:medico/features/profile/presentation/manager/change_password_cubit/change_password_cubit.dart';
import 'package:medico/features/profile/presentation/manager/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:medico/features/profile/presentation/views/widgets/edit_profile_view_body.dart';

class EditProfileViewBodyBlocConsumer extends StatelessWidget {
  const EditProfileViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          CustomDialog.showSuccessDialog(
            context: context,
            title: 'Password Changed',
            message: 'Your password has been updated successfully.',
          );
        }
        if (state is ChangePasswordFailure) {
          CustomDialog.showErrorDialog(
            context: context,
            title: 'Failed',
            message: state.errMessage,
          );
        }
      },
      builder: (context, changePasswordState) {
        return BlocConsumer<EditProfileCubit, EditProfileState>(
          listener: (context, state) {
            if (state is EditProfileSuccess) {
              CustomDialog.showSuccessDialog(
                context: context,
                title: 'Profile Updated',
                message: 'Your information has been saved successfully.',
                onPressed: () {
                  Navigator.of(context).pop(); // يقفل الـ dialog
                  Navigator.of(context).pop(); // يقفل صفحة الـ Edit
                },
              );
            }
            if (state is EditProfileFailure) {
              CustomDialog.showErrorDialog(
                context: context,
                title: 'Update Failed',
                message: state.errMessage,
              );
            }
          },
          builder: (context, state) {
            // covers both cubits so the HUD (and the disabled buttons) show
            // for whichever request is actually in flight
            final isLoading =
                state is EditProfileLoading ||
                changePasswordState is ChangePasswordLoading;
            return EditProfileViewBody(
              isLoading: isLoading,
              onSave: (fullName, phone) {
                context.read<EditProfileCubit>().updateProfile(
                  fullName: fullName,
                  phone: phone,
                );
              },
              onChangePasswordTap: () async {
                final result = await CustomDialog.showChangePasswordDialog(
                  context: context,
                );
                if (result != null) {
                  context.read<ChangePasswordCubit>().changePassword(
                    oldPassword: result.$1,
                    newPassword: result.$2,
                  );
                }
              },
            );
          },
        );
      },
    );
  }
}
