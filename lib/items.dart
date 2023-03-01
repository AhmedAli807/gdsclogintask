import 'package:flutter/material.dart';

class Items extends StatefulWidget {
  const Items({Key? key}) : super(key: key);

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    final _items=[];
    final GlobalKey<AnimatedListState>_key=GlobalKey();
    void _addItems(){
      _items.insert(0, "Item ${_items.length+1}");
      _key.currentState!.insertItem(0,
      duration: const Duration(seconds: 1));
    }
    void _removeItems(int index){
      _key.currentState!.removeItem(index, (context, animation) => SizeTransition(sizeFactor: animation,
      child:const Card(
        color: Colors.red,
        margin: EdgeInsets.all(10),
        child: ListTile(
          title: Text('Deleted',
          style: TextStyle(
            fontSize: 25
          ),),
        ),
      ) ,),
        duration: const Duration(milliseconds: 300)

      );
      _items.removeAt(index);
    }
   return Scaffold(
backgroundColor: const Color(0xff050522),
      appBar: AppBar(
        backgroundColor: Colors.white10,
        title:const  Text('Items'),
        centerTitle: true,
      ),
      body:Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          IconButton(onPressed: _addItems, icon: const Icon(Icons.add,
          color: Colors.white,)),
          Expanded(child: AnimatedList(
            key: _key,
            initialItemCount: 0,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context,index,animation){
              return SizeTransition(
                key: UniqueKey(),
                sizeFactor: animation,
                child: Card(
                  margin: const EdgeInsets.all(10),
                  color: Colors.orangeAccent,
                  child: ListTile(
                    title: Text(_items[index],
                      style: const TextStyle(
                          fontSize: 25),

                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: (){
                        _removeItems(index);
                      },
                    ),
                  ),
                ),
              );
            },
          ))
        ],
      )
    );
  }
}
