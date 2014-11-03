$(function(){
  var colors = d3.scale.ordinal().range(["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56", "#d0743c"]);
  var arc = d3.svg.arc().innerRadius(0).outerRadius(100);
  var svgWidth = 320; // SVG領域の横幅
  var svgHeight = 240;    // SVG領域の縦幅
  var pie = d3.layout.pie().value(function(d){ return d; })

  ShowGrath = function(json){
    $("#myGraph").empty();
    // SVGの表示領域を生成
    var svg = d3.select("#myGraph").append("svg").attr("width", svgWidth).attr("height", svgHeight)
    
    // グループを作成
    var g = svg.selectAll(".arc").data(pie(json.data_list)).enter().append("g").attr("class", "arc");

    // 円グラフを描画
    g.append("path").attr("d", function(d, i){return arc(d)}).
      attr("transform", function(d,i){
        //累計値を計算して，回転角に変換する．
        var subArr = i == 0 ? []: json.data_list.slice(0, i);
        return "translate(100,100),rotate(" + 360 * d3.sum(subArr, function(d){return d.score})/json.sum_value + ")"
      }).
      style("fill", function(d, i) { return colors[i % colors.length]; });
    // グラフ中の文字を追加
    g.append("text")
      .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
      .attr("dy", ".35em")
      .style("text-anchor", "middle")
      .text(function(d, i) { return d.data.word; });
  }
  ShowGrath({data_list: [{word: "a", score: 1}], sum_value: 1});
})