import 'package:flutter/material.dart';
import '../widgets/maindrawer.dart';

class FilterScreen extends StatefulWidget {
  static const routName = '/filter';

  final Function saveFilters;

  final Map<String, bool> currentFilters;

  const FilterScreen(
    this.currentFilters,
    this.saveFilters,
  );

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filters')),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(15),
          child: Center(
            child: Text(
              'Adjust your meal selection!',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
        Column(children: [
          buildSwitchListTile(
              'Gulten_Free', 'Only incluod gluten_free meal', _glutenFree,
              (newVale) {
            setState(() {
              _glutenFree = newVale;
            });
          }),
          buildSwitchListTile(
              'Lactose_Free', 'Only incluod lactose_Free meal', _lactoseFree,
              (newVale) {
            setState(() {
              _lactoseFree = newVale;
            });
          }),
          buildSwitchListTile(
              'Vegetarian', 'Only incluod vegetarian meal', _vegetarian,
              (newVale) {
            setState(() {
              _vegetarian = newVale;
            });
          }),
          buildSwitchListTile('Vegan', 'Only incluod vegan meal', _vegan,
              (newVale) {
            setState(() {
              _vegan = newVale;
            });
          }),
          Container(
              width: 150,
              margin: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueAccent),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                onPressed: () {
                  final Map<String, bool> selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegetarian': _vegetarian,
                    'vegan': _vegan,
                  };
                  widget.saveFilters(selectedFilters);
                  Navigator.of(context).pushNamed('/');
                },
                child: Text('Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    )),
              )),
        ]),
      ]),
    );
  }

  Widget buildSwitchListTile(
      String title, String subTitle, bool currentValue, Function state) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subTitle),
      value: currentValue,
      onChanged: state,
      activeColor: Colors.blue,
    );
  }
}
