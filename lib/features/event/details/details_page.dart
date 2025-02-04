import 'package:mmport/features/event/details/cubit/details_cubit.dart';
import 'package:mmport/domain/models/event_model.dart';
import 'package:mmport/domain/repositories/event_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    required this.id,
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event details'),
      ),
      body: BlocProvider(
      create: (context) => DetailsCubit(ItemsRepository())..getItemswithID(id),
      child: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          final itemModel = state.itemModel;
          if (itemModel == null) {
            return const CircularProgressIndicator();
          }
          return ListView(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            children: [
                _ListViewItem(
                  itemModel: itemModel,
                ),
            ],
          );
        },
      ),
    ),
   );
  }
}



class _ListViewItem extends StatelessWidget {
  const _ListViewItem({
    required this.itemModel,
  });

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 30,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(31, 0, 0, 0),
        ),
        child: Column(
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: const Color.fromARGB(31, 0, 0, 0),
                image: DecorationImage(
                  image: NetworkImage(
                    itemModel.imageURL,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          itemModel.title,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          itemModel.releaseDateFormatted(),
                         ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                  ),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child:  Column(
                    children: [
                      Text(
                        itemModel.daysLeft(),
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text('days left'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}