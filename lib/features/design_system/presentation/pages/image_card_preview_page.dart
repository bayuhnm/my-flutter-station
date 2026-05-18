import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/widgets/app_background.dart';
import '../widgets/image_card_widgets.dart';

class ImageCardPreviewPage extends StatelessWidget {
  const ImageCardPreviewPage({super.key});

  static const _blue = Color(0xFF38BDF8);
  static const _gold = Color(0xFFF8D66D);
  static const _purple = Color(0xFF8B5CF6);
  static const _green = Color(0xFF22C55E);
  static const _pink = Color(0xFFFB7185);
  static const _dark = Color(0xFF020617);

  static const _heroImage =
      'https://images.unsplash.com/photo-1639322537228-f710d846310a?auto=format&fit=crop&w=1200&q=80';

  static const _articleImage =
      'https://images.unsplash.com/photo-1640161704729-cbe966a08476?auto=format&fit=crop&w=1200&q=80';

  static const _promoImage =
      'https://images.unsplash.com/photo-1621761191319-c6fb62004040?auto=format&fit=crop&w=1200&q=80';

  static const _gallery1 =
      'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?auto=format&fit=crop&w=1200&q=80';

  static const _gallery2 =
      'https://images.unsplash.com/photo-1526628953301-3e589a6a8b74?auto=format&fit=crop&w=1200&q=80';

  static const _gallery3 =
      'https://images.unsplash.com/photo-1559526324-593bc073d938?auto=format&fit=crop&w=1200&q=80';

  static const _gallery4 =
      'https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&w=1200&q=80';

  static const _avatar =
      'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=300&q=80';

