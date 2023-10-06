import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 20, 5, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Glad to see you!",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
              ),
              const Text(
                "Esther Howard!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search), // Menambahkan ikon pencarian di depan
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear), // Menambahkan ikon clear
                    onPressed: () {
                      // Logika untuk menghapus teks saat ikon clear ditekan
                    },
                  ),
                  border: OutlineInputBorder( // Menggunakan border yang berbeda
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onChanged: (value) {
                  // Logika ketika teks berubah
                },
                onSubmitted: (value) {
                  // Logika ketika form disubmit
                },
              ),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black26, // Warna latar belakang container
                  borderRadius: BorderRadius.circular(20.0), // Opsional: Untuk memberi corner radius pada container
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Transform.translate(
                      offset: Offset(0, 10),
                      child: Text(
                        "Live Match",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    ),
                    const SizedBox(height: 30), // Jarak antara teks dan widget LiveScoreWidget
                    Center(
                      child: LiveScoreWidget(
                        homeTeam: "Arsenal",
                        awayTeam: "Barcelona",
                        homeScore: 2,
                        awayScore: 20,
                        homeLogoUrl: 'assets/arsenal.png', // Ganti dengan URL/logo Arsenal
                        awayLogoUrl: 'assets/barca.png', // Ganti dengan URL/logo Chelsea
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    // Aksi ketika tombol "Live" ditekan
                  },
                  child: const Text("Live"),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Finished Match",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              // Buat widget untuk menampilkan hasil skor yang sudah selesai
              // Misalnya: FinishedMatchScoreWidget(),
              const SizedBox(height: 15),
              const MatchesSliderWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class LiveScoreWidget extends StatelessWidget {
  final String homeTeam;
  final String awayTeam;
  final int homeScore;
  final int awayScore;
  final String homeLogoUrl;
  final String awayLogoUrl;

  const LiveScoreWidget({
  required this.homeTeam,
  required this.awayTeam,
  required this.homeScore,
  required this.awayScore,
  required this.homeLogoUrl,
  required this.awayLogoUrl,
});

@override
Widget build(BuildContext context) {
  return Row(
    children: [
      ClubLogoWidget(logoUrl: homeLogoUrl),
      const SizedBox(width: 25),
      Transform.translate(
      offset: Offset(0, -15),
      child: Text(
        '$homeScore - $awayScore',
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      ),
      const SizedBox(width: 25),
      ClubLogoWidget(logoUrl: awayLogoUrl),
    ],
  );
}
}

class ClubLogoWidget extends StatelessWidget {
  final String logoUrl;

  const ClubLogoWidget({
    required this.logoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 60,
        height: 60,
        margin: const EdgeInsets.only(left: 15, bottom: 20,),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
            image: AssetImage(logoUrl), // Ganti dengan path/logo sesuai dengan klub sepak bola
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class MatchesSliderWidget extends StatelessWidget {
  const MatchesSliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, // Sesuaikan dengan tinggi yang sesuai
      child: PageView(
        children: const [
          MatchContainer(score: "3 - 2", homeTeam: "Team A", awayTeam: "Team B"),
          MatchContainer(score: "1 - 1", homeTeam: "Team Barca", awayTeam: "Team BvB"),
        ],
      ),
    );
  }
}

class MatchContainer extends StatelessWidget {
  final String score;
  final String homeTeam;
  final String awayTeam;

  const MatchContainer({
    required this.score,
    required this.homeTeam,
    required this.awayTeam,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo Tim Tuan Rumah
              Image.asset('assets/barca.png', width: 50, height: 50),
              Text(score, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              // Logo Tim Tamu
              Image.asset('assets/BVB.png', width: 50, height: 50),
            ],
          ),
          Text("$homeTeam vs $awayTeam", style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
