import 'package:flutter/material.dart';



class ratecard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      debugShowCheckedModeBanner: false,
    );
  }
}

class RateCardScreen extends StatelessWidget {
  final List<Map<String, String>> bankAccounts = [
    {
      'name': 'Sathiya Murthy',
      'account': 'A/C NO : 6558001 500017962\nCHNB0038600',
      'logo': 'assets/icici.png',
    },
    {
      'name': 'Anu',
      'account': 'A/C NO : 8898001 720065935\nCUPFNB0075800',
      'logo': 'assets/axis.png',
    },
    {
      'name': 'Ravi',
      'account': 'A/C NO : 8898001 720065935\nCUPFNB0075800',
      'logo': 'assets/indian.png',
    },
    {
      'name': 'Suguna',
      'account': 'A/C NO : 8898001 720065935\nCUPFNB0075800',
      'logo': 'assets/yes.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'search',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle, color: Colors.pink),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: bankAccounts.length,
        itemBuilder: (context, index) {
          final account = bankAccounts[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: EdgeInsets.all(12),
              leading: CircleAvatar(
                backgroundImage: AssetImage(account['logo']!),
                radius: 28,
              ),
              title: Text(account['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(account['account']!),
              trailing: CircleAvatar(
                backgroundColor: Colors.pink,
                radius: 16,
                child: Icon(Icons.home, size: 16, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
