import 'package:avoota/cancellecdBookings_4.dart';
import 'package:avoota/completedBookings_3.dart';
import 'package:avoota/phonepay.dart';
import 'package:avoota/reports.dart';
import 'package:avoota/review_10.dart';
import 'package:avoota/upcomingdetails_2.dart';
import 'package:flutter/material.dart';


class SideAndNavBar extends StatefulWidget {
  @override
  _SideAndNavBarState createState() => _SideAndNavBarState();
}

class _SideAndNavBarState extends State<SideAndNavBar> {
  String selectedMenu = '';
  int selectedParent = -1; // To track the selected parent (Booking Details)
  int selectedChild = -1;  // To track the selected child (Upcoming, Completed, Cancelled)

  Widget _currentPage = Center(
    child: Text(
      'Select an option from the SideBar',
      style: TextStyle(fontSize: 18),
    ),
  ); // Default content displayed on the right

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Row(
          children: [
            // Sidebar
            _sidebar_container(screenHeight),
            // Right-side content
            Expanded(
              child: Column(
                children: [
                  // Top Container (Header)
                  _topbar_container(),
                  // Content area
                  Expanded(
                    child: _currentPage, // Display the selected page here
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _topbar_container() {
    return Container(
                  width: double.infinity,
                  height: 72,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 10),
                  color: Colors.white,
                  child: Row(
                    children: [
                      // Search Bar
                      SizedBox(
                        width: 420,
                        height: 44,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(color: const Color(0xFFD0D5DD)),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x1A101828),
                                offset: Offset(0, 1),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8),
                                child: Icon(
                                  Icons.search,
                                  color: Color(0xFF697586),
                                  size: 20,
                                ),
                              ),
                              const Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Search",
                                    hintStyle: TextStyle(
                                      color: Color(0xFF697586),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                     Row(children: [ IconButton(
                        icon: const Icon(Icons.notifications),
                        color: Colors.grey[700],
                        tooltip: 'Notifications',
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.logout),
                        color: Colors.grey[700],
                        tooltip: 'Logout',
                        onPressed: () {},
                      ),
                      GestureDetector(
                        onTap: () {
                          print('Navigating to Profile Page');
                        },
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey[300],
                          backgroundImage: const AssetImage('assets/user.png'),
                        ),
                      ),],)
                    ],
                  ),
                );
  }

  Container _sidebar_container(double screenHeight) {
    return Container(
            width: 250,
            height: screenHeight,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Image.asset(
                        'assets/avootalogo.png',
                        width: 210,
                        height: 72,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const Divider(),
                  // Menu Items
                  ListTile(
                    leading: Image.asset('assets/dashboard.png'),
                    title: const Text('Dashboards'),
                    onTap: () {
                      setState(() {
                        selectedMenu = 'Dashboards';
                        _currentPage = Center(
                          child: Text(
                            'Dashboard Content',
                            style: TextStyle(fontSize: 18),
                          ),
                        );
                      });
                    },
                  ),

                  ExpansionTile(
                    leading: Image.asset('assets/bookingdetails.png'),
                    title: Text(
                      'Booking Details',
                      style: TextStyle(
                        color: selectedParent == 0 ? Colors.blue : Colors.black,
                      ),
                    ),
                    children: [
                      ListTile(
                        title: Text(
                          'Upcoming Bookings',
                          style: TextStyle(
                            color: selectedChild == 0 ? Colors.blue : Colors.black,
                          ),
                        ),
                        onTap: () {
                          setState(() {
  selectedMenu = 'Upcoming Bookings';
  selectedParent = 0;
  selectedChild = 0;
  _currentPage = UpcomingBookings(
    onPageChange: (Widget newPage) {
      setState(() {
        _currentPage = newPage;
      });
    },
  );
});

                        },
                      ),
                      ListTile(
                        title: Text(
                          'Completed Bookings',
                          style: TextStyle(
                            color: selectedChild == 1 ? Colors.blue : Colors.black,
                          ),
                        ),
                        onTap: () {
                          setState(() {
  selectedMenu = 'Completed Bookings';
  selectedParent = 0;
  selectedChild = 0;
  _currentPage = CompletedBookings(
    onPageChange: (Widget newPage) {
      setState(() {
        _currentPage = newPage;
      });
    },
  );
});
                        },
                      ),
                      ListTile(
                        title: Text(
                          'Cancelled Bookings',
                          style: TextStyle(
                            color: selectedChild == 2 ? Colors.blue : Colors.black,
                          ),
                        ),
                        onTap: () {
                          setState(() {
  selectedMenu = 'Cancelled Bookings';
  selectedParent = 0;
  selectedChild = 0;
  _currentPage = CancelledBookings(
    onPageChange: (Widget newPage) {
      setState(() {
        _currentPage = newPage;
      });
    },
  );
});
                        },
                      ),
                    ],
                    onExpansionChanged: (bool expanded) {
                      setState(() {
                        selectedParent = expanded ? 0 : -1;
                        if (!expanded) selectedChild = -1;
                      });
                    },
                  ),
                  ListTile(
                    leading: Image.asset('assets/phonepepayment.png'),
                    title: const Text('PhonePe Payment'),
                    onTap: () {
                      setState(() {
                        selectedMenu = 'PhonePe Payment';
                        _currentPage = paymentscreen();
                          // child: Text(
                          //   'PhonePe Payment Content',
                          //   style: TextStyle(fontSize: 18),
                          // ),
                       
                      });
                    },
                  ),
                  ListTile(
                    leading: Image.asset('assets/reviews.png'),
                    title: const Text('Reviews'),
                    onTap: () {
                      setState(() {
                        selectedMenu = 'Reviews';
                        _currentPage = Reviews();
                      });
                    },
                  ),
                  ExpansionTile(
     leading: Image.asset('assets/reports.png'),
         title:
                      Text(
                        'Reports',
                        style: TextStyle(
                          color: selectedParent == 0 ? Colors.blue : Colors.black,
                        ),
                      ),
     
  children: [
                           ListTile(
                          title: Text(
                            'Revenue Report',
                            style: TextStyle(
                              color: selectedChild == 3 ? Colors.blue : Colors.black,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              selectedMenu = 'Revenue Reports';
                            selectedParent = 0;
                              selectedChild = 3;
                              _currentPage=Grid();
                            });
                          },
                        ),
  ],
  onExpansionChanged: (bool expanded) {
                        setState(() {
                          selectedParent = expanded ? 0 : -1;
                          if (!expanded) selectedChild = -1;
                        });
                      },
),
                            ListTile(
                    leading: Image.asset('assets/logout.png'),
                    title: const Text('Logout'),
                    onTap: () {
                      setState(() {
                        selectedMenu = 'Logout';
                        _currentPage = Center(
                          child: Text(
                            'Logout Content',
                            style: TextStyle(fontSize: 18),
                          ),
                        );
                      });
                    },
                  ),

                ],
              ),
            ),
          );
  }
}
