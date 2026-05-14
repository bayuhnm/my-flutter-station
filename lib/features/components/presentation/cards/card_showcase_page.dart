import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/glass_app_bar.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';

class CardShowcasePage extends StatelessWidget {
  const CardShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const GlassAppBar(title: 'Card Showcase'),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: [
            const _HeaderCard(
              pill: 'CARD SYSTEM',
              title: 'Glass Card Components',
              subtitle:
                  'Dashboard cards, profile cards, transaction cards, stats, and selectable cards.',
              icon: Icons.dashboard_customize_rounded,
            ),
            const SizedBox(height: 16),
            _PortfolioCard(),
            const SizedBox(height: 16),
            Row(
              children: const [
                Expanded(
                  child: _StatCard(
                    label: 'Revenue',
                    value: '\$24.8K',
                    change: '+12.4%',
                    icon: Icons.trending_up_rounded,
                  ),
                ),
                SizedBox(width: 14),
                Expanded(
                  child: _StatCard(
                    label: 'Users',
                    value: '8,421',
                    change: '+8.1%',
                    icon: Icons.group_rounded,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const _ProfileCard(),
            const SizedBox(height: 16),
            const _TransactionCard(
              title: 'Bitcoin Purchase',
              subtitle: 'BTC / USDT',
              amount: '+0.024 BTC',
              status: 'Completed',
            ),
            const SizedBox(height: 12),
            const _TransactionCard(
              title: 'Bank Withdrawal',
              subtitle: 'IDR Transfer',
              amount: '-Rp1,500,000',
              status: 'Pending',
            ),
            const SizedBox(height: 16),
            const _SelectableCard(),
          ],
        ),
      ),
    );
  }
}

class _PortfolioCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlassCard(
      borderRadius: 34,
      padding: const EdgeInsets.all(24),
      gradientColors: [
        const Color(0xFFAEC2FF).withOpacity(0.22),
        Colors.white.withOpacity(0.08),
        const Color(0xFFB7FFE0).withOpacity(0.08),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const GlassPill(
                text: 'BALANCE',
                icon: Icons.account_balance_wallet_rounded,
              ),
              const Spacer(),
              Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white.withOpacity(0.12),
                  border: Border.all(color: Colors.white.withOpacity(0.16)),
                ),
                child: const Icon(
                  Icons.visibility_rounded,
                  color: Color(0xFFAEC2FF),
                ),
              ),
            ],
          ),
          const SizedBox(height: 26),
          Text(
            'Total Portfolio',
            style: TextStyle(
              color: Colors.white.withOpacity(0.62),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            '\$128,420.50',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w900,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 10),
          const GlassPill(
            text: '+18.7% this month',
            icon: Icons.arrow_upward_rounded,
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final String change;
  final IconData icon;

  const _StatCard({
    required this.label,
    required this.value,
    required this.change,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      borderRadius: 30,
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFFAEC2FF)),
          const SizedBox(height: 18),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.58),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 8),
          Text(
            change,
            style: const TextStyle(
              color: Color(0xFF7CFFB2),
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard();

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      borderRadius: 30,
      padding: const EdgeInsets.all(18),
      child: Row(
        children: [
          Container(
            height: 62,
            width: 62,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.12),
              border: Border.all(color: Colors.white.withOpacity(0.18)),
            ),
            child: const Icon(
              Icons.person_rounded,
              color: Color(0xFFAEC2FF),
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Alex Morgan',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 4),
                Text(
                  'Premium Member',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.58),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const GlassPill(text: 'PRO'),
        ],
      ),
    );
  }
}

class _TransactionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final String status;

  const _TransactionCard({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final pending = status == 'Pending';
    return GlassCard(
      borderRadius: 28,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.white.withOpacity(0.09),
            ),
            child: Icon(
              pending ? Icons.schedule_rounded : Icons.check_rounded,
              color: pending
                  ? const Color(0xFFFFD166)
                  : const Color(0xFF7CFFB2),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.56),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(amount, style: const TextStyle(fontWeight: FontWeight.w900)),
              const SizedBox(height: 4),
              Text(
                status,
                style: TextStyle(
                  color: pending
                      ? const Color(0xFFFFD166)
                      : const Color(0xFF7CFFB2),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SelectableCard extends StatefulWidget {
  const _SelectableCard();

  @override
  State<_SelectableCard> createState() => _SelectableCardState();
}

class _SelectableCardState extends State<_SelectableCard> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    final plans = ['Basic', 'Growth', 'Scale'];
    return _ShowcaseSection(
      icon: Icons.fact_check_rounded,
      title: 'Selectable Card',
      subtitle: 'Tap card to select option.',
      children: [
        ...List.generate(plans.length, (index) {
          final active = selected == index;
          return Padding(
            padding: EdgeInsets.only(
              bottom: index == plans.length - 1 ? 0 : 12,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: () => setState(() => selected = index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: active
                      ? const Color(0xFFAEC2FF).withOpacity(0.16)
                      : Colors.white.withOpacity(0.06),
                  border: Border.all(
                    color: active
                        ? const Color(0xFFAEC2FF).withOpacity(0.54)
                        : Colors.white.withOpacity(0.10),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      active
                          ? Icons.radio_button_checked_rounded
                          : Icons.radio_button_off_rounded,
                      color: const Color(0xFFAEC2FF),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        plans[index],
                        style: const TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ),
                    Text(
                      index == 0
                          ? 'Free'
                          : index == 1
                          ? '\$19/mo'
                          : '\$99/mo',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.68),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}

class _HeaderCard extends StatelessWidget {
  final String pill;
  final String title;
  final String subtitle;
  final IconData icon;

  const _HeaderCard({
    required this.pill,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      borderRadius: 34,
      padding: const EdgeInsets.all(24),
      gradientColors: [
        Colors.white.withOpacity(0.22),
        const Color(0xFFAEC2FF).withOpacity(0.09),
        Colors.white.withOpacity(0.06),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlassPill(text: pill, icon: icon),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.8,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(
              height: 1.45,
              color: Colors.white.withOpacity(0.66),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _ShowcaseSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final List<Widget> children;

  const _ShowcaseSection({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      borderRadius: 32,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(icon: icon, title: title, subtitle: subtitle),
          const SizedBox(height: 18),
          ...children,
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _SectionTitle({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: Colors.white.withOpacity(0.12),
            border: Border.all(color: Colors.white.withOpacity(0.14)),
          ),
          child: Icon(icon, color: const Color(0xFFAEC2FF)),
        ),
        const SizedBox(width: 13),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.56),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ActionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ActionTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white.withOpacity(0.06),
            border: Border.all(color: Colors.white.withOpacity(0.10)),
          ),
          child: Row(
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: color.withOpacity(0.12),
                  border: Border.all(color: color.withOpacity(0.24)),
                ),
                child: Icon(icon, color: color),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.56),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
