part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<Users>> signIn(String email, String password,
      {http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseURL + '/login';

    var response = await client.post(Uri.parse(url),
        headers: ApiServices.headersPost(),
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Login failed please try again");
    }

    var data = jsonDecode(response.body);

    Users.token = data['data']['access_token'];
    Users value = Users.fromJson(data['data']['user']);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<Users>> singUp(Users user, String password,
      {File? pictureFile, http.Client? client})
  async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseURL + '/register';

    var response = await http.post(
      Uri.parse(url),
      headers: ApiServices.headersPost(),
      body: jsonEncode(<String, String>
      {
        'name': user.name!,
        'email': user.email!,
        'password': password  ,
        'password_confirmation': password,
        'address': user.address!,
        'city': user.city!,
        'houseNumber': user.houseNumber!,
        'phoneNumber': user.phoneNumber!,
      },
      )
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Login failed please try again");
    }

    var data = jsonDecode(response.body);

    Users.token = data['data']['access_token'];
    Users value = Users.fromJson(data['data']['user']);

    //Upload PictureFile
    if (pictureFile != null){
      ApiReturnValue<String> result =
          await uploadPicturePath(pictureFile);
      if (result.value != null) {
        value = value.copyWith(picturePath : "https://food.rtid73.com/storage/${result.value}");
      }
    }

    return ApiReturnValue(
      value: value,
    );
  }

  static Future<ApiReturnValue<String>> uploadPicturePath(
      File pictureFile, {http.MultipartRequest? request})
  async {
    String url = baseURL + '/user/photo';

    var uri = Uri.parse(url);

    if (request == null) {
      request ??= http.MultipartRequest("POST", uri)
        ..headers['Content-Type'] = 'apalication/json'
        ..headers['Authorization'] = 'Bearer ${Users.token}';
    }

    var multiPartFile =
        await http.MultipartFile.fromPath('file', pictureFile.path);

    request.files.add(multiPartFile);

    var response = await request.send();
    if( response.statusCode == 200){
      String responsebody = await response.stream.bytesToString();

      var data = jsonDecode(responsebody);

      String imagePath = data['data'][0];

      return ApiReturnValue(value: imagePath);
    } else {
      return ApiReturnValue(message: 'Upload picture failed, pealse try again');
    }
  }

  static Future<ApiReturnValue<bool>> logout({http.Client? client}) async{
  client ??= http.Client();

  String url = '$baseURL/logout';
  print("URL Logout : ${url}");

  var response = await client.post(Uri.parse(url),
  headers: ApiServices.headersPost(token: Users.token));

  print(response.body);

  if(response.statusCode != 200){
    return ApiReturnValue(message: "Failed Logout");
    }

    return ApiReturnValue(value: true);
}

  static Future<ApiReturnValue<Users>> getUser(Users user,
  {http.Client? client})
  async{
    client ??= http.Client();
    String url = '$baseURL/user';
    print('URL Get User : $url');
    
    var response = await client.get(Uri.parse(url),
        headers: ApiServices.headersGet(token: Users.token ));

    if(response.statusCode != 200){
      return ApiReturnValue(
        message: "Get User Failed Please Try Again"
      );
    }

    print("Reseponse get User : ${response.body}");

    var data = jsonDecode(response.body);
    Users value = Users.fromJson(data['data']);
    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<Users>> updateProfile(Users users,
      {http.Client? client})
  async {
    String url = '$baseURL/user';
    client ??= http.Client();
    var response = await client.put(
      Uri.parse(url),
      headers: ApiServices.headersPost(token: Users.token),
      body: jsonEncode(
        <String, dynamic>{
          'name': users.name,
          'address': users.address,
          'city': users.city,
          'houseNumber': users.houseNumber,
          'phoneNumber': users.phoneNumber,
        },
      ),
    );
    if (response.statusCode != 200) {
      return ApiReturnValue(
          message: 'Update profile failed, please try again later.');
    }
    var data = jsonDecode(response.body);
    Users value = Users.fromJson(data['data']);
    return ApiReturnValue(value: value);
  }
}
