$(".date-range").flatpickr({
	mode: "range",
	altInput: true,
	altFormat: "F j, Y",
	dateFormat: "Y-m-d",
	maxDate: new Date()
});

$(document).ready(function() {
	var table = $('#example2').DataTable({
		paging: false,
		lengthChange: false,
		pageLength: 50,
		buttons: [{
			extend: 'copy',
			title: 'Blackbox Report',
			text: 'Copy',
			exportOptions: {
				format: {
					body: function(data, row, column, node) {
						var link = $(node).find('a').attr('href');
						if (link) {
							return link;
						}
						return data;
					}
				}
			}
		},
		{
			extend: 'excel',
			title: 'Blackbox Report',
			text: 'Excel',
			exportOptions: {
				format: {
					body: function(data, row, column, node) {
						var link = $(node).find('a').attr('href');
						if (link) {
							return link;
						}
						return data;
					}
				}
			}
		}]
	});

	table.buttons().container().appendTo(
		'#example2_wrapper .col-md-6:eq(0)');
});

// Function to fetch and display report data
function fetchReportData(dateFrom, dateTo) {
	clearAlerts();
	$.ajax({
		type: "POST",
		url: "getAffProReport",
		data: JSON.stringify({ from: dateFrom, to: dateTo }),
		dataType: "html",
		contentType: "application/json",
		success: function(offerResult) {
			var offerJsonResult = JSON.parse(offerResult);
			$('#dataTable tbody').empty();

			$.each(offerJsonResult, function(index, campaign) {
				$.ajax({
					type: "POST",
					url: "getCampaignById",
					data: campaign.campaignId,
					dataType: "html",
					contentType: "application/text",
					success: function(result) {
						var jsonResult = JSON.parse(result);
						campaign.territoryName = jsonResult.territory_operator_name.split(' ')[0];
						campaign.operatorName = jsonResult.territory_operator_name.split(' ')[1];

						var link = 'http://35.200.175.6/vaspay/getAffProData?campaignName=' + campaign.offerid + '_' + campaign.campaignId + '&addtime=' + campaign.transData;
						var row = '<tr class="dataRow">' +
							'<td class="text-nowrap" style="position: sticky; left: 0; background-color: #FFF;">' + campaign.transData + '</td>' +
							'<td>' + campaign.territoryName + '</td>' +
							'<td>' + campaign.operatorName + '</td>' +
							'<td class="text-nowrap">' + campaign.agencyName + '</td>' +
							'<td>' + campaign.partnernName + '</td>' +
							'<td style="color:#5d9add;">' + campaign.offerid + '</td>' +
							'<td style="color:#5d9add;">' + campaign.campaignId + '</td>' +
							'<td class="text-nowrap">' + campaign.campaignName + '</td>' +
							'<td style="color:#5d9add;">' + campaign.totalPinGen + '</td>' +
							'<td style="color:#5d9add;">' + campaign.totalPinScs + '</td>' +
							'<td style="color:#5d9add;">' + campaign.totalPinVerifyScs + '</td>' +
							'<td style="color:#5d9add;">' + Number(((campaign.totalPinVerifyScs / campaign.totalPinScs) * 100).toFixed(2)).toLocaleString() + '</td>' +
							'<td style="color:#5d9add;">' + campaign.optimizePerc + '<button type="submit" class="transparent-button" data-bs-toggle="modal" data-bs-target="#responseModal" onclick="loadOfferData(' + campaign.offerid + ')"><i class="ti ti-edit"></i></button></td>' +
							'<td style="color:#5d9add;">' + campaign.totalCBSent + '</td>' +
							'<td style="color:#5d9add;">' + Number(((campaign.totalCBSent / campaign.totalPinScs) * 100).toFixed(2)).toLocaleString() + '</td>' +
							'<td class="text-center"><a href="' + link + '" target="_blank"><button type="button" class="transparent-button"><i class="ti ti-link"></i></button></a><span style="display:none;">' + link + '</span></td>' +
							'</tr>';
						$('#dataTable tbody').append(row);
						$('#excelBtn').prop('disabled', false);
					},
					error: function(xhr, status, error) {
						console.error("Error fetching campaign data:", error);
					}
				});
			});
		},
		error: function(xhr, status, error) {
			console.error("Error fetching data:", error);
		}
	});
}