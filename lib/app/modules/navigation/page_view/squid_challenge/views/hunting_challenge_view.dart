import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squidgame/app/data/model/carousel_model.dart';
import 'package:squidgame/app/modules/navigation/page_view/squid_challenge/views/widgets/challenges.dart';

import '../controllers/hunting_challenge_controller.dart';

class HuntingChallengeView extends StatelessWidget {
  final HuntingChallengeController controller = Get.put(HuntingChallengeController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Squid Challenge',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  initialPage: 2,
                  autoPlay: true,
                ),
                items: imageSliders,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(() {
              return Stepper(
                physics: NeverScrollableScrollPhysics(),
                onStepTapped: (step)=> controller.currentStep.value = step,
                onStepContinue: () {
                  if (controller.currentStep.value < _steps().length - 1) {
                    controller.overview.add(controller.scanBarcode.value);
                    controller.scanBarcode.value = '';
                    controller.currentStep.value += 1;
                  } else {
                    controller.currentStep.value = 0;
                  }
                },
                onStepCancel: (){
                  if (controller.currentStep.value > 0) {
                    controller.currentStep.value -= 1;
                  } else {
                    controller.currentStep.value = 0;
                  }
                },
                steps: _steps(),
                currentStep: controller.currentStep.value,
              );
            }),
          ],
        ),
      ),
    );
  }

  StepState _stepState(int step) {
    if (controller.currentStep.value > step) {
      return StepState.complete;
    } else {
      return StepState.editing;
    }
  }

  List<Step> _steps() {
    return [
      Step(
          title: Text('Challenge One'),
          content: Challenges(func: ()=> controller.scanBarcodeNormal(), result: controller.scanBarcode.value,),
          state: _stepState(0),
          isActive: controller.currentStep.value == 0),
      Step(
          title: Text('Challenge Two'),
          content: Challenges(func: ()=> controller.scanBarcodeNormal(), result: controller.scanBarcode.value,),
          state: _stepState(1),
          isActive: controller.currentStep.value == 1),
      Step(
          title: Text('Challenge Three'),
          content: Challenges(func: ()=> controller.scanBarcodeNormal(), result: controller.scanBarcode.value,),
          state: _stepState(2),
          isActive: controller.currentStep.value == 2),
      Step(
          title: Text('Overview'),
          content: Container(
            height: controller.overviewResult.length.toDouble() * 50,
            width: double.infinity,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.overviewResult.length,
                itemBuilder: (context, index){
                     return Padding(
                       padding: const EdgeInsets.symmetric(vertical: 10),
                       child: Text('${controller.overviewResult[index]}'),
                     );
    }),
          ),
          state: _stepState(3),
          isActive: controller.currentStep.value == 3),
    ];
  }


  final List<Widget> imageSliders = carousels
      .map(
        (item) =>
        Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Stack(
                children: <Widget>[
                  Image.asset(item.imageUrl ?? '',
                      fit: BoxFit.cover, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        'No. ${carousels.indexOf(item)} image',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
  )
      .toList();
}
