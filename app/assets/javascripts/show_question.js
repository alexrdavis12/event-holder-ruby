// This handles adding question

function hookselect() {
	$("select").change(function(evt){
		evt.stopImmediatePropagation();
		select_qid = $(this).attr('qid');
		opt = $(this).val();
		if ($("[hash=hash_" + select_qid + "_" + opt + "]") != undefined) {
			$("[showed=" + select_qid + "]").hide();
			$("[hash=hash_" + select_qid + "_" + opt + "]").show(400);
			$("[hash=hash_" + select_qid + "_" + opt + "]").attr("showed", select_qid);
		}

	});
}

function radioselect() {
	$(":radio").change(function(evt){
		evt.stopImmediatePropagation();
		select_qid = $(this).attr('qid');
		opt = $(this).val();
		if ($("[hash=hash_" + select_qid + "_" + opt + "]") != undefined) {
			$("[showed=" + select_qid + "]").hide();
			$("[hash=hash_" + select_qid + "_" + opt + "]").show(400);
			$("[hash=hash_" + select_qid + "_" + opt + "]").attr("showed", select_qid);
		}

	});
}

$(document).ready(function(){
	hookselect();
	radioselect();
});