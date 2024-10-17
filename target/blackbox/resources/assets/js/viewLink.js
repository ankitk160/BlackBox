$(document).ready(function() {
	var table = $('#example2').DataTable({
		lengthChange: false,
		pageLength: 50,
		order: [[0, 'desc']],
		buttons: false
	});

	table.buttons().container().appendTo(
		'#example2_wrapper .col-md-6:eq(0)');
});

/* Script to copy link from button in view Link page */
function copyToClipboard(button, linkId) {
	//var textToCopy = "http://lp.drivetrafficonline.com/vaspay/genLpPage?lpId=" + linkId;
	var textToCopy = "link here" + linkId;
	var textArea = document.createElement("textarea");
	textArea.value = textToCopy;
	textArea.style.position = "fixed";
	textArea.style.opacity = 0;
	document.body.appendChild(textArea);
	textArea.focus();
	textArea.select();
	try {
		document.execCommand('copy');
		var icon = button.querySelector('i');
		icon.textContent = 'inventory';

		setTimeout(function() {
			icon.textContent = 'link';
		}, 2000);
	} catch (err) {
		console.error('Error copying link: ', err);
	}
	document.body.removeChild(textArea);
}