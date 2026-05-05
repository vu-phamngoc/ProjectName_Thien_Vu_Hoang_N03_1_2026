import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF9F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFCF9F0),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: const Color(0xFF1C1C17),
            height: 4.0,
          ),
        ),
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF1C1C17), width: 2),
                color: const Color(0xFFEBE8DF),
              ),
              padding: const EdgeInsets.all(2),
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuANbnqUqMW2K5NRdasOT64u6h9cDV1QdbcfeSGKiwXePOMowlCEESg6tMNaSZ0x7Rv3q1LzXOEoI_QzS-SLhqFOi3HtWFP1Ll_f7ChB9EhbfUtMHoxWf82pgWyqD8PBTHEHFoyoOrdryGU6HedNY0MAMuvvbr_gQ-MJJ_Oa4yKOmbDZ_hZ7T_-Cs0WOzSM1W4LqHywcgH6X8AtUOGDiVg4uKu2FWp87E4HEzTe1MNF677oU1JJ-XnPGDNJC38DYzWX7tl39OQ1JKzmq',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              "ILLUMINATED ARCHIVE",
              style: GoogleFonts.spaceGrotesk(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: const Color(0xFF1C1C17),
                letterSpacing: -1,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.map, color: Color(0xFF77574D), size: 30),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Thematic Header
            Container(
              decoration: const BoxDecoration(
                border: Border(left: BorderSide(color: Color(0xFF77574D), width: 8)),
              ),
              padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "THE REALM MAP",
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFF1C1C17),
                      height: 1.0,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "SYSTEM CONFIGURATION HUB",
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF77574D),
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // World Map
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                border: Border.all(color: const Color(0xFF1C1C17), width: 4),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFF1C1C17),
                    offset: Offset(8, 8),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(4),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ColorFiltered(
                      colorFilter: const ColorFilter.matrix([
                        0.2126, 0.7152, 0.0722, 0, 0,
                        0.2126, 0.7152, 0.0722, 0, 0,
                        0.2126, 0.7152, 0.0722, 0, 0,
                        0,      0,      0,      1, 0,
                      ]), // Grayscale
                      child: Image.network(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuCtRCNnSv37Fg9S64ZeyRcVIZ9ZrrM6ys1L_rxLkaRmVEBhqSOviRlgfYFvBEKWfAIMogQZyeNOqCfV5PPbaCoNrpbppJlBcv99nkPNaeNkC7b76shwr3zLztjSOU2_-8uMRCQ5QOIQzoPmWtSlNunbCz57OO7NazkacMusmFb_qTdAUFeI3eXUBZHi9vyGngO54Soz340OMhQzlkzniKLc8fre2MoVWFJVq2hWkgtma72UuC5bFPKCaB9FuDzYPS70o2NdU78uqzFE',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      color: const Color(0xFFFCF9F0).withOpacity(0.2), // Light overlay
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1C1C17),
                          border: Border.all(color: const Color(0xFFFCF9F0), width: 2),
                        ),
                        child: Text(
                          "LOCATION: THE ARCHIVE CENTER",
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFFFCF9F0),
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Settings Categories
            _buildSection(
              title: "ACCOUNT",
              titleBg: const Color(0xFF77574D),
              titleColor: const Color(0xFFFFFFFF),
              children: [
                _buildMenuItem(icon: Icons.person, label: "Profile", iconColor: const Color(0xFF77574D)),
                _buildMenuItem(icon: Icons.security, label: "Security & Privacy", iconColor: const Color(0xFF77574D)),
                _buildMenuItem(icon: Icons.devices, label: "Linked Devices", iconColor: const Color(0xFF77574D)),
              ],
            ),
            const SizedBox(height: 40),

            _buildSection(
              title: "NOTIFICATIONS",
              titleBg: const Color(0xFF735C00),
              titleColor: const Color(0xFFFFFFFF),
              children: [
                _buildToggleItem(icon: Icons.notification_important, label: "Quest Alerts", iconColor: const Color(0xFF735C00), isOn: true),
                _buildToggleItem(icon: Icons.campaign, label: "Guild News", iconColor: const Color(0xFF735C00), isOn: false),
              ],
            ),
            const SizedBox(height: 40),

            _buildSection(
              title: "INTERFACE & SYSTEM",
              titleBg: const Color(0xFF1C1C17),
              titleColor: const Color(0xFFFCF9F0),
              children: [
                _buildDisabledItem(),
                _buildMenuItem(icon: Icons.volume_up, label: "Audio & SFX", iconColor: const Color(0xFF1C1C17)),
                _buildMenuItem(icon: Icons.format_size, label: "Text Size", iconColor: const Color(0xFF1C1C17)),
              ],
            ),
            const SizedBox(height: 40),

            _buildSection(
              title: "ARCHIVE INFORMATION",
              titleBg: const Color(0xFF1B6D24),
              titleColor: const Color(0xFFFFFFFF),
              children: [
                _buildMenuItem(icon: Icons.auto_stories, label: "About the Archive", iconColor: const Color(0xFF1B6D24)),
              ],
            ),
            
            // Add padding at the bottom so content isn't hidden behind BottomNavigationBar
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required Color titleBg,
    required Color titleColor,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: titleBg,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Text(
            title,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: titleColor,
              letterSpacing: 2,
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Color(0xFF1C1C17), width: 4)),
          ),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required Color iconColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF6F3EA),
        border: Border(bottom: BorderSide(color: const Color(0xFF1C1C17).withOpacity(0.1), width: 2)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(icon, color: iconColor),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    label.toUpperCase(),
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1C1C17),
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
                Icon(Icons.chevron_right, color: const Color(0xFF1C1C17).withOpacity(0.3)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildToggleItem({
    required IconData icon,
    required String label,
    required Color iconColor,
    required bool isOn,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF6F3EA),
        border: Border(bottom: BorderSide(color: const Color(0xFF1C1C17).withOpacity(0.1), width: 2)),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              label.toUpperCase(),
              style: GoogleFonts.spaceGrotesk(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1C1C17),
                letterSpacing: -0.5,
              ),
            ),
          ),
          Container(
            width: 48,
            height: 24,
            decoration: BoxDecoration(
              color: isOn ? const Color(0xFF1B6D24) : const Color(0xFFDDDAD1),
              border: Border.all(color: const Color(0xFF1C1C17), width: 2),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 2,
                  right: isOn ? 2 : null,
                  left: isOn ? null : 2,
                  child: Container(
                    width: 16,
                    height: 16,
                    color: isOn ? const Color(0xFFFFFFFF) : const Color(0xFF1C1C17),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDisabledItem() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE5E2DA),
        border: Border(
          bottom: BorderSide(
            color: const Color(0xFF1C1C17).withOpacity(0.1),
            width: 2,
          ),
        ),
      ),
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ENABLE DARK MODE",
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  color: const Color(0xFF1C1C17).withOpacity(0.5),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "SUNSTONE EDITION EXCLUSIVE",
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF77574D),
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          Icon(Icons.dark_mode, size: 36, color: const Color(0xFF1C1C17).withOpacity(0.2)),
        ],
      ),
    );
  }
}
