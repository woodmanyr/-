	var myfont_face = "Arial";
	var myfont_size = "10";
	var myfont_color = "#000000";
	var myback_color = "";
	var mywidth = 100;
	var my12_hour = 1;

	var dn = ""; var old = "";

	if (document.all||document.getElementById) { document.write('<span id="LiveClockIE" style="width:'+mywidth+'px; background-color:'+myback_color+'"></span>'); }
	else if (document.layers) { document.write('<ilayer bgColor="'+myback_color+'" id="ClockPosNS"><layer width="'+mywidth+'" id="LiveClockNS"></layer></ilayer>'); }
	else { old = "true"; show_clock(); }

	function show_clock() {

		//show clock in NS 4
		if (document.layers)
                document.ClockPosNS.visibility="show"
		if (old == "die") { return; }

		var Digital = new Date();
		var hours = Digital.getHours();
		var minutes = Digital.getMinutes();
		var seconds = Digital.getSeconds();

		if (my12_hour) {
			dn = "����";
			if (hours > 12) { dn = "����"; hours = hours - 12; }
			if (hours == 0) { hours = 12; }
		} else {
			dn = "";
		}
		if (minutes <= 9) { minutes = "0"+minutes; }
		if (seconds <= 9) { seconds = "0"+seconds; }

		myclock = '';
		myclock += '<font style="color:'+myfont_color+'; font-family:'+myfont_face+'; font-size:'+myfont_size+'pt;">';
		myclock += hours+':'+minutes+':'+seconds+' '+dn;
		myclock += '</font>';

		if (old == "true") {
			document.write(myclock);
			old = "die"; return;
		}

		if (document.layers) {
			clockpos = document.ClockPosNS;
			liveclock = clockpos.document.LiveClockNS;
			liveclock.document.write(myclock);
			liveclock.document.close();
		} else if (document.all) {
			LiveClockIE.innerHTML = myclock;
		} else if (document.getElementById) {
			document.getElementById("LiveClockIE").innerHTML = myclock;
		}

		setTimeout("show_clock()",1000);
}
