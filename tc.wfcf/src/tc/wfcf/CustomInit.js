
// CAUSION: This file should be in UTF-8 encoding

importPackage(com.teamcenter.rac.kernel);
importPackage(com.teamcenter.rac.util);

importPackage(Packages.tc.wfcf);

function taskQName(task) {
  if(!task) return '';
  var pQName = taskQName(task.parent);
  if(pQName) return pQName+'.'+task;
  return ''+task;
}



// Compatible with manual scripts {

function runOnAutoProcess () {}
var 自动处理时执行 = runOnAutoProcess;

function AutoApprove() {}
var 批准 = AutoApprove;

var AutoComplete = AutoApprove;
var 完成 = AutoComplete;


function AutoReject() {}
var 拒绝 = AutoReject;

var AutoUncomplete = AutoReject;
var 无法完成 = AutoUncomplete;


// Compatible with manual scripts }

function runWithBypass(func) {
  return function() {
    var bps = Packages.com.bp8.services.rac.bypass.BypassService.getService(te.task.session);
    var alreadyHasBypass = bps.hasBypass();
    if(!alreadyHasBypass) {
      bps.setBypass(true);
    }
    try {
      return func.apply(func, arguments);
    } finally {
      if(!alreadyHasBypass) {
        bps.setBypass(false);
      }
    }
  };
}
var 授权 = runWithBypass;

function getRelatedComponents(cmp, rel) {
  if('@' == rel.charAt(0)) {
    if("@user" == rel) {
      return [ te.task.session.user ];
    } else if("@group" == rel) {
      return [ te.task.session.group ];
    } else {
      throw "Unknown global relation '"+rel+"' !!";
    }
  }
  if(!rel)
    return cmp.getRelatedComponents();
  else
    return cmp.getRelatedComponents(rel);
}

function TopoPath(spec) {
  if(spec.charAt(0) == '/')
    spec = spec.substring(1);
  var pos = spec.indexOf('/');
  if(pos > 0) {
    this.next = new TopoPath(spec.substring(pos+1));
    spec = spec.substring(0, pos);
  } else {
    this.next = undefined;
  }
  pos = spec.indexOf(':');
  if(pos > 0) {
    this.relation = spec.substring(0,pos);
    spec = spec.substring(pos+1);
    pos = spec.indexOf('.');
    if(pos > 0) {
      this.type = spec.substring(0, pos);
      if(this.type == '*')
        this.type = undefined;
      this.prop = spec.substring(pos+1);
    } else {
      this.type = spec;
      this.prop = undefined;
    }
  } else {
    pos = spec.indexOf('.');
    if(pos > 0) {
      this.relation = spec.substring(0, pos);
      this.prop = spec.substring(pos+1);
    } else {
      this.relation = spec;
      this.type = undefined;
      this.prop = undefined;
    }
  }
  this.process = function(root, func) {
    var cmps = getRelatedComponents(root, this.relation);
    if(!cmps || cmps.length<1) return;
    for(var i=0; i<cmps.length; i++) {
      var cmp = cmps[i];
      if(this.type && !cmp.isTypeOf(this.type))
        continue;
      if(this.next) {
        this.next.process(cmp, func);
      } else {
        func(cmp);
      }
    }
  }
  this.getProp = function(root) {
    var cmps = getRelatedComponents(root, this.relation);
    if(!cmps || cmps.length<1) return;
    for(var i=0; i<cmps.length; i++) {
      var cmp = cmps[i];
      if(this.type && !cmp.isTypeOf(this.type))
        continue;
      if(this.next) {
        var v = this.next.getProp(cmp);
        if(v) return v;
        else continue;
      }
      if(!this.prop) {
        return String(cmp.uid);
      }
      var p = cmp.getTCProperty(this.prop);
      if(!p) {
        java.lang.System.err.println("!!! Component {"+cmp+"} of type ["+cmp.getType()+"] has no property named ["+this.prop+"] !!!");
        return undefined;
      }
      if(!p.isNotArray())
        throw "Array property '"+
          p.getDescriptor().getTypeComponent()+"."+
          p.getDescriptor().getName()+
        "' not supported yet !!";
      if(p.isReferenceType()) {
        var r = p.getReferenceValue();
        if(r) return r.uid;
        else return "AAAAAAAAAAAAAA";
      }
      return String(p.getUIFValue());
    }
  }
}

