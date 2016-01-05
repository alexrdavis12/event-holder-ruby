// This handles adding question
function delete_option(qid, cnt) {
	$("#Q" + qid + "_" + cnt).remove();
}

function delete_optionforsub(qid, option_id, subqcnt, cnt) {
	$("#Q" + qid + "_" + option_id + "_" + subqcnt + "_" + cnt).remove();
}


function delete_question(qid) {
	$("#Q" + qid).remove();
}

function delete_subquestion(qid, option_id, subqcnt) {
	$("#QQ" + qid + '_' + option_id + '_' + subqcnt).remove();
}


function add_optionsforsub(qid, option_id, subqcnt) {
	cnt = $("#Q" + qid + "_" + option_id + "_" + subqcnt + "_optcnt").val();
	$("#Q" + qid + "_" + option_id + "_" + subqcnt + "_optcnt").val(++cnt);
	$("#Q" + qid + "_" + option_id + "_" + subqcnt + "_insertpos").before("<div class='form-group' id='Q" + qid+ "_" + option_id + "_" + subqcnt + "_" + cnt + "'>\
										 <input class='form-control' name='S" + qid + "_" + option_id + "_" + subqcnt + "[opt" + cnt + "]' value=''><div class='form-group'></div><input class='btn btn-danger' type='Button' onclick='javascript:delete_optionforsub("+ qid + "," + option_id + "," + subqcnt + "," + cnt + ");' value='Delete Option' />\
										 </div>\
										 ");
}

function add_options(qid, displaysub) {

	if (displaysub == 1)
		vis = ""
	else
		vis = "disabled"

	cnt = $("#Q" + qid + "_optcnt").val();
	$("#Q" + qid + "_optcnt").val(++cnt);
	$("#Q" + qid + "_insertpos").before("<div class='form-group' id='Q" + qid+ "_" + cnt + "'>\
										 <input class='form-control' name='Q" + qid + "[opt" + cnt + "]' value=''><div class='form-group'></div><div class='btn-group'><input class='btn btn-danger' type='Button' onclick='javascript:delete_option("+ qid + ", " + cnt + ");' value='Delete Option' /><input class='btn btn-success' type='Button' onclick='javascript:add_subquestion(" + select_qid + ", " + cnt + ");' value='Add Sub-question' " + vis + "/>\
										 <input id='Q" + qid + "_" + cnt + "_subqcnt' type='hidden' value='0'>\
										 </div></div>\
										 ");
}

function add_subquestion(select_qid, option_id) {
	cnt = $("#Q" + select_qid + "_" + option_id + "_subqcnt").val();
	$("#Q" + select_qid + "_" + option_id + "_subqcnt").val(++cnt);
	q_type_str = '<div class="form-group">\
					  <label>Type</label>\
					  <select class="form-control" belong="' + select_qid + '_'+ option_id + '_' + cnt +'" name="S' + select_qid + '_' + option_id + '_' + cnt +'[type]">\
                      <option value="1">Text</option>\
                      <option value="2">Checkboxes</option>\
                      <option value="3">Radio Buttons</option>\
                      <option value="4">Dropdown</option>\
                      <option value="5">Paragraph Text</option>\
                	  </select>\
                	  <div class="form-group"></div>\
                	  <input class="btn btn-danger" type="Button" onclick="javascript:delete_subquestion(' + select_qid + ', ' + option_id + ',' + cnt + ');" value="Delete Question" />\
                	  </div>';
    str = 	"<div class='form-group'></div><div class='panel panel-danger' id='QQ" + select_qid + "_" + option_id + "_" + cnt + "'><div class='panel-heading'><h3 class='panel-title'>Sub-question</h3></div><div class='panel-body'><div class='form-group'><input class='form-control' name='S" + select_qid + "_" + option_id + "_" + cnt + "[title]' value=''></div>" + q_type_str + "</div></div></div>";
	$("#Q" + select_qid + "_" + option_id).append(str);

	hookClickSel();

}

