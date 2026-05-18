import 'dart:ui';

import 'package:flutter/material.dart';

enum PremiumCardEmblemPosition { topLeft, topRight, bottomLeft, bottomRight }

class PremiumImageChip extends StatelessWidget {
  final String label;
  final Color color;
  final IconData? icon;

  const PremiumImageChip({
    super.key,
    required this.label,
    required this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: color.withValues(alpha: 0.34)),
            boxShadow: [
              BoxShadow(color: color.withValues(alpha: 0.14), blurRadius: 16),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 14, color: color),
                const SizedBox(width: 6),
              ],
              Text(
                label,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PremiumImageEmblem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;

  const PremiumImageEmblem({
    super.key,
    required this.icon,
    required this.color,
    this.size = 46,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withValues(alpha: 0.28),
            border: Border.all(color: color.withValues(alpha: 0.38)),
            boxShadow: [
              BoxShadow(color: color.withValues(alpha: 0.28), blurRadius: 22),
            ],
          ),
          child: Icon(icon, color: color, size: size * 0.48),
        ),
      ),
    );
  }
}

class PremiumNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const PremiumNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final image = Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;

        return Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.06),
          ),
          child: const SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(strokeWidth: 2.2),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: width,
          height: height,
          color: Colors.white.withValues(alpha: 0.06),
          alignment: Alignment.center,
          child: Icon(
            Icons.broken_image_rounded,
            size: 30,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white70
                : Colors.black45,
          ),
        );
      },
    );

    if (borderRadius == null) return image;

    return ClipRRect(borderRadius: borderRadius!, child: image);
  }
}

class PremiumFeaturedImageCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String? tag;
  final String? chipLabel;
  final Color chipColor;
  final VoidCallback? onTap;

  const PremiumFeaturedImageCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    this.tag,
    this.chipLabel,
    this.chipColor = const Color(0xFFF8D66D),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _CardTapWrapper(
      onTap: onTap,
      borderRadius: 30,
      child: Container(
        height: 260,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.18),
              blurRadius: 30,
              offset: const Offset(0, 16),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Stack(
            fit: StackFit.expand,
            children: [
              PremiumNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x22000000),
                      Color(0x66000000),
                      Color(0xDD020617),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 18,
                left: 18,
                right: 18,
                child: Row(
                  children: [
                    if (chipLabel != null)
                      PremiumImageChip(
                        label: chipLabel!,
                        color: chipColor,
                        icon: Icons.auto_awesome_rounded,
                      ),
                    const Spacer(),
                    if (tag != null) _GlassMiniLabel(label: tag!),
                  ],
                ),
              ),
              Positioned(
                left: 18,
                right: 18,
                bottom: 18,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            height: 1.05,
                            letterSpacing: -0.6,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withValues(alpha: 0.82),
                        height: 1.45,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PremiumCleanImageCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const PremiumCleanImageCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _CardTapWrapper(
      onTap: onTap,
      borderRadius: 28,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: Colors.white.withValues(
            alpha: Theme.of(context).brightness == Brightness.dark
                ? 0.07
                : 0.72,
          ),
          border: Border.all(
            color: Colors.white.withValues(
              alpha: Theme.of(context).brightness == Brightness.dark
                  ? 0.10
                  : 0.84,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 24,
              offset: const Offset(0, 14),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PremiumNetworkImage(
              imageUrl: imageUrl,
              width: double.infinity,
              height: 185,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(28),
              ),
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                      height: 1.12,
                      letterSpacing: -0.4,
                    ),
                  ),
                  const SizedBox(height: 9),
                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: _mutedColor(context),
                      height: 1.45,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PremiumArticleImageCard extends StatelessWidget {
  final String imageUrl;
  final String category;
  final String title;
  final String date;
  final String? excerpt;
  final String? chipLabel;
  final Color chipColor;
  final VoidCallback? onTap;

  const PremiumArticleImageCard({
    super.key,
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.date,
    this.excerpt,
    this.chipLabel,
    this.chipColor = const Color(0xFF38BDF8),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _CardTapWrapper(
      onTap: onTap,
      borderRadius: 26,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(26),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              color: Colors.white.withValues(
                alpha: Theme.of(context).brightness == Brightness.dark
                    ? 0.07
                    : 0.72,
              ),
              border: Border.all(
                color: Colors.white.withValues(
                  alpha: Theme.of(context).brightness == Brightness.dark
                      ? 0.10
                      : 0.84,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 24,
                  offset: const Offset(0, 14),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    PremiumNetworkImage(
                      imageUrl: imageUrl,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 14,
                      left: 14,
                      child: PremiumImageChip(
                        label: category,
                        color: const Color(0xFFF8D66D),
                      ),
                    ),
                    if (chipLabel != null)
                      Positioned(
                        top: 14,
                        right: 14,
                        child: PremiumImageChip(
                          label: chipLabel!,
                          color: chipColor,
                        ),
                      ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        date,
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(
                              color: _mutedColor(context),
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.4,
                          height: 1.12,
                        ),
                      ),
                      if (excerpt != null) ...[
                        const SizedBox(height: 10),
                        Text(
                          excerpt!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: _mutedColor(context),
                                height: 1.45,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PremiumEmblemImageCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final IconData emblemIcon;
  final Color emblemColor;
  final String? chipLabel;
  final Color chipColor;
  final PremiumCardEmblemPosition emblemPosition;
  final VoidCallback? onTap;

  const PremiumEmblemImageCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.emblemIcon,
    this.emblemColor = const Color(0xFFF8D66D),
    this.chipLabel,
    this.chipColor = const Color(0xFF38BDF8),
    this.emblemPosition = PremiumCardEmblemPosition.topRight,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _CardTapWrapper(
      onTap: onTap,
      borderRadius: 30,
      child: Container(
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: emblemColor.withValues(alpha: 0.18),
              blurRadius: 30,
              offset: const Offset(0, 16),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Stack(
            fit: StackFit.expand,
            children: [
              PremiumNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x18000000),
                      Color(0x77000000),
                      Color(0xE6020617),
                    ],
                  ),
                ),
              ),
              if (chipLabel != null)
                Positioned(
                  top: 16,
                  left: 16,
                  child: PremiumImageChip(label: chipLabel!, color: chipColor),
                ),
              _EmblemPositioned(
                position: emblemPosition,
                child: PremiumImageEmblem(icon: emblemIcon, color: emblemColor),
              ),
              Positioned(
                left: 18,
                right: 18,
                bottom: 18,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            height: 1.05,
                          ),
                    ),
                    const SizedBox(height: 9),
                    Text(
                      subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white.withValues(alpha: 0.78),
                        height: 1.45,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PremiumRankImageCard extends StatelessWidget {
  final String imageUrl;
  final String rank;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback? onTap;

  const PremiumRankImageCard({
    super.key,
    required this.imageUrl,
    required this.rank,
    required this.title,
    required this.subtitle,
    this.color = const Color(0xFFF8D66D),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _CardTapWrapper(
      onTap: onTap,
      borderRadius: 26,
      child: Container(
        height: 160,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          color: Colors.white.withValues(
            alpha: Theme.of(context).brightness == Brightness.dark
                ? 0.07
                : 0.72,
          ),
          border: Border.all(color: color.withValues(alpha: 0.24)),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.12),
              blurRadius: 24,
              offset: const Offset(0, 14),
            ),
          ],
        ),
        child: Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                PremiumNetworkImage(
                  imageUrl: imageUrl,
                  width: 118,
                  height: double.infinity,
                  borderRadius: BorderRadius.circular(20),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: -6,
                  left: -6,
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [color, color.withValues(alpha: 0.62)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: color.withValues(alpha: 0.34),
                          blurRadius: 18,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        rank,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                      height: 1.12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: _mutedColor(context),
                      height: 1.4,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PremiumAuthorImageCard extends StatelessWidget {
  final String imageUrl;
  final String avatarUrl;
  final String authorName;
  final String readTime;
  final String title;
  final String? chipLabel;
  final Color chipColor;
  final VoidCallback? onTap;

  const PremiumAuthorImageCard({
    super.key,
    required this.imageUrl,
    required this.avatarUrl,
    required this.authorName,
    required this.readTime,
    required this.title,
    this.chipLabel,
    this.chipColor = const Color(0xFF22C55E),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _CardTapWrapper(
      onTap: onTap,
      borderRadius: 28,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: Colors.white.withValues(
            alpha: Theme.of(context).brightness == Brightness.dark
                ? 0.07
                : 0.72,
          ),
          border: Border.all(
            color: Colors.white.withValues(
              alpha: Theme.of(context).brightness == Brightness.dark
                  ? 0.10
                  : 0.84,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 24,
              offset: const Offset(0, 14),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                PremiumNetworkImage(
                  imageUrl: imageUrl,
                  width: double.infinity,
                  height: 185,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(28),
                  ),
                  fit: BoxFit.cover,
                ),
                if (chipLabel != null)
                  Positioned(
                    top: 14,
                    left: 14,
                    child: PremiumImageChip(
                      label: chipLabel!,
                      color: chipColor,
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                      height: 1.12,
                      letterSpacing: -0.4,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      PremiumNetworkImage(
                        imageUrl: avatarUrl,
                        width: 34,
                        height: 34,
                        borderRadius: BorderRadius.circular(999),
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          authorName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(fontWeight: FontWeight.w800),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        readTime,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: _mutedColor(context),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PremiumStatsImageCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String value;
  final String change;
  final bool isPositive;
  final String? chipLabel;
  final VoidCallback? onTap;

  const PremiumStatsImageCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.value,
    required this.change,
    required this.isPositive,
    this.chipLabel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isPositive
        ? const Color(0xFF22C55E)
        : const Color(0xFFFB7185);

    return _CardTapWrapper(
      onTap: onTap,
      borderRadius: 28,
      child: Container(
        height: 210,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.14),
              blurRadius: 26,
              offset: const Offset(0, 14),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: Stack(
            fit: StackFit.expand,
            children: [
              PremiumNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xE6020617),
                      Color(0x99020617),
                      Color(0x44020617),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (chipLabel != null)
                      PremiumImageChip(
                        label: chipLabel!,
                        color: color,
                        icon: isPositive
                            ? Icons.trending_up_rounded
                            : Icons.trending_down_rounded,
                      ),
                    const Spacer(),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withValues(alpha: 0.72),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      value,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -1,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      change,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: color,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PremiumHorizontalImageCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String? chipLabel;
  final Color chipColor;
  final VoidCallback? onTap;

  const PremiumHorizontalImageCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    this.chipLabel,
    this.chipColor = const Color(0xFF22C55E),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _CardTapWrapper(
      onTap: onTap,
      borderRadius: 24,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white.withValues(
            alpha: Theme.of(context).brightness == Brightness.dark
                ? 0.07
                : 0.72,
          ),
          border: Border.all(
            color: Colors.white.withValues(
              alpha: Theme.of(context).brightness == Brightness.dark
                  ? 0.10
                  : 0.84,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 22,
              offset: const Offset(0, 14),
            ),
          ],
        ),
        child: Row(
          children: [
            PremiumNetworkImage(
              imageUrl: imageUrl,
              width: 108,
              height: 108,
              borderRadius: BorderRadius.circular(18),
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (chipLabel != null) ...[
                    PremiumImageChip(label: chipLabel!, color: chipColor),
                    const SizedBox(height: 10),
                  ],
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.25,
                      height: 1.12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: _mutedColor(context),
                      height: 1.4,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PremiumPromoImageCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String actionLabel;
  final String? chipLabel;
  final Color chipColor;
  final VoidCallback? onTap;

  const PremiumPromoImageCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.actionLabel,
    this.chipLabel,
    this.chipColor = const Color(0xFF8B5CF6),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _CardTapWrapper(
      onTap: onTap,
      borderRadius: 28,
      child: Container(
        height: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.16),
              blurRadius: 28,
              offset: const Offset(0, 16),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: Stack(
            fit: StackFit.expand,
            children: [
              PremiumNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xE6020617),
                      Color(0xA6020617),
                      Color(0x33020617),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (chipLabel != null)
                      PremiumImageChip(label: chipLabel!, color: chipColor),
                    const Spacer(),
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            height: 1.05,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withValues(alpha: 0.82),
                        height: 1.45,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 14),
                    _PromoActionChip(label: actionLabel),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PremiumGalleryImageCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String? chipLabel;
  final Color chipColor;
  final VoidCallback? onTap;

  const PremiumGalleryImageCard({
    super.key,
    required this.imageUrl,
    required this.title,
    this.chipLabel,
    this.chipColor = const Color(0xFFFB7185),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _CardTapWrapper(
      onTap: onTap,
      borderRadius: 24,
      child: Container(
        width: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white.withValues(
            alpha: Theme.of(context).brightness == Brightness.dark
                ? 0.07
                : 0.72,
          ),
          border: Border.all(
            color: Colors.white.withValues(
              alpha: Theme.of(context).brightness == Brightness.dark
                  ? 0.10
                  : 0.84,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 22,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  PremiumNetworkImage(
                    imageUrl: imageUrl,
                    width: double.infinity,
                    height: 150,
                    borderRadius: BorderRadius.circular(18),
                    fit: BoxFit.cover,
                  ),
                  if (chipLabel != null)
                    Positioned(
                      top: 10,
                      left: 10,
                      child: PremiumImageChip(
                        label: chipLabel!,
                        color: chipColor,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                  height: 1.16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmblemPositioned extends StatelessWidget {
  final PremiumCardEmblemPosition position;
  final Widget child;

  const _EmblemPositioned({required this.position, required this.child});

  @override
  Widget build(BuildContext context) {
    switch (position) {
      case PremiumCardEmblemPosition.topLeft:
        return Positioned(top: 16, left: 16, child: child);
      case PremiumCardEmblemPosition.topRight:
        return Positioned(top: 16, right: 16, child: child);
      case PremiumCardEmblemPosition.bottomLeft:
        return Positioned(bottom: 16, left: 16, child: child);
      case PremiumCardEmblemPosition.bottomRight:
        return Positioned(bottom: 16, right: 16, child: child);
    }
  }
}

class _CardTapWrapper extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double borderRadius;

  const _CardTapWrapper({
    required this.child,
    required this.onTap,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    if (onTap == null) return child;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        child: child,
      ),
    );
  }
}

class _GlassMiniLabel extends StatelessWidget {
  final String label;

  const _GlassMiniLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            color: Colors.white.withValues(alpha: 0.14),
            border: Border.all(color: Colors.white.withValues(alpha: 0.20)),
          ),
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}

class _PromoActionChip extends StatelessWidget {
  final String label;

  const _PromoActionChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: Colors.white.withValues(alpha: 0.12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

Color _mutedColor(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  return isDark
      ? Colors.white.withValues(alpha: 0.58)
      : Colors.black.withValues(alpha: 0.52);
}
