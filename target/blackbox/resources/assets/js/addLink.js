/* Function to create operator based select elements using territoryid and agencyid */
function loadOperatorsAndOffers() {
	var selectedTerritoryId = $('#territory').val();
	var selectedAgencyId = String($('#agency').val());
	$.ajax({
		type: "POST",
		url: "getOperatorByTerritoryId",
		data: selectedTerritoryId,
		dataType: "html",
		contentType: "application/text",
		success: function(result) {
			var jsonResult = JSON.parse(result);
			$("#operatorDiv").empty();
			$.each(jsonResult, function(index, item) {
				var operatorDiv = $("<div>").addClass("mb-3 row");
				var label = $("<label>")
					.addClass("col-sm-3 col-form-label")
					.attr("for", item.operatorName)
					.text("Select " + item.operatorName + " Offer");
				var select = $("<select>")
					.addClass("form-select")
					.attr("id", "offerOpr" + (index + 1))
					.attr("name", "offerOpr" + (index + 1))
					.attr("data-placeholder", "Select Offer")
					.attr("data-width", "100%"); // Added data-width attribute for select2

				var hiddenInput = $("<input>")
					.attr("type", "hidden")
					.attr("name", "opr" + (index + 1))
					.val(item.id);
				operatorDiv.append(label);
				operatorDiv.append($("<div>").addClass("col-sm-9").append(select));
				operatorDiv.append(hiddenInput);
				$("#operatorDiv").append(operatorDiv);

				var selectedOperatorId = String(item.id);
				$.ajax({
					type: "POST",
					url: "getOffrByOprAgnId",
					data: JSON.stringify({ selectedOperatorId: selectedOperatorId, selectedAgencyId: selectedAgencyId }),
					dataType: "html",
					contentType: "application/json",
					success: function(offerResult) {
						var offerJsonResult = JSON.parse(offerResult);
						if (offerJsonResult.length > 0) {
							select.empty();
							var defaultOption = $("<option>").val("").text("Select Operator");
							select.append(defaultOption);
							$.each(offerJsonResult, function(index, offer) {
								var option = $("<option>").val(offer.id).text(offer.offerName + " - " + offer.id);
								select.append(option);
							});

							// Initialize select2 after options are appended
							select.select2({
								theme: "bootstrap-5",
								width: select.data('width') ? select.data('width') : select.hasClass('w-100') ? '100%' : 'style',
								placeholder: select.data('placeholder')
							});
						}
					}
				});
			});
		}
	});
}

/* Script to show link in popup */
document.addEventListener('DOMContentLoaded', function() {
	var result = document.getElementById('result') ? document.getElementById('result').value : null;
	if (result) {
		var message = result === "success" ? document.getElementById('successMessage').value : document.getElementById('errorMessage').value;
		var title = result === "success" ? "Success" : "Error";
		document.getElementById('responseModalLabel').innerText = title;
		document.getElementById('responseMessage').innerText = message;

		if (result === "success") {
			var link = document.getElementById('link').value;
			document.getElementById('linkInput').value = link;
			document.getElementById('copyButton').style.display = 'block';
		}

		// Show the modal using Bootstrap 5's JavaScript API
		var responseModal = new bootstrap.Modal(document.getElementById('responseModal'), {
			keyboard: false
		});
		responseModal.show();
	}
});

/* Script to copy link from popup */
function copyLink() {
	var linkInput = document.getElementById('linkInput');
	linkInput.select();
	linkInput.setSelectionRange(0, 99999); // For mobile devices

	try {
		document.execCommand('copy');
		var copyButton = document.getElementById('copyButton');
		copyButton.innerText = 'Copied';
		setTimeout(function() {
			copyButton.innerText = 'Copy';
		}, 2000); // Reset button text after 2 seconds
		console.log('Link copied to clipboard');
	} catch (err) {
		console.error('Could not copy text: ', err);
	}
}