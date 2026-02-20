import 'package:example_template/common/theme.dart';
import 'package:flutter/material.dart';

class BlogSection extends StatelessWidget {
  const BlogSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderColor = isDark ? AppTheme.brutalWhite : AppTheme.brutalBlack;

    return Container(
      padding: const EdgeInsets.all(48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'LATEST FROM THE BLOG',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w900,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 48),
          _buildBlogArticles(context, isDark, borderColor),
        ],
      ),
    );
  }

  Widget _buildBlogArticles(
    BuildContext context,
    bool isDark,
    Color borderColor,
  ) {
    final articles = [
      {
        'day': '15',
        'month': 'FEB',
        'title': 'Building Beautiful Flutter Apps with Neobrutalism',
        'description':
            'Exploring how to create stunning mobile interfaces using bold borders and striking shadows.',
      },
      {
        'day': '02',
        'month': 'FEB',
        'title': 'State Management in Flutter: A Practical Guide',
        'description':
            'A deep dive into different state management approaches and when to use each one.',
      },
    ];

    return Column(
      children: articles.map((article) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: _buildBlogCard(
            context,
            isDark,
            borderColor,
            article['day'] as String,
            article['month'] as String,
            article['title'] as String,
            article['description'] as String,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBlogCard(
    BuildContext context,
    bool isDark,
    Color borderColor,
    String day,
    String month,
    String title,
    String description,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: isDark ? AppTheme.cardDark : AppTheme.brutalWhite,
            border: Border.all(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isLarge = constraints.maxWidth > 600;
              return isLarge
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildDate(context, isDark, borderColor, day, month),
                        const SizedBox(width: 24),
                        Expanded(
                          child: _buildContent(
                            context,
                            isDark,
                            title,
                            description,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDate(context, isDark, borderColor, day, month),
                        const SizedBox(height: 16),
                        _buildContent(context, isDark, title, description),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildDate(
    BuildContext context,
    bool isDark,
    Color borderColor,
    String day,
    String month,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(right: BorderSide(color: borderColor, width: 2)),
      ),
      child: Column(
        children: [
          Text(
            day,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w900,
              color: AppTheme.primaryPurple,
            ),
          ),
          Text(
            month,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    bool isDark,
    String title,
    String description,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: isDark ? Colors.grey[300] : Colors.grey[600],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Read Article',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            decorationColor: AppTheme.primaryPurple,
            decorationThickness: 2,
          ),
        ),
      ],
    );
  }
}
