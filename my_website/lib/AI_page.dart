import 'package:flutter/material.dart';

class AIPage extends StatelessWidget {
  final List<String> tags = [
    'HTML',
    'CSS',
    'JavaScript',
    'Ruby',
    'Ruby on Rails',
    'Python',
    'Django',
    'PHP',
    'Laravel',
    'Java',
    'Spring',
    'Kotlin',
    'Swift',
    'Objective-C',
    'Flutter',
    'Dart',
    'React',
    'Vue.js',
    'Angular',
    'AWS',
    'Docker',
    'Firebase',
    'SQL',
    'Blockchain',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AI Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 8.0, // gap between adjacent chips
          runSpacing: 4.0, // gap between lines
          children: tags.map((String tag) {
            return Chip(
              label: Text(tag),
              backgroundColor: Colors.blue,
              labelStyle: TextStyle(color: Colors.white),
            );
          }).toList(),
        ),
      ),
    );
  }
}
