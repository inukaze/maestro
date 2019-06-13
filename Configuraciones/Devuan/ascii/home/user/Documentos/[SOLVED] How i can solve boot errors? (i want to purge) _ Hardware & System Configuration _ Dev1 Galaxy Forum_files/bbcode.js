// Find preceding [code] if any
function begcode(text,code) {
    var i = text.lastIndexOf( '[' + code + ']' );
    if ( i >= 0 ) {
	var j = text.lastIndexOf( '[/' + code + ']' );
	if ( j > i ) {
	    return -1;
	}
    }
    return i;
}

function endcode(text,code) {
    var j = text.indexOf( '[/' + code + ']' );
    if ( j >= 0 ) {
	var i = text.indexOf( '[' + code + ']' );
	if ( i >= 0 && i < j ) {
	    return -1;
	}
    }
    return j;
}

// Insert a bbcode wrapping for the selected text
function bbcode(textid,code) {
    var e = document.getElementById(textid);
    var beg = '[' + code + ']';
    var end = '[/' + code + ']';
    if ( e.selectionStart || e.selectionStart == 0 ) {
	var i = e.selectionStart;
	var j = e.selectionEnd;
	var head = e.value.substring( 0, i );
	var sel = e.value.substring( i, j );
	var tail = e.value.substring( j, e.value.length );
	var bi = begcode(head,code);
	var ei = endcode(tail,code);
	console.log( 'wrap ' + bi + " " + ei );
	if ( bi >= 0 && ei >= 0 ) {
	    // unwrap the enclosing bbcode block
	    head = head.substring( 0, bi ) +
		head.substring( bi + beg.length, head.length );
	    tail = tail.substring( 0, ei ) +
		tail.substring( ei + end.length, tail.length );
	    e.value = head + sel + tail;
	    e.selectionStart = bi;
	    e.selectionEnd = head.length + sel.length;
	} else {
	    e.value = head + beg + sel + end + tail;
	    e.selectionStart = head.length + beg.length + sel.length;
	    e.selectionEnd = e.selectionStart;
	}
    } else {
	e.value += beg + end;
    }
    e.focus();
}

// <img src="button.jpg" onclick="bbcode('editbox','code');">
