import 'dart:developer';

import 'package:example_template/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
        'title': 'SharingHub',
        'description':
            'A charity community app integrating Google Maps and Firebase for sharing and local support.',
        'tags': [
          'Flutter',
          'Google Maps',
          'ExpressJS',
          'flutter_bloc',
          'flutter_gen',
          'Flavor',
        ],
        'image':
            'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=900',
        'link': 'https://github.com/dscdut/sharinghub',
      },
      {
        'title': 'Image Edit App',
        'description':
            'An app that adds trending frames to photos with minimal editing, available on Google Play and App Store.',
        'tags': ['Flutter', 'Firebase', 'RevenueCat'],
        'image':
            'https://images.unsplash.com/photo-1500534314209-a25ddb2bd429?w=900',
        'link':
            'https://play.google.com/store/apps/details?id=spoon.app.frame_it',
      },
      {
        'title': 'Chuyển tọa độ',
        'description': 'Convert VN-2000 location coordinates to WGS-84.',
        'tags': ['Flutter'],
        'image':
            'https://images.unsplash.com/photo-1500534623283-312aade485b7?w=900',
        'link':
            'https://play.google.com/store/apps/details?id=spoon.app.chuyen_toa_do',
      },
      {
        'title': 'Pay Cutter',
        'description':
            'Capstone project for splitting bills within a group with a smooth collaboration flow.',
        'tags': ['Flutter', 'ExpressJS', 'GCP'],
        'image':
            'https://images.unsplash.com/photo-1450101499163-c8848c66ca85?w=900',
        'link': 'https://github.com/kreazyme/pay_cutter',
      },
      {
        'title': 'Bus App',
        'description':
            'Redesigned a bus website into a user-friendly mobile experience with WebView.',
        'tags': ['Flutter', 'Bloc', 'WebView'],
        'image':
            'https://images.unsplash.com/photo-1500534314209-a25ddb2bd429?w=900',
        'link': 'https://example.com/bus-app',
      },
      {
        'title': 'Attendance App',
        'description':
            'Attendance app with location check-in, announcements, and analytics via charts and WebSocket.',
        'tags': ['Flutter', 'Bloc', 'flutter_chart', 'Location', 'WebSocket'],
        'image':
            'https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=900',
        'link': 'https://example.com/attendance-app',
      },
      {
        'title': 'Travel App',
        'description':
            'Booking app for hotels with payment, camera capture, and social sharing features.',
        'tags': ['React Native', 'Redux', 'Async Storage', 'Stripe', 'Camera'],
        'image':
            'https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?w=900',
        'link': 'https://example.com/travel-app',
      },
      {
        'title': 'Trash Collecting App',
        'description':
            'A garbage collection app with real-time tracking and detailed waste info capture.',
        'tags': ['Flutter', 'Camera', 'Google Maps', 'RxDart'],
        'image':
            'https://images.unsplash.com/photo-1450101499163-c8848c66ca85?w=900',
        'link': 'https://example.com/trash-collecting-app',
      },
      {
        'title': 'Point App',
        'description':
            'Points collection app for urban tourism with QR scanning and payment integrations.',
        'tags': [
          'React Native',
          'RTK Query',
          'Async Storage',
          'Stripe',
          'PayPay',
          'Biometrics',
        ],
        'image':
            'https://images.unsplash.com/photo-1489515217757-5fd1be406fef?w=900',
        'link': 'https://example.com/point-app',
      },
      {
        'title': 'Resource Manage App',
        'description':
            'Internal super app for HR management, kudos, and remote requests.',
        'tags': ['SuperApp', 'Flutter', 'FormBuilder', 'ReactJS', 'NestJS'],
        'image':
            'https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=900',
        'link': 'https://example.com/resource-manage-app',
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
            return _buildProjectCard(
              context,
              isDark,
              borderColor,
              project['title'] as String,
              project['description'] as String,
              project['tags'] as List<String>,
              project['image'] as String,
              project['link'] as String,
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
    String description,
    List<String> tags,
    String imageUrl,
    String link,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _openLink(link),
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
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: isDark ? Colors.grey[300] : Colors.grey[700],
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 16),
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
                      const Spacer(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: OutlinedButton.icon(
                          onPressed: () => _openLink(link),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: borderColor, width: 2),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                          icon: const Icon(Icons.open_in_new, size: 18),
                          label: Text(
                            'OPEN PROJECT',
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                          ),
                        ),
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

  Future<void> _openLink(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) {
      log('Invalid url: $url', name: 'ProjectsSection');
      return;
    }

    try {
      final didLaunch = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      if (!didLaunch) {
        log('Could not launch url: $url', name: 'ProjectsSection');
      }
    } catch (error) {
      log('Failed to launch url: $url', name: 'ProjectsSection', error: error);
    }
  }
}
