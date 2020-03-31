import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:flutter_demo/common/mock/languages.dart';
import 'package:flutter_demo/common/model/language_model.dart';
import 'package:flutter_demo/common/utils/navigator_util.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_demo/common/utils/string_util.dart';

enum OptionDialogAction {
  cancel,
  discard,
  save,
}

const double SLIVER_HEADER_HEIGHT = 26;
const double SLIVER_ITEM_HEIGHT = 40;
const double KEY_ITEM_WIDTH = 20;
const double KEY_ITEM_HEIGHT = 16;

class OptionDialog extends StatefulWidget {

  @override
  _OptionDialogState createState() => _OptionDialogState();
}

class _OptionDialogState extends State<OptionDialog>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  Map<String, List<Language>> languagesMap = Map();
  final ScrollController _scrollController = ScrollController();
  List<Language> languagesList = [];
  List<Language> _languagesBySearch = [];
  String _inputText = StringUtil.STRING_EMPTY;
  int currentKeyIndex = 0;

  @override
  void initState() {
    _loadLanguages();
    _scrollController.addListener(() {
      _onScroll(_scrollController.position.pixels);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => NavigatorUtil.pop(context),
          child: Padding(
            padding: EdgeInsets.all(6),
            child: Icon(
              Icons.close,
              size: 20,
            ),
          ),
        ),
        title: Text("hahahah"),
        actions: <Widget>[
          FlatButton(
            child: Text(
              '完成',
              style: TextStyle(color: Colors.black54),
            ),
            onPressed: () {
              Navigator.pop(context, OptionDialogAction.save);
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
//            padding: EdgeInsets.only(top: 50),
            child: _inputText == StringUtil.STRING_EMPTY
                ? CustomScrollView(
              controller: _scrollController,
              slivers: _buildSlivers(context),
            )
                : _searchList,
          ),
          buildPositionedKeys
        ],
      ),
    );
  }

  Widget get buildPositionedKeys {
    var height = _getSortedKeys.length * KEY_ITEM_HEIGHT;
    return _inputText == StringUtil.STRING_EMPTY
        ? Positioned(
            right: 4,
            top: (MediaQuery.of(context).size.height - height) / 2 - 36,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              width: KEY_ITEM_WIDTH,
              height: height,
              child: _getListKeys,
            ),
          )
        : Container();
  }

  Widget get _searchList {
    return _languagesBySearch.isEmpty
        ? Container(
            child: Center(
              child: Text(
                '哎呦喂, 搜索值迷路了!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
          )
        : ListView(
            children: ListTile.divideTiles(
                    context: context,
                    tiles: _buildListTiles(context, _languagesBySearch))
                .toList(),
          );
  }

  List<Widget> _buildSlivers(BuildContext context) {
    List<Widget> slivers = [];
    slivers.addAll(_buildHeaderBuilderLists(context));
    return slivers;
  }

  List<Widget> _buildHeaderBuilderLists(BuildContext context) {
    List<String> keys = _getSortedKeys;
    List<Widget> sliverStickyHeaders = [];

    sliverStickyHeaders.addAll(List.generate(keys.length, (sliverIndex) {
      String key = keys[sliverIndex];
      List<Language> languages = languagesMap[key];

      return SliverStickyHeaderBuilder(
        builder: (context, state) => _buildAnimatedHeader(context, key, state),
        sliver: SliverList(
          delegate: SliverChildListDelegate(ListTile.divideTiles(
                  context: context, tiles: _buildListTiles(context, languages))
              .toList()),
        ),
      );
    }));
    return sliverStickyHeaders;
  }

  List<String> get _getSortedKeys => languagesMap.keys.toList()..sort();

  Widget get _getListKeys {
    final style = TextStyle(fontSize: 12, fontWeight: FontWeight.w500);
    final selectedStyle = TextStyle(
        fontSize: 12,
        color: Colors.lightBlueAccent,
        fontWeight: FontWeight.w500);
    List<Widget> widgets = [];
    _getSortedKeys.asMap().forEach((index, key) {
      widgets.add(GestureDetector(
        onTap: () => _onTapKey(index),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(2),
          height: KEY_ITEM_HEIGHT,
          width: 14,
          child: Text(
            key,
            style: currentKeyIndex == index ? selectedStyle : style,
          ),
        ),
      ));
    });

    return Column(
      children: widgets,
    );
  }

  Widget _buildAnimatedHeader(
      BuildContext context, String key, SliverStickyHeaderState state) {

    return Container(
      height: SLIVER_HEADER_HEIGHT,
      color: (state.isPinned
              ? Colors.blue
              : Colors.blueGrey.withOpacity(0.5))
          .withOpacity(1.0 - state.scrollPercentage),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.centerLeft,
      child: Text(
        '$key',
        style: TextStyle(color: Colors.brown),
      ),
    );
  }

  void _loadLanguages() {
    List<Language> languages = Languages.languages;
    Map<String, List<Language>> resultMap = Map();
    languages.forEach((language) {
      String text = language.text;
      if (text != null && text.length > 0) {
        String langPrefix = text.substring(0, 1).toUpperCase();
        List<Language> languagesInMap =
            !resultMap.containsKey(langPrefix) ? [] : resultMap[langPrefix];
        languagesInMap.add(language);
        resultMap[langPrefix] = languagesInMap;
      }
    });

    if (resultMap.containsKey('A')) {
      List<Language> languagesInMap = resultMap['A'];
      languagesInMap.insert(0, Language(text: '所有语言', color: '#cccccc'));
      resultMap['A'] = languagesInMap;
    }
    setState(() {
      languagesList = languages;
      languagesMap = resultMap;
    });
  }

  List<Widget> _buildListTiles(BuildContext context, List<Language> languages) {
    List<Widget> tiles = [];
    if (languages != null && languages.isNotEmpty) {
      languages.forEach((language) {
        tiles.add(GestureDetector(
          onTap: () {
            NavigatorUtil.pop(context);
          },
          child: Container(
            alignment: Alignment.centerLeft,
            height: SLIVER_ITEM_HEIGHT,
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(right: 6),
                  child: PhysicalModel(
                    color: HexColor(language.color),
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(6),
                    child: Container(
                      width: 12,
                      height: 12,
                      child: Text(StringUtil.STRING_EMPTY),
                    ),
                  ),
                ),
                Expanded(child: Text('${language.text}'))
              ],
            ),
          ),
        ));
      });
    }
    return tiles;
  }

  _onTapKey(int index) {
    setState(() {
      currentKeyIndex = index;
    });

    // 计算滚动offset
    double offset = SLIVER_ITEM_HEIGHT + SLIVER_HEADER_HEIGHT;
    _getSortedKeys.asMap().forEach((sortedIndex, sortedKey) {
      if (sortedIndex < index) {
        offset += languagesMap[sortedKey].length * SLIVER_ITEM_HEIGHT +
            SLIVER_HEADER_HEIGHT;
      }
    });
    _scrollController.jumpTo(offset + 0.01);
  }

  void _onScroll(double pixels) {
    if (pixels <= 0) return;
    double height = SLIVER_ITEM_HEIGHT + SLIVER_HEADER_HEIGHT;

    for (final key in _getSortedKeys) {
      height +=
          languagesMap[key].length * SLIVER_ITEM_HEIGHT + SLIVER_HEADER_HEIGHT;
      if (height >= pixels) {
        int index = _getSortedKeys.indexOf(key);
        if (index != currentKeyIndex) {
          setState(() {
            currentKeyIndex = index;
          });
        }
        break;
      }
    }
  }

  @override
  bool get wantKeepAlive => true;
}
