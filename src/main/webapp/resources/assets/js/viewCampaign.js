$(document).ready(function() {
	var table = $('#example2').DataTable({
		lengthChange: false,
		pageLength: 50,
		order: [[0, 'desc']],
		buttons: [
			{
				extend: 'copy',
				title: 'Blackbox Campaigns',
				exportOptions: {
					columns: ':not(:nth-child(8)):not(:nth-child(9))'
				}
			},
			{
				extend: 'excel',
				title: 'Blackbox Campaigns',
				exportOptions: {
					columns: ':not(:nth-child(8)):not(:nth-child(9))'
				}
			}
		]
	});

	table.buttons().container().appendTo('#example2_wrapper .col-md-6:eq(0)');
});

/* Script to add pinGenUrl and pinValidUrl into popup */
function loadCampaignData(id) {
	$.ajax({
		type: "POST",
		url: "getCampaignById",
		data: String(id),
		dataType: "html",
		contentType: "application/json",
		success: function(result) {
			var jsonResult = JSON.parse(result);
			$('#alert-container1').empty();
			$('#alert-container2').empty();
			$('#testButton1').empty().removeClass().addClass('btn btn-primary').text('Test');
			$('#testButton2').empty().removeClass().addClass('btn btn-primary').text('Test');
			$('#pinGenUrl').val(jsonResult.pinGenUrl);
			$('#pinValidUrl').val(jsonResult.pinValidUrl);
		}
	});
}


/* Script to generate urls with msisdn and pin into pinGenUrl and pinValidUrl */
$('#responseModal').on('hidden.bs.modal', function() {
	$('#urls').hide();
});
$('#urlsForm').submit(function(event) {
	event.preventDefault();

	var msisdn = $('#msisdn').val().trim();
	var pin = $('#pin').val().trim();

	var pinGenUrl = $('#pinGenUrl').val();
	var pinValidUrl = $('#pinValidUrl').val();

	pinGenUrl = pinGenUrl.replace('@msisdn', msisdn);
	pinValidUrl = pinValidUrl.replace('@msisdn', msisdn).replace('@pin', pin);

	$('#pinGenUrl').val(pinGenUrl);
	$('#pinValidUrl').val(pinValidUrl);

	$('#urls').show();
});


/* Script to test urls and show response in alert div */
$('#testButton1').click(function() {
	const url = $('#pinGenUrl').val();
	fetchUrl(url, '#testButton1');
});

$('#testButton2').click(function() {
	const url = $('#pinValidUrl').val();
	fetchUrl(url, '#testButton2');
});

function fetchUrl(url, buttonId) {
	$(buttonId).html('<span class="spinner-grow spinner-grow-sm" role="status" aria-hidden="true"></span>');

	$.ajax({
		type: "GET",
		url: url,
		dataType: "json",
		success: function(data) {
			var alertMessage = '';

			// Check if responseBody exists and decode it
			if (data.responseBody) {
				var decodedResponseBody = JSON.stringify(data.responseBody); // Remove backslashes
				try {
					alertMessage += 'Response Body: ' + decodedResponseBody + '<br>';
				} catch (e) {
					alertMessage += 'Error parsing responseBody: ' + e + '<br>';
				}
			}

			// Append other fields if they exist
			if (data.requestBody && data.requestBody !== '') {
				alertMessage += 'Request Body: ' + JSON.stringify(data.requestBody) + '<br>';
			}
			if (data.timeTaken) {
				alertMessage += 'Time Taken: ' + data.timeTaken + '<br>';
			}
			if (data.requestApi) {
				alertMessage += 'Request API: ' + data.requestApi + '<br>';
			}

			// If none of the specific parts were found, show the full data
			if (!alertMessage) {
				alertMessage = JSON.stringify(data);
			}
			console.log(data.response.toLowerCase());
			// Update button with appropriate styling and message
			updateButton(buttonId, data.response.toLowerCase() === 'fail' || data.response.toLowerCase() === 'failed' ? 'danger' : 'success', data.response.toLowerCase() === 'fail' || data.response.toLowerCase() === 'failed' ? '<i class="material-icons-outlined">close</i>' : '<i class="material-icons-outlined">check</i>', alertMessage);
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.error('Network Error:', textStatus, errorThrown);
			updateButton(buttonId, 'danger', '<i class="material-icons-outlined">close</i>', 'Network error: ' + textStatus);
		},
	});
}

function updateButton(buttonId, stateClass, content, successMessage) {
	$(buttonId).removeClass().addClass('btn btn-' + stateClass).html(content);

	if (successMessage) {
		var alertContainerId = $(buttonId).attr('id') === 'testButton1' ? '#alert-container1' : '#alert-container2';

		$(alertContainerId).empty();

		var alertHtml = '<div class="alert alert-' + stateClass + ' border-0 bg-' + stateClass + ' alert-dismissible fade show" role="alert"><div class="text-white" style="word-wrap: break-word; white-space: pre-wrap;">' +
			successMessage +
			'</div><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>' +
			'</div>';

		$(alertContainerId).append(alertHtml);
	}
}