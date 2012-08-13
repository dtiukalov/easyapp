package com.mycom.treeviewer.handlers;

import java.io.File;
import org.eclipse.jface.viewers.ITreeContentProvider;
import org.eclipse.jface.viewers.Viewer;

public class FileTreeExplorerContentProvider implements ITreeContentProvider
{
  public Object[] getChildren(Object element)
  {
    Object[] children = ((File) element).listFiles();
    return children == null ? new Object[0] : children;
  }

  public Object[] getElements(Object element)
  {
    return getChildren(element);
  }

  public boolean hasChildren(Object element)
  {
    return getChildren(element).length > 0;
  }

  public Object getParent(Object element)
  {
    return ((File)element).getParent();
  }
  
  public void dispose()
  {
    //No implementation	  
  }

  public void inputChanged(Viewer viewer, Object old_input, Object new_input)
  {
	//No implementation
  }
}

