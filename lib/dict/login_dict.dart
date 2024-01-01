import 'package:flutter/material.dart';
import 'package:words/dict/model/dict.dart';
import 'package:words/dict/widget/login_ditc_item.dart';
import 'package:words/plan/model/plan.dart';
import 'package:words/utils/api_service.dart';
import 'package:words/utils/preference.dart';

class LoginDict extends StatefulWidget {
  const LoginDict({super.key});

  @override
  State<LoginDict> createState() => _LoginDictState();
}

class _LoginDictState extends State<LoginDict> {
  late Future<List<Dict>> _dictFuture;
  int userID = getInt(Preference.userId);

  @override
  void initState() {
    super.initState();
    _dictFuture = ApiService().getDictList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('请选择一本词典'),
        centerTitle: true,
      ),
      body: FutureBuilder(
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
            List<Dict>? dicts = snapshot.data;
            return ListView(
              children: [
                const SizedBox(height: 10),
                Column(
                  children: List<LoginDictItem>.generate(
                    dicts!.length,
                    (index) => LoginDictItem(
                      dict: dicts[index],
                      plan: Plan(
                        planID: 0,
                        mode: 30,
                        nLearn: 30,
                        nReview: 30,
                        userID: userID,
                        dictID: 0,
                        progress: 0,
                      ),
                    ),
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
