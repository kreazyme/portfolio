import 'package:example_template/common/theme.dart';
import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderColor = isDark ? AppTheme.brutalWhite : AppTheme.brutalBlack;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 48),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.cardDark : AppTheme.brutalWhite,
        border: Border(
          top: BorderSide(color: borderColor, width: 4),
          bottom: BorderSide(color: borderColor, width: 4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context, isDark, borderColor),
          const SizedBox(height: 32),
          _buildSkills(context, isDark, borderColor),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark, Color borderColor) {
    return Container(
      padding: const EdgeInsets.only(bottom: 4, right: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: borderColor, width: 2)),
      ),
      child: Text(
        'TECH ARSENAL',
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
        ),
      ),
    );
  }

  Widget _buildSkills(BuildContext context, bool isDark, Color borderColor) {
    final skills = [
      'Flutter',
      'Dart',
      'Firebase',
      'REST APIs',
      'State Management',
      'Git',
      'CI/CD',
      'Material Design',
      'iOS',
      'Android',
      'UI/UX',
      'Clean Architecture',
    ];

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: skills.asMap().entries.map((entry) {
        final index = entry.key;
        final skill = entry.value;
        final isHighlighted = index == 0 || index == 3 || index == 7;

        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: isHighlighted
                  ? AppTheme.primaryPurple
                  : (isDark
                        ? AppTheme.backgroundDark
                        : AppTheme.backgroundLight),
              border: Border.all(color: borderColor, width: 2),
              borderRadius: BorderRadius.circular(8),
              boxShadow: AppTheme.brutalShadow(isDark),
            ),
            child: Text(
              skill,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: isHighlighted ? AppTheme.brutalWhite : null,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
