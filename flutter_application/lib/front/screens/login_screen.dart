import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF9F0), // surface
      body: Stack(
        children: [
          // Background dotted pattern
          Positioned.fill(
            child: CustomPaint(
              painter: _DotGridPainter(),
            ),
          ),
          
          // Background floating icons (optional decoration as per design)
          const Positioned(
            top: 40,
            right: 40,
            child: Opacity(
              opacity: 0.1,
              child: Icon(Icons.history_edu, size: 192, color: Color(0xFF1C1C17)),
            ),
          ),
          const Positioned(
            bottom: 40,
            left: 40,
            child: Opacity(
              opacity: 0.1,
              child: Icon(Icons.token, size: 192, color: Color(0xFF1C1C17)),
            ),
          ),

          // Main Login Card
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 448),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFCF9F0), // surface
                    border: Border.all(color: const Color(0xFF1C1C17), width: 4),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFF1C1C17),
                        offset: Offset(8, 8),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F3EA), // surface-container-low
                      border: Border.all(color: const Color(0xFF1C1C17), width: 2),
                    ),
                    child: Stack(
                      children: [
                        // Decorative Corners
                        Positioned.fill(child: _buildCorners()),

                        // Content
                        Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Heraldry / Logo
                              Container(
                                width: 96,
                                height: 96,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF735C00), // secondary
                                  border: Border.all(color: const Color(0xFF1C1C17), width: 4),
                                ),
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.menu_book,
                                  color: Colors.white,
                                  size: 48,
                                ),
                              ),
                              const SizedBox(height: 24),
                              
                              Text(
                                'QUEST LOG',
                                style: GoogleFonts.spaceGrotesk(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF1C1C17), // on-surface
                                  letterSpacing: -1.5,
                                  height: 1.0,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'SUNSTONE EDITION',
                                style: GoogleFonts.spaceGrotesk(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF77574D), // primary
                                  letterSpacing: 2.4,
                                ),
                              ),
                              const SizedBox(height: 40),

                              // Form
                              _buildInputField(
                                label: 'SCRIBE NAME',
                                icon: Icons.edit_note,
                                hint: 'ENTER YOUR ALIAS...',
                              ),
                              const SizedBox(height: 32),
                              
                              _buildInputField(
                                label: 'SECRET CIPHER',
                                icon: Icons.key,
                                hint: '••••••••',
                                isPassword: true,
                              ),
                              const SizedBox(height: 8),
                              
                              Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () {},
                                  child: Text(
                                    'FORGOT CIPHER?',
                                    style: GoogleFonts.spaceGrotesk(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF77574D), // primary
                                      decoration: TextDecoration.underline,
                                      decorationColor: const Color(0xFF77574D),
                                      decorationThickness: 2,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 32),

                              // Submit Button
                              SizedBox(
                                width: double.infinity,
                                height: 68,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1C1C17), // on-surface
                                    foregroundColor: const Color(0xFFFCF9F0), // surface
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                    elevation: 0,
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'BEGIN QUEST',
                                        style: GoogleFonts.spaceGrotesk(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: 1.8,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      const Icon(Icons.arrow_forward),
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(height: 48),

                              // Footer
                              Container(
                                padding: const EdgeInsets.only(top: 24),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                      color: Color(0xFFD0C5AF), // outline-variant
                                      width: 2,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      'New to the Archive?',
                                      style: GoogleFonts.spaceGrotesk(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF4D4635), // on-surface-variant
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Material(
                                      color: const Color(0xFF735C00), // secondary
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: const Color(0xFF1C1C17), // on-surface
                                              width: 2,
                                            ),
                                          ),
                                          child: Text(
                                            'NEW HERO? JOIN THE GUILD',
                                            style: GoogleFonts.spaceGrotesk(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white, // on-secondary
                                              letterSpacing: 0.6,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required IconData icon,
    required String hint,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF77574D), // primary
            letterSpacing: 2.4,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          color: const Color(0xFFDDDAD1), // surface-dim
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Icon(icon, color: const Color(0xFF7F7663), size: 18), // outline
              ),
              TextField(
                obscureText: isPassword,
                style: GoogleFonts.spaceGrotesk(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF1C1C17), // on-surface
                ),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: GoogleFonts.spaceGrotesk(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFD0C5AF), // outline-variant
                  ),
                  contentPadding: const EdgeInsets.only(left: 40, right: 12, top: 16, bottom: 16),
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1C1C17), width: 4),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1C1C17), width: 4),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF735C00), width: 4), // secondary
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCorners() {
    const borderColor = Color(0xFF1C1C17); // on-surface
    return Stack(
      children: [
        Positioned(
          top: 0, left: 0,
          child: Container(
            width: 16, height: 16,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: borderColor, width: 4),
                left: BorderSide(color: borderColor, width: 4),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0, right: 0,
          child: Container(
            width: 16, height: 16,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: borderColor, width: 4),
                right: BorderSide(color: borderColor, width: 4),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0, left: 0,
          child: Container(
            width: 16, height: 16,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: borderColor, width: 4),
                left: BorderSide(color: borderColor, width: 4),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0, right: 0,
          child: Container(
            width: 16, height: 16,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: borderColor, width: 4),
                right: BorderSide(color: borderColor, width: 4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DotGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFD0C5AF) // outline-variant
      ..style = PaintingStyle.fill;

    const spacing = 20.0;
    const radius = 1.0;

    for (double y = 0; y < size.height; y += spacing) {
      for (double x = 0; x < size.width; x += spacing) {
        canvas.drawCircle(Offset(x, y), radius, paint);
        canvas.drawCircle(Offset(x + 10, y + 10), radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
