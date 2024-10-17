$(document).ready(function() {

	//chart 1
	function fetchChartData() {
		$.ajax({
			type: "POST",
			url: "getChartData",
			dataType: "json",
			success: function(response) {
				var categories = [];
				var seriesData = [];
				response.forEach(function(item) {
					categories.push(item.addtime);
					seriesData.push(parseFloat(item.profit));
				});

				// Update chart configuration with fetched data
				var chartOptions = {
					series: [
						{ name: "Profit", data: seriesData },
					],
					chart: {
						type: "area",
						height: 205,
						offsetX: -15,
						toolbar: { show: false },
						foreColor: "#adb0bb",
						fontFamily: 'inherit',
						sparkline: { enabled: !0 },
						zoom: {
							enabled: false
						}
					},
					colors: ["#ffc107"],
					markers: { size: 0 },
					dataLabels: { enabled: false },
					legend: { show: false },
					grid: {
						borderColor: "rgba(0,0,0,0.1)",
						strokeDashArray: 3,
						xaxis: { lines: { show: false } },
					},
					xaxis: {
						type: "category",
						categories: categories,
						labels: {
							style: { cssClass: "grey--text lighten-2--text fill-color" },
						},
					},
					yaxis: {
						show: true,
						min: 0,
						tickAmount: 4,
						labels: {
							style: {
								cssClass: "grey--text lighten-2--text fill-color",
							},
						},
					},
					stroke: {
						curve: "smooth",
						show: true,
						width: 3,
						lineCap: "butt",
					},
					fill: {
						type: 'gradient',
						gradient: {
							shade: 'dark',
							gradientToColors: ['#ff0080'],
							shadeIntensity: 1,
							type: 'vertical',
							opacityFrom: 0.8,
							opacityTo: 0.1,
							stops: [0, 100, 100, 100]
						},
					},
					tooltip: { theme: "dark" },
					responsive: [
						{
							breakpoint: 600,
							options: {
								plotOptions: {
									bar: {
										borderRadius: 3,
									}
								},
							}
						}
					]
				};

				// Initialize the chart with options
				var chart = new ApexCharts(document.querySelector("#chart1"), chartOptions);
				chart.render();
			},
			error: function(xhr, status, error) {
				console.error("Error fetching chart data:", error);
			}
		});
	}

	// Fetch chart data on document ready
	fetchChartData();
});