function trigger_option_subquestion(dom_obj, select_qid, option_id, subqcnt) {
	dom_obj.parent().after("<div id='Q" + select_qid + "_" + option_id + "_" + subqcnt + "_optdiv' class='form-group'><div class='panel panel-default'>\
				   <div class='panel-heading'>Options</div>\
				   <div class='panel-body' id='Q" + select_qid + "_" + option_id + "_" + subqcnt + "_options'>\
				   <input id='Q" + select_qid + "_" + option_id + "_" + subqcnt + "_optcnt' type='hidden' value='3'>\
				   <div class='form-group' id='Q" + select_qid + "_" + option_id + "_" + subqcnt + "_1'>\
				   <input class='form-control' name='S" + select_qid + "_" + option_id + "_" + subqcnt + "[opt1]' value=''><div class='form-group'></div><input class='btn btn-danger' type='Button' onclick='javascript:delete_optionforsub(" + select_qid + ", " + option_id + "," + subqcnt + ", 1);' value='Delete Option' />\
				   </div>\
				   <div class='form-group' id='Q" + select_qid + "_" + option_id + "_" + subqcnt + "_2'>\
				   <input class='form-control' name='S" + select_qid + "_" + option_id + "_" + subqcnt + "[opt2]' value=''><div class='form-group'></div><input class='btn btn-danger' type='Button' onclick='javascript:delete_optionforsub(" + select_qid + "," + option_id + "," + subqcnt + ", 2);' value='Delete Option' />\
				   </div>\
				   <div class='form-group' id='Q" + select_qid + "_" + option_id + "_" + subqcnt + "_3'>\
				   <input class='form-control' name='S" + select_qid + "_" + option_id + "_" + subqcnt + "[opt3]' value=''><div class='form-group'></div><input class='btn btn-danger' type='Button' onclick='javascript:delete_optionforsub(" + select_qid + ", " + option_id + "," + subqcnt + ", 3);' value='Delete Option' />\
				   </div>\
				   <input id='Q" + select_qid + "_" + option_id + "_" + subqcnt + "_insertpos' type='button' class='btn btn-danger pull-right' onclick='javascript:add_optionsforsub(" + select_qid + "," + option_id + "," + subqcnt + ");' value='Add Option' />\
				   </div></div></div></div>");
}

function trigger_option(dom_obj, select_qid, displaysub) {
	if (displaysub == 1)
		vis = ""
	else
		vis = "disabled"
	dom_obj.parent().after("<div id='Q" + select_qid + "_optdiv' class='form-group'><div class='panel panel-default'>\
				   <div class='panel-heading'>Options</div>\
				   <div class='panel-body' id='Q" + select_qid + "_options'>\
				   <input id='Q" + select_qid + "_optcnt' type='hidden' value='3'>\
				   <div class='form-group' id='Q" + select_qid + "_1'>\
				   <input class='form-control' name='Q" + select_qid + "[opt1]' value=''><div class='form-group'></div><div class='btn-group'><input class='btn btn-danger' type='Button' onclick='javascript:delete_option(" + select_qid + ", 1);' value='Delete Option' /><input class='btn btn-success' type='Button' onclick='javascript:add_subquestion(" + select_qid + ", 1);' value='Add Sub-question' " + vis + " /></div>\
				   <input id='Q" + select_qid + "_1_subqcnt' type='hidden' value='0'>\
				   </div>\
				   <div class='form-group' id='Q" + select_qid + "_2'>\
				   <input class='form-control' name='Q" + select_qid + "[opt2]' value=''><div class='form-group'></div><div class='btn-group'><input class='btn btn-danger' type='Button' onclick='javascript:delete_option(" + select_qid + ", 2);' value='Delete Option' /><input class='btn btn-success' type='Button' onclick='javascript:add_subquestion(" + select_qid + ", 2);' value='Add Sub-question' " + vis + "/></div>\
   				   <input id='Q" + select_qid + "_2_subqcnt' type='hidden' value='0'>\
				   </div>\
				   <div class='form-group' id='Q" + select_qid + "_3'>\
				   <input class='form-control' name='Q" + select_qid + "[opt3]' value=''><div class='form-group'></div><div class='btn-group'><input class='btn btn-danger' type='Button' onclick='javascript:delete_option(" + select_qid + ", 3);' value='Delete Option' /><input class='btn btn-success' type='Button' onclick='javascript:add_subquestion(" + select_qid + ", 3);' value='Add Sub-question' " + vis + " /></div>\
   				   <input id='Q" + select_qid + "_3_subqcnt' type='hidden' value='0'>\
				   </div>\
				   <input id='Q" + select_qid + "_insertpos' type='button' class='btn btn-danger pull-right' onclick='javascript:add_options(" + select_qid + ", " + displaysub + ");' value='Add Option' />\
				   </div></div></div></div>");
}

