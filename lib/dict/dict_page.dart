import 'package:flutter/material.dart';
import 'package:words/dict/model/dict.dart';
import 'package:words/dict/widget/dict_item.dart';
import 'package:words/plan/model/plan.dart';
import 'package:words/utils/api_service.dart';
import 'package:words/utils/preference.dart';

class DictPage extends StatefulWidget {
  const DictPage({super.key});

  @override
  State<DictPage> createState() => _DictPageState();
}

class _DictPageState extends State<DictPage> {
  late Future<List<Dict>> _dictFuture;
  late Future<Plan> _planFuture;
  int userID = getInt(Preference.userId);

  @override
  void initState() {
    super.initState();
    _dictFuture = ApiService().getDictList();
    _planFuture = ApiService().getPlan(userID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('词典列表'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: Future.wait([_dictFuture, _planFuture]),
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
            List<Dict> dicts = snapshot.data![0];
            Plan plan = snapshot.data![1];
            return ListView(
              children: [
                const SizedBox(height: 10),
                Column(
                  children: List<DictItem>.generate(
                    dicts.length,
                    (index) => DictItem(dict: dicts[index], plan: plan),
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
