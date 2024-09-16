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

  Users(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.houseNumber,
      this.phoneNumber,
      this.city,
      this.picturePath});

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
