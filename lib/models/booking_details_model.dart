class BookingId {
  final String? bookingId;
  final Request? request;
  final Response? response;
  final String? bookingStatus;
  final String? checkInDate;
  final String? checkOutDate;
  final int? numberOfRooms;
  final int? numOfAdults;
  final String? imgUrl;
  final String? hotelName;
  final String? hotelRating;
  final String? address;
  final String? paymentStatus;
  final String? gstNumber;
  final String? companyName;
  final String? companyAddress;
  final bool? ratingStatus;
  final String? userId;
  final String? hotelId;
  final String? createdTime;

  BookingId({
    this.bookingId,
    this.request,
    this.response,
    this.bookingStatus,
    this.checkInDate,
    this.checkOutDate,
    this.numberOfRooms,
    this.numOfAdults,
    this.imgUrl,
    this.hotelName,
    this.hotelRating,
    this.address,
    this.paymentStatus,
    this.gstNumber,
    this.companyName,
    this.companyAddress,
    this.ratingStatus,
    this.userId,
    this.hotelId,
    this.createdTime,
  });

  factory BookingId.fromJson(Map<String, dynamic> json) {
    return BookingId(
      bookingId: json['bookingId'] as String?,
      request: json['request'] != null ? Request.fromJson(json['request']) : null,
      response: json['response'] != null ? Response.fromJson(json['response']) : null,
      bookingStatus: json['bookingStatus'] as String?,
      checkInDate: json['checkInDate'] as String?,
      checkOutDate: json['checkOutDate'] as String?,
      numberOfRooms: json['numberOfRooms'] as int?,
      numOfAdults: json['numOfAdults'] as int?,
      imgUrl: json['imgUrl'] as String?,
      hotelName: json['hotelName'] as String?,
      hotelRating: json['hotelRating'] as String?,
      address: json['address'] as String?,
      paymentStatus: json['paymentStatus'] as String?,
      gstNumber: json['gstNumber'] as String?,
      companyName: json['companyName'] as String?,
      companyAddress: json['companyAddress'] as String?,
      ratingStatus: json['ratingStatus'] as bool?,
      userId: json['userId'] as String?,
      hotelId: json['hotelId'] as String?,
      createdTime: json['createdTime'] as String?,
    );
  }
}

class Request {
  final String? gstNumber;
  final String? companyName;
  final String? companyAddress;
  final String? hotelId;
  final String? bookingId;
  final String? userId;
  final List<RoomTravellerInfo>? roomTravellerInfo;
  final DeliveryInfo? deliveryInfo;
  final String? type;
  final List<PaymentInfo>? paymentInfos;
  final SpecialRequest? specialRequest;
  final String? checkInDate;
  final String? checkOutDate;
  final int? numberOfRooms;
  final int? numOfAdults;
  final String? imgUrl;
  final String? hotelName;
  final String? hotelRating;
  final String? address;

  Request({
    this.gstNumber,
    this.companyName,
    this.companyAddress,
    this.hotelId,
    this.bookingId,
    this.userId,
    this.roomTravellerInfo,
    this.deliveryInfo,
    this.type,
    this.paymentInfos,
    this.specialRequest,
    this.checkInDate,
    this.checkOutDate,
    this.numberOfRooms,
    this.numOfAdults,
    this.imgUrl,
    this.hotelName,
    this.hotelRating,
    this.address,
  });

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      gstNumber: json['gstNumber'] as String?,
      companyName: json['companyName'] as String?,
      companyAddress: json['companyAddress'] as String?,
      hotelId: json['hotelId'] as String?,
      bookingId: json['bookingId'] as String?,
      userId: json['userId'] as String?,
      roomTravellerInfo: (json['roomTravellerInfo'] as List?)
          ?.map((e) => RoomTravellerInfo.fromJson(e))
          .toList(),
      deliveryInfo: json['deliveryInfo'] != null ? DeliveryInfo.fromJson(json['deliveryInfo']) : null,
      type: json['type'] as String?,
      paymentInfos: (json['paymentInfos'] as List?)
          ?.map((e) => PaymentInfo.fromJson(e))
          .toList(),
      specialRequest: json['specialRequest'] != null ? SpecialRequest.fromJson(json['specialRequest']) : null,
      checkInDate: json['checkInDate'] as String?,
      checkOutDate: json['checkOutDate'] as String?,
      numberOfRooms: json['numberOfRooms'] as int?,
      numOfAdults: json['numOfAdults'] as int?,
      imgUrl: json['imgUrl'] as String?,
      hotelName: json['hotelName'] as String?,
      hotelRating: json['hotelRating'] as String?,
      address: json['address'] as String?,
    );
  }
}

