part of 'post_call_ui.dart';

class PostCallState extends Equatable{
  final List<Data> list;
  final TextEditingController idController;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController genderController;
  final TextEditingController statusController;

  const PostCallState({
    this.list = const[],
    required this.idController,
    required this.nameController,
    required this.emailController,
    required this.genderController,
    required this.statusController,
  });

  @override
  List<Object?> get props => [list, idController, nameController, emailController, genderController,statusController,];

  PostCallState copyWith({
    List<Data>? list,
    TextEditingController? idController,
    TextEditingController? nameController,
    TextEditingController? emailController,
    TextEditingController? genderController,
    TextEditingController? statusController,
  }){
    return PostCallState(
        list: list ?? this.list,
        idController: idController ?? this.idController,
        nameController: nameController ?? this.nameController,
        emailController: emailController ?? this.emailController,
        genderController: genderController ?? this.genderController,
        statusController: statusController ?? this.statusController
    );
  }
}

/*    "id": 6925927,
    "name": "Vaishno Kaur",
    "email": "vaishno_kaur@feeney-strosin.example",
    "gender": "female",
    "status": "active"*/