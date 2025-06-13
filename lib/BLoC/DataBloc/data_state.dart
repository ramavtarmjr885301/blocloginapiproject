

 import '../../barrel.dart';

class DataState extends Equatable {
  final ApiStatus datastatus;
  final List<PostsListsModel> postsData;
  const DataState({this.datastatus = ApiStatus.loadingState, this.postsData=const[]});

  DataState copyWith({ApiStatus? datastatus,List<PostsListsModel>? postsData }){
    return DataState(datastatus: datastatus ?? this.datastatus, postsData:postsData?? this.postsData);
  }
  @override
  List<Object?> get props => [datastatus, postsData];
}
