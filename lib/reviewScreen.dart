import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // This will go back to the previous screen
          },
        ),
      ),
      body: Row(
        children: [
          // Sidebar Section
         // _buildSidebar(),

          // Main Content Section
          Expanded(
            child: Column(
              children: [
                // Top Bar Section
              //  _buildTopBar(),

                // Content Area
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      //  color: Colors.grey[100],
                      padding: const EdgeInsets.all(30),
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Reviews ',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          const Text('Dashboard / Reviews / Reply'),
                          const SizedBox(height: 10),
                          _buildTextFieldWithFixedSize('Name', 'User 1',
                              width: 964, height: 60),
                          _buildTextFieldWithFixedSize(
                              'Email/Mobile Number', 'user@email.com',
                              width: 964, height: 60),
                          _buildTextFieldWithFixedSize(
                              'Title', 'Great Experience',
                              width: 964, height: 60),
                          _buildTextFieldWithFixedSize(
                            'Message',
                            'I had a wonderful stay at this hotel. Highly recommended!',
                            width: 964,
                            height: 120,
                          ),
                          _buildStarRating(),
                          const SizedBox(height: 20),
                          const Text(
                            'Images',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          _buildImageSection(),
                          const SizedBox(height: 20),
                          _buildTextFieldWithFixedSize(
                              'Admin Reply', 'Write something...',
                              width: 964, height: 120),
                          const SizedBox(height: 20),
                          _buildSubmitButton(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildSidebar() {
  //   return Container(
  //     width: 250,
  //     color: Colors.white,
  //     child: ListView(
  //       padding: EdgeInsets.zero,
  //       children: [
  //         // Logo Section
  //         Container(
  //           padding: const EdgeInsets.symmetric(vertical: 20),
  //           alignment: Alignment.center,
  //           child: Image.asset(
  //             'assets/images/avoota_logo.png',
  //             width: 120,
  //             height: 50,
  //             fit: BoxFit.contain,
  //           ),
  //         ),
  //         // Menu Items
  //         ListTile(
  //           leading: Image.asset('assets/images/Dashboard.png'),
  //           title: const Text('Dashboards'),
  //           onTap: () {},
  //         ),
  //         ExpansionTile(
  //           leading: Image.asset('assets/images/check-square.png'),
  //           title: const Text('Booking Details'),
  //         ),
  //         ListTile(
  //           leading: Image.asset('assets/images/bank-note.png'),
  //           title: const Text('PhonePe Payment'),
  //           onTap: () {},
  //         ),
  //         ListTile(
  //           leading: Image.asset('assets/images/message-dots-circle.png'),
  //           title: const Text('Reviews'),
  //         ),
  //         ListTile(
  //           leading: Image.asset('assets/images/bar-chart.png'),
  //           title: const Text('Reports'),
  //           onTap: () {},
  //         ),
  //         ListTile(
  //           leading: Image.asset('assets/images/log-out-04.png'),
  //           title: const Text('Logout'),
  //           onTap: () {},
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildTopBar() {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //     color: Colors.white,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         // Search Box
  //         SizedBox(
  //           width: 400,
  //           child: TextField(
  //             decoration: InputDecoration(
  //               hintText: 'Search...',
  //               border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(8),
  //                 borderSide: BorderSide(color: Colors.grey.shade300),
  //               ),
  //               prefixIcon: const Icon(Icons.search, color: Colors.black),
  //             ),
  //           ),
  //         ),
  //         // Icons and Avatar Section
  //         Row(
  //           children: [
  //             IconButton(
  //               icon: const Icon(Icons.notifications_none, color: Colors.black),
  //               onPressed: () {},
  //             ),
  //             const SizedBox(width: 10),
  //             IconButton(
  //               icon: const Icon(Icons.logout, color: Colors.black),
  //               onPressed: () {},
  //             ),
  //             const SizedBox(width: 10),
  //             const CircleAvatar(
  //               radius: 22,
  //               backgroundImage: AssetImage('assets/images/Frame.png'),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildTextFieldWithFixedSize(String label, String placeholder,
      {required double width, required double height}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: width,
            height: height,
            child: TextField(
              maxLines: height > 60 ? null : 1,
              decoration: InputDecoration(
                hintText: placeholder,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 3.0,
                  horizontal: 5.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStarRating() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Star Rating',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          children: List.generate(
            5,
            (index) =>
                const Icon(Icons.star, color: Colors.orangeAccent, size: 30),
          ),
        ),
      ],
    );
  }

  Widget _buildImageSection() {
    return Row(
      children: List.generate(
        3,
        (index) => Container(
          width: 80,
          height: 80,
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.image, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF003572),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Text(
            'Submit',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
