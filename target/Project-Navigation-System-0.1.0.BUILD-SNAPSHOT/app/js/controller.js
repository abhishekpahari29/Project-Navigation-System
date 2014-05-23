'use strict';

/* Controllers */

var Controllers = angular.module('ProjControllers', [ 'ngAnimate' ]);
var ar, projectDetails, projectPackage;

Controllers.controller('NewProjectController', [ '$scope', '$location',
		'$http', function($scope, $location, $http) {

			$scope.Records = {};
			$scope.insertProject = function() {
				$http({
					method : 'POST',
					url : '../projects',
					headers : {
						'content-type' : 'application/json'
					},
					data : $scope.Record
				}).success(function(data, status, headers, config) {
					alert("Data successfully inserted!");
					$location.path('/home');
				});
			};
		}

]);

Controllers.controller('allProjectController', [ '$scope', 'Record',
		function($scope, Record) {
			$scope.projects = Record.query();

		} ]);

Controllers.controller('openProjectController', [
		'$scope',

		'$http',
		'$location',
		'$routeParams',
		function($scope, $http, $location, $routeParams) {

			var projectUrl1 = "../projects/" + $routeParams.id;
			$http.get(projectUrl1).then(function(response) {
				if (response.data != null) {
					$scope.projectopen = response.data;
					// console.log(response.data);
				}
			});

			var projectUrl = "../packagedetailses?find=ByProjectId&projectId="
					+ $routeParams.id;
			$http.get(projectUrl).then(function(response) {
				if (response.data != null) {
					$scope.packageDetails = response.data;
					// console.log(response.data);
				}
			});

		} ]);

Controllers.controller('openPackageController', [
		'$scope',

		'$http',
		'$location',
		'$routeParams',
		function($scope, $http, $location, $routeParams) {

			var packageUrl1 = "../packagedetailses/" + $routeParams.id;
			$http.get(packageUrl1).then(function(response) {
				if (response.data != null) {
					$scope.packageopen = response.data;
					// console.log(response.data);
				}
			});

			var packageUrl = "../classdetailses?find=ByPackageId&packageId="
					+ $routeParams.id;
			$http.get(packageUrl).then(function(response) {
				if (response.data != null) {
					$scope.classDetails = response.data;
					// console.log(response.data);
				}
			});

		} ]);

Controllers.controller('openMethodController', [
		'$scope',

		'$http',
		'$location',
		'$routeParams',
		function($scope, $http, $location, $routeParams) {

			var methodUrl1 = "../classdetailses/" + $routeParams.id;
			$http.get(methodUrl1).then(function(response) {
				if (response.data != null) {
					$scope.classopen = response.data;
					// console.log(response.data);
				}
			});

			var methodUrl = "../methoddetails?find=ByClassId&classId="
					+ $routeParams.id;
			$http.get(methodUrl).then(function(response) {
				if (response.data != null) {
					$scope.methodDetails = response.data;
					// console.log(response.data);
				}
			});

		} ]);

Controllers
		.controller(
				'openMethodDetailController',
				[
						'$scope',

						'$http',
						'$location',
						'$routeParams',
						function($scope, $http, $location, $routeParams) {

							$http
									.get("../methoddetails/" + $routeParams.id)
									.then(
											function(response) {
												$scope.method = response.data;

												$http
														.get(
																"../classdetailses/"
																		+ $scope.method.classId.id)
														.then(
																function(respo) {
																	$scope.classs = respo.data;

																	$http
																			.get(
																					"../packagedetailses/"
																							+ $scope.classs.packageId.id)

																			.then(
																					function(
																							response2) {

																						$scope.pckName = response2.data;

																					});

																});

											});

							var methodDetailUrl1 = "../methodarglists?find=ByMethodId&methodId="
									+ $routeParams.id;
							$http
									.get(methodDetailUrl1)
									.then(
											function(response) {
												if (response.data != null) {
													$scope.methodDetails = response.data;
													// console.log(response.data);
												}

											});

						} ]);

Controllers.controller('NewClassController', [ '$scope', '$location', '$http',
		function($scope, $location, $http) {

			$scope.ClassRecords = {};
			$scope.insertClass = function() {
				$http({
					method : 'POST',
					url : '../classdetailses',
					headers : {
						'content-type' : 'application/json'
					},
					data : $scope.ClassRecords
				}).success(function(data, status, headers, config) {
					alert("Data successfully inserted!");
					$location.path('/openProjectContent');
				});
			};
		} ]);

Controllers.controller('NewPackageCtrl', [ '$scope', '$location', '$http',
		'Record', function($scope, $location, $http, Record) {

			$scope.proj = Record.query();

			$scope.rec = {};
			$scope.insertPackage = function() {

				$http({
					method : 'POST',
					url : '../packagedetailses',
					headers : {
						'content-type' : 'application/json'
					},
					data : $scope.rec
				}).success(function(data, status, headers, config) {

					// $location.path('/allprojects');
				});

			};
		}

]);

