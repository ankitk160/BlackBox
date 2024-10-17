/* $.validator.setDefaults({
	submitHandler: function() {
		alert("submitted!");
	}
}); */

$(document).ready(function() {

	$("#addCampaignValidation").validate({
		rules: {
			servicename: "required",
			territory: "required",
			operator: "required",
			pinLength: "required",
			price: "required",
			chargingmode: "required",
			partnerName: "required",
			lpPageLang: "required",
			mailid: {
				required: true,
				email: true
			},
			unsubKeyword: "required",
			unsubSC: "required",
			dailyCap: "required",
			campBid: "required",
			portalUrl: "required",
			apiDevelopedBy: "required",
			antiFaurdUrl: "required",
			displayServiceName: "required"
		},
		messages: {
			servicename: "Please enter servicename.",
			territory: "Please select territory.",
			operator: "Please select operator.",
			pinLength: "Please select pin length.",
			price: "Please enter price upto two decimal places.",
			chargingmode: "Please enter charging mode in a single digit.",
			partnerName: "Please select partner.",
			lpPageLang: "Please select lp page language.",
			mailid: "Please enter a valid mail address.",
			unsubKeyword: "Please enter unsub keyword.",
			unsubSC: "Please enter unsub sc.",
			dailyCap: "Please enter daily cap.",
			campBid: "Please enter camp bid.",
			portalUrl: "Please enter valid portal url.",
			apiDevelopedBy: "Please select api developer.",
			antiFaurdUrl: "Please enter anti faurd url.",
			displayServiceName: "Please enter display service name."
		},

	});

	$("#addOfferValidation").validate({
		rules: {
			offerName: "required",
			territory: "required",
			operator: "required",
			defaultCampaignId: "required",
			dailyCap: "required",
			agencyid: "required",
			pubBid: "required",
			optimizePerc: "required",
			FailSaveCmpId: "required"
		},
		messages: {
			offerName: "Please enter offer name.",
			territory: "Please select territory.",
			operator: "Please select operator.",
			defaultCampaignId: "Please select default campaign ID.",
			dailyCap: "Please enter daily cap.",
			agencyid: "Please select agencyid.",
			pubBid: "Please enter pub bid.",
			optimizePerc: "Please select optimize percentage.",
			FailSaveCmpId: "Please select fail save camp ID."
		},

	});

	$("#addSwitchingValidation").validate({
		rules: {
			campaign1: "required"
		},
		messages: {
			campaign1: "Please select campaign 1."
		},
	});

	$("#loginValidation").validate({
		rules: {
			username: "required",
			password: "required"
		},
		messages: {
			username: "Please enter username.",
			password: "Please enter password."
		},

	});

	$("#dateRangeValidation").validate({
		rules: {
			dateRangeInput: "required"
		},
		messages: {
			dateRangeInput: "Please choose date range."
		},

	});

	$("#addLinkValidation").validate({
		rules: {
			name: "required",
			territory: "required",
			agency: "required"
		},
		messages: {
			name: "Please enter link name.",
			territory: "Please select territory.",
			agency: "Please select agency."
		},

	});

	$("#billingValidation").validate({
		rules: {
			territory: "required",
			operator: "required",
			serviceid: "required",
			dateRangeInput: {
				validateDateRange: true // Apply custom rule here
			}
		},
		messages: {
			territory: "Please select territory.",
			operator: "Please select operator.",
			serviceid: "Please select service ID.",
			dateRangeInput: "Please choose date range."
		},

	});
});