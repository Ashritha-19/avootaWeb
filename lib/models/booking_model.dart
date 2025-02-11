
// class BookingData {
//   final List<Booking> upcoming;
//   final List<Booking> completed;
//   final List<Booking> canceled;
//   final List<Booking> pending;

//   BookingData({
//     required this.upcoming,
//     required this.completed,
//     required this.canceled,
//     required this.pending,
//   });

//   factory BookingData.fromJson(Map<String, dynamic> json) {
//     return BookingData(
//       upcoming: List<Booking>.from(json['upcoming'].map((x) => Booking.fromJson(x))),
//       completed: List<Booking>.from(json['completed'].map((x) => Booking.fromJson(x))),
//       canceled: List<Booking>.from(json['canceled'].map((x) => Booking.fromJson(x))),
//       pending: List<Booking>.from(json['pending'].map((x) => Booking.fromJson(x))),
//     );
//   }
// }

// class Booking {
//   final String bookingId;
//   final Request request;
//   final Response response;
//   final String bookingStatus;
//   final String checkInDate;
//   final String checkOutDate;
//   final int numberOfRooms;
//   final int numOfAdults;
//   final String imgUrl;
//   final String hotelName;
//   final String hotelRating;
//   final String address;
//   final String paymentStatus;
//   final bool ratingStatus;
//   final String userId;
//   final String createdTime;
//   final String? hotelId;

//   Booking({
//     required this.bookingId,
//     required this.request,
//     required this.response,
//     required this.bookingStatus,
//     required this.checkInDate,
//     required this.checkOutDate,
//     required this.numberOfRooms,
//     required this.numOfAdults,
//     required this.imgUrl,
//     required this.hotelName,
//     required this.hotelRating,
//     required this.address,
//     required this.paymentStatus,
//     required this.ratingStatus,
//     required this.userId,
//     required this.createdTime,
//     this.hotelId,
//   });

//   factory Booking.fromJson(Map<String, dynamic> json) {
//     return Booking(
//       bookingId: json['bookingId'],
//       request: Request.fromJson(json['request']),
//       response: Response.fromJson(json['response']),
//       bookingStatus: json['bookingStatus'],
//       checkInDate: json['checkInDate'],
//       checkOutDate: json['checkOutDate'],
//       numberOfRooms: json['numberOfRooms'],
//       numOfAdults: json['numOfAdults'],
//       imgUrl: json['imgUrl'],
//       hotelName: json['hotelName'],
//       hotelRating: json['hotelRating'],
//       address: json['address'],
//       paymentStatus: json['paymentStatus'],
//       ratingStatus: json['ratingStatus'],
//       userId: json['userId'],
//       createdTime: json['createdTime'],
//       hotelId: json['hotelId'],
//     );
//   }
// }

// class Request {
//   final String bookingId;
//   final String userId;
//   final List<RoomTravellerInfo> roomTravellerInfo;
//   final DeliveryInfo deliveryInfo;
//   final String type;
//   final List<PaymentInfo> paymentInfos;
//   final SpecialRequest specialRequest;
//   final String checkInDate;
//   final String checkOutDate;
//   final int numberOfRooms;
//   final int numOfAdults;
//   final String imgUrl;
//   final String hotelName;
//   final String hotelRating;
//   final String address;

//   Request({
//     required this.bookingId,
//     required this.userId,
//     required this.roomTravellerInfo,
//     required this.deliveryInfo,
//     required this.type,
//     required this.paymentInfos,
//     required this.specialRequest,
//     required this.checkInDate,
//     required this.checkOutDate,
//     required this.numberOfRooms,
//     required this.numOfAdults,
//     required this.imgUrl,
//     required this.hotelName,
//     required this.hotelRating,
//     required this.address,
//   });

//   factory Request.fromJson(Map<String, dynamic> json) {
//     return Request(
//       bookingId: json['bookingId'],
//       userId: json['userId'],
//       roomTravellerInfo: List<RoomTravellerInfo>.from(
//           json['roomTravellerInfo'].map((x) => RoomTravellerInfo.fromJson(x))),
//       deliveryInfo: DeliveryInfo.fromJson(json['deliveryInfo']),
//       type: json['type'],
//       paymentInfos:
//           List<PaymentInfo>.from(json['paymentInfos'].map((x) => PaymentInfo.fromJson(x))),
//       specialRequest: SpecialRequest.fromJson(json['specialRequest']),
//       checkInDate: json['checkInDate'],
//       checkOutDate: json['checkOutDate'],
//       numberOfRooms: json['numberOfRooms'],
//       numOfAdults: json['numOfAdults'],
//       imgUrl: json['imgUrl'],
//       hotelName: json['hotelName'],
//       hotelRating: json['hotelRating'],
//       address: json['address'],
//     );
//   }
// }

// class RoomTravellerInfo {
//   final List<TravellerInfo> travellerInfo;

//   RoomTravellerInfo({required this.travellerInfo});

//   factory RoomTravellerInfo.fromJson(Map<String, dynamic> json) {
//     return RoomTravellerInfo(
//       travellerInfo: List<TravellerInfo>.from(
//           json['travellerInfo'].map((x) => TravellerInfo.fromJson(x))),
//     );
//   }
// }

// class TravellerInfo {
//   final String fN;
//   final String lN;
//   final String ti;
//   final String pan;
//   final String pt;

