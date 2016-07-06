var app = angular.module('trainApp', ['ngRoute','ngMaterial','ngMessages','duScroll','ngDialog']);

//configure our routes
app.config(function($routeProvider){
	$routeProvider

	//route for the home page
	.when('/', {
			templateUrl : 'pages/pnr-status.html',
			controller  : 'mainController',
			activetab   : 'pnrStatus'
	})

	//route for the train availability page
	.when('/train-availability', {
			templateUrl : 'pages/train-availability.html',
			controller  : 'trainAvailController',
			activetab: 'trainAvailability'
	})

	//route for the train schedule page
	.when('/live-stations', {
			templateUrl : 'pages/live-stations.html',
			controller  : 'liveStationController',
			activetab: 'liveStations'
	})


	//route for the live trains page
	.when('/live-trains', {
			templateUrl : 'pages/live-trains.html',
			controller  : 'trainLiveController',
			activetab: 'liveTrains'
	})
	
	//route for blog home page
	.when('/blog/page/:pageId', {
			templateUrl : 'pages/blog-home.html',
			controller  : 'blogHome',
			activetab: 'blog'
	})
	
	//route for blog single page
	.when('/blog/post/:id', {
			templateUrl : 'pages/blog-post.html',
			controller  : 'blogPost',
			activetab: 'blog'
	})
	
	//route for about us page
	.when('/about-us', {
			templateUrl : 'pages/about-us.html',
			controller  : 'aboutUs',
			activetab: 'aboutUs'
	})

	//route for the train schedule page
	.when('/seat-availablity', {
			templateUrl : 'pages/seat-availability.html',
			controller  : 'seatAvailablityController'
	})
	
	

});

/*function for routing*/
function widgetController($scope, $route) {
    $scope.$route = $route;
}


/*controllers start*/

// create the controller and inject Angular's $scope
//PNR Enquiry Controller
app.controller('mainController', function($scope,$http,$route,$document){
	widgetController($scope, $route);
	$scope.hidePnrResult = true;
	$scope.hideErrorBox = true;
	$scope.hideLoader = true;
	$scope.getPnr = function() {
		//console.log($scope.pnrNo);
		$scope.hidePnrResult = true;
		$scope.hideErrorBox = true;
		$scope.hideLoader = false;
	$http.get("http://api.railwayapi.com/pnr_status/pnr/"+$scope.pnrNo+"/apikey/jyqce1385/").then(function(response) {$scope.details = response.data;}).then(function(){
		//console.log($scope.details.error);
		$scope.hideLoader = true;
		if($scope.details.error){
			$scope.hideErrorBox = false;
			console.log($scope.details.error);	
		}
		else{
			$scope.hidePnrResult = false;
			$scope.toSection3();
		}
	});
	
	};
	
	$scope.toSection3 = function() {
	  $document.scrollTopAnimated(635, 2000).then(function() {
		console && console.log('You just scrolled to the top!');
	  });
	}
});	