class Response {
  final String? bookingId;
  final Status? status;

  Response({this.bookingId, this.status});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      bookingId: json['bookingId'] as String?,
      status: json['status'] != null ? Status.fromJson(json['status']) : null,
    );
  }
}

class Status {
  final bool? success;
  final int? httpStatus;

  Status({this.success, this.httpStatus});

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      success: json['success'] as bool?,
      httpStatus: json['httpStatus'] as int?,
    );
  }
}

class RoomTravellerInfo {
  final List<TravellerInfo>? travellerInfo;

  RoomTravellerInfo({this.travellerInfo});

  factory RoomTravellerInfo.fromJson(Map<String, dynamic> json) {
    return RoomTravellerInfo(
      travellerInfo: (json['travellerInfo'] as List?)
          ?.map((e) => TravellerInfo.fromJson(e))
          .toList(),
    );
  }
}

class TravellerInfo {
  final String? fN;
  final String? lN;
  final String? ti;
  final String? pan;
  final String? pt;

  TravellerInfo({this.fN, this.lN, this.ti, this.pan, this.pt});

  factory TravellerInfo.fromJson(Map<String, dynamic> json) {
    return TravellerInfo(
      fN: json['fN'] as String?,
      lN: json['lN'] as String?,
      ti: json['ti'] as String?,
      pan: json['pan'] as String?,
      pt: json['pt'] as String?,
    );
  }
}

class DeliveryInfo {
  final List<String>? emails;
  final List<String>? contacts;
  final List<String>? code;

  DeliveryInfo({this.emails, this.contacts, this.code});

  factory DeliveryInfo.fromJson(Map<String, dynamic> json) {
    return DeliveryInfo(
      emails: (json['emails'] as List?)?.map((e) => e as String).toList(),
      contacts: (json['contacts'] as List?)?.map((e) => e as String).toList(),
      code: (json['code'] as List?)?.map((e) => e as String).toList(),
    );
  }
}

class PaymentInfo {
  final double? amount;

  PaymentInfo({this.amount});

  factory PaymentInfo.fromJson(Map<String, dynamic> json) {
    return PaymentInfo(amount: (json['amount'] as num?)?.toDouble());
  }
}

class SpecialRequest {
  final bool? smokingRoom;
  final bool? lateCheckIn;
  final bool? earlyCheckIn;
  final bool? highFloor;
  final bool? largeBed;
  final bool? twinBed;

  SpecialRequest({
    this.smokingRoom,
    this.lateCheckIn,
    this.earlyCheckIn,
    this.highFloor,
    this.largeBed,
    this.twinBed,
  });

  factory SpecialRequest.fromJson(Map<String, dynamic> json) {
    return SpecialRequest(
      smokingRoom: json['smokingRoom'] as bool?,
      lateCheckIn: json['lateCheckIn'] as bool?,
      earlyCheckIn: json['earlyCheckIn'] as bool?,
      highFloor: json['highFloor'] as bool?,
      largeBed: json['largeBed'] as bool?,
      twinBed: json['twinBed'] as bool?,
    );
  }
}
