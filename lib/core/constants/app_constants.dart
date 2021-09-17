class ApiConstants {
  static ApiConstants _instance = ApiConstants._init();

  static ApiConstants get instance => _instance;

  ApiConstants._init();

  static const String BASE_URL =
      "https://anybwnk52i.execute-api.eu-central-1.amazonaws.com/test/";

  //AUTH
  static const String LOGIN = "login";

  //DEPARTURE
  static const String DEPARTURE_TIMES = "departureTimes";

  //USER
  static const String TICKET = "ticket";
}
