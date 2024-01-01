import 'package:dio/dio.dart';
import 'package:words/dict/model/dict.dart';
import 'package:words/plan/model/plan.dart';
import 'package:words/user/model/user.dart';
import 'package:words/word/model/word.dart';

class ApiService {
  Dio _dio;

  ApiService() : _dio = Dio() {
    BaseOptions options = BaseOptions(
      baseUrl: "http://192.168.1.101:8080",
      connectTimeout: const Duration(milliseconds: 3000),
      receiveTimeout: const Duration(milliseconds: 3000),
    );
    _dio = Dio(options);
  }

  Future<Response> loginUser(String username, String password) async {
    try {
      // 发送登录请求
      Response response = await _dio.post('/user/login/', queryParameters: {
        'username': username,
        'password': password,
      });
      return response;
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> registerUser(String username, String password) async {
    try {
      // 发送注册请求
      Response response = await _dio.post('/user/register/', queryParameters: {
        'username': username,
        'password': password,
      });
      return response;
    } catch (error) {
      rethrow;
    }
  }

  Future<List<Dict>> getDictList() async {
    try {
      // 发送获取词典列表请求
      Response response = await _dio.get('/dict/list/');
      List<dynamic> dictsList = response.data['Dicts'];
      List<Dict> dicts = dictsList.map((json) => Dict.fromJson(json)).toList();
      return dicts;
    } catch (error) {
      rethrow;
    }
  }

  Future<User> getUser(int userID) async {
    try {
      // 发送获取用户信息请求
      Response response =
          await _dio.get('/user/info/', queryParameters: {'user_id': userID});
      User user = User.fromJson(response.data['User']);
      return user;
    } catch (error) {
      rethrow;
    }
  }

  Future<Plan> getPlan(int userID) async {
    try {
      // 发送获取用户计划请求
      Response response =
          await _dio.get('/user/plan/', queryParameters: {'user_id': userID});
      Plan plan = Plan.fromJson(response.data['Plan']);
      return plan;
    } catch (error) {
      rethrow;
    }
  }

  Future<Plan> getPlanByDict(int userID, int dictID) async {
    try {
      // 发送获取用户计划请求
      Response response = await _dio.get('/plan/', queryParameters: {
        'user_id': userID,
        'dict_id': dictID,
      });
      Plan plan = Plan.fromJson(response.data['Plan']);
      return plan;
    } catch (error) {
      rethrow;
    }
  }

  Future<Dict> getDict(int dictID) async {
    try {
      // 发送获取词典信息请求
      Response response =
          await _dio.get('/dict/', queryParameters: {'dict_id': dictID});
      Dict dict = Dict.fromJson(response.data['Dict']);
      return dict;
    } catch (error) {
      rethrow;
    }
  }

  Future<List<Word>> getWordTody(int planID) async {
    try {
      // 发送获取今日单词请求
      Response response =
          await _dio.get('/word/today/', queryParameters: {'plan_id': planID});
      List<dynamic> wordsList = response.data['Words'];
      List<Word> words = wordsList.map((json) => Word.fromJson(json)).toList();
      return words;
    } catch (error) {
      rethrow;
    }
  }

  Future<List<Word>> getAllWord(int dictID, int offset) async {
    try {
      // 发送获取全部单词请求
      Response response = await _dio.get('/word/all/', queryParameters: {
        'dict_id': dictID,
        'offset': offset,
      });
      List<dynamic> wordsList = response.data['Words'];
      List<Word> words = wordsList.map((json) => Word.fromJson(json)).toList();
      return words;
    } catch (error) {
      rethrow;
    }
  }

  Future<List<Word>> getUserCollect(int userID) async {
    try {
      // 发送获取用户收藏单词请求
      Response response = await _dio
          .get('/user/collect/', queryParameters: {'user_id': userID});
      List<dynamic> wordsList = response.data['Words'];
      List<Word> words = wordsList.map((json) => Word.fromJson(json)).toList();
      return words;
    } catch (error) {
      rethrow;
    }
  }

  Future<String> addCollect(int userID, int wordID) async {
    try {
      // 发送添加收藏单词请求
      Response response = await _dio.post('/collect/add/',
          queryParameters: {'user_id': userID, 'word_id': wordID});
      return response.data['StatusMsg'];
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> changePlan(
      int userID, int dictID, int mode, int nLearn, int nReview) async {
    try {
      // 发送更改计划请求
      Response response = await _dio.post('/plan/change/', queryParameters: {
        'user_id': userID,
        'dict_id': dictID,
        'mode': mode,
        'n_learn': nLearn,
        'n_review': nReview,
      });
      return response;
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> addHistory(int userID, int wordID) async {
    try {
      // 发送添加历史记录请求
      Response response = await _dio.post('/word/history/', queryParameters: {
        'user_id': userID,
        'word_id': wordID,
      });
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
