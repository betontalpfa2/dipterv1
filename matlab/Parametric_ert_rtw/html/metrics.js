function CodeMetrics() {
	 this.metricsArray = {};
	 this.metricsArray.var = new Array();
	 this.metricsArray.fcn = new Array();
	 this.metricsArray.var["rtM_"] = {file: "C:\\Users\\ebenera\\bme\\2016_17_osz\\dipterv1\\matlab\\Parametric_ert_rtw\\Parametric.c",
	size: 489};
	 this.metricsArray.var["rtPeriodicIndX"] = {file: "C:\\Users\\ebenera\\bme\\2016_17_osz\\dipterv1\\matlab\\Parametric_ert_rtw\\Parametric.c",
	size: 4};
	 this.metricsArray.var["rtPeriodicRngX"] = {file: "C:\\Users\\ebenera\\bme\\2016_17_osz\\dipterv1\\matlab\\Parametric_ert_rtw\\Parametric.c",
	size: 16};
	 this.metricsArray.var["rtU"] = {file: "C:\\Users\\ebenera\\bme\\2016_17_osz\\dipterv1\\matlab\\Parametric_ert_rtw\\Parametric.c",
	size: 16};
	 this.metricsArray.var["rtX"] = {file: "C:\\Users\\ebenera\\bme\\2016_17_osz\\dipterv1\\matlab\\Parametric_ert_rtw\\Parametric.c",
	size: 8};
	 this.metricsArray.var["rtY"] = {file: "C:\\Users\\ebenera\\bme\\2016_17_osz\\dipterv1\\matlab\\Parametric_ert_rtw\\Parametric.c",
	size: 24};
	 this.metricsArray.fcn["Parametric.c:rt_ertODEUpdateContinuousStates"] = {file: "C:\\Users\\ebenera\\bme\\2016_17_osz\\dipterv1\\matlab\\Parametric_ert_rtw\\Parametric.c",
	stack: 200,
	stackTotal: -1};
	 this.metricsArray.fcn["Parametric_derivatives"] = {file: "C:\\Users\\ebenera\\bme\\2016_17_osz\\dipterv1\\matlab\\Parametric_ert_rtw\\Parametric.c",
	stack: 8,
	stackTotal: 8};
	 this.metricsArray.fcn["Parametric_initialize"] = {file: "C:\\Users\\ebenera\\bme\\2016_17_osz\\dipterv1\\matlab\\Parametric_ert_rtw\\Parametric.c",
	stack: 20,
	stackTotal: 20};
	 this.metricsArray.fcn["Parametric_step"] = {file: "C:\\Users\\ebenera\\bme\\2016_17_osz\\dipterv1\\matlab\\Parametric_ert_rtw\\Parametric.c",
	stack: 0,
	stackTotal: -1};
	 this.metricsArray.fcn["floor"] = {file: "C:\\Program Files\\MATLAB\\R2016a\\sys\\lcc\\include\\math.h",
	stack: 0,
	stackTotal: 0};
	 this.metricsArray.fcn["local_stateReduction"] = {file: "C:\\Users\\ebenera\\bme\\2016_17_osz\\dipterv1\\matlab\\Parametric_ert_rtw\\Parametric.c",
	stack: 40,
	stackTotal: 40};
	 this.metricsArray.fcn["memcpy"] = {file: "C:\\Program Files\\MATLAB\\R2016a\\sys\\lcc\\include\\string.h",
	stack: 0,
	stackTotal: 0};
	 this.metricsArray.fcn["sin"] = {file: "C:\\Program Files\\MATLAB\\R2016a\\sys\\lcc\\include\\math.h",
	stack: 0,
	stackTotal: 0};
	 this.getMetrics = function(token) { 
		 var data;
		 data = this.metricsArray.var[token];
		 if (!data) {
			 data = this.metricsArray.fcn[token];
			 if (data) data.type = "fcn";
		 } else { 
			 data.type = "var";
		 }
	 return data;}
}
	 CodeMetrics.instance = new CodeMetrics();
