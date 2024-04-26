import 'package:flutter/material.dart';
import 'package:test_daftar_belanja/services/shopping_services.dart';
import 'list_belanja_screen.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final ShoppingService _shoppingService = ShoppingService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Belanja"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller1,
                    decoration:
                        const InputDecoration(hintText: 'Masukkan Nama'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller2,
                    decoration: const InputDecoration(hintText: 'Masukkan NPM'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 370),
          Container(
            width: 400,
            height: 45,
            child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.purple),
                onPressed: () {
                  _shoppingService.addShoppingItem(
                      _controller1.text, _controller2.text);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListBelanjaScreen()));
                },
                child: Text(
                  "Input",
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ],
      ),
    );
  }
}
