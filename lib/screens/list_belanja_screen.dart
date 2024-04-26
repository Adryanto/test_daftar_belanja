import 'package:flutter/material.dart';
import 'package:test_daftar_belanja/services/shopping_services.dart';

class ListBelanjaScreen extends StatelessWidget {
  final ShoppingService _shoppingService = ShoppingService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Belanja'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<Map<String, String>>(
              stream: _shoppingService.getShoppingList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Map<String, String> items = snapshot.data!;
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final key = items.keys.elementAt(index);
                      final item = items[key];
                      return ListTile(
                        title: Text(item!),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _shoppingService.removeShoppingItem(key);
                          },
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
