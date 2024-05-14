import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/cubit/store_cubit.dart';
import 'package:store/cubit/store_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<StoreListCubit>().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<StoreListCubit, List<StoreModel>>(
            builder: (context, storeList) {
              if (storeList.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
								itemCount: storeList.length,
								itemBuilder: (context, index) {
									return Card(
										child: Padding(
											padding: const EdgeInsets.all(8.0),
											child: Row(
												children: [
													Container(
														height: 150,
														width: 100,
														child: ClipRRect(
															borderRadius: BorderRadius.circular(8.0),
															child: storeList[index].image.isNotEmpty
																	? Image.network(
																			storeList[index].image,
																			fit: BoxFit.scaleDown,
																		)
																	: const Icon(Icons.image, size: 60),
														),
													),
													const SizedBox(width: 8), // Add SizedBox to create space between image and text
													Expanded(
														child: Column(
															crossAxisAlignment: CrossAxisAlignment.start,
															children: [
																Text(storeList[index].title, style: const TextStyle(fontWeight: FontWeight.bold),),
																Text('Price: \$${storeList[index].price}', style: const TextStyle(fontWeight: FontWeight.bold),),
																Text('${storeList[index].description}'),
																Text('Category: ${storeList[index].category}', style: const TextStyle(fontWeight: FontWeight.bold),),
																Text('Rating: ${storeList[index].rate} (${storeList[index].count} reviews)', style: const TextStyle(fontWeight: FontWeight.bold),),
															],
														),
													),
												],
											),
										),
									);
								},
							);
            },
          ),
        ),
      ),
    );
  }
}
