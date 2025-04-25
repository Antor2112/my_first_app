import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For Clipboard

class TranslatorHomePage extends StatefulWidget {
  @override
  _TranslatorHomePageState createState() => _TranslatorHomePageState();
}

class _TranslatorHomePageState extends State<TranslatorHomePage> {
  String fromLanguage = 'English';
  String toLanguage = 'Bangla';
  String inputText = '';
  String translatedText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Word Bridge',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        iconTheme: IconThemeData(color: Colors.white), // <-- Back arrow in white
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              // Language Selection
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    value: fromLanguage,
                    items: ['English', 'Bangla'].map((lang) {
                      return DropdownMenuItem(value: lang, child: Text(lang));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        fromLanguage = value!;
                        if (fromLanguage == toLanguage) {
                          toLanguage =
                          fromLanguage == 'English' ? 'Bangla' : 'English';
                        }
                      });
                    },
                  ),
                  SizedBox(width: 40),
                  Icon(Icons.compare_arrows, color: Colors.grey),
                  SizedBox(width: 40),
                  DropdownButton<String>(
                    value: toLanguage,
                    items: ['Bangla', 'English'].map((lang) {
                      return DropdownMenuItem(value: lang, child: Text(lang));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        toLanguage = value!;
                        if (fromLanguage == toLanguage) {
                          fromLanguage =
                          toLanguage == 'English' ? 'Bangla' : 'English';
                        }
                      });
                    },
                  ),
                ],
              ),

              SizedBox(height: 10),

              // Input TextField
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Enter text to translate',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  inputText = value;
                },
              ),
              SizedBox(height: 10),

              // Translate Button
              ElevatedButton(
                onPressed: () {
                  if (inputText.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text("Please enter some text to translate")),
                    );
                  } else {
                    setState(() {
                      // Mock translation - Replace with actual translation logic
                      translatedText = "Translated: $inputText";
                    });
                  }
                },
                child: Text('Translate'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
              ),
              SizedBox(height: 30),

              // Output Area
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  translatedText.isEmpty
                      ? 'Translation will appear here...'
                      : translatedText,
                  style: TextStyle(fontSize: 16),
                ),
              ),

              // Copy Button
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.copy, color: Colors.deepPurple),
                    onPressed: () {
                      if (translatedText.trim().isNotEmpty) {
                        Clipboard.setData(
                            ClipboardData(text: translatedText));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Translation copied!")),
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
