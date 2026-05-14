import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/glass_app_bar.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';
import '../bloc/showcase_cubit.dart';
import '../widgets/showcase_common_widgets.dart';


class ChartShowcasePage extends StatelessWidget {
  const ChartShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShowcaseCubit(),
      child: GlassBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const GlassAppBar(title: 'Chart Showcase'),
          body: ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
            children: const [
              ShowcaseHeaderCard(
                pill: 'CHART SYSTEM',
                title: 'Glass Chart Components',
                subtitle: 'Line chart, bar chart, donut chart, sparkline, and portfolio performance widgets.',
                icon: Icons.show_chart_rounded,
              ),
              SizedBox(height: 16),
              _PortfolioChartCard(),
              SizedBox(height: 16),
              _BarChartCard(),
              SizedBox(height: 16),
              _DonutChartCard(),
              SizedBox(height: 16),
              _SparklineCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class _PortfolioChartCard extends StatelessWidget {
  const _PortfolioChartCard();

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      icon: Icons.trending_up_rounded,
      title: 'Line Chart',
      subtitle: 'Portfolio performance over time.',
      children: [
        SizedBox(
          height: 210,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(show: true, drawVerticalLine: false, getDrawingHorizontalLine: (_) => FlLine(color: Colors.white.withOpacity(0.08), strokeWidth: 1)),
              titlesData: const FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              minX: 0,
              maxX: 6,
              minY: 0,
              maxY: 6,
              lineBarsData: [
                LineChartBarData(
                  spots: const [
                    FlSpot(0, 2.2),
                    FlSpot(1, 2.8),
                    FlSpot(2, 2.4),
                    FlSpot(3, 4.2),
                    FlSpot(4, 3.8),
                    FlSpot(5, 5.1),
                    FlSpot(6, 5.6),
                  ],
                  isCurved: true,
                  barWidth: 4,
                  color: const Color(0xFFAEC2FF),
                  belowBarData: BarAreaData(show: true, color: const Color(0xFFAEC2FF).withOpacity(0.16)),
                  dotData: const FlDotData(show: false),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _BarChartCard extends StatelessWidget {
  const _BarChartCard();

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      icon: Icons.bar_chart_rounded,
      title: 'Bar Chart',
      subtitle: 'Weekly revenue or activity breakdown.',
      children: [
        SizedBox(
          height: 190,
          child: BarChart(
            BarChartData(
              gridData: const FlGridData(show: false),
              titlesData: const FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              barGroups: List.generate(7, (i) {
                final values = [3.0, 4.5, 2.8, 5.6, 4.8, 6.0, 5.2];
                return BarChartGroupData(
                  x: i,
                  barRods: [
                    BarChartRodData(
                      toY: values[i],
                      width: 18,
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFFB7FFE0),
                      backDrawRodData: BackgroundBarChartRodData(show: true, toY: 7, color: Colors.white.withOpacity(0.06)),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}

class _DonutChartCard extends StatelessWidget {
  const _DonutChartCard();

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      icon: Icons.donut_large_rounded,
      title: 'Donut Chart',
      subtitle: 'Asset allocation preview.',
      children: [
        SizedBox(
          height: 190,
          child: PieChart(
            PieChartData(
              centerSpaceRadius: 48,
              sectionsSpace: 4,
              sections: [
                PieChartSectionData(value: 45, title: 'BTC', radius: 42, color: const Color(0xFFAEC2FF), titleStyle: const TextStyle(fontWeight: FontWeight.w900)),
                PieChartSectionData(value: 30, title: 'ETH', radius: 42, color: const Color(0xFFB7FFE0), titleStyle: const TextStyle(fontWeight: FontWeight.w900)),
                PieChartSectionData(value: 25, title: 'SOL', radius: 42, color: const Color(0xFFFFD166), titleStyle: const TextStyle(fontWeight: FontWeight.w900)),
              ],
            ),
          ),
        ),
        const Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            GlassTag(text: 'BTC 45%', color: Color(0xFFAEC2FF)),
            GlassTag(text: 'ETH 30%', color: Color(0xFFB7FFE0)),
            GlassTag(text: 'SOL 25%', color: Color(0xFFFFD166)),
          ],
        ),
      ],
    );
  }
}

class _SparklineCard extends StatelessWidget {
  const _SparklineCard();

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      icon: Icons.stacked_line_chart_rounded,
      title: 'Mini Sparkline',
      subtitle: 'Compact chart for list items.',
      children: [
        Row(
          children: [
            const Expanded(child: Text('Bitcoin', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900))),
            Text('+2.45%', style: TextStyle(color: const Color(0xFF7CFFB2), fontWeight: FontWeight.w900)),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 76,
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: false),
              titlesData: const FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: const [
                    FlSpot(0, 1),
                    FlSpot(1, 1.4),
                    FlSpot(2, 1.2),
                    FlSpot(3, 1.8),
                    FlSpot(4, 1.7),
                    FlSpot(5, 2.2),
                  ],
                  isCurved: true,
                  barWidth: 3,
                  color: const Color(0xFF7CFFB2),
                  dotData: const FlDotData(show: false),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
