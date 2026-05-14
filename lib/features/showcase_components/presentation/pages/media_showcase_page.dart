import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/glass_app_bar.dart';
import '../../../../core/widgets/glass_background.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/glass_pill.dart';
import '../bloc/showcase_cubit.dart';
import '../widgets/showcase_common_widgets.dart';


class MediaShowcasePage extends StatelessWidget {
  const MediaShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const GlassAppBar(title: 'Media Showcase'),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: const [
            ShowcaseHeaderCard(
              pill: 'MEDIA SYSTEM',
              title: 'Avatar & Image Components',
              subtitle: 'Profile avatar, stacked avatar, upload box, banner image, placeholder, and image error state.',
              icon: Icons.image_rounded,
            ),
            SizedBox(height: 16),
            _AvatarSection(),
            SizedBox(height: 16),
            _UploadSection(),
            SizedBox(height: 16),
            _BannerSection(),
            SizedBox(height: 16),
            _ImageStateSection(),
          ],
        ),
      ),
    );
  }
}

class _AvatarSection extends StatelessWidget {
  const _AvatarSection();

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      icon: Icons.account_circle_rounded,
      title: 'Avatar',
      subtitle: 'Circle avatar, initials, and stacked users.',
      children: [
        Row(
          children: [
            _Avatar(label: 'A', size: 58),
            const SizedBox(width: 12),
            _Avatar(label: 'B', size: 58, color: Color(0xFFB7FFE0)),
            const SizedBox(width: 12),
            _Avatar(label: 'C', size: 58, color: Color(0xFFFFD166)),
            const SizedBox(width: 12),
            Stack(
              clipBehavior: Clip.none,
              children: List.generate(4, (index) {
                final labels = ['D', 'E', 'F', '+8'];
                return Padding(
                  padding: EdgeInsets.only(left: index * 28),
                  child: _Avatar(label: labels[index], size: 48, color: index == 3 ? const Color(0xFFFF8A8A) : const Color(0xFFAEC2FF)),
                );
              }),
            ),
          ],
        ),
      ],
    );
  }
}

class _Avatar extends StatelessWidget {
  final String label;
  final double size;
  final Color color;

  const _Avatar({
    required this.label,
    required this.size,
    this.color = const Color(0xFFAEC2FF),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.14),
        border: Border.all(color: color.withOpacity(0.35), width: 1.5),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
    );
  }
}

class _UploadSection extends StatelessWidget {
  const _UploadSection();

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      icon: Icons.cloud_upload_rounded,
      title: 'Upload Box',
      subtitle: 'Image picker placeholder component.',
      children: [
        Container(
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: Colors.white.withOpacity(0.06),
            border: Border.all(color: Colors.white.withOpacity(0.14)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlassIconBox(icon: Icons.add_photo_alternate_rounded, size: 62),
              const SizedBox(height: 14),
              const Text('Upload Image', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
              const SizedBox(height: 6),
              Text('PNG, JPG, or WEBP up to 5MB', style: TextStyle(color: Colors.white.withOpacity(0.55), fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ],
    );
  }
}

class _BannerSection extends StatelessWidget {
  const _BannerSection();

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      icon: Icons.panorama_rounded,
      title: 'Banner',
      subtitle: 'Hero image or promo banner.',
      children: [
        Container(
          height: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            gradient: LinearGradient(
              colors: [
                const Color(0xFFAEC2FF).withOpacity(0.28),
                const Color(0xFFB7FFE0).withOpacity(0.10),
                Colors.white.withOpacity(0.06),
              ],
            ),
            border: Border.all(color: Colors.white.withOpacity(0.14)),
          ),
          child: Stack(
            children: [
              Positioned(right: -30, bottom: -28, child: Icon(Icons.blur_on_rounded, color: Colors.white.withOpacity(0.10), size: 150)),
              Padding(
                padding: const EdgeInsets.all(22),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.end, children: const [
                  GlassPill(text: 'PROMO', icon: Icons.auto_awesome_rounded),
                  SizedBox(height: 14),
                  Text('Glass Media Banner', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
                ]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ImageStateSection extends StatelessWidget {
  const _ImageStateSection();

  @override
  Widget build(BuildContext context) {
    return ShowcaseSection(
      icon: Icons.broken_image_rounded,
      title: 'Image States',
      subtitle: 'Placeholder and error components.',
      children: const [
        GlassActionTile(title: 'Image Placeholder', subtitle: 'Shown while image is loading.', icon: Icons.image_search_rounded),
        GlassActionTile(title: 'Image Error', subtitle: 'Shown when image cannot be loaded.', icon: Icons.error_outline_rounded, color: Color(0xFFFF8A8A)),
      ],
    );
  }
}
