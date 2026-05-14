import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/glass_app_bar.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';

import 'package:characters/characters.dart';

class ListItemShowcasePage extends StatelessWidget {
  const ListItemShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const GlassAppBar(title: 'List Item Showcase'),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: [
            const _HeaderCard(
              pill: 'LIST SYSTEM',
              title: 'Glass List Items',
              subtitle:
                  'Reusable tiles for profile, transaction, notification, crypto asset, and selectable rows.',
              icon: Icons.list_alt_rounded,
            ),
            const SizedBox(height: 16),
            _ShowcaseSection(
              icon: Icons.view_list_rounded,
              title: 'Basic List Tiles',
              subtitle: 'Common row components.',
              children: const [
                _GlassListTile(
                  icon: Icons.person_rounded,
                  title: 'Profile Item',
                  subtitle: 'Account and user information',
                ),
                _GlassListTile(
                  icon: Icons.notifications_rounded,
                  title: 'Notification Item',
                  subtitle: 'You have a new login alert',
                ),
                _GlassListTile(
                  icon: Icons.security_rounded,
                  title: 'Security Item',
                  subtitle: 'Two-factor authentication enabled',
                ),
              ],
            ),
            const SizedBox(height: 16),
            _ShowcaseSection(
              icon: Icons.currency_bitcoin_rounded,
              title: 'Crypto List Items',
              subtitle: 'For market and portfolio list.',
              children: const [
                _MarketTile(
                  symbol: 'BTC',
                  name: 'Bitcoin',
                  price: '\$103,420.50',
                  change: '+2.4%',
                ),
                _MarketTile(
                  symbol: 'ETH',
                  name: 'Ethereum',
                  price: '\$5,260.20',
                  change: '+1.2%',
                ),
                _MarketTile(
                  symbol: 'SOL',
                  name: 'Solana',
                  price: '\$180.40',
                  change: '-0.8%',
                  negative: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _GlassListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _GlassListTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return _TileContainer(
      child: Row(
        children: [
          _IconBox(icon: icon),
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
    );
  }
}

class _MarketTile extends StatelessWidget {
  final String symbol;
  final String name;
  final String price;
  final String change;
  final bool negative;

  const _MarketTile({
    required this.symbol,
    required this.name,
    required this.price,
    required this.change,
    this.negative = false,
  });

  @override
  Widget build(BuildContext context) {
    return _TileContainer(
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.09),
              border: Border.all(color: Colors.white.withOpacity(0.12)),
            ),
            child: Text(
              symbol.characters.first,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Color(0xFFAEC2FF),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  symbol,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 4),
                Text(
                  name,
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
              Text(price, style: const TextStyle(fontWeight: FontWeight.w900)),
              const SizedBox(height: 4),
              Text(
                change,
                style: TextStyle(
                  color: negative
                      ? const Color(0xFFFF8A8A)
                      : const Color(0xFF7CFFB2),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TileContainer extends StatelessWidget {
  final Widget child;

  const _TileContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white.withOpacity(0.06),
        border: Border.all(color: Colors.white.withOpacity(0.10)),
      ),
      child: child,
    );
  }
}

class _IconBox extends StatelessWidget {
  final IconData icon;

  const _IconBox({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white.withOpacity(0.09),
      ),
      child: Icon(icon, color: const Color(0xFFAEC2FF)),
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
