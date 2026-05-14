import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/glass_app_bar.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';
import '../bloc/showcase_cubit.dart';
import '../widgets/showcase_common_widgets.dart';


class SearchFilterShowcasePage extends StatelessWidget {
  const SearchFilterShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShowcaseCubit(),
      child: GlassBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const GlassAppBar(title: 'Search & Filter Showcase'),
          body: BlocBuilder<ShowcaseCubit, ShowcaseState>(
            builder: (context, state) {
              final filters = ['All', 'Crypto', 'Stocks', 'News', 'Research', 'Popular'];
              final items = ['Bitcoin Research', 'Ethereum News', 'Stocks Weekly', 'Crypto Market Update', 'Portfolio Strategy'];
              final result = items.where((e) => e.toLowerCase().contains(state.searchQuery.toLowerCase())).toList();

              return ListView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                children: [
                  const ShowcaseHeaderCard(
                    pill: 'FILTER SYSTEM',
                    title: 'Search & Filter Components',
                    subtitle: 'Glass search field, filter chips, sort dropdown, date range row, active tags, and result header.',
                    icon: Icons.search_rounded,
                  ),
                  const SizedBox(height: 16),
                  ShowcaseSection(
                    icon: Icons.search_rounded,
                    title: 'Search Bar',
                    subtitle: 'Controlled by ShowcaseCubit.',
                    children: [
                      GlassSearchBox(
                        hintText: 'Search market, article, or product...',
                        onChanged: context.read<ShowcaseCubit>().setSearchQuery,
                      ),
                      const SizedBox(height: 14),
                      Text(
                        'Keyword: ${state.searchQuery.isEmpty ? '-' : state.searchQuery}',
                        style: TextStyle(color: Colors.white.withOpacity(0.60), fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ShowcaseSection(
                    icon: Icons.filter_alt_rounded,
                    title: 'Filter Chips',
                    subtitle: 'Tap chips to toggle selected filters.',
                    children: [
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: filters.map((filter) {
                          final active = state.selectedFilters.contains(filter);
                          return InkWell(
                            borderRadius: BorderRadius.circular(99),
                            onTap: () => context.read<ShowcaseCubit>().toggleFilter(filter),
                            child: GlassTag(
                              text: filter,
                              icon: active ? Icons.check_rounded : null,
                              color: active ? const Color(0xFFB7FFE0) : const Color(0xFFAEC2FF),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: state.selectedFilters.map((e) => GlassTag(text: e, color: const Color(0xFFFFD166))).toList(),
                            ),
                          ),
                          GlassMiniButton(
                            text: 'Clear',
                            icon: Icons.close_rounded,
                            onTap: context.read<ShowcaseCubit>().clearFilters,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ShowcaseSection(
                    icon: Icons.sort_rounded,
                    title: 'Result Header',
                    subtitle: 'Search result, sort, and date range example.',
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text('${result.length} Results', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900))),
                          const GlassTag(text: 'Newest', icon: Icons.sort_rounded),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const GlassActionTile(title: 'Date Range', subtitle: '14 May 2026 - 21 May 2026', icon: Icons.date_range_rounded),
                      ...result.map((item) => GlassActionTile(title: item, subtitle: 'Search result item', icon: Icons.article_rounded, color: const Color(0xFFB7FFE0))),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
