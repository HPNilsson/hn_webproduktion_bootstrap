

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
			console.log("insertNewPage in db WORKS!");
		},
		error: function(data) {
			console.log("insertNewPage error: ", data);
		}
	});
}

function getMenuLinks() {
	$.ajax({
		url: "php/get_menulinks.php",
		type: "post",
		dataType: "json",
		success: function(data) {
			console.log("getting menu links! Yay! ", data);
			createSelect(data);
		},
		error: function(data) {
			console.log("error getting menu links... darn ", data.responseText);
		}
	});
}

function createSelect(data){
	var selectHtml = $('<select class="form-control"/>');
	var topOptionHtml = $('<option value="">Top</option>');
			selectHtml.append(topOptionHtml);

	for (var i = 0; i < data.length; i++) {
		if (data[i].plid === null) {
			var optionHtml = $('<option value="'+data[i].mlid+'">'+data[i].title+'</option>');
			selectHtml.append(optionHtml);
		}
	}
	$('.menuSelect').html(selectHtml);
}