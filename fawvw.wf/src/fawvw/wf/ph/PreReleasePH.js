
function fawvwPreleasePH(task) {
  try {
    new TopoSetProperties({

$path:[
  "root_target_attachments:FV9PHReportRevision/*:Form",
  "root_target_attachments:FV9PHReportRevision/*:Dataset"
],
$match:[ [
    ["/owning_user","/@user"]
  ], [
    ["/owning_group/parent","/@group/parent"],
    ["一汽大众","/owning_group/parent/parent.name"]
  ]
],
fv9PreRelesed: "true"

    }).process(task);
  } catch (e) {
    if(e instanceof java.lang.Throwable)
      e.printStackTrace();
    return e;
  }

}

var 一汽大众预发布PH报告 = fawvwPreleasePH;