function hookClickSel() {
	$("select").change(function(evt){
		evt.stopImmediatePropagation();
		select_qid = $(this).attr('belong');
			switch(parseInt($(this).val())){
				case 1:
					if ($("#Q" + select_qid + "_optdiv") != undefined) {
						$("#Q" + select_qid + "_optdiv").remove();
					}
					break;
				case 2:
				// checkboxes
					if ($("#Q" + select_qid + "_optdiv") != undefined) {
						$("#Q" + select_qid + "_optdiv").remove();
					}
					if (select_qid.indexOf('_') == -1) 
						trigger_option($(this), select_qid, 0);
					else {
						belongarray = select_qid.split('_')
						qid = belongarray[0];
						option_id = belongarray[1];
						subqcnt = belongarray[2];
						trigger_option_subquestion($(this), qid, option_id, subqcnt);
					}
					break;
				case 3:
				// radio
					if ($("#Q" + select_qid + "_optdiv") != undefined) {
						$("#Q" + select_qid + "_optdiv").remove();
					}

					if (select_qid.indexOf('_') == -1) 
						trigger_option($(this), select_qid, 1);
					else {
						belongarray = select_qid.split('_')
						qid = belongarray[0];
						option_id = belongarray[1];
						subqcnt = belongarray[2];
						trigger_option_subquestion($(this), qid, option_id, subqcnt);
					}

					break;
				case 4:
				// dropdown
					if ($("#Q" + select_qid + "_optdiv") != undefined) {
						$("#Q" + select_qid + "_optdiv").remove();
					}

					if (select_qid.indexOf('_') == -1) 
						trigger_option($(this), select_qid, 1);
					else {
						belongarray = select_qid.split('_')
						qid = belongarray[0];
						option_id = belongarray[1];
						subqcnt = belongarray[2];
						trigger_option_subquestion($(this), qid, option_id, subqcnt);
					}

					break;
				default:
					if ($("#Q" + select_qid + "_optdiv") != undefined) {
						$("#Q" + select_qid + "_optdiv").remove();
					}
					break;
			}


	});
}

$(document).ready(function(){
	current_qid = parseInt($("#current_qid").val());
	$('#create_q_btn').click(function(evt){
		evt.stopImmediatePropagation();
		current_qid += 1;
		q_type_str = '<div class="form-group">\
					  <label>Type</label>\
					  <select class="form-control" belong=' + current_qid + ' name="Q' + current_qid + '[type]">\
                      <option value="1">Text</option>\
                      <option value="2">Checkboxes</option>\
                      <option value="3">Radio Buttons</option>\
                      <option value="4">Dropdown</option>\
                      <option value="5">Paragraph Text</option>\
                	  </select>\
                	  <div class="form-group"></div>\
                	  <input class="btn btn-danger" type="Button" onclick="javascript:delete_question(' + current_qid + ');"" value="Delete Question" />\
                	  </div>';
		$("#q_form").append("<div class='panel panel-success' id='Q" + current_qid + "'><div class='panel-heading'><h3 class='panel-title'>Question</h3></div><div class='panel-body'><div class='form-group'><input class='form-control' name='Q" + current_qid + "[title]' value=''></div>" + q_type_str+ "</div></div></div>");
		hookClickSel();
	});

	hookClickSel();

});
