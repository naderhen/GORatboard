function remove_fields(link) {  
    $(link).prev("input[type=hidden]").val("1");  
    $(link).closest(".fields").hide();  
}  
  
function add_fields(link, association, content) {  
    var new_id = new Date().getTime();  
    var regexp = new RegExp("new_" + association, "g");  
    $(link).parent().before(content.replace(regexp, new_id));  
	$(".to_be_hidden").hide();
}

function add_rows(link, association, content) {  
    var new_id = new Date().getTime();  
    var regexp = new RegExp("new_" + association, "g");  
    $(link).parent().parent().before(content.replace(regexp, new_id));  
	$(".to_be_hidden").hide();
}






$(function() {
		$(".hide_me").hide()
		$(".datepicker").datepicker({ dateFormat: 'yy-mm-dd' });
		
		$("#tabs, #customer_tabs, #tabs2").tabs();
		$('.datepicker').live('focus', function() {
		  $(this).datepicker({dateFormat: 'yy-mm-dd'});
		});
		$('.rat_date').live('focus', function() {
		  $(this).datepicker({dateFormat: 'yy-mm-dd'});
		});
		
		$(".to_be_hidden").hide();
		$('.trend_selector').live('click', function() {
		 	$(this).parent().parent().next("td").children().val($(this).attr("title"));
			$(this).siblings().removeClass("current")
			$(this).addClass("current");
		});
		
		$('input[value="1"]').parent().prev("td").find("#trend_up").addClass("current");
		$('input[value="0"]').parent().prev("td").find("#trend_static").addClass("current");
		$('input[value="-1"]').parent().prev("td").find("#trend_down").addClass("current");
		
		
		$('.sale_handle').toggle(function() {
		  	var me = $(this);
			var my_row = $(this).closest(".ratgrade_row");
			var ratgrade_id = $(this).attr("data-ratgrade_id");
			var ratgrade_name = $(this).attr("data-ratgrade_name");
			var warehouse_name = $(this).attr("data-warehouse_name");
			var warehouse_id = $(this).attr("data-warehouse_id");
			var board_id = $(this).attr("data-board_id");
			$("#newsale_placeholder").hide();
			$("#newsale_form").fadeIn();
			$("#rightmenu h3").text("Sale of "+ratgrade_name+" out of "+warehouse_name);
			$("#sale_ratgrade_id").val(ratgrade_id);
			$("#sale_ratgrade_name").val(ratgrade_name);
			$("#sale_warehouse_id").val(warehouse_id);
			
			$(".ratgrade_row").not(my_row).fadeTo('slow', .1);
			me.find("span").addClass("icon-cancel");
			
			return false;
		}, function() {
			var me = $(this);
			$("#newsale_placeholder").show()
			$("#newsale_form").hide();
		  	$(".ratgrade_row").fadeTo('fast', 1);
			$("#rightmenu h3").text("Quick Sale");
			$("#sale_ratgrade_id").val("");
			$("#sale_ratgrade_name").val("");
			$("#sale_warehouse_id").val("");
			me.find("span").removeClass("icon-cancel");
			me.find("span").addClass("icon-add");
		});
		
		
		//PUSHER STUFF //

			var pusher = new Pusher(pusher_key, pusher_channel);

		  pusher.bind('create', function(sale) {
			var sale_amount = sale.amount;
			var sale_price = sale.price;
			var ratgrade_average = sale.average
			var user_login = sale.user_login;
			var customer = sale.customer;
			var ratgrade = sale.ratgrade;
			var user_list = $('#'+user_login+'-sales-list');
		    
			user_list.effect('highlight');
			user_list.prepend('<li><h2>'+customer+'</h2><h3>'+sale_amount+'<span>pieces of</span></h3><h3 class="ratgrade_name">'+ratgrade+'</h3></li>');

			if (sale.price > (ratgrade_average+.35) ) {
				
			};


		  });

		
		


		
		
		
});





