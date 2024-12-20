import 'package:big_cart/configs/color/color.dart';
import 'package:big_cart/configs/components/custom_textfiled.dart';
import 'package:big_cart/configs/constants/constants.dart';
import 'package:big_cart/configs/extensions.dart';
import 'package:big_cart/view/home/widgets/input_search_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:big_cart/data/response/status.dart';
import 'package:big_cart/main.dart';
import 'package:big_cart/view/home/widgets/error_widgets.dart';
import 'package:big_cart/view/home/widgets/logout_button_widget.dart';
import 'package:big_cart/view_model/home/home_view_model.dart';
import 'package:provider/provider.dart';
import '../../configs/components/loading_widget.dart';
import '../../configs/components/network_image_widget.dart';
import 'widgets/carousel_slider_widget.dart';
import 'widgets/categories_widget.dart';
import 'widgets/product_list_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final searchFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child:Column(
              children: [
                20.height,
               InputSearchWidget(focusNode: searchFocusNode),
                20.height,
                CarouselSliderWidget(),
                20.height,
                CategoriesWidget(),
                20.height,
                ProductListWidget()

              ],
            ),
          ),
        ),
      ),
    );
  }
}



/*class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: const Text('Popular Shows'),
      //   actions: const [
      //     LogoutButtonWidget(),
      //     SizedBox(width: 20,)
      //   ],
      // ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) =>
            HomeViewViewModel(homeRepository: getIt())..fetchMoviesListApi(),
        child: Consumer<HomeViewViewModel>(builder: (context, value, _) {
          switch (value.moviesList.status) {
            case Status.loading:
              return const Center(child: LoadingWidget());
            case Status.error:
              return const HomeErrorWidget();
            case Status.completed:
              if (value.moviesList.data!.tvShow.isEmpty) {
                return const Center(child: Text('No data found'));
              }
              return ListView.builder(
                  itemCount: value.moviesList.data!.tvShow.length,
                  itemBuilder: (context, index) {
                    final moviesList = value.moviesList.data!.tvShow[index];
                    return Card(
                      child: ListTile(
                        leading: NetworkImageWidget(
                          borderRadius: 5,
                          imageUrl: moviesList.imageThumbnailPath.toString(),
                        ),
                        title: Text(moviesList.name.toString()),
                        subtitle: Text(moviesList.network.toString()),
                        trailing: Text(moviesList.status.toString()),
                      ),
                    );
                  });
            default:
              return Container();
          }
        }),
      ),
    );
  }
}*/
