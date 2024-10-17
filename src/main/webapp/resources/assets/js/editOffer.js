/* Script to add campaign in defCampId field */
$(document).ready(function() {
	$.ajax({
		type: "POST",
		url: "getCampaignByOperatorId",
		data: operatorId,
		dataType: "html",
		contentType: "application/text",
		success: function(result) {
			var jsonResult = JSON.parse(result);
			var defaultCampaignId = $("#defaultCampaignId");
			defaultCampaignId.empty();
			defaultCampaignId.append($("<option>").val("").text("Select Campaign"));
			$.each(jsonResult, function(index, item) {
				var option = $('<option>').val(item.id).text(item.id + " - " + item.description);
				if (defCampId == String(item.id)) {
					option.attr('selected', 'selected');
				}
				defaultCampaignId.append(option);
			});
		}
	});
});