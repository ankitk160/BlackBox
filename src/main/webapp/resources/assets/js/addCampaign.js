// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
	'use strict'

	// Fetch all the forms we want to apply custom Bootstrap validation styles to
	var forms = document.querySelectorAll('.needs-validation')

	// Loop over them and prevent submission
	Array.prototype.slice.call(forms)
		.forEach(function(form) {
			form.addEventListener('submit', function(event) {
				if (!form.checkValidity()) {
					event.preventDefault()
					event.stopPropagation()
				}
				form.classList.add('was-validated')
			}, false)
		})
})()

/* Function to get operators using territoryid */
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

				// Set the hidden input to the operatorName of the first option
				if (jsonResult.length > 0) {
					var firstOption = operator.find('option:first');
					$('#operatorName').val(firstOption.data('name'));
				} else {
					$('#operatorName').val(''); // Clear the hidden input if no options
				}
			}
		});
	});

/* Script to add operatorName in hidden field */
$('#territory').on('change', function() {
	var selectedOption = $(this).find('option:selected');
	var territoryName = selectedOption.data('name');
	$('#territoryName').val(territoryName);
});

/* Script to add operatorName in hidden field */
$('#operator').on('change', function() {
	var selectedOption = $(this).find('option:selected');
	var operatorName = selectedOption.data('name');
	$('#operatorName').val(operatorName);
});

/* Script to add @msisdn, @pin and @transactionId in the current input field */
document.addEventListener('DOMContentLoaded', function() {
	let lastFocusedInput;

	// Function to get the caret position in an input field
	function getCaretPosition(input) {
		if (!input) return 0;

		if (input.selectionStart !== undefined) {
			return input.selectionStart;
		} else if (document.selection) {
			// For older IE support
			input.focus();
			const selection = document.selection.createRange();
			const selectionLength = document.selection.createRange().text.length;
			selection.moveStart('character', -input.value.length);
			return selection.text.length - selectionLength;
		}
		return 0;
	}

	// Function to set the caret position in an input field
	function setCaretPosition(input, position) {
		if (!input) return;

		if (input.setSelectionRange) {
			input.focus();
			input.setSelectionRange(position, position);
		} else if (input.createTextRange) {
			// For older IE support
			const range = input.createTextRange();
			range.collapse(true);
			range.moveEnd('character', position);
			range.moveStart('character', position);
			range.select();
		}
	}

	// Event listener to track last focused input
	document.querySelectorAll('input').forEach(input => {
		input.addEventListener('focus', function() {
			lastFocusedInput = this;
		});
	});

	// Function to insert text at the caret position in the last focused input
	function insertTextAtCaret(input, text) {
		if (!input) return;

		const position = getCaretPosition(input);
		const currentValue = input.value;
		const newValue = currentValue.slice(0, position) + text + currentValue.slice(position);

		input.value = newValue;
		setCaretPosition(input, position + text.length);
	}

	// Check if the last focused input is one of the specified input fields
	function isAllowedInput(input) {
		const allowedNames = ['portalUrl', 'pinGenUrl', 'pinValidUrl', 'antiFaurdUrl'];
		return allowedNames.includes(input.name);
	}

	// Button event listeners to insert text at caret position in last focused input
	document.getElementById('btnMsisdn').addEventListener('click', function(event) {
		event.preventDefault();
		if (lastFocusedInput && isAllowedInput(lastFocusedInput)) {
			insertTextAtCaret(lastFocusedInput, '@msisdn');
		}
	});

	document.getElementById('btnPin').addEventListener('click', function(event) {
		event.preventDefault();
		if (lastFocusedInput && isAllowedInput(lastFocusedInput)) {
			insertTextAtCaret(lastFocusedInput, '@pin');
		}
	});

	document.getElementById('btnTransactionId').addEventListener('click', function(event) {
		event.preventDefault();
		if (lastFocusedInput && isAllowedInput(lastFocusedInput)) {
			insertTextAtCaret(lastFocusedInput, '@transactionId');
		}
	});
});