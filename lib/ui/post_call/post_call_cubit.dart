
part of 'post_call_ui.dart';

class PostCallCubit extends Cubit<PostCallState>{
  PostCallCubit(super.initialState){
    getAllData();
  }


  ///get all data
  void getAllData() async{
    ApiServices apiServices = ApiServices(Dio());
    List<Data> data = await apiServices.getData();
    emit(state.copyWith(list: data));
  }

  ///get single data
  void postData([Map<String, String>? map]) async{
    ApiServices apiServices = ApiServices(Dio());
    List<Data> data = await apiServices.postData(map);
    emit(state.copyWith(list: data));
  }

}