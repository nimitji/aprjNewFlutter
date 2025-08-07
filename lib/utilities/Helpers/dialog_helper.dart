import 'package:aprjnew/GlobalUtilities/Controllers/profileController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../Constants/app_color.dart';
import '../../Constants/size.dart';
import '../../classes/deleterequest.dart';

class DialogHelper {
  DialogHelper._();

  static final DialogHelper _instance = DialogHelper._();

  static DialogHelper get instance => _instance;

  void showErrorDialog(
      {String? title = 'Error', String? description = 'Something went wrong'}) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title!,
                style: Get.textTheme.bodyMedium,
              ),
              Center(child: Text(description!, style: Get.textTheme.bodyMedium,
                textAlign: TextAlign.center,)),
              getVerticalSpace(10),
              ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen!) Get.back();
                },
                child: Text('Dismiss'),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  //show loading
  void showLoading({@required message}) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 8),
              Text(message),
            ],
          ),
        ),
      ),
    );
  }

  //hide loading
  void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }


  void showConfirmDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: kPrimaryColor,
              height: getScreenHeight(60),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Do you want to exit?",
                style: Get.textTheme.bodyMedium!.copyWith(color: Colors.white,
                    fontSize: getTextSize(17), fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      onPressed: () => Get.back(), child: Text("NO")),
                  getHorizontalSpace(20),
                  OutlinedButton(
                      onPressed: () => SystemNavigator.pop(),
                      child: Text("YES")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  void accountdeleteconfirm(BuildContext context) {
    ProfileController _newpart=Get.put(ProfileController());
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color:kPrimaryColor,
              height: getScreenHeight(60),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Alert!!",
                style: Get.textTheme.bodyMedium!.copyWith(color: Colors.white,
                    fontSize: getTextSize(17), fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: getScreenHeight(60),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Do you want to delete all your data with us, this will remove all your engagements with Jaiswal Jain Parinay?",
                style: Get.textTheme.bodyMedium!.copyWith(color: kPrimaryColor,
                    fontSize: getTextSize(17), fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () => Get.back(), child: const Text("No")),
                  getHorizontalSpace(20),
                  TextButton(
                      onPressed: ()async {

                        DeleteRequestClass newreq=DeleteRequestClass(
                            deleterequest: "I confirm that I want my account deleted from the JJP Cloud and remove all my engagement with Jaiswal Jain Parinay"
                        );

                        _newpart.newdeleterequest(newreq: newreq);
                      },
                      child: const Text("Yes")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  void reportflagconfirm(BuildContext context,String id) {
    ProfileController _newpart=Get.put(ProfileController());
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color:kPrimaryColor,
              height: getScreenHeight(60),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Alert!!",
                style: Get.textTheme.bodyMedium!.copyWith(color: Colors.white,
                    fontSize: getTextSize(17), fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: getScreenHeight(60),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Do you want to mark this profile as objectionable, this profile will be removed/edited as per the policy?",
                style: Get.textTheme.bodyMedium!.copyWith(color: kPrimaryColor,
                    fontSize: getTextSize(17), fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () => Get.back(), child: const Text("No")),
                  getHorizontalSpace(20),
                  TextButton(
                      onPressed: ()async {

                        DeleteRequestClass newreq=DeleteRequestClass(
                            deleterequest: "the profile id $id is in-appropriate and objectionable please remove this profile "
                        );

                        _newpart.newreportflag(newreq: newreq);
                      },
                      child: const Text("Yes")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  void blockconfirm(BuildContext context,String id) {
    ProfileController _newpart=Get.put(ProfileController());
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color:kPrimaryColor,
              height: getScreenHeight(60),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Alert!!",
                style: Get.textTheme.bodyMedium!.copyWith(color: Colors.white,
                    fontSize: getTextSize(17), fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: getScreenHeight(60),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Do you want to block this user?",
                style: Get.textTheme.bodyMedium!.copyWith(color: kPrimaryColor,
                    fontSize: getTextSize(17), fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () => Get.back(), child: const Text("No")),
                  getHorizontalSpace(20),
                  TextButton(
                      onPressed: ()async {

                        DeleteRequestClass newreq=DeleteRequestClass(
                            deleterequest: "the profile id $id is in-appropriate and objectionable please block this user "
                        );

                        _newpart.newreportflag(newreq: newreq);
                      },
                      child: const Text("Yes")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}

  //show exit dialog

/*
  void orderPlacedDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: kMainColor,
              height: getScreenHeight(60),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Order has been placed",
                style: Get.textTheme.bodyMedium!.copyWith(color: Colors.white,
                    fontSize: getTextSize(17), fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () => Get.back(), child: Text("Dismiss")),
                  getHorizontalSpace(20),
                  TextButton(
                      onPressed: () {},
                      child: Text("Check")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void cartaddDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color:kMainColor,
              height: getScreenHeight(60),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Item has been added to your cart",
                style: Get.textTheme.bodyMedium!.copyWith(color: Colors.white,
                    fontSize: getTextSize(17), fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () => Get.back(), child: Text("Shop More")),
                  getHorizontalSpace(20),
                  TextButton(
                      onPressed: () {
                        Get.offAndToNamed(AppRoute.cartpage);

                      },
                      child: Text("Go To Cart")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void cartqtyerrorDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color:kMainColor,
              height: getScreenHeight(60),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Please Select Quantity",
                style: Get.textTheme.bodyMedium!.copyWith(color: Colors.white,
                    fontSize: getTextSize(17), fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () => Get.back(), child: Text("OK")),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void paymenterrorDialog(String title) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color:kMainColor,
              height: getScreenHeight(60),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                title,
                style: Get.textTheme.bodyMedium!.copyWith(color: Colors.white,
                    fontSize: getTextSize(17), fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () => Get.back(), child: Text("OK")),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void loadingDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color:kMainColor,
              height: getScreenHeight(60),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Loading",
                style: Get.textTheme.bodyMedium!.copyWith(color: Colors.white,
                    fontSize: getTextSize(17), fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 10),
          Center(child:CircularProgressIndicator())
          ],
        ),
      ),
    );
  }

  void saveconfirm(UserAccountController partner,BuildContext context) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color:kMainColor,
              height: getScreenHeight(60),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Do you want to save the data?",
                style: Get.textTheme.bodyMedium!.copyWith(color: Colors.white,
                    fontSize: getTextSize(17), fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () => Get.back(), child: const Text("No")),
                  getHorizontalSpace(20),
                  TextButton(
                      onPressed: ()async {
                        DialogHelper.instance.showLoading(message: "Saving Data");
                        await partner.saveNewPartner();
                      },
                      child: const Text("Yes")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void usersaved({@required message}) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: kMainColor,
              height: getScreenHeight(60),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
               message,
                style: Get.textTheme.bodyMedium!.copyWith(color: Colors.white,
                    fontSize: getTextSize(17), fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () => Get.offAndToNamed(AppRoute.home), child: const Text("Done")),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
*/
