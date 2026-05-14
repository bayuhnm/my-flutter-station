import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text; final bool isLoading; final VoidCallback? onPressed; final IconData? icon;
  const AppButton({super.key, required this.text, this.isLoading = false, this.onPressed, this.icon});
  @override
  Widget build(BuildContext context) {
    final child = isLoading ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2)) : Row(mainAxisAlignment: MainAxisAlignment.center, children: [if (icon != null) ...[Icon(icon, size: 19), const SizedBox(width: 10)], Text(text)]);
    return SizedBox(height: 54, width: double.infinity, child: FilledButton(onPressed: isLoading ? null : onPressed, child: child));
  }
}
