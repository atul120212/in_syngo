import 'package:in_syngo/utilities/themeColors.dart';
import 'package:in_syngo/utilities/themeStyles.dart';
import 'package:in_syngo/widgets/creditCard.dart';
import 'package:in_syngo/widgets/creditCard2.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
class CardsList extends StatefulWidget {
  const CardsList({super.key});

  @override
  State<CardsList> createState() => _CardsListState();
}

class _CardsListState extends State<CardsList> {
  List cardList = [
    CreditCard(),
    //CreditCard2(),
    //CreditCard(),
    //CreditCard(),
    //CreditCard(),
    
  ];
  int _currentCard = 0;

  final PageController _pageController = PageController(initialPage: 0);
  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }
  _onPageChanged(int index){
    setState(() {
      _currentCard = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(

        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32.0, left: 15.0, right: 15.0, bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('iN_SyNgo', style: TextStyle(color: Colors.blue, fontSize: 30, fontWeight:FontWeight.w900),),
                Text('🫡251.8',style: TextStyle(fontWeight: FontWeight.w700),),
                
              ],

            ),
          ),
          Container(
            height: 246.0,
            child: PageView.builder(
              itemCount: cardList.length,
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, index) => CreditCard(),
              ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i = 0;i<cardList.length ; i++)
                  if(_currentCard == i)
                    DotIndicator(true)
                    
                    else
                      DotIndicator(false)
              ],
            ),
          )
        ],
      ),
    );

  }
}

class DotIndicator extends StatefulWidget {
  final bool isActive;
  DotIndicator(this.isActive);

  //const DotIndicator({super.key});

  @override
  State<DotIndicator> createState() => _DotIndicatorState();
}

class _DotIndicatorState extends State<DotIndicator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Container(
          height: 8.0,
          width: 8.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: widget.isActive ? ThemeColors.black : ThemeColors.grey,
            ),
        ),
      ),
    );
  }
}