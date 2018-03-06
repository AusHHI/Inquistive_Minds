

quora.controller('ContactController',['$scope',function($scope){

		$scope.feedback = {mychannel:"", username:"", agree:false,email:""};
		var channels=[{value:"tel",label:"tel."},{value:"email",label:"email"}];
		$scope.channels = channels;
		$scope.invalidChannelSelection = false;
	}
]);
quora.controller('FeedbackController',['$scope',function($scope){
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
