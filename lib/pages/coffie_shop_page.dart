import 'package:coffee_shop/components/icon_button.dart';
import 'package:coffee_shop/models/cofee.dart';
import 'package:coffee_shop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoffeeShopPage extends StatefulWidget {
  final Coffee shoping;
  const CoffeeShopPage({super.key, required this.shoping});

  @override
  State<CoffeeShopPage> createState() => _CoffeeShopPageState();
}

class _CoffeeShopPageState extends State<CoffeeShopPage> {
  // add to cart
  void addToCart(Coffee coffee) async {
    if (_count > 0) {
      // add to cart
      Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

      // let user know it add been successfully added
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.grey[300],
          title: Text(
            'Seccessfully added to cart',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.green[700],
            ),
          ),
        ),
      );
      setState(() {
        _count = 0;
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.grey[300],
          title: const Text(
            'You Can\'t buy 0 coffee',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ),
      );
    }
  }

// count of coffee sales
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) {
        Coffee eachCoffee = widget.shoping;

        return Scaffold(
          backgroundColor: Colors.grey[400],
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // image
                  Image.asset(
                    widget.shoping.imagePath,
                    height: 180,
                  ),

                  // name +price
                  Center(
                    child: Column(
                      children: [
                        // name
                        Text(
                          widget.shoping.name,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.brown[600],
                          ),
                        ),

                        const SizedBox(height: 10),

                        // price
                        Text(
                          '\$ ${widget.shoping.price}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.brown[400],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Text(
                    'QUANTITY',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.brown,
                    ),
                  ),

                  // count
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // decrement button
                      GestureDetector(
                        onTap: () {
                          if (_count > 0) {
                            setState(() {
                              _count--;
                            });
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 20,
                            left: 15,
                            right: 15,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.brown[900],
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.minimize,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      // show count
                      Container(
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          _count.toString() ?? '0',
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      // increment button
                      MyIconButton(
                        onTap: () {
                          setState(() {
                            _count++;
                          });
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),

                  // add to cart button
                  GestureDetector(
                    onTap: () => addToCart(eachCoffee),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 50),
                      width: double.infinity,
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.brown[900],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Add to cart',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