  void _onTap(BuildContext context, String label) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$label tapped'),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? _dark
          : const Color(0xFFF6F9FF),
      body: AppBackground(
        child: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(22, 18, 22, 28),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _Header(onBack: () => Navigator.pop(context)),

                    const SizedBox(height: 28),

                    const _HeroCard(),

                    const SizedBox(height: 28),

                    const _SectionTitle(
                      title: 'Featured Image Cards',
                      subtitle:
                          'Large image cards for highlight content, article promotion, and premium campaign section.',
                    ),

                    const SizedBox(height: 14),

                    PremiumFeaturedImageCard(
                      imageUrl: _heroImage,
                      title:
                          'Bitcoin Momentum Returns With Luxury Bullish Setup',
                      subtitle:
                          'A bold premium featured card for hero content, top article, or banner showcase.',
                      chipLabel: 'Featured',
                      chipColor: _gold,
                      tag: 'Top Story',
                      onTap: () => _onTap(context, 'Featured card'),
                    ),

                    const SizedBox(height: 14),

                    PremiumArticleImageCard(
                      imageUrl: _articleImage,
                      category: 'Market Insight',
                      title:
                          'Ethereum ecosystem continues to attract strong institutional interest',
                      date: '16 May 2026',
                      excerpt:
                          'Use this card for article list, research content, market summary, and premium blog feed.',
                      chipLabel: 'Hot',
                      chipColor: _blue,
                      onTap: () => _onTap(context, 'Article card'),
                    ),

                    const SizedBox(height: 14),

                    PremiumPromoImageCard(
                      imageUrl: _promoImage,
                      title: 'Unlock Pro Trading Access',
                      description:
                          'Premium promotional image card with CTA styling for campaigns and upsell sections.',
                      actionLabel: 'Explore Now',
                      chipLabel: 'Premium',
                      chipColor: _purple,
                      onTap: () => _onTap(context, 'Promo card'),
                    ),

                    const SizedBox(height: 28),

                    const _SectionTitle(
                      title: 'Mixed Card Variants',
                      subtitle:
                          'Variasi card: tanpa chip, dengan emblem, rank badge, author meta, dan stats overlay.',
                    ),

                    const SizedBox(height: 14),

                    PremiumCleanImageCard(
                      imageUrl: _gallery1,
                      title: 'Clean Editorial Card Without Chip',
                      subtitle:
                          'A simple premium card without chip or badge. Useful for clean article layout.',
                      onTap: () => _onTap(context, 'Clean card'),
                    ),

                    const SizedBox(height: 14),

                    PremiumEmblemImageCard(
                      imageUrl: _gallery2,
                      title: 'Diamond Market Insight',
                      subtitle:
                          'Image card with floating emblem, optional chip, and luxury overlay treatment.',
                      chipLabel: 'Emblem',
                      chipColor: _blue,
                      emblemIcon: Icons.diamond_rounded,
                      emblemColor: _gold,
                      emblemPosition: PremiumCardEmblemPosition.topRight,
                      onTap: () => _onTap(context, 'Emblem card'),
                    ),

                    const SizedBox(height: 14),

                    PremiumEmblemImageCard(
                      imageUrl: _promoImage,
                      title: 'Verified Strategy Report',
                      subtitle:
                          'Another emblem card without chip, showing flexible visual hierarchy.',
                      emblemIcon: Icons.verified_rounded,
                      emblemColor: _green,
                      emblemPosition: PremiumCardEmblemPosition.bottomRight,
                      onTap: () => _onTap(context, 'Verified emblem card'),
                    ),

                    const SizedBox(height: 14),

                    PremiumRankImageCard(
                      imageUrl: _gallery3,
                      rank: '#1',
                      title: 'Top Performing Crypto Asset',
                      subtitle:
                          'Rank card style for leaderboard, trending list, popular article, or top collection.',
                      color: _gold,
                      onTap: () => _onTap(context, 'Rank card'),
                    ),

                    const SizedBox(height: 14),

                    PremiumAuthorImageCard(
                      imageUrl: _articleImage,
                      avatarUrl: _avatar,
                      authorName: 'Crypto Research Desk',
                      readTime: '4 min read',
                      title:
                          'How premium dashboards communicate trust through visual hierarchy',
                      chipLabel: 'Editorial',
                      chipColor: _green,
                      onTap: () => _onTap(context, 'Author card'),
                    ),

                    const SizedBox(height: 14),

                    PremiumStatsImageCard(
                      imageUrl: _heroImage,
                      title: 'Portfolio Growth',
                      value: '+42.80%',
                      change: '+12.48% this week',
                      isPositive: true,
                      chipLabel: 'Live Stats',
                      onTap: () => _onTap(context, 'Stats card positive'),
                    ),

                    const SizedBox(height: 14),

                    PremiumStatsImageCard(
                      imageUrl: _gallery4,
                      title: 'Market Drawdown',
                      value: '-8.24%',
                      change: '-2.10% today',
                      isPositive: false,
                      chipLabel: 'Risk Alert',
                      onTap: () => _onTap(context, 'Stats card negative'),
                    ),

                    const SizedBox(height: 28),

                    const _SectionTitle(
                      title: 'Horizontal Cards',
                      subtitle:
                          'Perfect for list item, recent activity, market content, article item, or portfolio insight.',
                    ),

                    const SizedBox(height: 14),

                    PremiumHorizontalImageCard(
                      imageUrl: _gallery1,
                      title: 'Crypto Research Weekly',
                      subtitle:
                          'Modern horizontal card with image, title, summary, and optional chip.',
                      chipLabel: 'Research',
                      chipColor: _green,
                      onTap: () => _onTap(context, 'Horizontal card chip'),
                    ),

                    const SizedBox(height: 14),

                    PremiumHorizontalImageCard(
                      imageUrl: _gallery2,
                      title: 'Portfolio Rebalancing Strategy',
                      subtitle:
                          'Horizontal card without chip for simple and clean list item design.',
                      onTap: () => _onTap(context, 'Horizontal card no chip'),
                    ),

                    const SizedBox(height: 28),

                    const _SectionTitle(
                      title: 'Gallery Cards',
                      subtitle:
                          'Compact image card styles with or without chip for grid, slider, and gallery content.',
                    ),

                    const SizedBox(height: 14),

                    SizedBox(
                      height: 250,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          PremiumGalleryImageCard(
                            imageUrl: _gallery1,
                            title: 'With Chip Gallery Card',
                            chipLabel: 'Studio',
                            chipColor: _blue,
                            onTap: () => _onTap(context, 'Gallery with chip'),
                          ),
                          const SizedBox(width: 14),
                          PremiumGalleryImageCard(
                            imageUrl: _gallery2,
                            title: 'No Chip Gallery Card',
                            onTap: () =>
                                _onTap(context, 'Gallery without chip'),
                          ),
                          const SizedBox(width: 14),
                          PremiumGalleryImageCard(
                            imageUrl: _gallery3,
                            title: 'Finance Workspace',
                            chipLabel: 'Finance',
                            chipColor: _gold,
                            onTap: () => _onTap(context, 'Gallery finance'),
                          ),
                          const SizedBox(width: 14),
                          PremiumGalleryImageCard(
                            imageUrl: _gallery4,
                            title: 'Analytics Dashboard',
                            chipLabel: 'Analytics',
                            chipColor: _pink,
                            onTap: () => _onTap(context, 'Gallery analytics'),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    const _FooterCard(),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onBack;

  const _Header({required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _GlassIconButton(icon: Icons.arrow_back_rounded, onTap: onBack),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShaderMask(
                shaderCallback: (bounds) {
                  return const LinearGradient(
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFF38BDF8),
                      Color(0xFFF8D66D),
                    ],
                  ).createShader(bounds);
                },
                child: Text(
                  'Image Card Showcase',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.6,
                  ),
                ),
              ),
              const SizedBox(height: 3),
              Text(
                'Premium image card collection with chips, emblems and stats',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: _mutedColor(context),
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

class _HeroCard extends StatelessWidget {
  const _HeroCard();

  static const _blue = Color(0xFF38BDF8);
  static const _gold = Color(0xFFF8D66D);

  @override
  Widget build(BuildContext context) {
    return _GlassPanel(
      padding: EdgeInsets.zero,
      borderRadius: 36,
      child: Stack(
        children: [
          Positioned(
            top: -90,
            right: -80,
            child: _BlurOrb(size: 220, color: _gold.withValues(alpha: 0.22)),
          ),
          Positioned(
            bottom: -110,
            left: -90,
            child: _BlurOrb(size: 220, color: _blue.withValues(alpha: 0.22)),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: Icon(
              Icons.photo_library_rounded,
              size: 100,
              color: Colors.white.withValues(
                alpha: Theme.of(context).brightness == Brightness.dark
                    ? 0.035
                    : 0.16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _Badge(
                  label: 'Image Card Library',
                  icon: Icons.image_rounded,
                  color: _gold,
                ),
                const SizedBox(height: 24),
                Text(
                  'Luxury cards\nwith rich variants.',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    height: 0.98,
                    letterSpacing: -1.4,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'Reusable network image cards for article feed, marketing banner, research content, featured news, gallery, stats overlay, and premium card layouts.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.55,
                    color: _mutedColor(context),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SectionTitle({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: _mutedColor(context),
            height: 1.4,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _FooterCard extends StatelessWidget {
  const _FooterCard();

  @override
  Widget build(BuildContext context) {
    return _GlassPanel(
      borderRadius: 30,
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: const Color(0xFF38BDF8).withValues(alpha: 0.12),
              border: Border.all(
                color: const Color(0xFF38BDF8).withValues(alpha: 0.28),
              ),
            ),
            child: const Icon(
              Icons.tips_and_updates_rounded,
              color: Color(0xFF38BDF8),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              'These cards are reusable for news feed, campaign banner, research content, leaderboard, stats section, and image slider.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                height: 1.42,
                color: _mutedColor(context),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GlassPanel extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;

  const _GlassPanel({
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.borderRadius = 28,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 22, sigmaY: 22),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: Colors.white.withValues(alpha: isDark ? 0.075 : 0.72),
            border: Border.all(
              color: Colors.white.withValues(alpha: isDark ? 0.12 : 0.86),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.34 : 0.08),
                blurRadius: 34,
                offset: const Offset(0, 18),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}

class _GlassIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _GlassIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Material(
          color: Colors.white.withValues(alpha: isDark ? 0.08 : 0.68),
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.white.withValues(alpha: isDark ? 0.12 : 0.82),
                ),
              ),
              child: Icon(icon),
            ),
          ),
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const _Badge({required this.label, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.28)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 7),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

class _BlurOrb extends StatelessWidget {
  final double size;
  final Color color;

  const _BlurOrb({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 58, sigmaY: 58),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
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
