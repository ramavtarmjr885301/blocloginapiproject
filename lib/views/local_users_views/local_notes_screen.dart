import 'package:bloc_practice/barrel.dart';

class LocalNotesScreen extends StatefulWidget {
  final LocalUserModel user;
  const LocalNotesScreen({super.key, required this.user});

  @override
  State<LocalNotesScreen> createState() => _LocalNotesScreenState();
}

class _LocalNotesScreenState extends State<LocalNotesScreen> {
  @override
  void initState() {
    context.read<NoteBloc>().add(LoadNotes());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.7,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Text("Welcome, ${widget.user.username}",
                  style:const TextStyle(fontSize: 20)),
              SizedBox(
                  height: 120,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Email: ${widget.user.email}"),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text("Mobile Number: ${widget.user.mobileNumber}"),
                        ],
                      ),
                    ),
                  )),
            const  SizedBox(
                height: 100,
              ),
              Container(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                      ),
                      onPressed: () {},
                      child: Text("LogOut")))
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue.shade900,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: const Text("My Notes", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          if (state.status == ApiStatus.loadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == ApiStatus.errorState) {
            return Center(child: Text(state.errorMessage ?? 'Error'));
          } else if (state.notes.isEmpty) {
            return const Center(
                child: Text("No notes found.",
                    style: TextStyle(color: Colors.white)));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: state.notes.length,
            itemBuilder: (context, index) {
              final note = state.notes[index];
              return GestureDetector(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => NoteFormScreen(note: note),
                    ),
                  );
                  context.read<NoteBloc>().add(LoadNotes());
                },
                // onLongPress: () {
                //   showDialog(
                //     context: context,
                //     builder: (_) => AlertDialog(
                //       title: const Text("Delete Note"),
                //       content: const Text(
                //           "Are you sure you want to delete this note?"),
                //       actions: [
                //         TextButton(
                //           onPressed: () => Navigator.pop(context),
                //           child: const Text("Cancel"),
                //         ),
                //         TextButton(
                //           onPressed: () {
                //             context.read<NoteBloc>().add(DeleteNote(note.id!));
                //             Navigator.pop(context);
                //           },
                //           child: const Text("Delete",
                //               style: TextStyle(color: Colors.red)),
                //         ),
                //       ],
                //     ),
                //   );
                // },
                child: Card(
                  color: Colors.white60,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    title: Text(note.title,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(note.content),
                    trailing: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text("Delete Note"),
                              content: const Text(
                                  "Are you sure you want to delete this note?"),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context
                                        .read<NoteBloc>()
                                        .add(DeleteNote(note.id!));
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Delete",
                                      style: TextStyle(color: Colors.red)),
                                ),
                              ],
                            ),
                          );
                        },
                        icon:const Icon(Icons.delete)),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add, color: Colors.black),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const NoteFormScreen()),
          );
          
          context.read<NoteBloc>().add(LoadNotes());
        },
      ),
    );
  }
}
