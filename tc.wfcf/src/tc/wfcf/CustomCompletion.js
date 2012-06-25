
// CAUSION: This file should be in UTF-8 encoding

importPackage(com.teamcenter.rac.kernel);
importPackage(com.teamcenter.rac.util);

importPackage(Packages.tc.wfcf);


function runOnCompletion(func) {
  var pArgs = arguments;
  te.beforeCompletionRun(new JavaHandler() {
    handleCompletion: function (task, unableToComplete) {
      if(unableToComplete)
        return true;
      this.msg = func(task, unableToComplete, pArgs);
      if(this.msg)
        return false;
      return true;
    },
    getMessage: function () {
      return this.msg;
    }
  });
}

function runAfterCompletion(func) {
  var pArgs = arguments;
  te.afterCompletionRun(new JavaHandler() {
    handleCompletion: function (task, unableToComplete) {
      if(unableToComplete)
        return true;
      this.msg = func(task, unableToComplete);
      if(this.msg)
        return false;
      return true;
    },
    getMessage: function () {
      return this.msg;
    }
  });
}

function runOnUnableToComplete(func) {
  var pArgs = arguments;
  te.beforeCompletionRun(new JavaHandler() {
    handleCompletion: function (task, unableToComplete) {
      if(!unableToComplete)
        return true;
      this.msg = func(task, unableToComplete, pArgs);
      if(this.msg)
        return false;
      return true;
    },
    getMessage: function () {
      return this.msg;
    }
  });
}

function runAfterUnableToComplete(func) {
  var pArgs = arguments;
  te.afterCompletionRun(new JavaHandler() {
    handleCompletion: function (task, unableToComplete) {
      if(!unableToComplete)
        return true;
      this.msg = func(task, unableToComplete, pArgs);
      if(this.msg)
        return false;
      return true;
    },
    getMessage: function () {
      return this.msg;
    }
  });
}


var 完成时执行 = runOnCompletion;
var 完成后执行 = runAfterCompletion;

var 无法完成时执行 = runOnUnableToComplete;
var 无法完成后执行 = runAfterUnableToComplete;