function TopoMatch(spec) {
  if(!(spec instanceof Array))
    throw "A $match element must be an array !!";
  this.andMatchList = new Array(spec.length);
  for(var i=0; i<spec.length; i++) {
    var ml = spec[i];
    if(!(ml instanceof Array))
      throw "A $match element's element must be an array !!";
    this.andMatchList[i] = new Array(ml.length);
    for(var j=0; j<ml.length; j++) {
      var mPath = String(ml[j]);
      if('/' == mPath.charAt(0)) {
        this.andMatchList[i][j] = new TopoPath(mPath);
      } else {
        this.andMatchList[i][j] = mPath;
      }
    }
  }
  this.match = function (cmp) {
    for(var i=0; i<this.andMatchList.length; i++) {
      var ml = this.andMatchList[i];
      var mv = undefined;
      for(var j=0; j<ml.length; j++) {
        var v = ml[j];
        if(v instanceof TopoPath) {
          v = v.getProp(cmp);
          if(!v) {
            // treat undefined, null or empty value as not matchable
            return false;
          }
        } else {
        }
        if(undefined == mv) {
          mv = v;
        } else if(v != mv) {
          return false;
        }
      }
    }
    return true;
  }
}

function TopoSetProperties(spec) {
  this.spec = spec;
  var pathl = spec["$path"];
  if(!pathl)
    throw "!! $path is required !!";
  if(pathl instanceof Array) {
    this.pathl = new Array(pathl.length);
    for(var i=0; i<pathl.length; i++) {
      this.pathl[i] = new TopoPath(pathl[i]);
    }
  } else {
    this.pathl = [ new TopoPath(pathl) ];
  }
  var ml = spec["$match"];
  if(ml) {
    if(ml instanceof Array) {
      this.orMatchList = new Array(ml.length);
      for(var i=0; i<ml.length; i++) {
        this.orMatchList[i] = new TopoMatch(ml[i]);
      }
    } else {
      throw "$match must be a 3d array!!";
    }
  }
  this.process = function (root) {
    var orMatchList = this.orMatchList;
    var spec = this.spec;
    for(var i=0; i<this.pathl.length; i++) {
      this.pathl[i].process(root, function(cmp) {
        if(orMatchList) {
          for(var i=0; i<orMatchList.length; i++) {
            if(orMatchList[i].match(cmp)) {
              // this match group accepted cmp
java.lang.System.err.println(" ## Updating ["+cmp+"] ##");
              for(var name in spec) {
                if(name.charAt(0) == '$') continue;
java.lang.System.err.println("  # Setting "+name+"=["+spec[name]+"] ##");
                cmp.setProperty(name, spec[name]);
              }
              break;
            }
          }
        }
      });
    }
  }
}

function updateProperties(task, decision, pArgs) {
  try {
    for(var i=1; i<pArgs.length; i++) {
      new TopoSetProperties(pArgs[i]).process(task);
    }
  } catch (e) {
    if(e instanceof java.lang.Throwable)
      e.printStackTrace();
    return e;
  }
}
var 更新属性 = updateProperties;

/**
  runOnApproval(runWithBypass(updateProperties), {
    $path  : "root_target_attachments:ItemRevision/*:Form",
    $match : [ 
      [ ["/owning_user", "/@user"] ], 
      [
        ["/owning_group/parent", "/@group/parent"],
        ["FAWVW", "/owning_group/parent/parent.name"]
      ],
    ],
    object_desc : "Form updated @ " + date()
  }, {
    $path  : "root/target_attachments",
    object_desc : "Target udpated @ " + date()
  });
*/

function adminScripts(task, act, fArgs) {
  if(!fArgs || fArgs.length<2)
    return 'No script path specified in workflow template: '+
      taskQName(task.taskDefinition);
  for(var i=1; i<fArgs.length; i++) {
    var msg = te.runAdminScripts(fArgs[i]);
    if(msg) return msg;
  }
}
var 管理员脚本 = adminScripts;


