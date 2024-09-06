import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grid_test_app/features/game/data/repositories/game_repository.dart';
import 'package:grid_test_app/features/game/presentation/pages/game_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final Map<String, GameRepository> levels = {
    'Easy': GameRepository.easy(),
    'Medium': GameRepository.medium(),
    'Hard': GameRepository.hard()
  };

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, screenSize.height * 0.2),
        child: Image.asset(
          'assets/decorations/top_wall.png',
          fit: BoxFit.fill,
          height: screenSize.height * 0.2,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 24),
          Text(
            'Welcome!',
            style: GoogleFonts.getFont(
              'Share',
              fontWeight: FontWeight.w700,
              fontSize: 24,
              height: 1,
              letterSpacing: -0.5,
              color: const Color.fromARGB(222, 178, 120, 12),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Select difficulty level',
            style: GoogleFonts.getFont(
              'Share',
              fontWeight: FontWeight.w700,
              fontSize: 24,
              height: 1,
              letterSpacing: -0.5,
              color: const Color.fromARGB(222, 178, 120, 12),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GamePage(
                        gameRepository: levels.values.elementAt(index),
                      ),
                    ),
                  ),
                  child: Text(
                    levels.keys.elementAt(index),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Image.asset(
        'assets/decorations/bottom_wall.png',
        height: screenSize.height * 0.2,
        fit: BoxFit.fill,
      ),
    );
  }
}
