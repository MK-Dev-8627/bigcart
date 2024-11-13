import 'package:big_cart/configs/color/color.dart';
import 'package:big_cart/configs/extensions.dart';
import 'package:big_cart/configs/routes/routes_name.dart';
import 'package:big_cart/model/address/address_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/assets/image_assets.dart';
import '../../configs/components/custom_appbar.dart';
import '../../view_model/shipping/shipping_view_model.dart';
import 'widgets/shipping_address_widget.dart';

class MyAddressView extends StatefulWidget {
  const MyAddressView({super.key});

  @override
  State<MyAddressView> createState() => _MyAddressViewState();
}

class _MyAddressViewState extends State<MyAddressView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Schedule fetchFavProductsList to run after the build phase
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<ShippingViewModel>(context, listen: false);
      provider.fetchMyAddressList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'My Address',
        autoImplyLeading: true,
        actionWidgets: [
          IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, RoutesName.addAddressView, (route) => true);
              },
              icon: const ImageIcon(AssetImage(ImageAssets.add ?? ""))),
        ],
      ),
      body: SafeArea(
        child: Consumer<ShippingViewModel>(builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView.builder(
                itemCount: provider.myAddressList.length,
                itemBuilder: (context, index) {
                  final myAddress = provider.myAddressList[index];
                  return AddressCardWidget(
                    myAddress: myAddress,
                    index: index
                  );
                }),
          );
        }),
      ),
    );
  }
}

class AddressCardWidget extends StatelessWidget {
  AddressCardWidget({
    super.key,
    required this.myAddress,
    required this.index,
  });
  MyAddress myAddress;
int index;
  @override
  Widget build(BuildContext context) {
    final name = myAddress.name ?? "";
    final phone = myAddress.phone ?? "";
    final address = myAddress.address ?? "";
    final city = myAddress.city ?? "";
    final zipcode = myAddress.zipcode ?? "";
    final country = myAddress.country ?? "";
    final makeDefault = myAddress.makeDefault ?? false;
    final show = myAddress.show ?? false;
    return Consumer<ShippingViewModel>(builder: (context, provider, child) {
      return Container(
        width: context.mediaQueryWidth,
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(color: Theme.of(context).cardColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            makeDefault
                ? Container(
                    color: AppColors.primaryLightColor,
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      'Default',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.primaryDarkColor),
                    ),
                  )
                : const SizedBox.shrink(),
            ListTile(
              leading: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: AppColors.primaryLightColor, shape: BoxShape.circle),
                child: const Center(
                    child: ImageIcon(
                  AssetImage(ImageAssets.locationHome),
                  color: AppColors.primaryDarkColor,
                  size: 30,
                )),
              ),
              title: Text(
                name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$address, $city, $country, $zipcode',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    phone,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              trailing: GestureDetector(
                onTap: (){
                  provider.showInput(index);
                },
                child: ImageIcon(
                  AssetImage(show ? ImageAssets.arrowUP : ImageAssets.arrowDown),
                  color: AppColors.primaryDarkColor,
                  size: 20,
                ),
              ),
            ),
            show? const Column(
              children: [
                Divider(
                  thickness: 2,
                  height: 2,
                ),
                InputMyAddressWidget(),
              ],
            ):const SizedBox.shrink(),

          ],
        ),
      );
    });
  }
}
