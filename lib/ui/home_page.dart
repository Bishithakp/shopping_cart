import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shopping_cart/constants/app_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      padding: EdgeInsets.all(7.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.arrow_back,
                color: Colors.green,
              ),
              RichText(
                text: const TextSpan(
                    text: 'Welcome To ',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    children: [
                      TextSpan(
                          text: 'Fresh Basket',
                          style: TextStyle(
                              fontSize: 20, color: AppColor.appMainColor)),
                    ]),
              ),
              Icon(Icons.notifications)
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 60,
            child: const TextField(
                decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              hintText: 'search',
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColor.appMainColor, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            )),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width * .95,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://t3.ftcdn.net/jpg/06/75/32/78/240_F_675327802_ofal9iuJ9lEtLZfd8ICrYrX6RVXHlXQ1.jpg'))),
          ),
          SizedBox(
            height: 10,
          ),
          const Text(
            'categories',
            style: TextStyle(
                fontSize: 15,
                color: AppColor.headingColor,
                fontWeight: FontWeight.w900),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: ((context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 40,
                    width: 60,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                'https://t3.ftcdn.net/jpg/06/75/32/78/240_F_675327802_ofal9iuJ9lEtLZfd8ICrYrX6RVXHlXQ1.jpg'))),
                  );
                })),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Popular Products',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
          ),
          GridView.builder(shrinkWrap: true,
              itemCount: images.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 6,
                crossAxisSpacing: 4,
              ),
              itemBuilder: (context, index) {
                return Stack(children: [
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.appMainColor,width: 2),
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
                  Positioned(top:200,right: 20,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(color: Colors.green,
                          borderRadius: BorderRadius.circular(15)),
                          child: Icon(Icons.add,color: Colors.white,size: 13,),
                    ),
                  )
                ]);
              }),
          BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 25,
                  ),
                  label: 'Home',
                  backgroundColor: AppColor.groundColor),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 25,
                  ),
                  label: 'Cart',
                  backgroundColor: AppColor.groundColor),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                    size: 25,
                  ),
                  label: 'favorite',
                  backgroundColor: AppColor.groundColor),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_pin_circle_outlined,
                    size: 25,
                  ),
                  label: 'Profile',
                  backgroundColor: AppColor.groundColor)
            ],
            type: BottomNavigationBarType.shifting,
            currentIndex: selectedindex,
            selectedItemColor: AppColor.appMainColor,
            unselectedItemColor: AppColor.headingColor,
            elevation: 6,
            onTap: (index) {
              setState(() {
                selectedindex = index;
              });
            },
          )
        ],
      ),
    ));
  }
}
