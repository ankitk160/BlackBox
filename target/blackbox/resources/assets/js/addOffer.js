/* Function to get operators using territoryid */
$('#territory').on(
	'change',
	function() {
		var selectedTerritoryId = this.value;
		var selectedTerritoryName = $(this).find(':selected').data('name');
		$('#territoryName').val(selectedTerritoryName);
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
						.attr('data-name', item.operatorName);
					operator.append(option);
				});
			}
		});
	});


/* Script to add campaign in all defCampId field and FailSaveCampId */
$('#operator').on('change', function() {
	var selectedOperatorId = this.value;
	var selectedOperatorName = $(this).find(':selected').data('name');
	$('#operatorName').val(selectedOperatorName);
	$.ajax({
		type: "POST",
		url: "getCampaignByOperatorId",
		data: selectedOperatorId,
		dataType: "html",
		contentType: "application/text",
		success: function(result) {
			var jsonResult = JSON.parse(result);
			var defaultCampaignId = $("#defaultCampaignId");
			var FailSaveCmpId = $("#FailSaveCmpId");
			defaultCampaignId.empty();
			FailSaveCmpId.empty();
			// Create separate default options for each campaign
			defaultCampaignId.append($("<option>").val("").text("Select Campaign"));
			FailSaveCmpId.append($("<option>").val("").text("Select Campaign"));
			$.each(jsonResult, function(index, item) {
				// Create separate options for each campaign
				var option1 = $("<option>").val(item.id).text(item.id + " - " + item.description);
				var option2 = $("<option>").val(item.id).text(item.id + " - " + item.description);
				defaultCampaignId.append(option1);
				FailSaveCmpId.append(option2);
			});
		}
	});
});