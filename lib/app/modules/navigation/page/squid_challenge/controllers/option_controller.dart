import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/data/model/marker_model.dart';
import 'package:squidgame/app/data/model/question_model.dart';
import 'package:squidgame/app/data/repository/repository_local.dart';
import 'package:squidgame/app/data/repository/repository_remote.dart';

class OptionController extends GetxController{
  final RepositoryRemote _repositoryRemote = Get.find<RepositoryRemote>();
  final RepositoryLocal _repositoryLocal = Get.find<RepositoryLocal>();

  var isActive = false.obs;

  var _questionModel = QuestionModel().obs;

  QuestionModel get questionModel => this._questionModel.value;

  Result? _result;
  set setDuration(Result duration) => this._result = duration;
  int get getDuration => int.parse(this._result?.time ?? '0');

  @override
  void onReady() {
    print("idMarker ${_result?.id}");
    getQuestions(_result!.id!);
    super.onReady();
  }

  void getQuestions(String idMarker) async {
    var question = await _repositoryRemote.getDataQuestions(idMarker);
    List<Questions> listData = List.empty(growable: true);
     question.docs.forEach((QueryDocumentSnapshot docs) {
      listData.add(Questions.fromJson(docs.data() as Map<String, dynamic>));
    });
    _questionModel(QuestionModel(result:listData));
    _questionModel.refresh();
  }

}