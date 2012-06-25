
// CAUSION: This file should be in UTF-8 encoding

importPackage(com.teamcenter.rac.kernel);
importPackage(com.teamcenter.rac.util);

importPackage(Packages.tc.wfcf);


// Compatible with manual scripts {

function runOnCompletion() {}
function runAfterCompletion() {}
function runOnUnableToComplete() {}
function runAfterUnableToComplete() {}

var 完成时执行 = runOnCompletion;
var 完成后执行 = runAfterCompletion;
var 无法完成时执行 = runOnUnableToComplete;
var 无法完成后执行 = runAfterUnableToComplete;


function runOnApproval () {}
function runAfterApproval () {}
function runOnRejection () {}
function runAfterRejection () {}

var 批准时执行 = runOnApproval;
var 批准后执行 = runAfterApproval;
var 否决时执行 = runOnRejection;
var 否决后执行 = runAfterRejection;

// Compatible with manual scripts {


// Auto scripts

function runOnAutoProcess () {
  for(var i=0; i<arguments.length; i++) {
    var proc = arguments[i];
    while(!(proc instanceof AutoProcessor)) {
      if(proc instanceof java.lang.Class && AutoProcessor.isAssignableFrom(proc))
        proc = proc.newInstance();
      else if((typeof proc) != 'function')
        throw "Not a function: '"+proc+"'"; 
      else
        proc = proc();
      if(!proc) throw "Not an auto processor: "+proc;
    }
    pe.onAutoProcessRun(proc);
  }
}

var 自动处理时执行 = runOnAutoProcess;


function AutoApprove(comments, retryDelay, allowFurtherProcess) {
  if(!comments) comments = 'Approved by Clickbot';
  if(!retryDelay) retryDelay = 1000*60*5; // 5 minutes
  if(allowFurtherProcess == undefined) allowFurtherProcess = false;
  return new DecisionApproval(comments, retryDelay, allowFurtherProcess);
}
var 批准 = AutoApprove;

var AutoComplete = AutoApprove;
var 完成 = AutoComplete;


function AutoReject(comments, retryDelay, allowFurtherProcess) {
  if(!comments) comments = 'Rejected by Clickbot';
  if(!retryDelay) retryDelay = 1000*60*5; // 5 minutes
  if(allowFurtherProcess == undefined) allowFurtherProcess = false;
  return new DecisionDenial(comments, retryDelay, allowFurtherProcess);
}
var 拒绝 = AutoReject;

var AutoUncomplete = AutoReject;
var 无法完成 = AutoUncomplete;


