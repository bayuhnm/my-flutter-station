import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/glass_app_bar.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';
import '../bloc/showcase_cubit.dart';
import '../widgets/showcase_common_widgets.dart';

class TableShowcasePage extends StatelessWidget {
  const TableShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const GlassAppBar(title: 'Table Showcase'),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: const [
            ShowcaseHeaderCard(
              pill: 'TABLE SYSTEM',
              title: 'Glass Data Tables',
              subtitle:
                  'Transaction table, key value table, comparison table, and pricing table components.',
              icon: Icons.table_chart_rounded,
            ),
            SizedBox(height: 16),
            _TransactionTable(),
            SizedBox(height: 16),
            _KeyValueTable(),
            SizedBox(height: 16),
            _PricingComparison(),
          ],
        ),
      ),
    );
  }
}

class _TransactionTable extends StatelessWidget {
  const _TransactionTable();

  @override
  Widget build(BuildContext context) {
    final rows = [
      ('BTC Buy', 'Completed', '+0.024 BTC', const Color(0xFF7CFFB2)),
      ('ETH Sell', 'Pending', '-1.20 ETH', const Color(0xFFFFD166)),
      ('IDR Withdraw', 'Failed', '-Rp500K', const Color(0xFFFF8A8A)),
    ];

    return ShowcaseSection(
      icon: Icons.receipt_long_rounded,
      title: 'Transaction Table',
      subtitle: 'Compact mobile-friendly data table.',
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingTextStyle: const TextStyle(
              fontWeight: FontWeight.w900,
              color: Color(0xFFAEC2FF),
            ),
            dataTextStyle: const TextStyle(fontWeight: FontWeight.w700),
            dividerThickness: 0.5,
            columns: const [
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Status')),
              DataColumn(label: Text('Amount')),
            ],
            rows: rows.map((row) {
              return DataRow(
                cells: [
                  DataCell(Text(row.$1)),
                  DataCell(
                    Text(
                      row.$2,
                      style: TextStyle(
                        color: row.$4,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  DataCell(Text(row.$3)),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _KeyValueTable extends StatelessWidget {
  const _KeyValueTable();

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      icon: Icons.view_list_rounded,
      title: 'Key Value Table',
      subtitle: 'Useful for detail, receipt, and summary page.',
      children: const [
        KeyValueRow(label: 'Network', value: 'ERC20'),
        GlassDivider(),
        KeyValueRow(label: 'Fee', value: '0.0004 ETH'),
        GlassDivider(),
        KeyValueRow(label: 'Estimated Arrival', value: '5 minutes'),
        GlassDivider(),
        KeyValueRow(
          label: 'Total',
          value: '\$1,240.80',
          valueColor: Color(0xFFB7FFE0),
        ),
      ],
    );
  }
}

class _PricingComparison extends StatelessWidget {
  const _PricingComparison();

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      icon: Icons.workspace_premium_rounded,
      title: 'Pricing Table',
      subtitle: 'Plan comparison card.',
      children: [
        Row(
          children: const [
            Expanded(
              child: _PlanCard(title: 'Basic', price: 'Free', active: false),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _PlanCard(title: 'Pro', price: '\$19/mo', active: true),
            ),
          ],
        ),
      ],
    );
  }
}

class _PlanCard extends StatelessWidget {
  final String title;
  final String price;
  final bool active;

  const _PlanCard({
    required this.title,
    required this.price,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: active
            ? const Color(0xFFAEC2FF).withOpacity(0.16)
            : Colors.white.withOpacity(0.06),
        border: Border.all(
          color: active
              ? const Color(0xFFAEC2FF).withOpacity(0.42)
              : Colors.white.withOpacity(0.10),
        ),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
          ),
          const SizedBox(height: 8),
          Text(
            price,
            style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 22),
          ),
          const SizedBox(height: 12),
          GlassMiniButton(text: active ? 'Current' : 'Choose'),
        ],
      ),
    );
  }
}
