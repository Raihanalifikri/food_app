part of 'models.dart';

enum FoodType { new_food, popular, recommended }

class Food extends Equatable {
  final int? id;
  final String? name;
  final String? picturePath;
  final String? description;
  final String? ingredients;
  final double? price;
  final double? rate;
  final List<FoodType> types;

  Food({
    this.id,
    this.name,
    this.picturePath,
    this.description,
    this.ingredients,
    this.price,
    this.rate,
    this.types = const [],
  });

  factory Food.fromJson(Map<String, dynamic> data) => Food(
        id: data['id'],
        name: data['name'],
        picturePath: data['picturePath'],
        description: data['description'],
        ingredients: data['ingredients'],
        price: data['price'].toDouble(),
        rate: data['rate'].toDouble(),
        types: data['types'].toString().split(',').map((e) {
          switch (e) {
            case 'new_food':
              return FoodType.new_food;
            case 'popular':
              return FoodType.popular;
            case 'recommended':
              return FoodType.recommended;
            default:
              return FoodType.new_food;
          }
        }).toList(),
      );

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, name, picturePath, description, ingredients, price, rate];
}

List<Food> mockFoods = [
  Food(
    id: 1,
    picturePath:
        'https://i.pinimg.com/236x/5b/f2/7e/5bf27e721ed7bc858e0a7f0d905632e8.jpg',
    name: 'Sate Sayur Sultan',
    description:
        'Sate Sayur Sultan adalah menu sate vegan paling terkenal di Jakarta. Sate ini dibuat dari berbagai macam bahan berkualitas terbaik dan langsung dibuat oleh chef handal. Sate ini sangat sehat dan bergizi.',
    ingredients: 'Tahu, Tempe, Sayuran segar, Bumbu kacang, Saus kecap',
    price: 150000,
    rate: 4.2,
    types: [FoodType.popular],
  ),
  Food(
    id: 2,
    picturePath:
        'https://i.pinimg.com/236x/e4/c8/ac/e4c8ac48c71738d0493b6e824f0094ed.jpg',
    name: 'Nasi Goreng Kambing',
    description:
        'Nasi Goreng Kambing spesial dengan bumbu rempah rahasia yang kaya akan cita rasa. Cocok untuk Anda yang menggemari makanan gurih dan pedas.',
    ingredients: 'Nasi, Daging kambing, Bumbu rempah, Saus kecap, Cabe',
    price: 25000,
    rate: 4.5,
    types: [FoodType.recommended, FoodType.new_food],
  ),
  Food(
    id: 3,
    picturePath:
        'https://i.pinimg.com/236x/1a/b7/ee/1ab7ee51c29e366c9c47311773c09dde.jpg',
    name: 'Mie Ayam Jamur',
    description:
        'Mie Ayam Jamur dengan topping ayam yang empuk dan jamur yang segar, disajikan dengan kuah kaldu yang lezat.',
    ingredients: 'Mie, Ayam suwir, Jamur, Kaldu ayam, Sawi hijau',
    price: 20000,
    rate: 4.7,
  ),
  Food(
    id: 4,
    picturePath:
        'https://i.pinimg.com/236x/80/a9/1a/80a91a42cea42a2dcda727a48847642c.jpg',
    name: 'Bakso Beranak',
    description:
        'Bakso Beranak dengan ukuran jumbo berisi bakso kecil di dalamnya. Sangat cocok untuk pecinta makanan berkuah.',
    ingredients: 'Daging sapi, Tepung kanji, Kuah kaldu sapi, Mie, Tauge',
    price: 30000,
    rate: 4.3,
  ),
  Food(
    id: 5,
    picturePath:
        'https://i.pinimg.com/236x/20/80/e0/2080e0aeb6d1d9c91b990892dcbbb455.jpg',
    name: 'Ayam Bakar Taliwang',
    description:
        'Ayam Bakar khas Lombok dengan bumbu pedas dan gurih, disajikan dengan plecing kangkung dan sambal terasi.',
    ingredients: 'Ayam, Bumbu Taliwang, Plecing kangkung, Sambal terasi',
    price: 50000,
    rate: 4.8,
  ),
  Food(
    id: 6,
    picturePath:
        'https://i.pinimg.com/236x/6f/b7/f9/6fb7f9d36a80ee104e5a417ec2287b15.jpg',
    name: 'Gado-Gado Jakarta',
    description:
        'Gado-Gado dengan sayuran segar, tahu, tempe, dan lontong, disiram saus kacang kental yang gurih.',
    ingredients: 'Sayuran, Tahu, Tempe, Lontong, Saus kacang',
    price: 20000,
    rate: 4.6,
  ),
  Food(
    id: 7,
    picturePath:
        'https://i.pinimg.com/236x/6e/35/3d/6e353dfdcef71ce2f3dfe363390cb6b4.jpg',
    name: 'Es Cendol Durian',
    description:
        'Minuman es cendol dengan topping buah durian yang manis dan creamy, cocok untuk menghilangkan dahaga.',
    ingredients: 'Cendol, Santan, Gula merah, Durian, Es batu',
    price: 25000,
    rate: 4.4,
  ),
  Food(
    id: 8,
    picturePath:
        'https://i.pinimg.com/564x/01/d0/f3/01d0f3c618287c68db8b77ba196af8ca.jpg',
    name: 'Martabak Manis Keju',
    description:
        'Martabak manis dengan isian keju yang melimpah dan lezat, ditambah topping susu kental manis.',
    ingredients: 'Tepung terigu, Gula, Keju, Susu kental manis, Mentega',
    price: 45000,
    rate: 4.5,
    types: [FoodType.new_food, FoodType.recommended, FoodType.popular],
  ),
  // Tambahan data makanan lainnya mengikuti pola di atas.
];
