import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islamic Prayer App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          color: Colors.green,
        ),
        textTheme: TextTheme(
          titleMedium: TextStyle(color: Colors.white, fontSize: 18),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
        ),
      ),
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                filled: true,
                fillColor: Colors.grey[800],
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.grey[800],
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.grey[800],
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Islamic Prayer App'),
      ),
      body: Column(
        children: [
          Expanded(child: IconGrid()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}

class IconGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      children: [
        _buildIconWithText(context, Icons.menu_book, "Quran", QuranPage()),
        _buildIconWithText(context, Icons.menu_book, "Azkar", AzkarPage()),
        _buildIconWithText(context, Icons.loop, "Tasbih", TasbihPage()),
        _buildIconWithText(context, Icons.explore, "Qibla", QiblaPage()),
        _buildIconWithText(context, Icons.store, "Store", StorePage()),
        _buildIconWithText(context, Icons.track_changes, "Tracker", TrackerPage()),
        _buildIconWithText(context, Icons.favorite, "Duas", DuasPage()),
        _buildIconWithText(context, Icons.star, "99 Names", NamesPage()),
        _buildIconWithText(context, Icons.photo_album, "Gallery", GalleryPage()),
        _buildIconWithText(context, Icons.calendar_today, "Calendar", CalendarPage()),
        _buildIconWithText(context, Icons.flag, "Shahada", ShahadaPage()),
        _buildIconWithText(context, Icons.monetization_on, "Donation", DonationPage()),
        _buildIconWithText(context, Icons.fastfood, "Fasting", FastingPage()),
        _buildIconWithText(context, Icons.flight, "Hajj", HajjPage()),
        _buildIconWithText(context, Icons.fitness_center, "Activity", ActivityPage()),
      ],
    );
  }

  Widget _buildIconWithText(BuildContext context, IconData icon, String title, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40.0, color: Colors.green),
          SizedBox(height: 5),
          Text(title, style: TextStyle(fontSize: 12, color: Colors.white)),
        ],
      ),
    );
  }
}

class BottomNavigationBarWidget extends StatefulWidget {
  @override
  _BottomNavigationBarWidgetState createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.white,
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.umbrella), label: 'Ummah'),
        BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Quran'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me'),
      ],
    );
  }
}

// Example pages
class QuranPage extends StatelessWidget {
  const QuranPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("القرآن الكريم"), // Added const here
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "القرآن الكريم",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "بسم الله الرحمن الرحيم",
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildSurahCard(
                    "الفاتحة",
                    "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ\nالْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ...",
                  ),
                  _buildSurahCard(
                    "البقرة",
                    "الم (1) ذَٰلِكَ الْكِتَابُ لَا رَيْبَ فِيهِ...\n",
                  ),
                  _buildSurahCard(
                    "آل عمران",
                    "الم (1) اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ...\n",
                  ),
                  // Add more Surah Cards as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSurahCard(String title, String content) {
    return Card(
      color: Colors.grey[850],
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AzkarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Azkar")),
      body: Center(child: Text("Azkar Page Content")),
    );
  }
}

class TasbihPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tasbih")),
      body: Center(child: Text("Tasbih Page Content")),
    );
  }
}

class QiblaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Qibla")),
      body: Center(child: Text("Qibla Page Content")),
    );
  }
}

class StorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Store")),
      body: Center(child: Text("Store Page Content")),
    );
  }
}

class TrackerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tracker")),
      body: Center(child: Text("Tracker Page Content")),
    );
  }
}

class DuasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Duas")),
      body: Center(child: Text("Duas Page Content")),
    );
  }
}

class NamesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("99 Names")),
      body: Center(child: Text("99 Names Page Content")),
    );
  }
}

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gallery")),
      body: Center(child: Text("Gallery Page Content")),
    );
  }
}

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calendar")),
      body: Center(child: Text("Calendar Page Content")),
    );
  }
}

class ShahadaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shahada")),
      body: Center(child: Text("Shahada Page Content")),
    );
  }
}

class DonationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Donation")),
      body: Center(child: Text("Donation Page Content")),
    );
  }
}

class FastingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fasting")),
      body: Center(child: Text("Fasting Page Content")),
    );
  }
}

class HajjPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hajj")),
      body: Center(child: Text("Hajj Page Content")),
    );
  }
}

class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Activity")),
      body: Center(child: Text("Activity Page Content")),
    );
  }
}


class QuranSurahPage extends StatelessWidget {
  const QuranSurahPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("القرآن الكريم"), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "القرآن الكريم",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "بسم الله الرحمن الرحيم",
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildSurahCard(
                    "الفاتحة",
                    "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ\nالْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ...",
                  ),
                  _buildSurahCard(
                    "البقرة",
                    "الم (1) ذَٰلِكَ الْكِتَابُ لَا رَيْبَ فِيهِ...\n",
                  ),
                  _buildSurahCard(
                    "آل عمران",
                    "الم (1) اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ...\n",
                  ),
                  // Add more Surah Cards as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSurahCard(String title, String content) {
    return Card(
      color: Colors.grey[850],
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


