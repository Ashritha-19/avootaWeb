class Booking {
  int? id;
  String? hotelName;
  String? hotelPhone;
  String? city;
  String? address;
  String? state;
  String? country;
  String? bookingid;
  String? checkIN;
  String? checkOUT;
  String? noOfDays;
  String? roomType;
  String? noOfPeople;
  String? name;
  String? phone;
  String? email;
  String? pan;

  Booking(
      {this.id,
      this.hotelName,
      this.hotelPhone,
      this.city,
      this.address,
      this.state,
      this.country,
      this.bookingid,
      this.checkIN,
      this.checkOUT,
      this.noOfDays,
      this.roomType,
      this.noOfPeople,
      this.name,
      this.phone,
      this.email,
      this.pan});

  Booking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelName = json['hotelName'];
    hotelPhone = json['hotelPhone'];
    city = json['city'];
    address = json['address'];
    state = json['state'];
    country = json['country'];
    bookingid = json['bookingid'];
    checkIN = json['checkIN'];
    checkOUT = json['checkOUT'];
    noOfDays = json['noOfDays'];
    roomType = json['roomType'];
    noOfPeople = json['noOfPeople'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    pan = json['pan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hotelName'] = this.hotelName;
    data['hotelPhone'] = this.hotelPhone;
    data['city'] = this.city;
    data['address'] = this.address;
    data['state'] = this.state;
    data['country'] = this.country;
    data['bookingid'] = this.bookingid;
    data['checkIN'] = this.checkIN;
    data['checkOUT'] = this.checkOUT;
    data['noOfDays'] = this.noOfDays;
    data['roomType'] = this.roomType;
    data['noOfPeople'] = this.noOfPeople;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['pan'] = this.pan;
    return data;
  }
}
