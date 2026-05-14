import 'dart:ui';

import 'package:flutter/material.dart';

class GlassAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;

  const GlassAppBar({super.key, required this.title, this.actions, this.automaticallyImplyLeading = true});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 8);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: AppBar(
          automaticallyImplyLeading: automaticallyImplyLeading,
          title: Text(title),
          backgroundColor: const Color(0xFF070A12).withOpacity(0.18),
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          actions: actions,
        ),
      ),
    );
  }
}
