import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Để responsive tốt hơn trên mobile, ta ẩn bớt phần menu top nếu màn hình nhỏ
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTopNav(isDesktop),
            const SizedBox(height: 60),
            _buildHeader(),
            const SizedBox(height: 40),
            _buildForm(),
            const SizedBox(height: 100),
            _buildFooter(isDesktop),
          ],
        ),
      ),
    );
  }

  Widget _buildTopNav(bool isDesktop) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          const Icon(Icons.dashboard_customize, size: 32, color: Colors.black87),
          
          // Menu Items (ẩn trên mobile để gọn)
          if (isDesktop)
            Row(
              children: [
                _navItem("Products"),
                _navItem("Solutions"),
                _navItem("Community"),
                _navItem("Resources"),
                _navItem("Pricing"),
                _navItem("Contact"),
              ],
            ),
          
          // Auth Buttons
          Row(
            children: [
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black87,
                  side: const BorderSide(color: Colors.black26),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
                child: const Text("Sign in"),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF222222),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  elevation: 0,
                ),
                child: const Text("Register"),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _navItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: const [
        Text(
          "Title",
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w800,
            color: Color(0xFF222222),
            letterSpacing: -1.0,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Subtitle",
          style: TextStyle(
            fontSize: 24,
            color: Color(0xFF555555),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField("Name"),
          const SizedBox(height: 20),
          _buildTextField("Surname"),
          const SizedBox(height: 20),
          _buildTextField("Email"),
          const SizedBox(height: 20),
          _buildTextField("Message", maxLines: 4),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF222222),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                elevation: 0,
              ),
              child: const Text(
                "Submit",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTextField(String label, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: "Value",
            hintStyle: const TextStyle(color: Colors.black38),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.black12),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.black12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.black54),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFooter(bool isDesktop) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 1, child: _buildFooterBrand()),
                Expanded(flex: 3, child: _buildFooterLinksRow()),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFooterBrand(),
                const SizedBox(height: 40),
                _buildFooterLinksRow(isMobile: true),
              ],
            ),
    );
  }

  Widget _buildFooterBrand() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.dashboard_customize, size: 32, color: Colors.black87),
        const SizedBox(height: 20),
        Row(
          children: const [
            Icon(Icons.close, size: 24, color: Colors.black54), // X (Twitter)
            SizedBox(width: 16),
            Icon(Icons.camera_alt_outlined, size: 24, color: Colors.black54), // Instagram
            SizedBox(width: 16),
            Icon(Icons.play_circle_outline, size: 24, color: Colors.black54), // Youtube
            SizedBox(width: 16),
            Icon(Icons.work_outline, size: 24, color: Colors.black54), // LinkedIn
          ],
        )
      ],
    );
  }

  Widget _buildFooterLinksRow({bool isMobile = false}) {
    final columns = [
      _buildFooterColumn("Use cases", [
        "UI design", "UX design", "Wireframing", "Diagramming",
        "Brainstorming", "Online whiteboard", "Team collaboration"
      ]),
      _buildFooterColumn("Explore", [
        "Design", "Prototyping", "Development features", "Design systems",
        "Collaboration features", "Design process", "FigJam"
      ]),
      _buildFooterColumn("Resources", [
        "Blog", "Best practices", "Colors", "Color wheel",
        "Support", "Developers", "Resource library"
      ]),
    ];

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: columns.map((c) => Padding(padding: const EdgeInsets.only(bottom: 32), child: c)).toList(),
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: columns,
      );
    }
  }

  Widget _buildFooterColumn(String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 20),
        ...links.map((link) => Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(
                link,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            )),
      ],
    );
  }
}
