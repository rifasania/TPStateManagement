import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'store_state.dart';

class StoreListCubit extends Cubit<List<StoreModel>> {
  final String url = "https://fakestoreapi.com/products";

  StoreListCubit() : super([]);

  void setFromJson(List<dynamic> json) {
    List<StoreModel> stores = json.map((store) {
      return StoreModel(
        id: store['id'].toString(),
        title: store['title'],
        price: store['price'].toString(),
        description: store['description'],
        category: store['category'],
        image: store['image'],
        rating: store['rating']['rate'].toString(),
        rate: store['rating']['rate'].toString(),
        count: store['rating']['count'],
      );
    }).toList();

    emit(stores);
  }

  void fetchData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setFromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load');
      }
    } catch (e) {
      throw Exception('Failed to load: $e');
    }
  }
}
