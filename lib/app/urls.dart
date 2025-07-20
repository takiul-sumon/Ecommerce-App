class Urls {
  static const baseUrl = 'https://ecom-rs8e.onrender.com/api';
  static const signUpUrl = '$baseUrl/auth/signup';
  static const otpUrl = '$baseUrl/auth/verify-otp';
  static const loginUrl = '$baseUrl/auth/login';

  static const homeSliderurl = '$baseUrl/slides';
  static String catagoriesListurl(int count, int currentPage) =>
      '$baseUrl/categories?count=$count&page=$currentPage';
  static String productByCatagoryurl(
    int count,
    int currentPage,
    String catagoryId,
  ) => '$baseUrl/products?count=$count&page=$currentPage&category=$catagoryId';
  static String popularListByTagurl(String tag) =>
      '$baseUrl//products?tag=$tag';

  static String productDetailsUrl(String productId) =>
      '$baseUrl/products/id/$productId';
}
