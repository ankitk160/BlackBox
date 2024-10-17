/* Script to initialize flatpicker */
$(".date-range").flatpickr({
	mode: "range",
	altInput: true,
	altFormat: "F j, Y",
	dateFormat: "Y-m-d",
	maxDate: new Date()
});

/* Script for copy and excel buttons in datatable */
$(document).ready(
	function() {
		var table = $('#example2').DataTable({
			paging: false,
			lengthChange: false,
			pageLength: 50,
			order: [[0, 'asc']],
			buttons: [
				{
					extend: 'copy',
					title: 'Blackbox Billing Report',
				},
				{
					extend: 'excel',
					title: 'Blackbox Billing Report',
				}
			]
		});

		table.buttons().container().appendTo(
			'#example2_wrapper .col-md-6:eq(0)');
	});

/* Script to get operators using territoryid */
$('#territory').on(
	'change',
	function() {
		var selectedTerritoryId = this.value;
		$.ajax({
			type: "POST",
			url: "getOperatorByTerritoryId",
			data: selectedTerritoryId,
			dataType: "html",
			contentType: "application/text",
			success: function(result) {
				var jsonResult = JSON.parse(result);
				var operator = $("#operator");
				operator.empty();
				var defaultOption = $("<option>")
					.val("")
					.text("Select Operator");
				operator.append(defaultOption);
				$.each(jsonResult, function(index, item) {
					var option = $("<option>")
						.val(item.id)
						.text(item.id + " - " + item.operatorName)
						.attr("data-name", item.operatorName);
					operator.append(option);
				});
			}
		});
	});

/* Script to get service IDs using operatorid */
$('#operator').on('change', function() {
	var selectedOperatorId = this.value;
	$.ajax({
		type: "POST",
		url: "getServiceInfoByOprId",
		data: selectedOperatorId,
		dataType: "html",
		contentType: "application/text",
		success: function(result) {
			var jsonResult = JSON.parse(result);
			console.log(jsonResult);
			var serviceid = $("#serviceid");
			serviceid.empty();
			serviceid.append($("<option>").val("").text("Select Service ID"));
			$.each(jsonResult, function(index, item) {
				var option1 = $("<option>").val(item.service).text(item.id + " - " + item.serviceName);
				serviceid.append(option1);
			});
		}
	});
});