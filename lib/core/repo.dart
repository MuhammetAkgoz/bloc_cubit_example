// class PostsPage extends StatefulWidget {
//   @override
//   _PostsPageState createState() => _PostsPageState();
// }
//
// class _PostsPageState extends State<PostsPage> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<PostsBloc>().loadItems();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Posts')),
//       body: ViewStateBuilder<List<Post>, PostsBloc>(
//         onLoading: (context) => const LoadingIndicator(),
//         onSuccess: (context, posts) => PostsList(posts, onRefresh: () => _refreshPosts(context)),
//         onRefreshing: (context, posts) => PostsList(posts, onRefresh: () => _refreshPosts(context)),
//         onEmpty: (context) => const PostsListEmpty(),
//         onError: (context, error) => ErrorMessage(error: error),
//       ),
//     );
//   }
//
//   void _refreshPosts(BuildContext context) {
//     context.read<PostsBloc>().refreshItems();
//   }
// }
