
// CAUSION: This file should be in UTF-8 encoding

importPackage(com.teamcenter.rac.kernel);
importPackage(com.teamcenter.rac.util);

importPackage(Packages.tc.wfcf);


function runOnApproval(func) {
  var pArgs = arguments;
  te.beforeDecisionRun(new JavaHandler() {
    handleDecision: function (task, decision) {
      if(decision !== TCCRDecision.APPROVE_DECISION)
        return true;
      this.msg = func(task, decision, pArgs);
      if(this.msg)
        return false;
      return true;
    },
    getMessage: function () {
      return this.msg;
    }
  });
}

function runAfterApproval(func) {
  var pArgs = arguments;
  te.afterDecisionRun(new JavaHandler() {
    handleDecision: function (task, decision) {
      if(decision !== TCCRDecision.APPROVE_DECISION)
        return true;
      this.msg = func(task, decision, pArgs);
      if(this.msg)
        return false;
      return true;
    },
    getMessage: function () {
      return this.msg;
    }
  });
}

function runOnRejection(func) {
  var pArgs = arguments;
  te.beforeDecisionRun(new JavaHandler() {
    handleDecision: function (task, decision) {
      if(decision !== TCCRDecision.REJECT_DECISION)
        return true;
      this.msg = func(task, decision, pArgs);
      if(this.msg)
        return false;
      return true;
    },
    getMessage: function () {
      return this.msg;
    }
  });
}

function runAfterRejection(func) {
  var pArgs = arguments;
  te.afterDecisionRun(new JavaHandler() {
    handleDecision: function (task, decision) {
      if(decision !== TCCRDecision.REJECT_DECISION)
        return true;
      this.msg = func(task, decision, pArgs);
      if(this.msg)
        return false;
      return true;
    },
    getMessage: function () {
      return this.msg;
    }
  });
}



var 批准时执行 = runOnApproval;
var 批准后执行 = runAfterApproval;

var 否决时执行 = runOnRejection;
var 否决后执行 = runAfterRejection;