//Train Availability Controller
app.controller('trainAvailController', function($scope, $http,$route,$document){
	widgetController($scope, $route);
	$scope.hideTrainAvailResult = true;	
	$scope.hideErrorBox = true;
	$scope.hideLoader = true;

	var fromStation ='',ToStation ='',date ='', month = '', year = '';

	$scope.getTrains = function(){
		date  = $scope.myDate.getDate();
		month = $scope.myDate.getMonth()+1;
		year  = $scope.myDate.getFullYear();
		if(date < 10){
		date = '0'+date;	
		}
		if (month < 10) {
		month = '0'+month;
		};
		//console.log(year);
		$scope.hideTrainAvailResult = true;	
		$scope.hideErrorBox = true;
		$scope.hideLoader = false;
		fromStation = $scope.fromStation;
		ToStation   = $scope.ToStation;
		//date        = $scope.date;	
		$http.get("http://api.railwayapi.com/between/source/"+$scope.fromStation+"/dest/"+$scope.ToStation+"/date/"+date+'-'+month+"/apikey/jyqce1385/").then(function(response){$scope.trains = response.data;}).then(function(){
				$scope.hideLoader = true;
				if($scope.trains.response_code == 204){
					$scope.hideErrorBox = false;
					console.log($scope.trains.error);	
				}
				else{
					$scope.hideTrainAvailResult = false;
					console.log($scope.trains);
					$scope.toSection3();
				}
			});
	};

	var trainBox = angular.element( document.querySelector( '.train-route-box' ) );
	var popupOverlay = angular.element( document.querySelector( '.popup-overlay' ) );
	var body = angular.element( document.querySelector( 'body' ) );
	/*Module for show train route popup*/
	

	$scope.getTrainRoute = function(obj){
	 	console.log(obj);
		var trainNo = obj.target.attributes.trainNo.value;
		console.log(trainNo);
		//alert(obj.target.attributes.trainNo.value);
		$http.get("http://api.railwayapi.com/route/train/"+trainNo+"/apikey/jyqce1385/").then(function(response){$scope.routes = response.data;}).then(function(){
			console.log($scope.routes);
		});

		
		body.addClass('popup-open');
		$scope.hideLoader = false;
		trainBox.addClass('active'); 
	};

	/*module end for train route popup*/

	/*module for seat availability popup*/
	var seatAvailBox = angular.element(document.querySelector('.seat-availability-box'));

	$scope.getSeatAvail = function(obj){
		 var trainNo = obj.target.attributes.trainNo.value;
		 var classCode = obj.target.attributes.classCode.value;
		 var sourceCode = obj.target.attributes.sourceCode.value;
		 var destCode = obj.target.attributes.destCode.value;
		 popupOverlay.removeClass('popupOverlay-hidden');
		 /*console.log(trainNo);	
		 console.log(classCode);
		 console.log(fromStation);
		 console.log(ToStation);
		 console.log(date);	*/
		 $http.get("http://api.railwayapi.com/check_seat/train/"+trainNo+"/source/"+sourceCode+"/dest/"+destCode+"/date/"+date+'-'+month+'-'+year+"/class/"+classCode+"/quota/GN/apikey/jyqce1385/").then(function(response){$scope.seats = response.data;}).then(function(){
		 		console.log($scope.seats);

		 	$http.get("http://api.railwayapi.com/fare/train/"+trainNo+"/source/"+sourceCode+"/dest/"+destCode+"/age/18/quota/GN/doj/"+date+'-'+month+'-'+year+"/apikey/jyqce1385/").then(function(response){
		 		$scope.fares = response.data;}).then(function(){
		 			//console.log($scope.fares);
		 			var fareLength = $scope.fares.fare;
		 			//console.log(fareLength);
		 			for(var i = 0; i<fareLength.length;i++){
		 				//console.log(fareLength[i].fare);
		 				//console.log($scope.seats.class.class_code);
		 				if($scope.seats.class.class_code == fareLength[i].code)
		 				{
		 					$scope.finalFare = fareLength[i].fare; 
		 				}
		 			}
		 			//console.log($scope.finalFare);
		 			popupOverlay.addClass('popupOverlay-hidden');
		 		});
		 });

		body.addClass('popup-open');
		$scope.hideLoader = false;
		seatAvailBox.addClass('active');
	};
	
	$scope.overlayClick = function(){
		trainBox.removeClass('active'); 
		seatAvailBox.removeClass('active');
		body.removeClass('popup-open');
		$scope.hideLoader = true; 
	};

	$scope.myDate = new Date();

  	$scope.minDate = new Date(
      $scope.myDate.getFullYear(),
      $scope.myDate.getMonth(),
      $scope.myDate.getDate());

  	$scope.maxDate = new Date(
      $scope.myDate.getFullYear(),
      $scope.myDate.getMonth() + 4,
      $scope.myDate.getDate());
	  
	  //var resultContainer = angular.element(document.getElementById('resultContainer'));
	  $scope.toSection3 = function() {
		//console.log('kuch to hua hai');
      //$document.scrollToElementAnimated(resultContainer);
	  $document.scrollTopAnimated(650, 2000).then(function() {
        console && console.log('You just scrolled to the top!');
      });
    }
	
	$scope.showStation = function(stationCode){
		if(stationCode.length == 2)
		{
			//console.log(stationCode);
			$http.get("http://api.railwayapi.com/suggest_station/name/"+stationCode+"/apikey/jyqce1385/").then(function(response){$scope.stations = response.data;}).then(function(){
				console.log($scope.stations);
			});
			$scope.hideSuggestedResult = false;
		}
	};
	var setStation = '';

	$scope.setStationCode = function(stationName,setStationCode){
		//setStation = setStationCode;
		//console.log(setStation);
		$scope.stationCode = stationName +' ('+setStationCode+')';
		$scope.hiddenStationCode = setStationCode;
		$scope.hideSuggestedResult = true;
	};	
});


