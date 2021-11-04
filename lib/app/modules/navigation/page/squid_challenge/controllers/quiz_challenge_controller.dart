
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/data/model/question_model.dart';
import 'package:squidgame/app/modules/navigation/page/squid_challenge/controllers/option_controller.dart';

class QuizChallengeController extends GetxController with SingleGetTickerProviderMixin{

  // Animate progress bar
  AnimationController? _animationController;
  Animation? _animation;

  Animation? get animation => this._animation;

  PageController? _pageController;
  PageController? get pageController => this._pageController;

  List<QuestionModel> _questions = sample_data.map((question) => QuestionModel(
    id: question['id'],
    question: question['question'],
    options: question['options'],
    answer: question['answer_index']
  )).toList();

  List<QuestionModel> get questions => this._questions;

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


  @override
  void onInit() {
    //  Animation 6= seconds
    // fill progress animated
    print('duration ${_optC.getDuration}');
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

  void checkAns(QuestionModel question, int selectedIndex){
    // when once ans run this
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if(_correctAns == _selectedAns) _numOffCorrectAns++;

    // Stop counter
    _animationController?.stop();
    update();

    // after select next in 3s
    Future.delayed(Duration(seconds: 3), nextQuestion);
  }

  void nextQuestion(){
    if(_questionNumber.value != _questions.length){
      _isAnswered = false;
      _pageController?.nextPage(duration: Duration(milliseconds: 250), curve: Curves.ease);

      // Reset timer
      _animationController?.reset();

      // start again
      // finish to next question
      _animationController?.forward().whenComplete(nextQuestion);
    }else {
      // final score
      
    }
  }

  void updateQnNumber(int index){
    _questionNumber.value = index + 1;
  }

}
