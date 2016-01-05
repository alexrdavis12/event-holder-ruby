function piechart(dis1,dis2,dis3,dis4,dis5,dis6,dis7) {
    Highcharts.getOptions().plotOptions.pie.colors = (function () {
        var colors = [],
            base = Highcharts.getOptions().colors[0],
            i;

        for (i = 0; i < 10; i += 1) {
            colors.push(Highcharts.Color(base).brighten((i - 3) / 10).get());
        }
        return colors;
    }());

    $('#con').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: '<h2>Zipcode Distribution</h2>'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.y}',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            name: 'Distribution',
            data: [
                { name: 'Local', y: parseInt(dis1) },
                { name: 'Houston Area', y: parseInt(dis2) },
                { name: 'Austin Area', y: parseInt(dis3) },
                { name: 'San Antonio Area', y: parseInt(dis4) },
                { name: 'Dallas/Fort Worth Area', y: parseInt(dis5) },
                { name: 'Other Areas in Texas', y: parseInt(dis6) },
                { name: 'Out of Texas', y: parseInt(dis7) }
            ]
        }]
    });
}

$(document).ready(function(){
	var dis1 = document.getElementById("Local").textContent;
	var dis2 = document.getElementById("Houston").textContent;
	var dis3 = document.getElementById("Austin").textContent;
	var dis4 = document.getElementById("San").textContent;
	var dis5 = document.getElementById("Dallas").textContent;
	var dis6 = document.getElementById("Other").textContent;
	var dis7 = document.getElementById("Out").textContent;
	piechart(dis1,dis2,dis3,dis4,dis5,dis6,dis7);
});
