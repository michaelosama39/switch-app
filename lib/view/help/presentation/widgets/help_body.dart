import 'package:flutter/material.dart';
import 'help_card.dart';

class HelpBody extends StatelessWidget {
  const HelpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (context, index) {
        return HelpCard(
          title: 'ماهي ساعات العمل',
          desc: 'تعتمد ساعات العمل حسب ساعات عمل المتاجر التي نعمل معها يرجي الرجوع الي صفحة المتجر الرئيسية للحصول علي معلومات ساعات العمل \r\n  كما تعتمد أوقات التوصيل على الاوقات التي يتم تحديدها من قبل إدارات المتاجر',
        );
      },
    );
  }
}