//   TravellerInfo({required this.fN, required this.lN, required this.ti, required this.pan, required this.pt});

//   factory TravellerInfo.fromJson(Map<String, dynamic> json) {
//     return TravellerInfo(
//       fN: json['fN'],
//       lN: json['lN'],
//       ti: json['ti'],
//       pan: json['pan'],
//       pt: json['pt'],
//     );
//   }
// }

// class DeliveryInfo {
//   final List<String> emails;
//   final List<String> contacts;
//   final List<String> code;

//   DeliveryInfo({required this.emails, required this.contacts, required this.code});

//   factory DeliveryInfo.fromJson(Map<String, dynamic> json) {
//     return DeliveryInfo(
//       emails: List<String>.from(json['emails']),
//       contacts: List<String>.from(json['contacts']),
//       code: List<String>.from(json['code']),
//     );
//   }
// }

// class PaymentInfo {
//   final double amount;

//   PaymentInfo({required this.amount});

//   factory PaymentInfo.fromJson(Map<String, dynamic> json) {
//     return PaymentInfo(amount: json['amount'].toDouble());
//   }
// }

// class SpecialRequest {
//   final bool smokingRoom, lateCheckIn, earlyCheckIn, highFloor, largeBed, twinBed;

//   SpecialRequest({required this.smokingRoom, required this.lateCheckIn, required this.earlyCheckIn, required this.highFloor, required this.largeBed, required this.twinBed});

//   factory SpecialRequest.fromJson(Map<String, dynamic> json) {
//     return SpecialRequest(
//       smokingRoom: json['smokingRoom'],
//       lateCheckIn: json['lateCheckIn'],
//       earlyCheckIn: json['earlyCheckIn'],
//       highFloor: json['highFloor'],
//       largeBed: json['largeBed'],
//       twinBed: json['twinBed'],
//     );
//   }
// }

// class Response {
//   final String bookingId;
//   final Status status;

//   Response({required this.bookingId, required this.status});

//   factory Response.fromJson(Map<String, dynamic> json) {
//     return Response(
//       bookingId: json['bookingId'],
//       status: Status.fromJson(json['status']),
//     );
//   }
// }

// class Status {
//   final bool success;
//   final int httpStatus;

//   Status({required this.success, required this.httpStatus});

//   factory Status.fromJson(Map<String, dynamic> json) {
//     return Status(success: json['success'], httpStatus: json['httpStatus']);
//   }
// }
////////////////
///
///


class BookingResponse {
  final List<Booking> upcoming;
  final List<Booking> completed;
  final List<Booking> canceled;
  final List<Booking> pending;

  BookingResponse({
    required this.upcoming,
    required this.completed,
    required this.canceled,
    required this.pending,
  });

  factory BookingResponse.fromJson(Map<String, dynamic> json) {
    return BookingResponse(
      upcoming: (json['upcoming'] as List).map((e) => Booking.fromJson(e)).toList(),
      completed: (json['completed'] as List).map((e) => Booking.fromJson(e)).toList(),
      canceled: (json['canceled'] as List).map((e) => Booking.fromJson(e)).toList(),
      pending: (json['pending'] as List).map((e) => Booking.fromJson(e)).toList(),
    );
  }
}

class Booking {
  final String bookingId;
  final String hotelName;
  final String hotelRating;
  final String address;
  final String checkInDate;
  final String checkOutDate;
  final int numberOfRooms;
  final int numOfAdults;
  final String imgUrl;
  final String paymentStatus;
  final String bookingStatus;
  final String contact;
  final String fullName;
  final DateTime? createdTime;

  Booking({
    required this.bookingId,
    required this.hotelName,
    required this.hotelRating,
    required this.address,
    required this.checkInDate,
    required this.checkOutDate,
    required this.numberOfRooms,
    required this.numOfAdults,
    required this.imgUrl,
    required this.paymentStatus,
    required this.bookingStatus,
    required this.contact,
    required this.fullName,
     this.createdTime, 
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    String contact = "";
    String fullName = "";
    
    if (json['request'] != null) {
      var deliveryInfo = json['request']['deliveryInfo'];
      if (deliveryInfo != null && deliveryInfo['contacts'] != null && deliveryInfo['contacts'].isNotEmpty) {
        contact = deliveryInfo['contacts'][0];
      }

      var travellerInfo = json['request']['roomTravellerInfo'][0]['travellerInfo'][0];
      if (travellerInfo != null) {
        fullName = "${travellerInfo['fN']} ${travellerInfo['lN']}".trim();
      }
    }

    return Booking(
      bookingId: json['bookingId'] ?? '',
      hotelName: json['hotelName'] ?? '',
      hotelRating: json['hotelRating'] ?? '',
      address: json['address'] ?? '',
      checkInDate: json['checkInDate'] ?? '',
      checkOutDate: json['checkOutDate'] ?? '',
      numberOfRooms: json['numberOfRooms'] ?? 1,
      numOfAdults: json['numOfAdults'] ?? 1,
      imgUrl: json['imgUrl'] ?? '',
      paymentStatus: json['paymentStatus'] ?? '',
      bookingStatus: json['bookingStatus'] ?? '',
      contact: contact,
      fullName: fullName,
      createdTime: json['createdTime'] != null
          ? DateTime.tryParse(json['createdTime'])
          : null,
    );
  }
}
