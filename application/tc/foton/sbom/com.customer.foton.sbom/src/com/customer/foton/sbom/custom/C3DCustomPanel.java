package com.customer.foton.sbom.custom;

import java.awt.Frame;
import java.util.HashMap;
import java.util.Map;

import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

import com.teamcenter.rac.commands.newitem.NewItemCommand;
import com.teamcenter.rac.commands.newitem.NewItemDialog;
import com.teamcenter.rac.commands.newitem.NewItemFinishPanel;
import com.teamcenter.rac.commands.newitem.NewItemPanel;
import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCComponentForm;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.kernel.TCProperty;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.stylesheet.AbstractRendering;
import com.teamcenter.rac.util.MessageBox;
import com.teamcenter.rac.util.PropertyLayout;
import com.teamcenter.rac.util.VerticalLayout;

public class C3DCustomPanel extends NewItemFinishPanel {
	
	public C3DCustomPanel(Frame arg0, TCSession arg1, NewItemPanel arg2) {
		super(arg0, arg1, arg2);
		// TODO Auto-generated constructor stub
		System.out.println("------");
	}


	
	
	
	
}
