$(document).ready(function() {
		pushPopListeners();
		
		$(".menuLinkFields").hide();

		/*$("#admin").click(function() {
			$('.createPageForm').toggle();
		});*/

		$(".addtomenu").click(function() {
			$(".menuLinkFields").toggle();

		});

  $('li li a').addClass("btn btn-default");
 
  $('article').addClass("box_outline");
  $('p').addClass("col-md-offset-1");


	$("#admin-form form").submit(function() {
		var adminFormData = {
			":title": $(this).find("#page_title").val(),
			":path": $(this).find("#page_url").val(),
			":body": $(this).find("#page_body").val()
		};
		if($(".addtomenu").is(":checked")) {
			adminFormData.menuData = {
			":title": $(this).find("#menu_title").val(),
			":path": $(this).find("#page_url").val(),
			":plid": $(this).find(".menuSelect select :selected").val()
			};
		}

		insertNewPage(adminFormData);

		this.reset();
		return false;
	});



});




// jquery live, gör inte såhär!!!
// $("class").live("click",function(){});

//setTimeour(function(){
//$('<button class="class">knapp</button>').appendTo('body');
// },3000);

// jquery on, dis is the way!!
//du kan göra den snabbare genom att vara snävare i din
// första selector än att skriva document
//$(document).on("click", "button.class", function(){
	//addClass.("bogeli");
	// });

//htaccess gå till index oberoende på url.,.,..
//history.pushState().................. :,(

	//pageName = pageName || "start";