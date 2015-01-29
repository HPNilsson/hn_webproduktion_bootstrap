

function insertNewPage(adminFormData) {
	$.ajax({
		url: "php/save_content.php",
		type: "post",
		dataType: "json",
		data: {
			"page_data" : adminFormData
		},
		success: function(data) {
			// goTo("content-list");
			console.log("funkar det?");
		},
		error: function(data) {
			console.log("insertNewPage error: ", data);
		}
	});
}

