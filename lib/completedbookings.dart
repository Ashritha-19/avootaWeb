// import 'package:flutter/material.dart';

// class CompletedBookingDetails extends StatelessWidget {
//   const CompletedBookingDetails({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);  // Go back to the previous screen
//           },
//         ),
//       ),
//       body: Expanded(
//         child: Container(
//           width: double.infinity,
//           padding: const EdgeInsets.all(24),
//           margin: const EdgeInsets.all(24),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(16),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 offset: const Offset(0, 2),
//                 blurRadius: 4,
//               ),
//             ],
//           ),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Heading Section
//               Container(
//                 width: 530, // Fixed width
//                 height: 68, // Fixed height
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     const Text(
//                                       'Booking Details',
//                                       style: TextStyle(
//                                         fontFamily: 'Inter',
//                                         fontSize: 24,
//                                         fontWeight: FontWeight.w700,
//                                         height: 36 / 24,
//                                         color: Color(0xFF212121),
//                                         decoration: TextDecoration.none,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 4),
//                                     Row(
//                                       children: [
//                                         Text(
//                                           'Dashboard / Completed Bookings / Booking Details',
//                                           style: TextStyle(
//                                             fontFamily: 'Inter',
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w500,
//                                             height: 24 / 16,
//                                             color: const Color(0xFF697586),
//                                             decoration: TextDecoration.none,
//                                           ),
//                                         ),
//                                         const Text(
//                                           ' / ',
//                                           style: TextStyle(
//                                             fontFamily: 'Inter',
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w500,
//                                             height: 24 / 16,
//                                             color: Color(0xFF697586),
//                                             decoration: TextDecoration.none,
//                                           ),
//                                         ),
//                                         Text(
//                                           'TJS207601102940',
//                                           style: TextStyle(
//                                             fontFamily: 'Inter',
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w500,
//                                             height: 24 / 16,
//                                             color: const Color(0xFF003572),
//                                             decoration: TextDecoration.none,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//     Card(
//   color: Colors.grey[100], // Background color
//   elevation: 2,
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(16),
//   ),
//  child: Padding(
//   padding: const EdgeInsets.all(16),
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         'Hotel Details',
//         style: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//           color: Colors.blue[900],
//         ),
//       ),
//       const SizedBox(height: 16),
//       // First Row: Hotel Name, Phone, City
//       Row(
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text(
//                   'Hotel Name',
//                   style: TextStyle(color: Colors.grey, fontSize: 14),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   'The Mount Regency',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text(
//                   'Phone',
//                   style: TextStyle(color: Colors.grey, fontSize: 14),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   '91-9841119992',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text(
//                   'City',
//                   style: TextStyle(color: Colors.grey, fontSize: 14),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   'Chennai',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       const SizedBox(height: 16),
//       // Second Row: Address, State, Country
//       Row(
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text(
//                   'Address',
//                   style: TextStyle(color: Colors.grey, fontSize: 14),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   '#7 Wallers Road, Mount Road',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text(
//                   'State',
//                   style: TextStyle(color: Colors.grey, fontSize: 14),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   'Tamil Nadu',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text(
//                   'Country',
//                   style: TextStyle(color: Colors.grey, fontSize: 14),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   'India',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
  


//  const SizedBox(height: 32),
//         Text(
//           'Booking Details',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Colors.blue[900],
//           ),
//         ),
//         const SizedBox(height: 16),
      

//         Row(
//   children: [
//     Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           Text(
//             'Booking ID',
//             style: TextStyle(color: Colors.grey, fontSize: 14),
//           ),
//           SizedBox(height: 4),
//           Text(
//             'TJS207601102940',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//     ),
//     Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           Text(
//             'Check-In Date',
//             style: TextStyle(color: Colors.grey, fontSize: 14),
//           ),
//           SizedBox(height: 4),
//           Text(
//             '19 November 2024',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//     ),
//     Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           Text(
//             'Check-Out Date',
//             style: TextStyle(color: Colors.grey, fontSize: 14),
//           ),
//           SizedBox(height: 4),
//           Text(
//             '20 November 2024',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//     ),
//   ],
// ),

// const SizedBox(height: 16),

// Row(
//   children: [
//     Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           Text(
//             'No of Days',
//             style: TextStyle(color: Colors.grey, fontSize: 14),
//           ),
//           SizedBox(height: 4),
//           Text(
//             '1',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//     ),
//     Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           Text(
//             'Room Type',
//             style: TextStyle(color: Colors.grey, fontSize: 14),
//           ),
//           SizedBox(height: 4),
//           Text(
//             'Standard Double Room - 1 Queen Bed',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//     ),
//     Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           Text(
//             'No of People',
//             style: TextStyle(color: Colors.grey, fontSize: 14),
//           ),
//           SizedBox(height: 4),
//           Text(
//             '2 Adults, 0 Children',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//     ),
//   ],
// ),

//         const SizedBox(height: 16),
      
//       ],
//     ),
//   ),
// ),
//                               const SizedBox(height: 32),
//                               // Traveller Details Card
//                        Card(
//                                 color: Colors.grey[100], // Updated color
//                                 elevation: 2,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(16),
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(16),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         'Traveller Details',
//                                         style: TextStyle(
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.blue[900],
//                                         ),
//                                       ),
//                                       const SizedBox(height: 16),
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Expanded(
//                                             child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: const [
//                                                 Text(
//                                                   'Name',
//                                                   style: TextStyle(
//                                                     color: Colors.grey,
//                                                     fontSize: 14,
//                                                   ),
//                                                 ),
//                                                 SizedBox(height: 4),
//                                                 Text(
//                                                   'Vijay Anand',
//                                                   style: TextStyle(
//                                                     fontSize: 16,
//                                                     fontWeight: FontWeight.w500,
//                                                     color: Colors.black,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: const [
//                                                 Text(
//                                                   'Phone',
//                                                   style: TextStyle(
//                                                     color: Colors.grey,
//                                                     fontSize: 14,
//                                                   ),
//                                                 ),
//                                                 SizedBox(height: 4),
//                                                 Text(
//                                                   '9043493339',
//                                                   style: TextStyle(
//                                                     fontSize: 16,
//                                                     fontWeight: FontWeight.w500,
//                                                     color: Colors.black,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: const [
//                                                 Text(
//                                                   'Email',
//                                                   style: TextStyle(
//                                                     color: Colors.grey,
//                                                     fontSize: 14,
//                                                   ),
//                                                 ),
//                                                 SizedBox(height: 4),
//                                                 Text(
//                                                   'vijayanand310@gmail.com',
//                                                   style: TextStyle(
//                                                     fontSize: 16,
//                                                     fontWeight: FontWeight.w500,
//                                                     color: Colors.black,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(height: 16),
//                                       Row(
//                                         children: [
//                                           Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: const [
//                                               Text(
//                                                 'PAN',
//                                                 style: TextStyle(
//                                                   color: Colors.grey,
//                                                   fontSize: 14,
//                                                 ),
//                                               ),
//                                               SizedBox(height: 4),
//                                               Text(
//                                                 'BIJPV9305H',
//                                                 style: TextStyle(
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.w500,
//                                                   color: Colors.black,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),

//                               const SizedBox(height: 32),
//           ],
//         ),
//       ),
//         ),
//     ),
//     );
//   }
// }


//CompletedBookingDetails
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class CompletedBookingDetails extends StatefulWidget {
  final String bookingId;

  const CompletedBookingDetails({Key? key, required this.bookingId})
      : super(key: key);

  @override
  _CompletedBookingDetailsState createState() =>
      _CompletedBookingDetailsState();
}

class _CompletedBookingDetailsState extends State<CompletedBookingDetails> {
  final Dio _dio = Dio();
  bool _isLoading = true;
  bool _hasError = false;
  Map<String, dynamic> _bookingDetails = {};

  // Helper method to calculate the number of days
  int _calculateDays(String checkin, String checkout) {
    final checkinDate = DateTime.parse(checkin);
    final checkoutDate = DateTime.parse(checkout);
    return checkoutDate.difference(checkinDate).inDays;
  }

  // Helper method to calculate the number of people
  int _calculatePeople(List<dynamic> roomInfo) {
    int numberOfAdults = roomInfo[0]['numberOfAdults'] ?? 0;
    int numberOfChild = roomInfo[0]['numberOfChild'] ?? 0;
    return numberOfAdults + numberOfChild;
  }

  @override
  void initState() {
    super.initState();
    _fetchBookingDetails();
  }

  Future<void> _fetchBookingDetails() async {
    try {
      final response = await _dio.post(
        'https://avoota-core.onrender.com/api/avoota/booking-details',
        data: {'bookingId':"TJS200501250764"}, // Send bookingId in request body
      );
      final data=response.data;
      final hotelData=data["response"];
      setState(() {
        print(response);
        _isLoading = false;
        _bookingDetails = hotelData;
        _hasError = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching booking details: $e')),
      );
    }
  }

//   getAllUpcomingBookings() async {
//     try {
//       final payload={
//     "bookingId": "TJS200501250764"
// };
//       final response = await _dio.post('https://avoota-core-v6.onrender.com/api/avoota/booking-details',data: payload);
//       print(response);

//       if (response.data["avootaStatus"] == "SUCCESS") {
//          final List<dynamic> data = response.data;
//       return data.map((e) => Booking.fromJson(e));
//       } else {
//         throw Exception('Failed to load bookings');
//       }
//     } catch (e) {
//       throw Exception('Error fetching data: $e');
//     }
//   }

  @override
  Widget build(BuildContext context) {
  
     final order = _bookingDetails['order']??{};
     final itemInfos = _bookingDetails['itemInfos']??{};
    final deliveryInfo = order['deliveryInfo'];
    final hotel = itemInfos['HOTEL'];
    final hInfo = hotel['hInfo'];
    final dynamic ad = hInfo['ad'];
    final dynamic cnt = hInfo['cnt'];
    final query = hotel['query'];
     final checkinDate = query['checkinDate'] ?? '';
    final checkoutDate = query['checkoutDate'] ?? '';
    final dynamic ops = hInfo['ops'];


    // Calculate no. of days
    final noOfDays = checkinDate.isNotEmpty && checkoutDate.isNotEmpty
        ? _calculateDays(checkinDate, checkoutDate)
        : 0;

    // Calculate no. of people
    final roomInfo = query['roomInfo'] ?? [];
    final noOfPeople = roomInfo.isNotEmpty ? _calculatePeople(roomInfo) : 0;


     print("deliveryInfo>>>>>>${deliveryInfo}");
     print("HotelInfo>>>>>>${hInfo}");
     print("AddressInfo>>>>>>${ad}");
     print("AddressInfo>>>>>>${query}");
     print("AddressInfo>>>>>>${ops}");
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_hasError) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Error fetching data. Please try again later.'),
              ElevatedButton(
                onPressed: _fetchBookingDetails,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    // Extracting booking data from the fetched response
    final hotelDetails = _bookingDetails['hotel'] ?? {};
    final bookingDetails = _bookingDetails['booking'] ?? {};
    final travellerDetails = _bookingDetails['traveller'] ?? {};

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Booking Details',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      height: 36 / 24,
                      color: Color(0xFF212121),
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Text(
                        'Dashboard / Completed Bookings / Booking Details / ',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 24 / 16,
                          color: Color(0xFF697586),
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        widget.bookingId,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 24 / 16,
                          color: Color(0xFF003572),
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Hotel Details Card
              _buildDetailsCard(
                title: 'Hotel Details',
                details: [
                  _buildRowDetails(
                    ['Hotel Name', 'Phone', 'City'],
                    [
                      hInfo['name'] ?? '',
                      cnt['ph'] ?? '',
                      ad['city']['name'] ?? ''
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildRowDetails(
                    ['Address', 'State', 'Country'],
                    [
                      ad['adr'] ?? '',
                      ad['state']['name'] ?? '',
                      ad['country']['name'] ?? ''
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Booking Details Card
              _buildDetailsCard(
                title: 'Booking Details',
                details: [
                  _buildRowDetails(
                    ['Booking ID', 'Check-In Date', 'Check-Out Date'],
                    [
                      order['bookingId'] ?? '',
                      checkinDate,
                      checkoutDate
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildRowDetails(
                    ['No of Days', 'Room Type', 'No of People'],
                    [
                     noOfDays.toString(),
                      _bookingDetails['roomType'] ?? '',
                     noOfPeople.toString()
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Traveller Details Card
              _buildDetailsCard(
                title: 'Traveller Details',
                details: [
                  _buildRowDetails(
                    ['Name', 'Phone', 'Email', 'Pan'],
                    [
                      _bookingDetails['name'] ?? '',
                      (deliveryInfo['contacts'] as List).join(', '),
                      (deliveryInfo['emails'] as List).join(', '),
                      _bookingDetails['pan'] ?? ''
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsCard({
    required String title,
    required List<Widget> details,
  }) {
    return Card(
      color: Colors.grey[100],
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
            const SizedBox(height: 16),
            ...details,
          ],
        ),
      ),
    );
  }

  Widget _buildRowDetails(List<String> labels, List<String> values) {
    return Row(
      children: List.generate(labels.length, (index) {
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                labels[index],
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                values[index],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
