/* Set the defaults for DataTables initialisation */
$.extend( true, $.fn.dataTable.defaults, {
	"sDom":
		"<'row space5'<'col-sm-6 col-xs-12'l><'col-sm-6 col-xs-12'f>r>"+
		"t"+
		"<'row'<'col-xs-12 col-sm-4'i><'col-xs-12 col-sm-8'p>>",
	"oLanguage": {
		"sLengthMenu": "Shows: "
	}
} );


/* Default class modification */
$.extend( $.fn.dataTableExt.oStdClasses, {
	"sWrapper": "dataTables_wrapper form-inline",
	"sFilterInput": "form-control",
	"sLengthSelect": "form-control"
} );

// In 1.10 we use the pagination renderers to draw the Bootstrap paging,
// rather than  custom plug-in
if ( $.fn.dataTable.Api ) {
	$.fn.dataTable.defaults.renderer = 'bootstrap';
	$.fn.dataTable.ext.renderer.pageButton.bootstrap = function ( settings, host, idx, buttons, page, pages ) {
		var api = new $.fn.dataTable.Api( settings );
		var classes = settings.oClasses;
		var lang = settings.oLanguage.oPaginate;
		var btnDisplay, btnClass;

		var attach = function( container, buttons ) {
			var i, ien, node, button;
			var clickHandler = function ( e ) {
				e.preventDefault();
				if ( e.data.action !== 'ellipsis' ) {
					api.page( e.data.action ).draw( false );
				}
			};

			for ( i=0, ien=buttons.length ; i<ien ; i++ ) {
				button = buttons[i];

				if ( $.isArray( button ) ) {
					attach( container, button );
				}
				else {
					btnDisplay = '';
					btnClass = '';

					switch ( button ) {
						case 'ellipsis':
							btnDisplay = '&hellip;';
							btnClass = 'disabled';
							break;

						case 'first':
							btnDisplay = lang.sFirst;
							btnClass = button + (page > 0 ?
								'' : ' disabled');
							break;

						case 'previous':
							btnDisplay = lang.sPrevious;
							btnClass = button + (page > 0 ?
								'' : ' disabled');
							break;

						case 'next':
							btnDisplay = lang.sNext;
							btnClass = button + (page < pages-1 ?
								'' : ' disabled');
							break;

						case 'last':
							btnDisplay = lang.sLast;
							btnClass = button + (page < pages-1 ?
								'' : ' disabled');
							break;

						default:
							btnDisplay = button + 1;
							btnClass = page === button ?
								'active' : '';
							break;
					}

					if ( btnDisplay ) {
						node = $('<li>', {
								'class': classes.sPageButton+' '+btnClass,
								'aria-controls': settings.sTableId,
								'tabindex': settings.iTabIndex,
								'id': idx === 0 && typeof button === 'string' ?
									settings.sTableId +'_'+ button :
									null
							} )
							.append( $('<a>', {
									'href': '#'
								} )
								.html( btnDisplay )
							)
							.appendTo( container );

						settings.oApi._fnBindAction(
							node, {action: button}, clickHandler
						);
					}
				}
			}
		};

		attach(
			$(host).empty().html('<ul class="pagination"/>').children('ul'),
			buttons
		);
	}
}
else {
	// Integration for 1.9-
	$.fn.dataTable.defaults.sPaginationType = 'bootstrap';

	/* API method to get paging information */
	$.fn.dataTableExt.oApi.fnPagingInfo = function ( oSettings )
	{
		return {
			"iStart":         oSettings._iDisplayStart,
			"iEnd":           oSettings.fnDisplayEnd(),
			"iLength":        oSettings._iDisplayLength,
			"iTotal":         oSettings.fnRecordsTotal(),
			"iFilteredTotal": oSettings.fnRecordsDisplay(),
			"iPage":          oSettings._iDisplayLength === -1 ?
				0 : Math.ceil( oSettings._iDisplayStart / oSettings._iDisplayLength ),
			"iTotalPages":    oSettings._iDisplayLength === -1 ?
				0 : Math.ceil( oSettings.fnRecordsDisplay() / oSettings._iDisplayLength )
		};
	};

	/* Bootstrap style pagination control */
	$.extend( $.fn.dataTableExt.oPagination, {
	    "bootstrap": {
	        "fnInit": function( oSettings, nPaging, fnDraw ) {
	            var oLang = oSettings.oLanguage.oPaginate;
	            var fnClickHandler = function ( e ) {
	                e.preventDefault();
	                if ( oSettings.oApi._fnPageChange(oSettings, e.data.action) ) {
	                    fnDraw( oSettings );
	                }
	            };
	  
	            $(nPaging).addClass('pagination').append(
	                '<ul class="pagination">' +
	                    '<li class="prev disabled"><a href="#">' + oLang.sFirst + '</a></li>' +
	                    '<li class="prev disabled"><a href="#">'+oLang.sPrevious+'</a></li>'+
	                    '<li class="next disabled"><a href="#">' + oLang.sNext + '</a></li>' +
	                    '<li class="next disabled"><a href="#">' + oLang.sLast + '</a></li>' +
	                '</ul>'
	            );
	            var els = $('a', nPaging);
	            $(els[0]).bind('click.DT', { action: "first" }, fnClickHandler);
	            $(els[1]).bind( 'click.DT', { action: "previous" }, fnClickHandler );
	            $(els[2]).bind('click.DT', { action: "next" }, fnClickHandler);
	            $(els[3]).bind('click.DT', { action: "last" }, fnClickHandler);
	        },
	  
	        "fnUpdate": function ( oSettings, fnDraw ) {
	            var iListLength = 5;
	            var oPaging = oSettings.oInstance.fnPagingInfo();
	            var an = oSettings.aanFeatures.p;
	            var i, j, sClass, iStart, iEnd, iHalf=Math.floor(iListLength/2);
	  
	            if ( oPaging.iTotalPages < iListLength) {
	                iStart = 1;
	                iEnd = oPaging.iTotalPages;
	            }
	            else if ( oPaging.iPage <= iHalf ) {
	                iStart = 1;
	                iEnd = iListLength;
	            } else if ( oPaging.iPage >= (oPaging.iTotalPages-iHalf) ) {
	                iStart = oPaging.iTotalPages - iListLength + 1;
	                iEnd = oPaging.iTotalPages;
	            } else {
	                iStart = oPaging.iPage - iHalf + 1;
	                iEnd = iStart + iListLength - 1;
	            }
	  
	            for ( i=0, iLen=an.length ; i<iLen ; i++ ) {
	                // Remove the middle elements
	                $('li:gt(1)', an[i]).filter(':not(.next)').remove();
	  
	                // Add the new list items and their event handlers
	                for ( j=iStart ; j<=iEnd ; j++ ) {
	                    sClass = (j==oPaging.iPage+1) ? 'class="active"' : '';
	                    $('<li '+sClass+'><a href="#">'+j+'</a></li>')
	                        .insertBefore( $('li.next:first', an[i])[0] )
	                        .bind('click', function (e) {
	                            e.preventDefault();
	                            oSettings._iDisplayStart = (parseInt($('a', this).text(),10)-1) * oPaging.iLength;
	                            fnDraw( oSettings );
	                        } );
	                }
	  
	                // Add / remove disabled classes from the static elements
	                if ( oPaging.iPage === 0 ) {
	                    $('li.prev', an[i]).addClass('disabled');
	                } else {
	                    $('li.prev', an[i]).removeClass('disabled');
	                }
	  
	                if ( oPaging.iPage === oPaging.iTotalPages-1 || oPaging.iTotalPages === 0 ) {
	                    $('li.next', an[i]).addClass('disabled');
	                } else {
	                    $('li.next', an[i]).removeClass('disabled');
	                }
	            }
	        }
	    }
	} );
}


/*
 * TableTools Bootstrap compatibility
 * Required TableTools 2.1+
 */
if ( $.fn.DataTable.TableTools ) {
	// Set the classes that TableTools uses to something suitable for Bootstrap
	$.extend( true, $.fn.DataTable.TableTools.classes, {
		"container": "DTTT btn-group",
		"buttons": {
			"normal": "btn btn-default",
			"disabled": "disabled"
		},
		"collection": {
			"container": "DTTT_dropdown dropdown-menu",
			"buttons": {
				"normal": "",
				"disabled": "disabled"
			}
		},
		"print": {
			"info": "DTTT_print_info modal"
		},
		"select": {
			"row": "active"
		}
	} );

	// Have the collection use a bootstrap compatible dropdown
	$.extend( true, $.fn.DataTable.TableTools.DEFAULTS.oTags, {
		"collection": {
			"container": "ul",
			"button": "li",
			"liner": "a"
		}
	} );
}