//Live Station Controller
app.controller('liveStationController', function($scope,$http,$route,$document){
	widgetController($scope, $route);
	$scope.hideResultBox = true;
	$scope.hideErrorBox = true;
	$scope.hideLoader = true;
	$scope.hideSuggestedResult = true;
	$scope.getLiveStation = function(){
		
		//console.log($scope.hiddenStationCode);
		$scope.hideResultBox = true;
		$scope.hideErrorBox = true;
		$scope.hideLoader = false;
		$http.get("http://api.railwayapi.com/arrivals/station/"+$scope.hiddenStationCode+"/hours/2/apikey/jyqce1385/").then(function(response){$scope.trains = response.data;}).then(function(){
				$scope.hideLoader = true;
				if($scope.trains.response_code == 200){
					$scope.hideResultBox = false;
					console.log($scope.trains);	
					$scope.toSection3();
				}
				else{
					$scope.hideErrorBox = false;
				}
		});
	};

	var trainBox = angular.element( document.querySelector( '.train-route-box' ) );
	var body = angular.element( document.querySelector( 'body' ) );

	$scope.getTrainRoute = function(obj){
		console.log(obj);
		var trainNo = obj.target.attributes.trainNo.value;
		console.log(trainNo);
		//alert(obj.target.attributes.trainNo.value);
		$http.get("http://api.railwayapi.com/route/train/"+trainNo+"/apikey/jyqce1385/").then(function(response){$scope.routes = response.data;}).then(function(){
			console.log($scope.routes);
		});

		
		body.addClass('popup-open');
		$scope.hideLoader = false;
		trainBox.addClass('active'); 
	};

	$scope.overlayClick = function(){
		body.removeClass('popup-open');
		$scope.hideLoader = true;
		trainBox.removeClass('active'); 
	};

	
	$scope.showStation = function(stationCode){
		if(stationCode.length == 2)
		{
			//console.log(stationCode);
			$http.get("http://api.railwayapi.com/suggest_station/name/"+stationCode+"/apikey/jyqce1385/").then(function(response){$scope.stations = response.data;}).then(function(){
				console.log($scope.stations);
			});
			$scope.hideSuggestedResult = false;
		}
	};
	var setStation = '';

	$scope.setStationCode = function(stationName,setStationCode){
		//setStation = setStationCode;
		//console.log(setStation);
		$scope.stationCode = stationName +' ('+setStationCode+')';
		$scope.hiddenStationCode = setStationCode;
		$scope.hideSuggestedResult = true;
	};	
	
	$scope.toSection3 = function() {
	  $document.scrollTopAnimated(565, 2000).then(function() {
		console && console.log('You just scrolled to the top!');
	  });
	}
	
});


