import 'package:flutter/material.dart';
import 'package:property_tax/activity/house_tax_payment_view.dart';
import 'package:property_tax/base/dimens.dart';
import 'package:property_tax/base/strings.dart';
import 'package:property_tax/view/combination_view.dart';
import 'package:property_tax/view/text_view.dart';

//反馈界面
class QueryView extends StatelessWidget {
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text(Strings.FEEDBACK_BOTTOM_STR),
            centerTitle: true,
          ),
          body: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF5F5F5),
            ),
            child: showQueryView(),
          )),
    );
  }

  Widget showQueryView() {
    return Column(
      children: <Widget>[
        showTextView(Strings.POLICY_ADVOCACY),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: CombinationView.showItmeView(
              Icons.pages, Strings.POLICY_ADVOCACY),
        ),
        showTextView('征缴税收'),
        showPropertyTaxView(),
        TextView.drawDivider(),
        CombinationView.showItmeView(Icons.subject, '年度总结'),
        showTextView('申诉异议'),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: CombinationView.showItmeView(Icons.sync_problem, '申诉异议处理记录'),
        ),
        showTextView('咨询'),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: CombinationView.showItmeView(Icons.import_contacts, '房产税咨询记录'),
        ),
        TextView.drawDivider(),
        CombinationView.showItmeView(Icons.report_problem, '提出咨询'),
      ],
    );
  }

  Widget showTextView(String title) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 16),
      alignment: FractionalOffset.centerLeft,
      child:
          TextView.getTextColorView(title, Colors.black, Dimens.FONT_SIZE_16),
    );
  }

  Widget showPropertyTaxView() {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: CombinationView.showItmeView(
            Icons.home, Strings.PROPERTY_TAX_COLLECTION),
      ),
      onTap: () {
        Navigator.push(_context,
            MaterialPageRoute(builder: (_context) => HouseTaxPaymentView()));
      },
    );
  }
}
