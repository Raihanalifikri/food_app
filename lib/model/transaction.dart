  part of 'models.dart';

  enum TransactionStatus { delivered, on_delivery, pending, cancel }

  class Transaction extends Equatable {
    final int? id;
    final Food? food;
    final int? quantity;
    final int? total;
    final DateTime? dateTime;
    final TransactionStatus? status;
    final Users? user;
    final String? payment_url;

    Transaction(
        {this.id,
        this.food,
        this.quantity,
        this.total,
        this.dateTime,
        this.status,
        this.user,
          this.payment_url

        });

    Transaction copyWith({
       int? id,
       Food? food,
       int? quantity,
       int? total,
       DateTime? dateTime,
       TransactionStatus? status,
       Users? user
  }) {
      return Transaction(
        id: id ?? this.id,
        food: food ?? this.food,
        quantity: quantity ?? this.quantity,
        total: total ?? this.total,
        dateTime: dateTime ?? this.dateTime,
        status: status ?? this.status,
        user: user ?? this.user,
      );
    }

    factory Transaction.fromJson(Map<String, dynamic> data) => Transaction(
        id: data['id'],
        food: Food.fromJson(data['food']),
        quantity: data['quantity'],
        total: data['total'],
        dateTime: DateTime.fromMillisecondsSinceEpoch(data['created_at']),
        user: Users.fromJson(data['user']),
        payment_url: data['payment_url'],
        status: data['status'] == 'PENDING'
            ? TransactionStatus.pending
            : data['status'] == 'ON_DELIVERY'
            ? TransactionStatus.on_delivery
            : data['status'] == 'CANCELED'
            ? TransactionStatus.cancel
            : TransactionStatus.delivered);


    @override
    // TODO: implement props
    List<Object?> get props =>
        [id, food, quantity, total, dateTime, status, user];
  }

  List<Transaction> mockTransaction = [
    Transaction(
      id: 1,
      food: mockFoods[1],
      quantity: 5,
      total: (mockFoods[1].price! * 5 * 1.1).toInt(),
      dateTime: DateTime.now(),
      status: TransactionStatus.delivered,
      user: mockUser
    ),
    Transaction(
        id: 2,
        food: mockFoods[2],
        quantity: 6,
        total: (mockFoods[2].price! * 6 * 1.1).toInt(),
        dateTime: DateTime.now(),
        status: TransactionStatus.on_delivery,
        user: mockUser
    ),
    Transaction(
        id: 3,
        food: mockFoods[3],
        quantity: 4,
        total: (mockFoods[3].price! * 4 * 1.1).toInt(),
        dateTime: DateTime.now(),
        status: TransactionStatus.pending,
        user: mockUser
    ),
    Transaction(
        id: 4,
        food: mockFoods[5],
        quantity: 4,
        total: (mockFoods[5].price! * 4 * 1.1).toInt(),
        dateTime: DateTime.now(),
        status: TransactionStatus.cancel,
        user: mockUser
    ),
  ];
