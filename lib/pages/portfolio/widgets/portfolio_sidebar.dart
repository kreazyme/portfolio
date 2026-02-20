import 'package:example_template/common/theme.dart';
import 'package:flutter/material.dart';

class PortfolioSidebar extends StatelessWidget {
  const PortfolioSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderColor = isDark ? AppTheme.brutalWhite : AppTheme.brutalBlack;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppTheme.backgroundDark : AppTheme.brutalWhite,
        border: Border(
          right: BorderSide(color: borderColor, width: 4),
          bottom: BorderSide(color: borderColor, width: 4),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildProfile(context, isDark, borderColor),
                  const SizedBox(height: 32),
                  _buildNavigation(context, isDark, borderColor),
                ],
              ),
            ),
          ),
          _buildFooter(context, isDark, borderColor),
        ],
      ),
    );
  }

  Widget _buildProfile(BuildContext context, bool isDark, Color borderColor) {
    return Column(
      children: [
        // Avatar
        Stack(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: borderColor, width: 2),
                boxShadow: AppTheme.brutalShadow(isDark),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://avatars.githubusercontent.com/u/yourusername',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppTheme.primaryPurple,
                  shape: BoxShape.circle,
                  border: Border.all(color: borderColor, width: 2),
                ),
                child: Icon(Icons.code, size: 16, color: AppTheme.brutalWhite),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Name
        Text(
          'THONG TRAN',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w900,
            letterSpacing: -0.5,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        // Role Badge
        Transform.rotate(
          angle: -0.05,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: AppTheme.primaryPurple,
              border: Border.all(color: borderColor, width: 2),
            ),
            child: Text(
              'MOBILE DEV',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppTheme.brutalWhite,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavigation(
    BuildContext context,
    bool isDark,
    Color borderColor,
  ) {
    final menuItems = [
      {'icon': Icons.home, 'label': 'Home', 'active': true},
      {'icon': Icons.person, 'label': 'About', 'active': false},
      {'icon': Icons.description, 'label': 'Resume', 'active': false},
      {'icon': Icons.grid_view, 'label': 'Portfolio', 'active': false},
      {'icon': Icons.edit_note, 'label': 'Blog', 'active': false},
      {'icon': Icons.mail, 'label': 'Contact', 'active': false},
    ];

    return Column(
      children: menuItems.map((item) {
        final isActive = item['active'] as bool;
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildNavItem(
            context,
            isDark,
            borderColor,
            item['icon'] as IconData,
            item['label'] as String,
            isActive,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    bool isDark,
    Color borderColor,
    IconData icon,
    String label,
    bool isActive,
  ) {
    if (isActive) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isDark ? AppTheme.cardDark : AppTheme.backgroundLight,
          border: Border.all(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(8),
          boxShadow: AppTheme.brutalShadow(isDark),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label.toUpperCase(),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            Icon(Icons.arrow_forward, size: 18),
          ],
        ),
      );
    }

    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 12),
            Text(
              label.toUpperCase(),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context, bool isDark, Color borderColor) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark
            ? AppTheme.backgroundDark
            : AppTheme.primaryPurple.withOpacity(0.05),
        border: Border(top: BorderSide(color: borderColor, width: 2)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialButton(context, isDark, borderColor, Icons.code),
              const SizedBox(width: 16),
              _buildSocialButton(context, isDark, borderColor, Icons.email),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style:
                  ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: AppTheme.primaryPurple,
                    foregroundColor: AppTheme.brutalWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: borderColor, width: 2),
                    ),
                    elevation: 0,
                    shadowColor: Colors.transparent,
                  ).copyWith(
                    overlayColor: WidgetStateProperty.all(
                      AppTheme.brutalWhite.withOpacity(0.1),
                    ),
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'DOWNLOAD CV',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppTheme.brutalWhite,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.download, size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(
    BuildContext context,
    bool isDark,
    Color borderColor,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.backgroundDark : AppTheme.brutalWhite,
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, size: 20),
    );
  }
}
