import 'dart:async';

import 'package:flutter/material.dart';

class EnterAmountPage extends StatefulWidget {
  const EnterAmountPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<EnterAmountPage> createState() => _EnterAmountPageState();
}

class _EnterAmountPageState extends State<EnterAmountPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      _showTransactionAmountInput(context);
    });
  }

  void _showTransactionAmountInput(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.amber,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Modal BottomSheet'),
                ElevatedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(title: const Text('Shop Name')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showTransactionAmountInput(context),
          child: const Text('Enter Amount'),
        ),
      ),
    );
  }
}

/*
class enteramount extends StatelessWidget {
  const enteramount({Key? key}) : super(key: key);

  final String title;

  @override
  State<enteramount> createState() => enteramountState();

  }


class enteramount extends StatelessWidget {
  const enteramount ({Key? key}) : super(key: key);

  void _showTransactionAmountInput(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) => const TransactionAmountInput(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shop Name')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showTransactionAmountInput(context),
          child: const Text('Enter Amount'),
        ),
      ),
    );
  }
}

class TransactionAmountInput extends StatefulWidget {
  const TransactionAmountInput({Key? key}) : super(key: key);

  @override
  _TransactionAmountInputState createState() => _TransactionAmountInputState();
}

class _TransactionAmountInputState extends State<TransactionAmountInput> {
  final TextEditingController _controller = TextEditingController();

  void _onNextPressed() {
    if (_controller.text.isNotEmpty) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Transaction Amount: ₹${_controller.text}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          const Text('Enter Amount', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Text('Enter your Transaction Amount', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              children: [
                const Text('₹', style: TextStyle(fontSize: 24)),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '0',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _onNextPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow[700],
              minimumSize: const Size.fromHeight(50),
            ),
            child: const Text('Next', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}*/
