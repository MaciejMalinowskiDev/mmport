import 'package:mmport/features/event/add/cubit/add_cubit.dart';
import 'package:mmport/domain/repositories/event_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddPage extends StatefulWidget {
  const AddPage({
    super.key,
  });

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String? _imageURL;
  String? _title;
  DateTime? _releaseDate;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCubit(ItemsRepository()),
      child: BlocListener<AddCubit, AddState>(
        listener: (context, state) {
          if (state.saved){
            Navigator.of(context).pop();
          }
          if (state.errorMessage.isNotEmpty){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<AddCubit, AddState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Add new upcoming event'),
                actions: [
                  IconButton(
                    onPressed: _imageURL == null ||
                            _title == null ||
                            _releaseDate == null
                        ? null
                        : () {
                            context.read<AddCubit>().add(
                                  _title!,
                                  _imageURL!,
                                  _releaseDate!,
                                );
                          },
                    icon: const Icon(Icons.check),
                  ),
                ],
              ),
              body: _AddPageBody(
                onTitleChanged: (newValue) {
                  setState(() {
                    _title = newValue;
                  });
                },
                onImageUrlChanged: (newValue) {
                  setState(() {
                    _imageURL = newValue;
                  });
                },
                onDateChanged: (newValue) {
                  setState(() {
                    _releaseDate = newValue;
                  });
                },
                selectedDateFormatted: _releaseDate == null ? null : DateFormat.yMMMEd().format(_releaseDate!),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _AddPageBody extends StatelessWidget {
  const _AddPageBody({
    required this.onTitleChanged,
    required this.onImageUrlChanged,
    required this.onDateChanged,
    this.selectedDateFormatted,
  });

  final Function(String) onTitleChanged;
  final Function(String) onImageUrlChanged;
  final Function(DateTime?) onDateChanged;
  final String? selectedDateFormatted;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      children: [
        TextField(
          onChanged: onTitleChanged,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'name of event',
            label: Text('event'),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          onChanged: onImageUrlChanged,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'http://yup_you_need_to_copy_some_url.jpg',
            label: Text('Image URL'),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            final selectedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(
                const Duration(days: 365 * 10),
              ),
            );
            onDateChanged(selectedDate);
          },
          child: Text(selectedDateFormatted ?? 'Set date'),
        ),
      ],
    );
  }
}
