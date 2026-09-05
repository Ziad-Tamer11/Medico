import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/widgets/result_header.dart';
import 'package:medico/features/doctors/presentation/manager/doctor_cubit/doctor_cubit.dart';
import 'package:medico/features/search/presentation/views/widgets/search_results_bloc_builder.dart';
import 'package:medico/features/search/presentation/views/widgets/search_text_field.dart';

const _searchDebounceDuration = Duration(milliseconds: 400);

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  late TextEditingController searchController;
  Timer? _debounce;

  bool showCloseIcon = false;

  @override
  void initState() {
    super.initState();

    searchController = TextEditingController();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();

    super.dispose();
  }

  void _onQueryChanged(String query) {
    setState(() {
      showCloseIcon = query.isNotEmpty;
    });

    _debounce?.cancel();
    final doctorCubit = context.read<DoctorCubit>();
    if (query.trim().isEmpty) {
      doctorCubit.resetSearch();
      return;
    }
    _debounce = Timer(_searchDebounceDuration, () {
      doctorCubit.searchDoctors(query.trim());
    });
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
            onChanged: _onQueryChanged,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: ResultHeader(),
        ),
        const Expanded(child: SearchResultsBlocBuilder()),
      ],
    );
  }
}
