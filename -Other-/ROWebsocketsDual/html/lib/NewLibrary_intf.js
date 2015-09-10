//----------------------------------------------------------------------------//
// This unit was automatically generated by the RemObjects SDK after reading  //
// the RODL file associated with this project .                               //
//                                                                            //
// Do not modify this unit manually, or your changes will be lost when this   //
// unit is regenerated the next time you compile the project.                 //
//----------------------------------------------------------------------------//


/* This codegen depends on RemObjectsSDK.js
* Usage:
* var Channel = new RemObjects.SDK.HTTPClientChannel("http://localhost:8099/JSON");
* var Message = new RemObjects.SDK.JSONMessage();
* var Service = new NewService(Channel, Message);
* Service.Sum(1, 2,
*             function(result) {
*                 alert(result);
*             },
*             function(msg) {alert(msg.getErrorMessage())}
* );
*
*/





// Service: NewService
function NewService(__channel, __message, __service_name) {
  RemObjects.SDK.ROService.call(this, __channel, __message, __service_name);
  this.fServiceName = this.fServiceName || __service_name || "NewService";
};


NewService.prototype.Sum = function(
	A,
	B,
	__success, __error) {
    try {
        var msg = this.fMessage.clone();
        msg.initialize(this.fServiceName, "Sum");
        msg.write("A", "Integer", A);
        msg.write("B", "Integer", B);
        msg.finalize();
        this.fChannel.dispatch(msg, function (__message) {
		var __result = __message.read("Result", "Integer");
	        __success(
		__result
		);
        }, __error);

    } catch (e) {
        __error(msg, e);
    };
};

NewService.prototype.GetServerTime = function(
	__success, __error) {
    try {
        var msg = this.fMessage.clone();
        msg.initialize(this.fServiceName, "GetServerTime");
        msg.finalize();
        this.fChannel.dispatch(msg, function (__message) {
		var __result = __message.read("Result", "DateTime");
	        __success(
		__result
		);
        }, __error);

    } catch (e) {
        __error(msg, e);
    };
};

NewService.prototype.StartTimer = function(
	__success, __error) {
    try {
        var msg = this.fMessage.clone();
        msg.initialize(this.fServiceName, "StartTimer");
        msg.finalize();
        this.fChannel.dispatch(msg, function (__message) {
	        __success(
		);
        }, __error);

    } catch (e) {
        __error(msg, e);
    };
};

NewService.prototype.StopTimer = function(
	__success, __error) {
    try {
        var msg = this.fMessage.clone();
        msg.initialize(this.fServiceName, "StopTimer");
        msg.finalize();
        this.fChannel.dispatch(msg, function (__message) {
	        __success(
		);
        }, __error);

    } catch (e) {
        __error(msg, e);
    };
};

NewService.prototype.ExecuteLongStatementWithProgress = function(
	__success, __error) {
    try {
        var msg = this.fMessage.clone();
        msg.initialize(this.fServiceName, "ExecuteLongStatementWithProgress");
        msg.finalize();
        this.fChannel.dispatch(msg, function (__message) {
	        __success(
		);
        }, __error);

    } catch (e) {
        __error(msg, e);
    };
};



// Event sink: NewEventSink
function NewEventSink() {
	this.NewMethod = {
		NewParam : {dataType : "AnsiString", value : null}
	};
	this.ProgressEvent = {
		aProgress : {dataType : "Integer", value : null},
		aMax : {dataType : "Integer", value : null}
	};
	this.TimerEvent = {
		aTime : {dataType : "DateTime", value : null}
	};
};
NewEventSink.prototype = new RemObjects.SDK.ROEventSink();
NewEventSink.prototype.constructor = NewEventSink;
RemObjects.SDK.RTTI["NewEventSink"] = NewEventSink;

