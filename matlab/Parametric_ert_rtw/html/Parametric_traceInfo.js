function RTW_Sid2UrlHash() {
	this.urlHashMap = new Array();
	/* <S1>/Constant1 */
	this.urlHashMap["SCIM_3different_simple_dive:368"] = "Parametric.c:179";
	/* <S1>/Constant2 */
	this.urlHashMap["SCIM_3different_simple_dive:369"] = "Parametric.c:189";
	/* <S1>/Constant3 */
	this.urlHashMap["SCIM_3different_simple_dive:376"] = "msg=rtwMsg_CodeGenerationReducedBlock&block=SCIM_3different_simple_dive:376";
	/* <S1>/Integrator */
	this.urlHashMap["SCIM_3different_simple_dive:370"] = "Parametric.c:172,181,191,227,269&Parametric.h:59,68,73";
	/* <S1>/Product */
	this.urlHashMap["SCIM_3different_simple_dive:379"] = "Parametric.c:173";
	/* <S1>/Product1 */
	this.urlHashMap["SCIM_3different_simple_dive:380"] = "Parametric.c:182";
	/* <S1>/Product2 */
	this.urlHashMap["SCIM_3different_simple_dive:381"] = "Parametric.c:192";
	/* <S1>/Sum */
	this.urlHashMap["SCIM_3different_simple_dive:374"] = "Parametric.c:184";
	/* <S1>/Sum1 */
	this.urlHashMap["SCIM_3different_simple_dive:375"] = "Parametric.c:194";
	/* <S1>/Sum2 */
	this.urlHashMap["SCIM_3different_simple_dive:377"] = "msg=rtwMsg_CodeGenerationReducedBlock&block=SCIM_3different_simple_dive:377";
	/* <S1>/U_s1 */
	this.urlHashMap["SCIM_3different_simple_dive:395"] = "msg=rtwMsg_reducedBlock&block=SCIM_3different_simple_dive:395";
	/* <S1>/U_s2 */
	this.urlHashMap["SCIM_3different_simple_dive:396"] = "msg=rtwMsg_reducedBlock&block=SCIM_3different_simple_dive:396";
	/* <S1>/U_s4 */
	this.urlHashMap["SCIM_3different_simple_dive:394"] = "msg=rtwMsg_reducedBlock&block=SCIM_3different_simple_dive:394";
	/* <S1>/Ua_gen */
	this.urlHashMap["SCIM_3different_simple_dive:359"] = "Parametric.c:174";
	/* <S1>/Ub_gen */
	this.urlHashMap["SCIM_3different_simple_dive:360"] = "Parametric.c:183";
	/* <S1>/Uc_gen */
	this.urlHashMap["SCIM_3different_simple_dive:361"] = "Parametric.c:193";
	this.getUrlHash = function(sid) { return this.urlHashMap[sid];}
}
RTW_Sid2UrlHash.instance = new RTW_Sid2UrlHash();
function RTW_rtwnameSIDMap() {
	this.rtwnameHashMap = new Array();
	this.sidHashMap = new Array();
	this.rtwnameHashMap["<Root>"] = {sid: "Parametric"};
	this.sidHashMap["Parametric"] = {rtwname: "<Root>"};
	this.rtwnameHashMap["<S1>"] = {sid: "SCIM_3different_simple_dive:358"};
	this.sidHashMap["SCIM_3different_simple_dive:358"] = {rtwname: "<S1>"};
	this.rtwnameHashMap["<S1>/Omega"] = {sid: "SCIM_3different_simple_dive:378"};
	this.sidHashMap["SCIM_3different_simple_dive:378"] = {rtwname: "<S1>/Omega"};
	this.rtwnameHashMap["<S1>/Amp"] = {sid: "SCIM_3different_simple_dive:382"};
	this.sidHashMap["SCIM_3different_simple_dive:382"] = {rtwname: "<S1>/Amp"};
	this.rtwnameHashMap["<S1>/Constant1"] = {sid: "SCIM_3different_simple_dive:368"};
	this.sidHashMap["SCIM_3different_simple_dive:368"] = {rtwname: "<S1>/Constant1"};
	this.rtwnameHashMap["<S1>/Constant2"] = {sid: "SCIM_3different_simple_dive:369"};
	this.sidHashMap["SCIM_3different_simple_dive:369"] = {rtwname: "<S1>/Constant2"};
	this.rtwnameHashMap["<S1>/Constant3"] = {sid: "SCIM_3different_simple_dive:376"};
	this.sidHashMap["SCIM_3different_simple_dive:376"] = {rtwname: "<S1>/Constant3"};
	this.rtwnameHashMap["<S1>/Integrator"] = {sid: "SCIM_3different_simple_dive:370"};
	this.sidHashMap["SCIM_3different_simple_dive:370"] = {rtwname: "<S1>/Integrator"};
	this.rtwnameHashMap["<S1>/Product"] = {sid: "SCIM_3different_simple_dive:379"};
	this.sidHashMap["SCIM_3different_simple_dive:379"] = {rtwname: "<S1>/Product"};
	this.rtwnameHashMap["<S1>/Product1"] = {sid: "SCIM_3different_simple_dive:380"};
	this.sidHashMap["SCIM_3different_simple_dive:380"] = {rtwname: "<S1>/Product1"};
	this.rtwnameHashMap["<S1>/Product2"] = {sid: "SCIM_3different_simple_dive:381"};
	this.sidHashMap["SCIM_3different_simple_dive:381"] = {rtwname: "<S1>/Product2"};
	this.rtwnameHashMap["<S1>/Sum"] = {sid: "SCIM_3different_simple_dive:374"};
	this.sidHashMap["SCIM_3different_simple_dive:374"] = {rtwname: "<S1>/Sum"};
	this.rtwnameHashMap["<S1>/Sum1"] = {sid: "SCIM_3different_simple_dive:375"};
	this.sidHashMap["SCIM_3different_simple_dive:375"] = {rtwname: "<S1>/Sum1"};
	this.rtwnameHashMap["<S1>/Sum2"] = {sid: "SCIM_3different_simple_dive:377"};
	this.sidHashMap["SCIM_3different_simple_dive:377"] = {rtwname: "<S1>/Sum2"};
	this.rtwnameHashMap["<S1>/U_s1"] = {sid: "SCIM_3different_simple_dive:395"};
	this.sidHashMap["SCIM_3different_simple_dive:395"] = {rtwname: "<S1>/U_s1"};
	this.rtwnameHashMap["<S1>/U_s2"] = {sid: "SCIM_3different_simple_dive:396"};
	this.sidHashMap["SCIM_3different_simple_dive:396"] = {rtwname: "<S1>/U_s2"};
	this.rtwnameHashMap["<S1>/U_s4"] = {sid: "SCIM_3different_simple_dive:394"};
	this.sidHashMap["SCIM_3different_simple_dive:394"] = {rtwname: "<S1>/U_s4"};
	this.rtwnameHashMap["<S1>/Ua_gen"] = {sid: "SCIM_3different_simple_dive:359"};
	this.sidHashMap["SCIM_3different_simple_dive:359"] = {rtwname: "<S1>/Ua_gen"};
	this.rtwnameHashMap["<S1>/Ub_gen"] = {sid: "SCIM_3different_simple_dive:360"};
	this.sidHashMap["SCIM_3different_simple_dive:360"] = {rtwname: "<S1>/Ub_gen"};
	this.rtwnameHashMap["<S1>/Uc_gen"] = {sid: "SCIM_3different_simple_dive:361"};
	this.sidHashMap["SCIM_3different_simple_dive:361"] = {rtwname: "<S1>/Uc_gen"};
	this.rtwnameHashMap["<S1>/Ua"] = {sid: "SCIM_3different_simple_dive:362"};
	this.sidHashMap["SCIM_3different_simple_dive:362"] = {rtwname: "<S1>/Ua"};
	this.rtwnameHashMap["<S1>/Ub"] = {sid: "SCIM_3different_simple_dive:363"};
	this.sidHashMap["SCIM_3different_simple_dive:363"] = {rtwname: "<S1>/Ub"};
	this.rtwnameHashMap["<S1>/Uc"] = {sid: "SCIM_3different_simple_dive:364"};
	this.sidHashMap["SCIM_3different_simple_dive:364"] = {rtwname: "<S1>/Uc"};
	this.getSID = function(rtwname) { return this.rtwnameHashMap[rtwname];}
	this.getRtwname = function(sid) { return this.sidHashMap[sid];}
}
RTW_rtwnameSIDMap.instance = new RTW_rtwnameSIDMap();
