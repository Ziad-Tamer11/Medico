import 'package:flutter/material.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/widgets/result_header.dart';
import 'package:medico/features/home/presentation/views/widgets/no_result.dart';
import 'package:medico/features/search/presentation/views/widgets/search_text_field.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  late TextEditingController searchController;

  bool showCloseIcon = false;

  @override
  void initState() {
    super.initState();

    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: SearchTextField(
            searchController: searchController,
            showCloseIcon: showCloseIcon,
            onChanged: (value) {
              setState(() {
                showCloseIcon = value.isNotEmpty;
              });
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: ResultHeader(),
        ),
        NoResult(text: 'Search for the doctor you want'),
      ],
    );
  }
}
