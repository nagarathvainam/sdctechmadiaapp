import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CardListScreen extends StatefulWidget {
  @override
  _CardListScreenState createState() => _CardListScreenState();
}

class _CardListScreenState extends State<CardListScreen> {
  List<String> items = List.generate(10, (index) => 'Item ${index + 1}');

  void editItem(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Edit ${items[index]}')),
    );
  }

  void deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Deleted')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slidable Card List')),
      body: SlidableAutoCloseBehavior(
    child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Slidable(
            key: ValueKey(items[index]),
            startActionPane: ActionPane(
              motion: DrawerMotion(),
              children: [
                SlidableAction(
                  onPressed: (_) => editItem(index),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Edit',
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: DrawerMotion(),
              children: [
                SlidableAction(
                  onPressed: (_) => deleteItem(index),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: ListTile(
                title: Text(items[index]),
                subtitle: Text('Swipe left or right'),
              ),
            ),
          );
        },
      ),

    ));
  }
}
