
function fawvwPreleasePH(task) {
  try {
    new TopoSetProperties({

$path:[
  "root_target_attachments:FV9PHReportRevision/FV9LOPH_Rel:Form",
  "root_target_attachments:FV9PHReportRevision/FV9LOPH_Rel:Dataset",
  "root_target_attachments:FV9PHReportRevision/FV9PMPH_Rel:Form",
  "root_target_attachments:FV9PHReportRevision/FV9PMPH_Rel:Dataset",
  "root_target_attachments:FV9PHReportRevision/FV9CP1PH_Rel:Form",
  "root_target_attachments:FV9PHReportRevision/FV9CP1PH_Rel:Dataset",
  "root_target_attachments:FV9PHReportRevision/FV9VSCPH_Rel:Form",
  "root_target_attachments:FV9PHReportRevision/FV9VSCPH_Rel:Dataset",
  "root_target_attachments:FV9PHReportRevision/FV9PLPH_Rel:Form",
  "root_target_attachments:FV9PHReportRevision/FV9PLPH_Rel:Dataset",
  "root_target_attachments:FV9PHReportRevision/FV9TEPH_Rel:Form",
  "root_target_attachments:FV9PHReportRevision/FV9TEPH_Rel:Dataset",
  "root_target_attachments:FV9PHReportRevision/FV9SUPH_Rel:Form",
  "root_target_attachments:FV9PHReportRevision/FV9SUPH_Rel:Dataset",
  "root_target_attachments:FV9PHReportRevision/FV9QAPH_Rel:Form",
  "root_target_attachments:FV9PHReportRevision/FV9QAPH_Rel:Dataset",
  "root_target_attachments:FV9PHReportRevision/FV9PHBackup_Rel:Form",
  "root_target_attachments:FV9PHReportRevision/FV9PHBackup_Rel:Dataset"

],
$match:[ [
    ["/owning_user","/@user"]
  ], [
    ["/owning_group/parent","/@group/parent"],
    ["一汽大众","/owning_group/parent/parent.name"]
  ]
],
fv9PreRelesed: "Yes"

    }).process(task);
  } catch (e) {
    if(e instanceof java.lang.Throwable)
      e.printStackTrace();
    return e;
  }

}
var 一汽大众预发布PH报告 = fawvwPreleasePH;
