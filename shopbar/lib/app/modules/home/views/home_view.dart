import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../../widgets/custom_bottom_navigation_bar.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
                          child: Obx(() => Text(
                            'Hello, ${controller.user['displayName'] ?? controller.user['email'] ?? 'User'}',
                            style: const TextStyle(fontSize: 14),
                          )),
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Banner App
                Obx(() {
                  if (controller.homeProductsList.isEmpty) {
                    return Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 69, 74, 78),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'Loading...',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  } else {
                    final product = controller.homeProductsList[0];
                    return Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200,
                            child: Image.network(
                              product['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              // Navigate to product detail page
                              Get.toNamed('/product-detail', arguments: {'id': product['id']});
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.blue,
                            ),
                            child: const Text('Detail Product'),
                          ),
                        ],
                      ),
                    );
                  }
                }),

                // Menu Grid
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    final List<Map<String, dynamic>> menuItems = [
                      {'icon': Icons.shopping_cart, 'title': 'Keranjang'},
                      {'icon': Icons.book, 'title': 'Pedoman'},
                      {'icon': Icons.location_on, 'title': 'Lokasi'},
                      {'icon': Icons.phone, 'title': 'Kontak'},
                      {'icon': Icons.event, 'title': 'Agenda'},
                      {'icon': Icons.info, 'title': 'Info'},
                    ];
                    
                    final item = menuItems[index];
                    return GestureDetector(
                      onTap: () {
                        if (controller.homeProductsList.isNotEmpty) {
                          final product = controller.homeProductsList[0];
                          Get.toNamed('/product-detail', arguments: {'id': product['id']});
                        }
                      },
                      child: Card(
                        elevation: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              item['icon'],
                              size: 30,
                              color: Colors.blue,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item['title'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                // News Section
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Kategori Produk',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: controller.homeProductsList.length,
                  itemBuilder: (context, index) {
                    final product = controller.homeProductsList[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed('/product-detail', arguments: product);
                      },
                      child: Card(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          title: Text(product['title']),
                          subtitle: Text(product['date'] ?? ''),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }
      }),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 0),
    );
  }
}
