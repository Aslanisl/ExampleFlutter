import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_project/data/repository/entity/manufactory.dart';
import 'package:test_project/pages/details/details_page.dart';

import 'list_cubit.dart';
import 'list_state.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetIt.instance.get<ListCubit>(),
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Items'),
            ),
            body: const _Items()));
  }
}

class _Items extends StatefulWidget {
  const _Items({Key? key}) : super(key: key);

  @override
  State<_Items> createState() => _ItemsState();
}

class _ItemsState extends State<_Items> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<ListCubit>().loadManufactures(false);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent) {
        context.read<ListCubit>().loadManufactures(false);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCubit, ListState>(builder: (context, state) {
      final items = state.manufactures ?? List.empty();
      final itemsCount;
      if (state.itHasMoreManufactures || state.status == MainStatus.fail) {
        itemsCount = items.length + 1;
      } else {
        itemsCount = items;
      }
      return ListView.separated(
          controller: _scrollController,
          itemBuilder: (context, index) {
            if (items.length > index) {
              return _Item(item: items.elementAt(index));
            } else {
              if (state.status == MainStatus.fail) {
                return _ErrorLoad(error: state.error ?? "Reload");
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            }
          },
          separatorBuilder: (context, index) {
            return Divider(height: 1);
          },
          itemCount: itemsCount);
    });
  }
}

class _ErrorLoad extends StatelessWidget {
  const _ErrorLoad({Key? key, required this.error}) : super(key: key);

  final String error;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ListCubit>().loadManufactures(true);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Row(
            children: [const Icon(Icons.refresh), const SizedBox(width: 16), Text(error)],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({Key? key, required this.item}) : super(key: key);

  final Manufactory item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.mfrName),
      subtitle: item.country != null ? Text(item.country!) : null,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsPage(manufactoryId: item.mfrId)),
        );
      },
    );
  }
}
