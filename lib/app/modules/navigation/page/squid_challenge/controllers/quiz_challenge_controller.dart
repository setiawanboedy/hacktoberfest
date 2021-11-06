
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/data/model/question_model.dart';
import 'package:squidgame/app/data/model/user_model.dart';
import 'package:squidgame/app/data/repository/repository_remote.dart';
import 'package:squidgame/app/modules/navigation/page/squid_challenge/controllers/option_controller.dart';
import 'package:squidgame/app/routes/app_pages.dart';

class QuizChallengeController extends GetxController with SingleGetTickerProviderMixin{
  final RepositoryRemote _repositoryRemote = Get.find<RepositoryRemote>();

  // Animate progress bar
  AnimationController? _animationController;
  Animation? _animation;

  Animation? get animation => this._animation;

  PageController? _pageController;
  PageController? get pageController => this._pageController;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int? _correctAns;
  int? get correctAns => this._correctAns;

  int? _selectedAns;
  int? get selectedAns => this._selectedAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOffCorrectAns = 0;
  int get numOffCorrectAns => this._numOffCorrectAns;

  OptionController _optC = Get.put(OptionController());
  int get duration => this._optC.getDuration;

  UserModel? user;
  int? totalPoint;


  var _questions = QuestionModel().obs;
  QuestionModel get questions => this._questions.value;

  @override
  void onInit() {
    //  Animation 6= seconds
    // fill progress animated
    _questions(_optC.questionModel);
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: _optC.getDuration));
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController!)
    ..addListener(() {update();});

    // Start animation
    // when completed next page
    _animationController?.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController?.dispose();
    _pageController?.dispose();
  }

  void checkAns(Questions? question, int selectedIndex){
    // when once ans run this
    _isAnswered = true;
    _correctAns = question?.answer;
    _selectedAns = selectedIndex;

    if(_correctAns == _selectedAns) _numOffCorrectAns++;

    // Stop counter
    _animationController?.stop();
    update();

    // after select next
    Future.delayed(Duration(seconds: 3), nextQuestion);
  }

  Future<void> nextQuestion() async {
    if(_questionNumber.value != questions.result?.length){
      _isAnswered = false;
      _pageController?.nextPage(duration: Duration(milliseconds: 250), curve: Curves.ease);

      // Reset timer
      _animationController?.reset();

      // start again
      // finish to next question
      _animationController?.forward().whenComplete(nextQuestion);
    }else {
      // final score
      print("score ${numOffCorrectAns}");

      user = await _repositoryRemote.userModel;
      totalPoint = (user!.totalPoint! + numOffCorrectAns);
      await _repositoryRemote.updateUserPoint(totalPoint!);

      Get.offNamed(Routes.SCORE_CHALLENGE, arguments: [numOffCorrectAns, questions.result?.length]);
    }
  }

  void updateQnNumber(int index){
    _questionNumber.value = index + 1;
    update();
  }

}
