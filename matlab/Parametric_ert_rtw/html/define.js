function CodeDefine() { 
this.def = new Array();
this.def["rt_OneStep"] = {file: "ert_main_c.html",line:35,type:"fcn"};
this.def["main"] = {file: "ert_main_c.html",line:72,type:"fcn"};
this.def["rtX"] = {file: "Parametric_c.html",line:38,type:"var"};
this.def["rtPeriodicIndX"] = {file: "Parametric_c.html",line:41,type:"var"};
this.def["rtPeriodicRngX"] = {file: "Parametric_c.html",line:42,type:"var"};
this.def["rtU"] = {file: "Parametric_c.html",line:45,type:"var"};
this.def["rtY"] = {file: "Parametric_c.html",line:48,type:"var"};
this.def["rtM_"] = {file: "Parametric_c.html",line:51,type:"var"};
this.def["rtM"] = {file: "Parametric_c.html",line:52,type:"var"};
this.def["local_stateReduction"] = {file: "Parametric_c.html",line:58,type:"fcn"};
this.def["rt_ertODEUpdateContinuousStates"] = {file: "Parametric_c.html",line:77,type:"fcn"};
this.def["Parametric_step"] = {file: "Parametric_c.html",line:157,type:"fcn"};
this.def["Parametric_derivatives"] = {file: "Parametric_c.html",line:222,type:"fcn"};
this.def["Parametric_initialize"] = {file: "Parametric_c.html",line:234,type:"fcn"};
this.def["RT_MODEL"] = {file: "Parametric_h.html",line:55,type:"type"};
this.def["X"] = {file: "Parametric_h.html",line:60,type:"type"};
this.def["]"] = {file: "Parametric_h.html",line:63,type:"type"};
this.def["]"] = {file: "Parametric_h.html",line:64,type:"type"};
this.def["XDot"] = {file: "Parametric_h.html",line:69,type:"type"};
this.def["XDis"] = {file: "Parametric_h.html",line:74,type:"type"};
this.def["ODE3_IntgData"] = {file: "Parametric_h.html",line:83,type:"type"};
this.def["ExtU"] = {file: "Parametric_h.html",line:91,type:"type"};
this.def["ExtY"] = {file: "Parametric_h.html",line:98,type:"type"};
this.def["int8_T"] = {file: "rtwtypes_h.html",line:49,type:"type"};
this.def["uint8_T"] = {file: "rtwtypes_h.html",line:50,type:"type"};
this.def["int16_T"] = {file: "rtwtypes_h.html",line:51,type:"type"};
this.def["uint16_T"] = {file: "rtwtypes_h.html",line:52,type:"type"};
this.def["int32_T"] = {file: "rtwtypes_h.html",line:53,type:"type"};
this.def["uint32_T"] = {file: "rtwtypes_h.html",line:54,type:"type"};
this.def["int64_T"] = {file: "rtwtypes_h.html",line:55,type:"type"};
this.def["uint64_T"] = {file: "rtwtypes_h.html",line:56,type:"type"};
this.def["real32_T"] = {file: "rtwtypes_h.html",line:57,type:"type"};
this.def["real64_T"] = {file: "rtwtypes_h.html",line:58,type:"type"};
this.def["real_T"] = {file: "rtwtypes_h.html",line:64,type:"type"};
this.def["time_T"] = {file: "rtwtypes_h.html",line:65,type:"type"};
this.def["boolean_T"] = {file: "rtwtypes_h.html",line:66,type:"type"};
this.def["int_T"] = {file: "rtwtypes_h.html",line:67,type:"type"};
this.def["uint_T"] = {file: "rtwtypes_h.html",line:68,type:"type"};
this.def["ulong_T"] = {file: "rtwtypes_h.html",line:69,type:"type"};
this.def["char_T"] = {file: "rtwtypes_h.html",line:70,type:"type"};
this.def["uchar_T"] = {file: "rtwtypes_h.html",line:71,type:"type"};
this.def["byte_T"] = {file: "rtwtypes_h.html",line:72,type:"type"};
this.def["creal32_T"] = {file: "rtwtypes_h.html",line:82,type:"type"};
this.def["creal64_T"] = {file: "rtwtypes_h.html",line:87,type:"type"};
this.def["creal_T"] = {file: "rtwtypes_h.html",line:92,type:"type"};
this.def["cint8_T"] = {file: "rtwtypes_h.html",line:99,type:"type"};
this.def["cuint8_T"] = {file: "rtwtypes_h.html",line:106,type:"type"};
this.def["cint16_T"] = {file: "rtwtypes_h.html",line:113,type:"type"};
this.def["cuint16_T"] = {file: "rtwtypes_h.html",line:120,type:"type"};
this.def["cint32_T"] = {file: "rtwtypes_h.html",line:127,type:"type"};
this.def["cuint32_T"] = {file: "rtwtypes_h.html",line:134,type:"type"};
this.def["cint64_T"] = {file: "rtwtypes_h.html",line:141,type:"type"};
this.def["cuint64_T"] = {file: "rtwtypes_h.html",line:148,type:"type"};
this.def["pointer_T"] = {file: "rtwtypes_h.html",line:169,type:"type"};
}
CodeDefine.instance = new CodeDefine();
var testHarnessInfo = {OwnerFileName: "", HarnessOwner: "", HarnessName: "", IsTestHarness: "0"};
var relPathToBuildDir = "../ert_main.c";
var fileSep = "\\";
var isPC = true;
function Html2SrcLink() {
	this.html2SrcPath = new Array;
	this.html2Root = new Array;
	this.html2SrcPath["ert_main_c.html"] = "../ert_main.c";
	this.html2Root["ert_main_c.html"] = "ert_main_c.html";
	this.html2SrcPath["Parametric_c.html"] = "../Parametric.c";
	this.html2Root["Parametric_c.html"] = "Parametric_c.html";
	this.html2SrcPath["Parametric_h.html"] = "../Parametric.h";
	this.html2Root["Parametric_h.html"] = "Parametric_h.html";
	this.html2SrcPath["rtwtypes_h.html"] = "../rtwtypes.h";
	this.html2Root["rtwtypes_h.html"] = "rtwtypes_h.html";
	this.getLink2Src = function (htmlFileName) {
		 if (this.html2SrcPath[htmlFileName])
			 return this.html2SrcPath[htmlFileName];
		 else
			 return null;
	}
	this.getLinkFromRoot = function (htmlFileName) {
		 if (this.html2Root[htmlFileName])
			 return this.html2Root[htmlFileName];
		 else
			 return null;
	}
}
Html2SrcLink.instance = new Html2SrcLink();
var fileList = [
"ert_main_c.html","Parametric_c.html","Parametric_h.html","rtwtypes_h.html"];
