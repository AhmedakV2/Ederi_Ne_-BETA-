class Product {
  final String title;
  final String location;
  final String price;
  final String category;
  final String neighborhood;
  final DateTime date;
  int likes;    
  int dislikes;

  Product({
    required this.title,
    required this.location,
    required this.price,
    required this.category,
    required this.neighborhood,
    required this.date,
    this.likes = 0,    
    this.dislikes = 0,
  });
}

class DataService {
  static final DataService _instance = DataService._internal();
  factory DataService() => _instance;
  DataService._internal();

  String currentUsername = "";
  List<Product> products = [];

  void addProduct(Product product) {
    products.insert(0, product); 
  }

  void setUsername(String username) {
    currentUsername = username;
  }

  int get score => products.length * 50;
  int get dealCount => products.length;
}