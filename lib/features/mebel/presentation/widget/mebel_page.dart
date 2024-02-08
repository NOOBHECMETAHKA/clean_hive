import 'package:flutter/material.dart';
import 'package:mebel_shop_hive/features/mebel/presentation/controller/mebel_controller.dart';
import 'package:provider/provider.dart';

class MebelPage extends StatelessWidget {
  const MebelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Table(
            border: TableBorder.all(color: Colors.black, borderRadius: BorderRadius.circular(10.0)),
            children: [
              TableRow(children: [
                const TableCell(
                    child: Center(child: Text('Наименование: '))),
                TableCell(
                    child: Center(child: Text(context.read<MebelController>().getSavedObjectMebel!.name))),
              ]),
              TableRow(children: [
                const TableCell(
                    child: Center(child: Text('Описание: '))),
                TableCell(
                    child: Center(child: Text(context.read<MebelController>().getSavedObjectMebel!.description))),
              ]),
              TableRow(children: [
                const TableCell(
                    child: Center(child: Text('Категория: '))),
                TableCell(
                    child: Center(child: Text(context.read<MebelController>().getSavedObjectMebel!.category))),
              ]),
              TableRow(children: [
                const TableCell(
                    child: Center(child: Text('Количество: '))),
                TableCell(
                    child: Center(child: Text("${context.read<MebelController>().getSavedObjectMebel!.count} штук"))),
              ]),
              TableRow(children: [
                const TableCell(
                    child: Center(child: Text('Количество: '))),
                TableCell(
                    child: Center(child: Text("${context.read<MebelController>().getSavedObjectMebel!.price} рублей"))),
              ]),
            ],
          )),
    );
  }
}
