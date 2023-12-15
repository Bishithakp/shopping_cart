import 'package:flutter/material.dart';

import '../constants/app_color.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<String> images = [
    "https://t3.ftcdn.net/jpg/06/75/32/78/240_F_675327802_ofal9iuJ9lEtLZfd8ICrYrX6RVXHlXQ1.jpg",
    'https://t3.ftcdn.net/jpg/06/75/32/78/240_F_675327802_ofal9iuJ9lEtLZfd8ICrYrX6RVXHlXQ1.jpg',
    'https://t3.ftcdn.net/jpg/06/75/32/78/240_F_675327802_ofal9iuJ9lEtLZfd8ICrYrX6RVXHlXQ1.jpg',
    'https://t3.ftcdn.net/jpg/06/75/32/78/240_F_675327802_ofal9iuJ9lEtLZfd8ICrYrX6RVXHlXQ1.jpg',
    'https://t3.ftcdn.net/jpg/06/75/32/78/240_F_675327802_ofal9iuJ9lEtLZfd8ICrYrX6RVXHlXQ1.jpg'
  ];
  List<String> items = ['Banana', 'orange', 'apple', 'grapes', 'kiwi'];
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: headlineItems(),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                height: 60,
                width: double.maxFinite,
                color: const Color(0xFFd9d9d9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 20,
                      color: Colors.black,
                    ),
                    RichText(
                        text: const TextSpan(
                            text: 'Delivery ',
                            style: TextStyle(color: Colors.black, fontSize: 15),
                            children: [
                          TextSpan(
                              text: 'Address',
                              style: TextStyle(color: AppColor.appMainColor))
                        ])),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                    )
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  cartHeading(label: 'Items in Cart:'),
                  const SizedBox(
                    height: 10,
                  ),
                  cartItems(
                      numberofitems: '2',
                      price: '\$5/kg',
                      productName: 'Brocholli'),
                  const SizedBox(
                    height: 5,
                  ),
                  cartItems(
                      productName: 'kiwi', price: '\$7/kg', numberofitems: '1'),
                  heightBtw(),
                  cartHeading(label: 'Add More Items'),
                  heightBtw(),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 8),
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(images[index]))),
                              ),
                              Text(items[index]),
                              const Text('\$/5kg'),
                            ],
                          );
                        }),
                  ),
                  heightBtw(),
                  cartHeading(label: 'Bill deatils:'),
                  heightBtw(),
                  billDetails(details: 'Sub Total', fee: '\$150'),
                  const SizedBox(
                    height: 5,
                  ),
                  billDetails(details: 'Delivery Fee', fee: '\$32'),
                  const SizedBox(
                    height: 5,
                  ),
                  billDetails(details: 'Tax & Other fee', fee: '\$18'),
                  heightBtw(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Total',
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ),
                      ),
                      Text('\$187'),
                    ],
                  ),
                  heightBtw(),
                  SizedBox(
                    height: 40,
                    width: double.maxFinite,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'Make Payment',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        side: BorderSide(color: Colors.black, width: 3),
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row billDetails({required String details, required String fee}) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Sub Total',
          style: TextStyle(
              color: Color.fromARGB(255, 116, 114, 114), fontSize: 10),
        ),
        Text(
          '\$150',
          style: TextStyle(color: Colors.black, fontSize: 10),
        )
      ],
    );
  }

  Row headlineItems() {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.arrow_back,
            color: AppColor.appMainColor,
          ),
          const Text(
            'Cart',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
          Stack(
            children: [
              const Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              Positioned(
                right: 7,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red),
                ),
              )
            ],
          )
        ]);
  }

  SizedBox heightBtw() => const SizedBox(
        height: 10,
      );

  Row cartItems(
      {required String productName,
      required String price,
      required String numberofitems}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                  image: AssetImage('assets/loginpageshopping cart.jfif'))),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(productName), Text(price)],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xFFd9d9d9),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.remove,
                color: Colors.black,
                size: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  numberofitems,
                  style: const TextStyle(fontSize: 10, color: Colors.black),
                ),
              ),
              const Icon(
                Icons.add,
                color: Colors.black,
                size: 10,
              )
            ],
          ),
        )
      ],
    );
  }

  Text cartHeading({required String label}) {
    return Text(label,
        style: const TextStyle(
            fontSize: 15,
            color: AppColor.headingColor,
            fontWeight: FontWeight.w900));
  }
}
