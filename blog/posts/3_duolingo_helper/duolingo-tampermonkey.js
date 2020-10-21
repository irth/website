// ==UserScript==
// @name           Duolingo mistake helper
// @description    Requires an additional enter click to move to the next exercise when you have made a mistake.
//
// @run-at         document-start
// @include        https://www.duolingo.com/*
// @grant          none
// ==/UserScript==

var checking = 0;

function advance() {
    document.querySelector("button[data-test=player-next]").click()
}


(window.opera ? document.body : document).addEventListener('keydown', function(e) {
    if (e.keyCode == 13) {
        e.cancelBubble = true;
        e.stopImmediatePropagation();
        e.preventDefault();
        if(checking === 0) {
            checking = 1;
            advance()
        } else if(checking === 1) {
            var correct = document.querySelector("[data-test*=blame-incorrect]") == null
            if(correct) advance();
            else {
                checking = 2;
            }
        } else if(checking === 2) {
            checking = 0;
            advance()
        }
    }
    return false;
}, !window.opera);