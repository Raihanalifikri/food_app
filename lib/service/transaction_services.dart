part of 'services.dart';

class TransactionServices {
  static Future<ApiReturnValue<List<Transaction>>> getTransaction(
      {http.Client? client}) async {
    client ??= http.Client();

    String url = baseURL + '/transaction';

    print("URL Transaction : $url");

    var response = await client.get(Uri.parse(url), headers: ApiServices.headersGet(

    ));

    print("USER TOKEN : ${Users.token}");

    print('Response Transaction : ${response.body}');

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Failed To Get Transaction");
    }

    var data = jsonDecode(response.body);

    print("Data Transanction : $data");

    List<Transaction> value = (data['data']['data'] as Iterable)
        .map((e) => Transaction.fromJson(e))
        .toList();

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<Transaction>> submitTransaction(
      Transaction transaction, {http.Client? client})
  async {
    // await Future.delayed(Duration(seconds: 2));

    client ??= http.Client();

    String url = baseURL + '/checkout';

    print("URL Submit Transaction : $url}");

    var response = await client.post(Uri.parse(url), headers: ApiServices.headersPost(), body: jsonEncode(<String, dynamic>{
      'food_id' : transaction.food!.id,
      'user_id' : transaction.user!.id,
      'quantity' : transaction.quantity,
      'total' : transaction.total,
      'status' : 'PENDING'
    }));

    print("Response Submit Transaction : ${response.body}");
    print(Users.token);

    if(response.statusCode != 200){
      return ApiReturnValue(message: 'Failed to submit Trasaction');
    }

    var data = jsonDecode(response.body);

    Transaction submit = Transaction.fromJson(data['data']);

    return ApiReturnValue(value: submit);

    // Assuming you want to return the updated list of transactions after submitting
    return ApiReturnValue(
      value: transaction.copyWith(
        id: 123,
        status: TransactionStatus.pending,
        total: (transaction.quantity! * transaction.food!.price! * 1.1).toInt(),
      ),
    );
  }
}