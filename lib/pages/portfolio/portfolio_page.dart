import 'package:example_template/common/theme.dart';
import 'package:example_template/pages/portfolio/widgets/blog_section.dart';
import 'package:example_template/pages/portfolio/widgets/contact_section.dart';
import 'package:example_template/pages/portfolio/widgets/hero_section.dart';
import 'package:example_template/pages/portfolio/widgets/portfolio_sidebar.dart';
import 'package:example_template/pages/portfolio/widgets/projects_section.dart';
import 'package:example_template/pages/portfolio/widgets/skills_section.dart';
import 'package:flutter/material.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  SidebarSection _selectedSection = SidebarSection.about;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollTo(GlobalKey key, SidebarSection section) {
    setState(() {
      _selectedSection = section;
    });

    final context = key.currentContext;
    if (context == null) {
      return;
    }

    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isLargeScreen = MediaQuery.of(context).size.width >= 1024;

    final sidebar = PortfolioSidebar(
      selectedSection: _selectedSection,
      onAboutTap: () => _scrollTo(_aboutKey, SidebarSection.about),
      onProjectsTap: () => _scrollTo(_projectsKey, SidebarSection.projects),
      onSkillsTap: () => _scrollTo(_skillsKey, SidebarSection.skills),
      onContactTap: () => _scrollTo(_contactKey, SidebarSection.contact),
    );

    return Scaffold(
      body: isLargeScreen
          ? Row(
              children: [
                SizedBox(width: 320, child: sidebar),
                Expanded(child: _buildMainContent(isDark)),
              ],
            )
          : Column(
              children: [
                sidebar,
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
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HeroSection(key: _aboutKey),
            ProjectsSection(key: _projectsKey),
            SkillsSection(key: _skillsKey),
            ContactSection(key: _contactKey),
            const BlogSection(),
          ],
        ),
      ),
    );
  }
}
