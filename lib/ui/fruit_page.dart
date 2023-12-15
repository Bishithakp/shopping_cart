import 'package:flutter/material.dart';
import 'package:shopping_cart/constants/app_color.dart';

class FruitPage extends StatefulWidget {
  const FruitPage({super.key});

  @override
  State<FruitPage> createState() => _FruitPageState();
}

class _FruitPageState extends State<FruitPage> {
  int selectedindex = 0;
  List<String> images = [
    "https://t3.ftcdn.net/jpg/06/75/32/78/240_F_675327802_ofal9iuJ9lEtLZfd8ICrYrX6RVXHlXQ1.jpg",
    'https://t3.ftcdn.net/jpg/06/75/32/78/240_F_675327802_ofal9iuJ9lEtLZfd8ICrYrX6RVXHlXQ1.jpg',
    'https://t3.ftcdn.net/jpg/06/75/32/78/240_F_675327802_ofal9iuJ9lEtLZfd8ICrYrX6RVXHlXQ1.jpg',
    'https://t3.ftcdn.net/jpg/06/75/32/78/240_F_675327802_ofal9iuJ9lEtLZfd8ICrYrX6RVXHlXQ1.jpg',
    'https://t3.ftcdn.net/jpg/06/75/32/78/240_F_675327802_ofal9iuJ9lEtLZfd8ICrYrX6RVXHlXQ1.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(children: [
            headingFruitpage(),
            const SizedBox(
              height: 10,
            ),
            GridView.builder(
                padding: EdgeInsets.all(12),
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 25,
                ),
                itemBuilder: (context, index) {
                  return Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColor.appMainColor, width: 2),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(images[index]))),
                    ),
                    Positioned(
                        right: 20,
                        top: 16,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.green[400],
                        )),
                    Positioned(
                      top: 180,
                      right: 20,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(15)),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 13,
                        ),
                      ),
                    )
                  ]);
                }),
            const SizedBox(
              height: 10,
            ),
            Container(
                height: 40,
                width: MediaQuery.of(context).size.width * .9,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/loginpageshopping cart.jfif')),
                )),
            SizedBox(
              height: 10,
            ),
            GridView.builder(
                padding: EdgeInsets.all(12),
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: images.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 25,
                ),
                itemBuilder: (context, index) {
                  return Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColor.appMainColor, width: 2),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(images[index]))),
                    ),
                    Positioned(
                        right: 20,
                        top: 16,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.green[400],
                        )),
                    Positioned(
                      top: 180,
                      right: 20,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 13,
                        ),
                      ),
                    )
                  ]);
                }),
          ]),
        ),
      ),
    );
  }

  Row headingFruitpage() {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.arrow_back,
            color: AppColor.appMainColor,
          ),
          RichText(
            text: const TextSpan(
                text: 'Fresh ',
                style: TextStyle(
                    color: AppColor.headingColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
                children: [
                  TextSpan(
                      text: 'Fruits',
                      style: TextStyle(
                          color: AppColor.appMainColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w900)),
                ]),
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
}
