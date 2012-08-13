package com.mycom.treeviewer.handlers;

import java.io.File;
import org.eclipse.jface.viewers.LabelProvider;


public class FileTreeExplorerLabelProvider extends LabelProvider
{
  public String getText(Object element)
  {
    return ((File) element).getName();
  }
}
