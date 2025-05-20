import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تبدیل مثقال به گرم',
      home: MesghalToGramConverter(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MesghalToGramConverter extends StatefulWidget {
  @override
  _MesghalToGramConverterState createState() => _MesghalToGramConverterState();
}

class _MesghalToGramConverterState extends State<MesghalToGramConverter> {
  final TextEditingController _controller = TextEditingController();
  double _result = 0.0;

  void _convert() {
    final mesghal = double.tryParse(_controller.text);
    if (mesghal != null) {
      setState(() {
        _result = mesghal * 4.6875; // هر مثقال = ۴.۶۸۷۵ گرم
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('امیرحسین عابدینی'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'مقدار به مثقال',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convert,
              child: Text('تبدیل کن'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            ),
            SizedBox(height: 20),
            Text(
              'مقدار به گرم: \${_result.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
