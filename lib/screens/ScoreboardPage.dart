import 'package:flutter/material.dart';

class ScoreboardPage extends StatelessWidget {
  const ScoreboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Scoreboard',
          style: TextStyle(
            fontFamily: 'gilroy',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          _buildLeaderboardCard(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildUserScoreCard(
                  name: 'Arnold',
                  score: '2854',
                  rank: 1,
                  imagePath: 'assets/images/user.png',
                  isTop: true,
                ),
                _buildUserScoreCard(
                  name: 'Derek',
                  score: '2690',
                  rank: 2,
                  imagePath: 'assets/images/user.png',
                  isTop: true,
                ),
                _buildUserScoreCard(
                  name: 'Michael',
                  score: '2545',
                  rank: 3,
                  imagePath: 'assets/images/user.png',
                  isTop: true,
                ),
                _buildUserScoreCard(
                  name: 'John',
                  score: '2445',
                  rank: 4,
                  imagePath: 'assets/images/user.png',
                ),
                _buildUserScoreCard(
                  name: 'George',
                  score: '2300',
                  rank: 5,
                  imagePath: 'assets/images/user.png',
                ),
                _buildUserScoreCard(
                  name: 'Mike',
                  score: '2100',
                  rank: 6,
                  imagePath: 'assets/images/user.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeaderboardCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFD9FF3E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Leaderboard',
                  style: TextStyle(
                    fontFamily: 'gilroy-bold',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Compare your progress with others',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Icons.emoji_events,
              color: Color(0xFFD9FF3E),
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserScoreCard({
    required String name,
    required String score,
    required int rank,
    required String imagePath,
    bool isTop = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isTop ? const Color(0xFFF5F7FA) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color.fromARGB(43, 209, 209, 209),
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isTop ? const Color(0xFFD9FF3E) : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Text(
              '#$rank',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isTop ? Colors.black : Colors.grey,
              ),
            ),
          ),
          const SizedBox(width: 12),
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Score: $score',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          if (rank <= 3)
            Icon(
              Icons.workspace_premium,
              color: rank == 1
                  ? const Color(0xFFFFD700) // Gold
                  : rank == 2
                      ? const Color(0xFFC0C0C0) // Silver
                      : const Color(0xFFCD7F32), // Bronze
              size: 24,
            ),
        ],
      ),
    );
  }
}
