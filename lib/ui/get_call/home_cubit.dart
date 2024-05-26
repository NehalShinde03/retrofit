part of 'home_ui.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit(super.initialState){
    getAllData();
  }


  ///get all data
  void getAllData() async{
    ApiServices apiServices = ApiServices(Dio());
    List<Data> data = await apiServices.getData();
    emit(state.copyWith(list: data));
  }

  ///get single data
  void getSingleData(int id) async{
    ApiServices apiServices = ApiServices(Dio());
    List<Data> data = await apiServices.getSpecificData(id);
    emit(state.copyWith(list: data));
  }

}