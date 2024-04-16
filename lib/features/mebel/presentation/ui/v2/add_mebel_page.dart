import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/cubit/mebel_cubit.dart';


class AddMebelPage extends StatefulWidget {
  const AddMebelPage({super.key});

  @override
  State<AddMebelPage> createState() => _AddMebelPageState();
}

class _AddMebelPageState extends State<AddMebelPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _count = TextEditingController();
  late String _selectedItem;
  final List<String> _categoriesCollection = <String>[
    'Столы',
    'Кровати',
    'Тумбочки',
    'Шкафы'
  ];

  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _selectedItem = _categoriesCollection.first;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Добавление мебели")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //saving
          if (!_keyForm.currentState!.validate()) return;
          context.read<MebelCubit>().addMebel(
              _name.text,
              _selectedItem,
              _description.text,
              double.tryParse(_price.text),
              int.tryParse(_count.text));
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _keyForm,
          child: ListView(children: [
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Поле пустое';
                }
                return null;
              },
              controller: _name,
              decoration: const InputDecoration(
                label: Text('Название'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(_selectedItem),
                  DropdownButton<String>(
                    items: _categoriesCollection.map((e) {
                      return DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedItem = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Поле пустое';
                }
                return null;
              },
              controller: _description,
              minLines: 3,
              maxLines: 3,
              decoration: const InputDecoration(
                label: Text('Описание'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Поле пустое';
                }
                return null;
              },
              controller: _count,
              onChanged: (value) {
                if (int.tryParse(value) == null) {
                  _count.text = '';
                }
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('Количество'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Поле пустое';
                }
                return null;
              },
              controller: _price,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('Цена'),
                border: OutlineInputBorder(),
              ),
            ),
          ]),
        ),
      ),
    );

  }
}