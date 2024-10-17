$(document).ready(function() {
	var table = $('#example2').DataTable({
		lengthChange: false,
		pageLength: 50,
		order: [[0, 'desc']],
		buttons: [
			{
				extend: 'copy',
				title: 'Blackbox Offers',
				exportOptions: {
					columns: ':not(:nth-child(8)):not(:nth-child(9)):not(:nth-child(10)):not(:nth-child(11))', // Excludes "Switching", "Edit", and "Landing Page Url" columns
					format: {
						body: function(data, row, column, node) {
							if (column === 6) { // Customize "Switch Flag" column content
								return $(node).closest('tr').attr('data-switch-flag');
							}
							return data;
						}
					}
				}
			},
			{
				extend: 'excel',
				title: 'Blackbox Offers',
				exportOptions: {
					columns: ':not(:nth-child(8)):not(:nth-child(9)):not(:nth-child(10)):not(:nth-child(11))', // Excludes "Switching", "Edit", and "Landing Page Url" columns
					format: {
						body: function(data, row, column, node) {
							if (column === 6) { // Customize "Switch Flag" column content
								return $(node).closest('tr').attr('data-switch-flag');
							}
							return data;
						}
					}
				}
			}
		]
	});

	table.buttons().container().appendTo(
		'#example2_wrapper .col-md-6:eq(0)');

	$('#linkDiv').hide();
	$('#themeDiv').hide();
	$('#landingModal').on(
		'show.bs.modal',
		function(event) {
			$('#linkDiv').hide();
			$('#themeDiv').hide();
			var button = $(event.relatedTarget);
			var id = button.data('id');
			updateLink();
			function updateLink() {
				var domain = $('#domain').val();
				var link = "";
				if (domain == "promolink") {
					$('#themeDiv').show();
					$('#linkDiv').hide();
					$('#theme').on('change', function() {
						var theme = $('#theme').val();
						link = "landing page url here/?promoId=" + id + "&th=" + theme + "&site=bb";
						$('#linkInput').val(link);
						$('#linkDiv').show();
					});
				}
			}

			$('#domain').on('change', function() {
				updateLink();
				if ($('#domain').val() != "promolink") {
					$('#linkDiv').show();
				}
			});
			$('#domain').val('');
			$('#theme').val('');
		});
});

$(".toggle-switch").on("change", function() {
	var offerId = $(this).data("offer-id"); // Get the offer ID
	var switchingCampFlag = $(this).is(":checked") ? "Y" : "N"; // Get the checkbox state
	// Prepare the data to be sent
	var offerData = {
		id: offerId,
		switchingCampFlag: switchingCampFlag
	};
	// Send AJAX request to update offer
	$.ajax({
		url: 'updateOffer',
		type: 'POST',
		contentType: 'application/json',
		data: JSON.stringify(offerData),
		success: function(response) {
			if (response) {
				console.log("Offer updated successfully!");
			} else {
				console.log("Failed to update offer.");
			}
		},
		error: function() {
			alert("An error occurred while updating the offer.");
		}
	});
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