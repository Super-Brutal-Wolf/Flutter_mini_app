import 'package:flutter/material.dart';

typedef CartChangeCallback = Function(Product product, bool incart);


class Product {
  const Product({required this.name});
  final String name;
}

class ShoppingListItem extends StatelessWidget {
  const ShoppingListItem(
    {
      super.key,
      required this.product,
      required this.incart,
      required this.onCartChange,
    }
  );

  final Product product;
  final bool incart;
  final CartChangeCallback onCartChange;

  Color _getColor(BuildContext context) {
    return incart ? Colors.black54 : Theme.of(context).primaryColor; 
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if(!incart) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough
    );
  } 
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChange(product, incart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(product.name, style: _getTextStyle(context)),
    );
  }
}

class ShoppingList extends StatefulWidget {
  const ShoppingList({
    super.key,
    required this.products
  });

  final List<Product> products;

  @override
  State<ShoppingList> createState () => _ShoppingListState(); 
}

class _ShoppingListState extends State<ShoppingList> {
  final _shoppingCart = <Product> {};

  void _handleCartChanged(Product product, bool incart){
    setState(() {
      if (!incart) {
        _shoppingCart.add(product);
      }else {
        _shoppingCart.remove(product);
      }
    });
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text('Shopping List')),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8),
          children:
            widget.products.map((product) {
              return ShoppingListItem(product: product, incart: _shoppingCart.contains(product), onCartChange: _handleCartChanged);
            }).toList(),
        ),
      );
    }
  
}


void main() {
  runApp(
    const MaterialApp(
      title: 'Shopping App',
      home: ShoppingList(
        products: [
          Product(name: 'Eggs'),
          Product(name: 'Flour'),
          Product(name: 'Chocolate chips')
      ])
    )
  );
}