//Live Train Controller
app.controller('trainLiveController', function($scope, $http,$route,$document){
	widgetController($scope, $route);
	$scope.hideResultBox = true;
	$scope.hideErrorBox = true;
	$scope.hideLoader = true;

	var date ='', month = '', year = '';
	$scope.getLiveTrain = function(){
		//console.log('function chala');
		date  = $scope.myDate.getDate();
		month = $scope.myDate.getMonth()+1;
		year  = $scope.myDate.getFullYear();

		if(date < 10){
		date = '0'+date;	
		}
		if (month < 10) {
		month = '0'+month;
		};
		//console.log(year);
		//console.log(month);
		//console.log(date);
		$scope.hideResultBox = true;
		$scope.hideErrorBox = true;
		$scope.hideLoader = false;

		$http.get("http://api.railwayapi.com/live/train/"+$scope.trainCode+"/doj/"+year+month+date+"/apikey/jyqce1385/").then(function(response){$scope.trainStatus = response.data}).then(function(){
			$scope.hideLoader = true;
			if($scope.trainStatus.response_code == 200){
				$scope.hideResultBox = false;
				console.log($scope.trainStatus);
				$scope.toSection3();
			}
			else{
				$scope.hideErrorBox = false;
			}
		});
	};

	$scope.myDate = new Date();

  	$scope.minDate = new Date(
      $scope.myDate.getFullYear(),
      $scope.myDate.getMonth(),
      $scope.myDate.getDate() - 7);

  	$scope.maxDate = new Date(
      $scope.myDate.getFullYear(),
      $scope.myDate.getMonth(),
      $scope.myDate.getDate() + 1 );
	  
	$scope.toSection3 = function() {
		  $document.scrollTopAnimated(635, 2000).then(function() {
			//console && console.log('You just scrolled to the top!');
		  });
	}

});

//controller for blog home
app.controller('blogHome', function($scope, $http,$document,$routeParams){
	var pageId = $routeParams["pageId"];

	var div = document.querySelector('.call-globalloader');
	$scope.elem = angular.element(div).addClass('show-loader');
	$scope.hidePostBox = true;
	
	$http.get('http://localhost/enquiryrailway.in/api/blog-api.php?page='+pageId).
	then(function(response){
		$scope.blogList = response.data;
		//console.log($scope.blogList);
		$scope.hidePostBox = false;
		$scope.elem = angular.element(div).removeClass('show-loader');
	});
	$http.get('http://localhost/enquiryrailway.in/api/popular-posts-api.php').
		then(function(response){
		$scope.popularList = response.data;
		//console.log($scope.popularList);
	});
	
	

});

//controller for blog single
app.controller('blogPost', function($scope,$routeParams,$http,ngDialog){
	var id = $routeParams["id"];
	var div = document.querySelector('.call-globalloader');
	//var overlaydiv = document.querySelector('.overlay');
	$scope.elem = angular.element(div).addClass('show-loader');
	$scope.hidePostBox = true;
	
	//alert(id);
	$http.get('http://localhost/enquiryrailway.in/api/single-post-api.php?post_id='+id).
	then(function(response){
		$scope.postDetails = response.data;
		//console.log($scope.postDetails);

		$http.get('http://localhost/enquiryrailway.in/api/post-comments-api.php?post_id='+id).
		then(function(response){
		$scope.postComments = response.data;
		//console.log($scope.postComments);

		$scope.hidePostBox = false;
		$scope.elem = angular.element(div).removeClass('show-loader');
		});

	});
	
	$http.get('http://localhost/enquiryrailway.in/api/popular-posts-api.php').
		then(function(response){
		$scope.popularList = response.data;
		console.log($scope.popularList);
		
	});

	
	
	$scope.formData = {};
	$scope.joinDiscussion = function(){
		
		//var userData = $scope.formData;
		$scope.formData.id = id;
		// console.log(userData);
		$http({
		method: "POST",
        url: 'http://localhost/enquiryrailway.in/api/comment-submit.php',
        data: $scope.formData,
		headers : {'Content-Type': 'application/x-www-form-urlencoded'}
		})
		.then(function(response) {
				$scope.msg = response.data;
				console.log($scope.msg);
				ngDialog.open({
	    		template: '<h3>Thanks!!</h3><p>Your Comment has been submitted successfully for approvel</p>',
	    		plain: true
				});
				document.getElementById("discussion-form").reset();
		});
		//event.preventDefault();
	};

});

//controller for about us
app.controller('aboutUs', function($scope){
	
});
//jyqce1385 Bkup Apikey
//dqqtt3669 Bkup Apikey
//jyqce1385 Bkup Apikey