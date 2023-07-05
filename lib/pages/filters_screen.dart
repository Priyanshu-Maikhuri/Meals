import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function setFilters;
  final Map<String, bool> currentFilters;
  const FiltersScreen(
      {super.key, required this.currentFilters, required this.setFilters});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFree = false;
  bool lactoseFree = false;
  bool vegan = false;
  bool vegetarian = false;

  @override
  void initState() {
    glutenFree = widget.currentFilters['gluten']!;
    lactoseFree = widget.currentFilters['lactose']!;
    vegan = widget.currentFilters['vegan']!;
    vegetarian = widget.currentFilters['vegetarian']!;

    super.initState();
  }

  Widget _buildSwitchTiles(
      String text, bool currentValue, String description, Function change) {
    return SwitchListTile(
      title: Text(text),
      subtitle: Text(description),
      value: currentValue,
      onChanged: (newValue) => change(newValue),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': glutenFree,
                'lactose': lactoseFree,
                'vegan': vegan,
                'vegetarian': vegetarian
              };
              widget.setFilters(selectedFilters);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(25),
            child: Text('Adjust your meal selection!',
                style: Theme.of(context).textTheme.titleLarge),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchTiles(
                  'Gluten-Free', glutenFree, 'Only include gluten-free meals.',
                  (newValue) {
                setState(() {
                  glutenFree = newValue;
                });
              }),
              _buildSwitchTiles('Lactose-Free', lactoseFree,
                  'Only include lactose-free meals.', (newValue) {
                setState(() {
                  lactoseFree = newValue;
                });
              }),
              _buildSwitchTiles('Vegan', vegan, 'Only include vegan meals.',
                  (newValue) {
                setState(() {
                  vegan = newValue;
                });
              }),
              _buildSwitchTiles(
                  'Vegetarian', vegetarian, 'Only include vegetarian meals.',
                  (newValue) {
                setState(() {
                  vegetarian = newValue;
                });
              })
            ],
          ))
        ],
      ),
    );
  }
}
