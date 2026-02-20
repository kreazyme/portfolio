import 'package:example_template/common/theme.dart';
import 'package:example_template/pages/portfolio/widgets/blog_section.dart';
import 'package:example_template/pages/portfolio/widgets/contact_section.dart';
import 'package:example_template/pages/portfolio/widgets/hero_section.dart';
import 'package:example_template/pages/portfolio/widgets/portfolio_sidebar.dart';
import 'package:example_template/pages/portfolio/widgets/projects_section.dart';
import 'package:example_template/pages/portfolio/widgets/skills_section.dart';
import 'package:flutter/material.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isLargeScreen = MediaQuery.of(context).size.width >= 1024;

    return Scaffold(
      body: isLargeScreen
          ? Row(
              children: [
                const SizedBox(width: 320, child: PortfolioSidebar()),
                Expanded(child: _buildMainContent(isDark)),
              ],
            )
          : Column(
              children: [
                const PortfolioSidebar(),
                Expanded(child: _buildMainContent(isDark)),
              ],
            ),
    );
  }

  Widget _buildMainContent(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: isDark ? AppTheme.brutalWhite : AppTheme.brutalBlack,
            width: 4,
          ),
        ),
      ),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            ProjectsSection(),
            SkillsSection(),
            BlogSection(),
            ContactSection(),
          ],
        ),
      ),
    );
  }
}
