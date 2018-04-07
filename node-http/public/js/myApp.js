var quora= angular.module("quoraApp",[]);

quora.controller('SignUpFormController',['$scope',function($scope){
    $scope.testVariable = "INQUISTIVE_MINDS";
    $scope.userRegex ='[a-zA-Z]{8,}';
    $scope.userRegex='[a-zA-Z0-9]{8,}';

    $scope.submitSignUp = function (user){
      console.log(user);
    };

}]);

quora.controller('SignInFormController',['$scope',function($scope){
    $scope.testVariable = "INQUISTIVE_MINDS";

    $scope.register = function (user){
      console.log(user);
    };

}]);

quora.controller('ProfileController',['$scope',function($scope){
	$scope.profileSubmit = function(user){
		console.log(user);
	}
}]);
