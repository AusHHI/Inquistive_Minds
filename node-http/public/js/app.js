'use strict';

angular.module("quoraApp",[])
.controller('SignUpFormController',['$scope',function($scope){
    $scope.testVariable = "INQUISTIVE_MINDS";
    $scope.userRegex ='[a-zA-Z]{8,}';
    $scope.userRegex='[a-zA-Z0-9]{8,}';
	
	$scope.submitSignUp = function(){
		console.log($scope.user);
	};
}]).controller('SignInFormController',['$scope',function($scope){
    $scope.testVariable = "INQUISTIVE_MINDS";

    $scope.register = function (){
      console.log($scope.user);
    };
}]).controller('ContactController',['$scope',function($scope){
		$scope.feedback = {mychannel:"", username:"", agree:false,email:""};
		var channels=[{value:"tel",label:"tel."},{value:"email",label:"email"}];
		$scope.channels = channels;
		$scope.invalidChannelSelection = false;
	}
]).controller('FeedbackController',['$scope',function($scope){
 	  $scope.sendFeedback = function(){
			console.log($scope.feedback);
			if($scope.feedback.agree && ($scope.feedback.mychannel=="")&& !$scope.feedback.mychannel){
				 $scope.invalidChannelSelection = true;
				 cosole.log('incorrect');
			}
			else{
				 $scope.invalidChannelSelection = false;
				 $scope.feedback = {mychannel:"",username:"",agree:false,email:""};
				 $scope.feedback.mychannel="";
				 $scope.feedbackForm.$setPristine();
				 console.log($scope.feedback);
			}
		};
	}
]);
