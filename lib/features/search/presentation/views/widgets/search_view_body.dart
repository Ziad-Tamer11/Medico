import 'package:flutter/material.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/widgets/result_header.dart';
import 'package:medico/features/home/presentation/views/widgets/no_result.dart';
import 'package:medico/features/search/presentation/views/widgets/search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: SearchTextField(
            searchController: TextEditingController(),
            showCloseIcon: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: ResultHeader(),
        ),
        NoResult(text: 'Search for the doctor you want'),
      ],
    );
  }
}
