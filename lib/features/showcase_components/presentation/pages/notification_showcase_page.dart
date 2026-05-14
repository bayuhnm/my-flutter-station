import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/glass_app_bar.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';
import '../bloc/showcase_cubit.dart';
import '../widgets/showcase_common_widgets.dart';


class NotificationShowcasePage extends StatelessWidget {
  const NotificationShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const GlassAppBar(title: 'Notification Showcase'),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: const [
            ShowcaseHeaderCard(
              pill: 'NOTIFICATION',
              title: 'Notification & Activity Center',
              subtitle: 'Notification cards, unread state, activity item, announcement banner, and grouped notification.',
              icon: Icons.notifications_rounded,
            ),
            SizedBox(height: 16),
            _AnnouncementBanner(),
            SizedBox(height: 16),
            _NotificationList(),
          ],
        ),
      ),
    );
  }
}

class _AnnouncementBanner extends StatelessWidget {
  const _AnnouncementBanner();

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      borderRadius: 30,
      padding: const EdgeInsets.all(20),
      gradientColors: [
        const Color(0xFFAEC2FF).withOpacity(0.20),
        const Color(0xFFB7FFE0).withOpacity(0.08),
      ],
      child: Row(
        children: [
          const GlassIconBox(icon: Icons.campaign_rounded),
          const SizedBox(width: 14),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('New Feature Available', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17)),
              const SizedBox(height: 5),
              Text('Component library now supports extra production widgets.', style: TextStyle(color: Colors.white.withOpacity(0.62), fontWeight: FontWeight.w600)),
            ]),
          ),
        ],
      ),
    );
  }
}

class _NotificationList extends StatelessWidget {
  const _NotificationList();

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      icon: Icons.mark_email_unread_rounded,
      title: 'Notification Items',
      subtitle: 'Unread, read, and activity style.',
      children: const [
        GlassActionTile(title: 'Security Alert', subtitle: 'New login from Chrome on macOS.', icon: Icons.security_rounded, color: Color(0xFFFFD166), trailing: GlassTag(text: 'NEW', color: Color(0xFFFFD166))),
        GlassActionTile(title: 'Transaction Completed', subtitle: 'Your BTC purchase has been completed.', icon: Icons.check_circle_rounded, color: Color(0xFF7CFFB2)),
        GlassActionTile(title: 'Weekly Summary', subtitle: 'Your portfolio increased by 2.45%.', icon: Icons.insights_rounded),
      ],
    );
  }
}
