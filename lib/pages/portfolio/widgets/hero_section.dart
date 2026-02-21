import 'package:example_template/common/theme.dart';
import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderColor = isDark ? AppTheme.brutalWhite : AppTheme.brutalBlack;
    final size = MediaQuery.of(context).size;

    return Container(
      constraints: BoxConstraints(minHeight: size.height * 0.9),
      padding: const EdgeInsets.all(48),
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isLarge = constraints.maxWidth > 900;
            return isLarge
                ? _buildLargeLayout(context, isDark, borderColor)
                : _buildSmallLayout(context, isDark, borderColor);
          },
        ),
      ),
    );
  }

  Widget _buildLargeLayout(
    BuildContext context,
    bool isDark,
    Color borderColor,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 6, child: _buildContent(context, isDark, borderColor)),
        const SizedBox(width: 48),
        Expanded(flex: 4, child: _buildHeroImage(context, isDark, borderColor)),
      ],
    );
  }

  Widget _buildSmallLayout(
    BuildContext context,
    bool isDark,
    Color borderColor,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildContent(context, isDark, borderColor),
        const SizedBox(height: 48),
        _buildHeroImage(context, isDark, borderColor),
      ],
    );
  }

  Widget _buildContent(BuildContext context, bool isDark, Color borderColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Available for hire badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isDark ? AppTheme.cardDark : AppTheme.brutalWhite,
            border: Border.all(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppTheme.primaryPurple,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'AVAILABLE FOR HIRE',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        // Main heading
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.w900,
              height: 0.9,
              letterSpacing: -2,
            ),
            children: [
              const TextSpan(text: 'I BUILD\n'),
              TextSpan(
                text: 'DIGITAL\n',
                style: TextStyle(
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2
                    ..color = borderColor,
                ),
              ),
              const TextSpan(text: 'EXPERIENCES'),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Description
        Container(
          padding: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: AppTheme.primaryPurple, width: 4),
            ),
          ),
          child: Text(
            'Hi, I am a Software Engineer with 3+ years of exper iences, focusing on Flutter and React Native - modern cross plassform frame-works. Now I am living in Đà Nẵng city and I’d love to create some community products. I’m also open to working with others who share the same mindset, so we can build and launch meaningful products together.',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: isDark ? Colors.grey[300] : Colors.grey[700],
              height: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 32),
        // CTA Buttons
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 20,
                ),
                backgroundColor: isDark
                    ? AppTheme.brutalWhite
                    : AppTheme.brutalBlack,
                foregroundColor: isDark
                    ? AppTheme.brutalBlack
                    : AppTheme.brutalWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: borderColor, width: 2),
                ),
                elevation: 0,
              ),
              child: Text(
                'VIEW MY WORK',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: isDark ? AppTheme.brutalBlack : AppTheme.brutalWhite,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 20,
                ),
                side: BorderSide(color: borderColor, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "LET'S TALK",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward, size: 18),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeroImage(BuildContext context, bool isDark, Color borderColor) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Background accent box
        Positioned(
          bottom: -24,
          left: -24,
          child: Container(
            width: 300,
            height: 400,
            decoration: BoxDecoration(
              border: Border.all(color: AppTheme.primaryPurple, width: 4),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        // Main image container
        Container(
          width: 300,
          height: 400,
          decoration: BoxDecoration(
            color: isDark ? AppTheme.cardDark : AppTheme.brutalWhite,
            border: Border.all(color: borderColor, width: 4),
            borderRadius: BorderRadius.circular(12),
            boxShadow: AppTheme.brutalShadowLarge(isDark),
            image: const DecorationImage(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1618477388954-7852f32655ec?w=400',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              // Top left badge
              Positioned(
                top: 16,
                left: 16,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isDark ? AppTheme.brutalBlack : AppTheme.brutalWhite,
                    border: Border.all(color: borderColor, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.flutter_dash, size: 32),
                ),
              ),
              // Bottom right badge
              Positioned(
                bottom: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryPurple,
                    border: Border.all(color: borderColor, width: 2),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: AppTheme.brutalShadow(isDark),
                  ),
                  child: Text(
                    '5+ YEARS',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppTheme.brutalWhite,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
