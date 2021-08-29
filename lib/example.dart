import 'package:adstestgoogle/ad_state.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class RewardedAdsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    AdmobHelper admobHelper = Provider.of<AdmobHelper>(context,listen: false);

    return Scaffold(appBar: AppBar(title: Container(
        height: 60,
      width: double.infinity,
        color: Colors.red,
        child: AdWidget(
          ad: AdmobHelper.getBannerAd()..load(),
          key: UniqueKey(),
        ),
      ),backgroundColor: Colors.grey[900],),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<AdmobHelper>(builder: (context,date,child){
              return Text("Rewarded Point is ${admobHelper.getrewardpoint()}");
            },),
            ElevatedButton(onPressed: (){admobHelper.loadRewardedAd();}, child: Text("Load Rewarded Ads")),
            ElevatedButton(onPressed: (){admobHelper.showRewaredAd();}, child: Text("Show Rewarded Ads")),
          ],
        ),
      ),
       bottomNavigationBar: Container(
        height: 60,
        color: Colors.red,
        child: AdWidget(
          ad: AdmobHelper.getBannerAd()..load(),
          key: UniqueKey(),
        ),
      ),
    );
  }
}