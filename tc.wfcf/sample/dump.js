
function dumpTargets(task) {
  var rootTask = task.root;
  var targets = rootTask.getAttachments(TCAttachmentScope.LOCAL, TCAttachmentType.TARGET);
  for(var i in targets) {
    var c = targets[i];
  	java.lang.System.err.println(" * No."+i+" : "+targets[i]+" of "+targets[i].getClass());
  }
}
