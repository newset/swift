// Generated by CoffeeScript 1.8.0
angular.module("swift", []).directive('swModal', function() {
  return {
    restrict: 'E',
    transclude: true,
    replace: true,
    scope: {
      close: '&',
      submit: '&',
      submitTitle: '='
    },
    template: '<div class="modal hide fade"> <div class="modal-header"> <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ng-click="close()">&times;</button> <h3>Modal header</h3> </div> <div class="modal-body" ng-transclude> </div> <div class="modal-footer"> <a href="#" class="btn" ng-click="close()">Close</a> <a href="#" class="btn btn-primary" ng-click="submit()">{{submitTitle}}</a> </div> </div>'
  };
}).directive('bindHtmlUnsafe', [
  '$compile', function($compile) {
    return function($scope, $element, $attrs) {
      var compile, htmlName;
      compile = function(newHTML) {
        if (newHTML) {
          newHTML = newHTML.replace(/\n/g, '<br>');
        }
        return $element.html('').append(newHTML);
      };
      htmlName = $attrs.bindHtmlUnsafe;
      return $scope.$watch(htmlName, function(newHTML, oldHTML) {
        return compile(newHTML);
      });
    };
  }
]).directive('editInPlace', function() {
  return {
    restrict: 'A',
    require: 'ngModel',
    scope: {},
    link: function(scope, elm, attrs, ngModelController) {
      return console.log(ngModelController, arguments);
    }
  };
});
