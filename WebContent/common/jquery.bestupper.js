/*
 * Copyright (c) 2009 Mustafa OZCAN (http://www.mustafaozcan.net) Dual licensed
 * under the MIT (http://www.opensource.org/licenses/mit-license.php) and GPL
 * (http://www.opensource.org/licenses/gpl-license.php) licenses. Version: 1.0
 * Requires: jquery.1.2.6+
 * Adaptado por: Luiz Romero Machado
 */
(function($) {
	$.fn.bestupper = function(settings) {
		var defaults = {
			restrito : true,
			clear : true,
			semPontuacao : false
		}, settings = $.extend({}, defaults, settings);
		this.each(function() {
			var $this = $(this);
			if ($this.is('textarea') || $this.is('input:text')) {
				$this.keypress(function(e) {
					var keycode = e.charCode == undefined
							? e.keyCode
							: e.charCode;
					var str = String.fromCharCode(keycode);

					if ((settings.restrito)
							&& !((isPermitido(e.keyCode) || isPermitido(e.which))
									|| (48 <= keycode && keycode <= 48 + 10)
									|| (65 <= keycode && keycode <= 65 + 25) 
									|| (97 <= keycode && keycode <= 97 + 25)))
						e.preventDefault();

					if ((97 <= keycode && keycode <= 97 + 25)) {
						if (this.createTextRange) {
							window.event.keyCode = str.toUpperCase()
									.charCodeAt(0);
							return;
						} else {
							var startpos = this.selectionStart;
							var endpos = this.selectionEnd;
							this.value = this.value.substr(0, startpos)
									+ str.toUpperCase()
									+ this.value.substr(endpos);
							this.setSelectionRange(startpos + 1, startpos + 1);
							return false;
						}
					}
				});
				$this.blur(function(e) {
					if (settings.clear) {
								this.value = this.value.replace(/^\s+|\s+$/g,
										"").replace(/\s{2,}/g, " ")
										.toUpperCase();
					}
					if (settings.semPontuacao) {
								this.value = this.value.replace(/[\b.,;:]+/g,
										"");
					}
				});
			}
		});
	};

	function isPermitido(key) {
		var pchar = [8, 9, 17, 32, 35, 36, 37, 39, 46, 116, 45, 64];
		for (var i = 0; i < pchar.length; i++) {
			if (pchar[i] == key)
				return true;
		}
		return false;
	}
})(jQuery);
