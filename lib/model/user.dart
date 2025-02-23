class User {
  String? name;
  String? email;
  String? phone;
  String? address;
  String? city;
  String? state;
  String? zip;

  User(
      {this.name,
      this.email,
      this.phone,
      this.address,
      this.city,
      this.state,
      this.zip});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
  }
}
