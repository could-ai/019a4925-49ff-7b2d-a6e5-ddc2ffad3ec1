import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Class 11 NCERT Hindi Medium',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<String> subjects = const [
    'गणित', // Mathematics
    'भौतिक विज्ञान', // Physics
    'रसायन विज्ञान', // Chemistry
    'जीव विज्ञान', // Biology
    'हिन्दी', // Hindi
    'अंग्रेज़ी', // English
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('कक्षा 11 - विषय'), // Class 11 - Subjects
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          final subject = subjects[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.book),
              title: Text(subject),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChapterListScreen(subject: subject),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ChapterListScreen extends StatelessWidget {
  final String subject;

  const ChapterListScreen({super.key, required this.subject});

  // Dummy data for chapters. In a real app, this would come from a database or API.
  Map<String, List<String>> get chapters => {
        'गणित': List.generate(16, (i) => 'अध्याय ${i + 1}'),
        'भौतिक विज्ञान': List.generate(15, (i) => 'अध्याय ${i + 1}'),
        'रसायन विज्ञान': List.generate(14, (i) => 'अध्याय ${i + 1}'),
        'जीव विज्ञान': List.generate(22, (i) => 'अध्याय ${i + 1}'),
        'हिन्दी': List.generate(10, (i) => 'अध्याय ${i + 1}'),
        'अंग्रेज़ी': List.generate(8, (i) => 'अध्याय ${i + 1}'),
      };

  @override
  Widget build(BuildContext context) {
    final chapterList = chapters[subject] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(subject),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: chapterList.length,
        itemBuilder: (context, index) {
          final chapter = chapterList[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Text('${index + 1}'),
              title: Text(chapter),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChapterDetailScreen(
                      subject: subject,
                      chapter: chapter,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ChapterDetailScreen extends StatelessWidget {
  final String subject;
  final String chapter;

  const ChapterDetailScreen(
      {super.key, required this.subject, required this.chapter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chapter),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'यह $subject विषय के $chapter का सामग्री पृष्ठ है। सामग्री यहाँ प्रदर्शित की जाएगी।', // This is the content page for [chapter] of [subject]. Content will be displayed here.
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
    );
  }
}
