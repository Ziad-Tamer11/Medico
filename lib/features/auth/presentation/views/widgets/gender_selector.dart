import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/auth/presentation/views/widgets/gender_option.dart';

class GenderSelector extends FormField<String> {
  GenderSelector({
    super.key,
    void Function(String?)? onSaved,
    String? initialValue,
  }) : super(
         onSaved: onSaved,
         initialValue: initialValue,
         validator: (value) {
           if (value == null || value.isEmpty) {
             return 'Please select your gender';
           }
           return null;
         },
         builder: (state) {
           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Row(
                 children: [
                   Expanded(
                     child: GenderOption(
                       label: 'Male',
                       isSelected: state.value == 'male',
                       hasError: state.hasError,
                       onTap: () => state.didChange('male'),
                     ),
                   ),
                   const SizedBox(width: 12),
                   Expanded(
                     child: GenderOption(
                       label: 'Female',
                       isSelected: state.value == 'female',
                       hasError: state.hasError,
                       onTap: () => state.didChange('female'),
                     ),
                   ),
                 ],
               ),
               if (state.hasError)
                 Padding(
                   padding: const EdgeInsets.only(
                     top: 8,
                     left: 18,
                   ), // ← المسافة من فوق وشمال
                   child: Text(
                     state.errorText!,
                     style: TextStyles.font16Regular.copyWith(
                       color: AppColor.red,
                     ),
                   ),
                 ),
             ],
           );
         },
       );
}
