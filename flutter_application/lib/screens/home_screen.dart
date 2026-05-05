import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF9F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F3EA),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            color: const Color(0xFF1C1C17),
            height: 2.0,
          ),
        ),
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Image.network(
                'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                width: 32,
                height: 32,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              "Hoang",
              style: GoogleFonts.spaceGrotesk(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: const Color(0xFF1C1C17),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu_book, color: Color(0xFF1C1C17)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Adventurer Stats + Notification Badge Overlay
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: _buildAdventurerStats(),
                ),
                Positioned(
                  top: 0,
                  right: 16,
                  child: _buildNotificationBadge(),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Level and Gold
            Row(
              children: [
                Expanded(child: _buildStatBox(Icons.emoji_events, "LEVEL", "14")),
                const SizedBox(width: 16),
                Expanded(child: _buildStatBox(Icons.payments, "GOLD PIECES", "2,450")),
              ],
            ),
            const SizedBox(height: 32),
            
            // Daily Challenges Title
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 28, color: Color(0xFF5E35B1)),
                const SizedBox(width: 8),
                Text(
                  "DAILY CHALLENGES",
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.5,
                    color: const Color(0xFF1C1C17),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Daily Challenges List
            _buildDailyChallenge("HYDRATION POTION: DRINK 2L WATER", 50, false),
            const SizedBox(height: 12),
            _buildDailyChallenge("SUNRISE RITUAL: WAKE BY 7AM", 100, true),
            const SizedBox(height: 12),
            _buildDailyChallenge("TOME OF KNOWLEDGE: READ 10 PAGES", 75, false),
            const SizedBox(height: 12),
            _buildDailyChallenge("STRENGTH TRAINING: 20 PUSHUPS", 150, false),
            
            const SizedBox(height: 32),
            
            // Active Quests Title
            Row(
              children: [
                const Icon(Icons.colorize, size: 28, color: Color(0xFFD4AF37)),
                const SizedBox(width: 8),
                Text(
                  "ACTIVE\nQUESTS",
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.5,
                    color: const Color(0xFF1C1C17),
                    height: 1.0,
                  ),
                ),
                const Spacer(),
                _buildSmallButton("SORT\nDIFFICULTY"),
                const SizedBox(width: 8),
                _buildSmallButton("FILTER:\nMAIN"),
              ],
            ),
            const SizedBox(height: 16),
            
            // Active Quests List
            _buildQuestCard(
              title: "THE PROJECT GOLIATH: COMPLETE QUARTERLY REPORT",
              description: "Slay the bureaucratic giant by assembling all department metrics into a cohesive 40-page parchment. Requires focus and high-level clerical skills.",
              difficulty: "HARD",
              exp: 5000,
              gold: 500,
              statusLabel: "TIME REMAINING",
              statusValue: "4D : 12H : 08M",
              buttonText: "CLAIM VICTORY",
              buttonColor: const Color(0xFFD4AF37),
              difficultyColor: const Color(0xFFBA1A1A),
            ),
            const SizedBox(height: 24),
            
            _buildQuestCard(
              title: "THE ALCHEMIST'S PANTRY: MEAL PREP FOR WEEK",
              description: "Concoct 5 days worth of sustaining rations to prevent the 'Starving' debuff during the work week questline.",
              difficulty: "MEDIUM",
              exp: 1200,
              gold: 150,
              statusLabel: "PROGRESS",
              statusValue: "3 / 5 Prepped",
              buttonText: "CONTINUE",
              buttonColor: const Color(0xFF5E35B1),
              difficultyColor: const Color(0xFF5E35B1),
            ),
            const SizedBox(height: 24),

            _buildQuestCard(
              title: "CLEAN THE ARMORY: TIDY THE DESK",
              description: "Remove the chaotic clutter from your command station to increase Focus stats by +5.",
              difficulty: "EASY",
              exp: 300,
              gold: 20,
              statusLabel: "STATUS",
              statusValue: "READY",
              buttonText: "CLAIM VICTORY",
              buttonColor: const Color(0xFFD4AF37),
              difficultyColor: const Color(0xFFD0C5AF),
            ),
            
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        border: Border.all(color: const Color(0xFF1C1C17), width: 2),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF1C1C17),
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            color: const Color(0xFFD4AF37),
            child: const Icon(Icons.inventory, color: Colors.white, size: 16),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "NEW LOOT!",
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFD4AF37),
                ),
              ),
              Text(
                "LEGENDARY COFFEE BEANS",
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1C1C17),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildAdventurerStats() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F3EA),
        border: Border.all(color: const Color(0xFF1C1C17), width: 2),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF1C1C17),
            offset: Offset(6, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ADVENTURER STATS",
            style: GoogleFonts.spaceGrotesk(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: const Color(0xFFD4AF37),
            ),
          ),
          const SizedBox(height: 16),
          _buildProgressBar("HEALTH POINTS (HP)", "85 / 100", 0.85, const Color(0xFFBA1A1A)),
          const SizedBox(height: 12),
          _buildProgressBar("STAMINA (DAILY ENERGY)", "42 / 60", 0.7, const Color(0xFF5E35B1)),
        ],
      ),
    );
  }

  Widget _buildProgressBar(String label, String value, double percent, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1C1C17),
              ),
            ),
            Text(
              value,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1C1C17),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Container(
          height: 12,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFF1C1C17), width: 2),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: percent,
            child: Container(
              decoration: BoxDecoration(
                color: color,
                border: const Border(right: BorderSide(color: Color(0xFF1C1C17), width: 2)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatBox(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F3EA),
        border: Border.all(color: const Color(0xFF1C1C17), width: 2),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF1C1C17),
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF1C1C17), width: 2),
            ),
            child: Icon(icon, color: const Color(0xFFD4AF37), size: 20),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1C1C17),
                ),
              ),
              Text(
                value,
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: const Color(0xFF1C1C17),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDailyChallenge(String title, int exp, bool isDone) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDone ? const Color(0xFFF6F3EA) : const Color(0xFFF6F3EA),
        border: Border.all(color: isDone ? const Color(0xFF1C1C17).withOpacity(0.5) : const Color(0xFF5E35B1), width: 2),
      ),
      child: Row(
        children: [
          Icon(
            isDone ? Icons.check_circle : Icons.local_drink, // approximate icon based on text
            color: isDone ? Colors.grey : const Color(0xFF5E35B1),
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: isDone ? Colors.grey : const Color(0xFF1C1C17),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      "REWARD: ",
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const Icon(Icons.star, size: 10, color: Color(0xFFD4AF37)),
                    Text(
                      " $exp EXP",
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFD4AF37),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            color: isDone ? Colors.grey.shade300 : const Color(0xFFE1BEE7),
            child: Text(
              isDone ? "DONE" : "DAILY",
              style: GoogleFonts.spaceGrotesk(
                fontSize: 8,
                fontWeight: FontWeight.bold,
                color: isDone ? Colors.grey.shade600 : const Color(0xFF5E35B1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFDDDAD1),
        border: Border.all(color: const Color(0xFF1C1C17), width: 2),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.spaceGrotesk(
          fontSize: 8,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF1C1C17),
        ),
      ),
    );
  }

  Widget _buildQuestCard({
    required String title,
    required String description,
    required String difficulty,
    required int exp,
    required int gold,
    required String statusLabel,
    required String statusValue,
    required String buttonText,
    required Color buttonColor,
    required Color difficultyColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        border: Border.all(color: const Color(0xFF1C1C17), width: 2),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF1C1C17),
            offset: Offset(6, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top Part
          Container(
            color: const Color(0xFFF6F3EA),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Row(
                      children: List.generate(3, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: index < (difficulty == "HARD" ? 3 : difficulty == "MEDIUM" ? 2 : 1) ? difficultyColor : Colors.transparent,
                              border: Border.all(color: difficultyColor, width: 2),
                              shape: BoxShape.circle,
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "$difficulty DIFFICULTY",
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: difficultyColor,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFF1C1C17),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF4D4635),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _buildRewardTag(Icons.star, "$exp EXP"),
                    const SizedBox(width: 8),
                    _buildRewardTag(Icons.payments, "$gold GOLD"),
                  ],
                ),
              ],
            ),
          ),
          
          // Bottom Part
          Container(
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Color(0xFF1C1C17), width: 2)),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  statusLabel,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600,
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  statusValue,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFF1C1C17),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      elevation: 0,
                      side: const BorderSide(color: Color(0xFF1C1C17), width: 2),
                    ),
                    child: Text(
                      buttonText,
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRewardTag(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFDDDAD1),
        border: Border.all(color: const Color(0xFF1C1C17), width: 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: const Color(0xFFD4AF37)),
          const SizedBox(width: 4),
          Text(
            text,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFD4AF37),
            ),
          ),
        ],
      ),
    );
  }
}