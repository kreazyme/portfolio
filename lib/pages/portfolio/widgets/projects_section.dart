import 'package:example_template/common/theme.dart';
import 'package:flutter/material.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderColor = isDark ? AppTheme.brutalWhite : AppTheme.brutalBlack;

    return Container(
      padding: const EdgeInsets.all(48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context, isDark, borderColor),
          const SizedBox(height: 48),
          _buildProjectsGrid(context, isDark, borderColor),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark, Color borderColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SELECTED WORK',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.w900,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 8),
        Container(height: 8, width: 96, color: AppTheme.primaryPurple),
        const SizedBox(height: 16),
        Text(
          'Showcasing my best projects that combine beautiful design with powerful functionality',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: isDark ? Colors.grey[400] : Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildProjectsGrid(
    BuildContext context,
    bool isDark,
    Color borderColor,
  ) {
    final projects = [
      {
        'title': 'E-Commerce App',
        'subtitle': 'Flutter & Firebase',
        'tags': ['Flutter', 'Firebase', 'Stripe'],
        'image':
            'https://images.unsplash.com/photo-1563013544-824ae1b704d3?w=600',
      },
      {
        'title': 'Fintech Dashboard',
        'subtitle': 'Full Stack Development',
        'tags': ['Flutter', 'Node.js', 'PostgreSQL'],
        'image':
            'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=600',
      },
      {
        'title': 'Fitness Tracker',
        'subtitle': 'Mobile App Design',
        'tags': ['Flutter', 'UI/UX', 'HealthKit'],
        'image':
            'https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?w=600',
      },
      {
        'title': 'View All Projects',
        'subtitle': null,
        'tags': null,
        'image': null,
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 900 ? 2 : 1;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 32,
            mainAxisSpacing: 32,
            childAspectRatio: 0.85,
          ),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final project = projects[index];
            if (project['image'] == null) {
              return _buildViewAllCard(context, isDark, borderColor);
            }
            return _buildProjectCard(
              context,
              isDark,
              borderColor,
              project['title'] as String,
              project['subtitle'] as String,
              project['tags'] as List<String>,
              project['image'] as String,
            );
          },
        );
      },
    );
  }

  Widget _buildProjectCard(
    BuildContext context,
    bool isDark,
    Color borderColor,
    String title,
    String subtitle,
    List<String> tags,
    String imageUrl,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: isDark ? AppTheme.cardDark : AppTheme.brutalWhite,
            border: Border.all(color: borderColor, width: 4),
            borderRadius: BorderRadius.circular(12),
            boxShadow: AppTheme.brutalShadow(isDark),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    border: Border(
                      bottom: BorderSide(color: borderColor, width: 4),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Content
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: Theme.of(context).textTheme.titleLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: -0.5,
                                      ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  subtitle,
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        color: isDark
                                            ? Colors.grey[400]
                                            : Colors.grey[600],
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Transform.rotate(
                            angle: -0.785,
                            child: Icon(
                              Icons.arrow_forward,
                              size: 32,
                              color: borderColor,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: tags.map((tag) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: isDark
                                  ? AppTheme.backgroundDark
                                  : AppTheme.backgroundLight,
                              border: Border.all(color: borderColor, width: 2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              tag,
                              style: Theme.of(context).textTheme.labelSmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildViewAllCard(
    BuildContext context,
    bool isDark,
    Color borderColor,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.primaryPurple,
            border: Border.all(color: borderColor, width: 4),
            borderRadius: BorderRadius.circular(12),
            boxShadow: AppTheme.brutalShadow(isDark),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'VIEW ALL\nPROJECTS',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: AppTheme.brutalWhite,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDark ? AppTheme.brutalWhite : AppTheme.brutalBlack,
                  shape: BoxShape.circle,
                  border: Border.all(color: borderColor, width: 2),
                ),
                child: Icon(
                  Icons.arrow_forward,
                  size: 32,
                  color: isDark ? AppTheme.brutalBlack : AppTheme.brutalWhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
