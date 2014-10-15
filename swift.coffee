angular.module("swift", []).
	directive('swModal', ()->
		restrict: 'E'
		transclude: true
		replace: true
		scope : 
			close : '&'
			submit: '&'
			submitTitle: '='
		template : '<div class="modal hide fade">
					  <div class="modal-header">
					    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ng-click="close()">&times;</button>
					    <h3>Modal header</h3>
					  </div>
					  <div class="modal-body" ng-transclude>
					  </div>
					  <div class="modal-footer">
					    <a href="#" class="btn" ng-click="close()">Close</a>
					    <a href="#" class="btn btn-primary" ng-click="submit()">{{submitTitle}}</a>
					  </div>
					</div>'

	).directive('bindHtmlUnsafe', ['$compile', ($compile)->
    ($scope, $element, $attrs )->
        compile = ( newHTML )-> #// Create re-useable compile function
            if newHTML
                newHTML = newHTML.replace(/\n/g,'<br>')
            $element.html('').append(newHTML); #// Clear and append it

        htmlName = $attrs.bindHtmlUnsafe; 
       
        $scope.$watch(htmlName, (newHTML, oldHTML)->
            # return if !newHTML
            compile(newHTML)   #// Compile it
        )
    ]).directive 'editInPlace', () ->
    	# Runs during compile
	    restrict: 'A'
	    require: 'ngModel'
	    scope : {}
	    link: (scope, elm, attrs, ngModelController)->
	    	console.log ngModelController, arguments

