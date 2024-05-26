part of 'home_ui.dart';

class HomeState extends Equatable{

  final List<Data> list;
  final TextEditingController controller;

  const HomeState({
    this.list = const[],
    required this.controller
  });

  @override
  List<Object?> get props => [list, controller,];

  HomeState copyWith({
    List<Data>? list,
    TextEditingController? controller
  }){
    return HomeState(
        list: list ?? this.list,
        controller: controller ?? this.controller
    );
  }

}