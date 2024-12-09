part of 'models.dart';

class Users extends Equatable{
  final int? id;
  final String? name;
  final String? email;
  final String? address;
  final String? houseNumber;
  final String? phoneNumber;
  final String? city;
  final String? picturePath;
  static String? token;

  Users(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.houseNumber,
      this.phoneNumber,
      this.city,
      this.picturePath
      });

  Users copyWith({
    int? id,
    String? name,
    String? email,
    String? address,
    String? houseNumber,
    String? phoneNumber,
    String? city,
    String? picturePath,
})  {
    return Users(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
      houseNumber: houseNumber ?? this.houseNumber,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      city: city ?? this.city,
      picturePath: picturePath ?? this.picturePath,
    );
  }

  factory Users.fromJson(Map<String, dynamic> data) => Users(
    id: data['id'],
    name: data['name'],
    email: data['email'],
    address: data['address'],
    houseNumber: data['houseNumber'],
    phoneNumber: data['phoneNumber'],
    city: data['city'],
    picturePath: data['profile_photo_url'],
  );

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    name,
    email,
    address,
    houseNumber,
    phoneNumber,
    city,
    picturePath
  ];
}

Users mockUser = Users(
  id: 1,
  name: 'Muhammad Ali',
  email: 'Alifikri@gmail.com',
  address: 'Jl.In aja dulu',
  houseNumber: '89',
  phoneNumber: '0899876534',
  city: 'Cirbon',
  picturePath: 'https://i.pinimg.com/564x/4e/a9/a7/4ea9a741f70751c3aece6aab3cedc42f.jpg'
);
