import 'package:blocloginapiproject/model/postsListModel.dart';
import 'package:blocloginapiproject/utils/states.dart';
import 'package:equatable/equatable.dart';

 class DataState extends Equatable {
  final ApiStatus datastatus;
  final List<PostsListsModel> postsData;
  const DataState({this.datastatus = ApiStatus.successState, this.postsData=const[]});

  DataState copyWith({ApiStatus? datastatus,List<PostsListsModel>? postsData }){
    return DataState(datastatus: datastatus ?? this.datastatus, postsData:postsData?? this.postsData);
  }
  @override
  List<Object?> get props => [datastatus, postsData];
}
