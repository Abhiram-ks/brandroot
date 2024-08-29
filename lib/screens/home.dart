import 'package:flutter/material.dart';
import 'package:flutter_project_1/screens/index.dart';
import 'package:flutter_project_1/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffcbcbcb),
      // top - home page
      appBar: AppBar(
        title: const Text(
          'HOME',
          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _showLogoutDialog(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 0, 0), // Pink
                Color.fromARGB(255, 18, 90, 0), // Purple
                Color.fromARGB(255, 2, 189, 58), // Light Blue
                Color.fromARGB(255, 64, 255, 0), // Teal
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          const ListTile(
            leading: Icon(
              Icons.shopping_cart,
              size: 30,
              color: Colors.green,
            ),
            title: Text(
              'Items',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          // serch details
          Container(
            height: 52,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: const Color(0xffc2c2c2),
                filled: true,
                hintText: 'Search for items in the store',
                suffixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SearchItem(
            imageUrl:
                'https://www.shutterstock.com/image-photo/fresh-tasty-burger-on-dark-600nw-1937730733.jpg',
            productName: 'Burger',
            priceDetails: '399\$ / 1 nos',
          ),
          const SearchItem(
            imageUrl:
                'https://static.vecteezy.com/system/resources/thumbnails/027/671/365/small_2x/pepperoni-pizza-on-the-wooden-board-with-dark-lighting-and-black-background-food-and-delivery-concept-generative-ai-free-photo.jpg',
            productName: 'pizza',
            priceDetails: '499\$ / full',
          ),
          const SearchItem(
            imageUrl:
                'https://img.freepik.com/premium-photo/homemade-sandwich-with-lettuce-ham_77190-1925.jpg',
            productName: 'SandWich',
            priceDetails: '35% off /199\$',
          ),

          const SearchItem(
            imageUrl: 'https://i.ytimg.com/vi/CK_GDa8Rj-Y/sddefault.jpg',
            productName: 'Alfam',
            priceDetails: '499\$ / 1 kg',
          ),
          const SearchItem(
            imageUrl:
                'https://img.freepik.com/premium-photo/asian-noodles-with-prawns-vegetables-served-pan-dark-background_1220-5662.jpg',
            productName: 'Noodles',
            priceDetails: '699 \$/ full',
          ),
          const SearchItem(
            imageUrl:
                'https://img.freepik.com/premium-photo/crispy-french-fries-black-background-photo-1_1021945-5184.jpg',
            productName: 'French Fries',
            priceDetails: '399\$ / 1 Cup',
          ),
          const SearchItem(
            imageUrl:
                'https://image.entabe.jp/upload/20210701/images/sub1_1.jpg',
            productName: 'KFC',
            priceDetails: '999\$/10 pc',
          ),
          const SearchItem(
            imageUrl:
                'https://c.ndtvimg.com/2023-03/fqpicf98_momos_625x300_15_March_23.jpg?im=FaceCrop,algorithm=dnn,width=1200,height=675',
            productName: 'Momos',
            priceDetails: '50\$ / 1 nos',
          ),
        ],
      ),
    );
  }

  //  logout warnig message
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Logout'),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                logout(context); //  logout action
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

// logout go to home page part
    logout(BuildContext context) async {
 final sharePrefs =await SharedPreferences.getInstance();
     await  sharePrefs.clear();

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx) => const ScreenLogin()),
      (route) => false,
    );
  }
}