Controllers
		.controller(
				'networkDiagramController',
				[
						'$scope',
						'$location',
						'$http',
						function($scope, $location, $http) {

							var margin = {
								top : 0,
								right : 0,
								bottom : 0,
								left : 10
							}, width = 960 - margin.right - margin.left, height = 500
									- margin.top - margin.bottom;

							var i = 0, duration = 750, root;

							var tree = d3.layout.tree().size([ height, width ]);

							var diagonal = d3.svg.diagonal().projection(
									function(d) {
										return [ d.y, d.x ];
									});

							var svg = d3
									.select("#networkDiagram")
									.append("svg")
									.attr("id", "chart")
									.attr("width",
											width + margin.right + margin.left)
									.attr("height",
											height + margin.top + margin.bottom)
									.attr("viewBox", "0 0 960 500").attr(
											"preserveAspectRatio", "xMidYMid")
									.append("g").attr(
											"transform",
											"translate(" + margin.left + ","
													+ margin.top + ")");

							var chart = $("#chart"), aspect = chart.width()
									/ chart.height(), container = chart
									.parent();
							$(window).on(
									"resize",
									function() {
										var targetWidth = container.width();
										chart.attr("width", targetWidth);
										chart.attr("height", Math
												.round(targetWidth / aspect));
									}).trigger("resize");
							// var data;

							
							
							
							
							
							
							
							
							
							var project = "../projects/39";
							$http
									.get(project)
									.then(
											function(response) {
												if (response.data != null) {
													projName = response.data;
													// console.log(response.data);
												}

											});

							var JSONobj = {name : };
							
							
							
							
							
							
							
							d3.json("./lib/flare.json", function(error, flare) {

								// data=flare;

								// flare.forEach(function(d){alert(d.projectName);});

								root = flare;

								root.x0 = height / 2;
								root.y0 = 0;

								function collapse(d) {

									if (d.children) {
										d._children = d.children;
										d._children.forEach(collapse);
										d.children = null;
									}
								}

								root.children.forEach(collapse);
								update(root);
							});

							d3
									.select(
											document
													.getElementById("networkDiagram"))
									.style("height", "0px");

							function update(source) {

								// Compute the new tree layout.
								var nodes = tree.nodes(root).reverse(), links = tree
										.links(nodes);

								// Normalize for fixed-depth.
								nodes.forEach(function(d) {
									d.y = d.depth * 180;
								});

								// Update the nodes…
								var node = svg.selectAll("g.node").data(nodes,
										function(d) {
											return d.id || (d.id = ++i);
										});

								// Enter any new nodes at the parent's previous
								// position.
								var nodeEnter = node.enter().append("g").attr(
										"class", "node").attr(
										"transform",
										function(d) {
											return "translate(" + source.y0
													+ "," + source.x0 + ")";
										}).on("click", click);

								nodeEnter
										.append("circle")
										.attr("r", 1e-6)
										.style(
												"fill",
												function(d) {
													return d._children ? "lightsteelblue"
															: "#fff";
												});

								nodeEnter
										.append("text")
										.attr(
												"x",
												function(d) {
													return d.children
															|| d._children ? -10
															: 10;
												})
										.attr("dy", ".35em")
										.attr(
												"text-anchor",
												function(d) {
													return d.children
															|| d._children ? "end"
															: "start";
												}).text(function(d) {
											return d.name;
										}).style("fill-opacity", 1e-6);

								// Transition nodes to their new position.
								var nodeUpdate = node.transition().duration(
										duration).attr(
										"transform",
										function(d) {
											return "translate(" + d.y + ","
													+ d.x + ")";
										});

								nodeUpdate
										.select("circle")
										.attr("r", 8)
										.style(
												"fill",
												function(d) {
													return d._children ? "lightsteelblue"
															: "#fff";
												});

								nodeUpdate.select("text").style("fill-opacity",
										1);

								// Transition exiting nodes to the parent's new
								// position.
								var nodeExit = node.exit().transition()
										.duration(duration).attr(
												"transform",
												function(d) {
													return "translate("
															+ source.y + ","
															+ source.x + ")";
												}).remove();

								nodeExit.select("circle").attr("r", 1e-6);

								nodeExit.select("text").style("fill-opacity",
										1e-6);

								// Update the links…
								var link = svg.selectAll("path.link").data(
										links, function(d) {
											return d.target.id;
										});

								// Enter any new links at the parent's previous
								// position.
								link.enter().insert("path", "g").attr("class",
										"link").attr("d", function(d) {
									var o = {
										x : source.x0,
										y : source.y0
									};
									return diagonal({
										source : o,
										target : o
									});
								});

								// Transition links to their new position.
								link.transition().duration(duration).attr("d",
										diagonal);

								// Transition exiting nodes to the parent's new
								// position.
								link.exit().transition().duration(duration)
										.attr("d", function(d) {
											var o = {
												x : source.x,
												y : source.y
											};
											return diagonal({
												source : o,
												target : o
											});
										}).remove();

								// Stash the old positions for transition.
								nodes.forEach(function(d) {
									d.x0 = d.x;
									d.y0 = d.y;
								});
							}

							// Toggle children on click.
							function click(d) {
								if (d.children) {
									d._children = d.children;
									d.children = null;
								} else {
									d.children = d._children;
									d._children = null;
								}
								update(d);
							}

						} ]);
