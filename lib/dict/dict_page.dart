import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:words/dict/model/dict.dart';
import 'package:words/dict/widget/dict_item.dart';
import 'package:words/net/api_service.dart';

class DictPage extends StatefulWidget {
  const DictPage({super.key});

  @override
  State<DictPage> createState() => _DictPageState();
}

class _DictPageState extends State<DictPage> {
  late Future<List<Dict>> _dictFuture;

  @override
  void initState() {
    super.initState();
    _dictFuture = ApiService().getDictList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('词典列表'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Dict>>(
        future: _dictFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text('No data available'),
            );
          } else {
            return ListView(
              children: [
                const SizedBox(height: 10),
                Column(
                  children: List<DictItem>.generate(
                    snapshot.data!.length,
                    (index) => DictItem(dict: snapshot.data![index]),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
