package com.mycom.tableviewer.handlers;

import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import org.eclipse.jface.viewers.CellEditor;
import org.eclipse.jface.viewers.ColumnWeightData;
import org.eclipse.jface.viewers.ICellModifier;
import org.eclipse.jface.viewers.ISelection;
import org.eclipse.jface.viewers.IStructuredSelection;
import org.eclipse.jface.viewers.TableLayout;
import org.eclipse.jface.viewers.TableViewer;
import org.eclipse.jface.viewers.TextCellEditor;
import org.eclipse.swt.SWT;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Control;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Table;
import org.eclipse.swt.widgets.TableColumn;
import org.eclipse.swt.widgets.TableItem;

import com.teamcenter.rac.aif.AbstractAIFDialog;
import com.teamcenter.rac.util.Registry;

/**
 * This is an example program showing how to use a TableViewer
 */
public class TableViewerExample {

	private Table table;
	private TableViewer tableViewer;
	
	/** class registry */
    private final static  Registry reg = Registry.getRegistry( TableViewerExample.class );


	private final static String[] COLUMN_HEADINGS = { reg.getString( "Object"),reg.getString( "Type" )};

	public TableViewerExample() {
		createTableViewerExample();
	}

	private void createTableViewerExample() {
		Shell shell = new Shell(SWT.SHELL_TRIM);
		shell.setImage( Registry.getRegistry(
                  AbstractAIFDialog.class ).getImage(
                  "aifDesktop.ICON" ) );
		shell.setText(reg.getString("details"));
		shell.setLayout(new FillLayout());

		createContents(shell);

		shell.setSize(400, 400);
		shell.open();

		while (!shell.isDisposed()) {
			if (!Display.getDefault().readAndDispatch())
				Display.getDefault().sleep();
		}
	}

	protected Control createContents(Composite parent) {
		final Composite composite = new Composite(parent, SWT.NONE);
		GridLayout layout = new GridLayout(1, false);
		layout.verticalSpacing = 10;
		composite.setLayout(layout);
		GridData data = new GridData(GridData.FILL_BOTH);
		data.grabExcessHorizontalSpace = true;
		composite.setLayoutData(data);

		table = new Table(composite, SWT.BORDER | SWT.V_SCROLL | SWT.MULTI
				| SWT.FULL_SELECTION);
		table.setLinesVisible(true);
		table.setHeaderVisible(true);
		data = new GridData(SWT.FILL, SWT.FILL, true, false);
		data.heightHint = 300;
		table.setLayoutData(data);

		TableLayout tableLayout = new TableLayout();
		table.setLayout(tableLayout);

		tableLayout.addColumnData(new ColumnWeightData(10, 50, true));
		TableColumn column = new TableColumn(table, SWT.NONE);
		column.setText(COLUMN_HEADINGS[0]);
		column.setAlignment(SWT.LEFT);

		tableLayout.addColumnData(new ColumnWeightData(15, 200, true));
		column = new TableColumn(table, SWT.NONE);
		column.setText(COLUMN_HEADINGS[1]);
		column.setAlignment(SWT.LEFT);

		tableViewer = new TableViewer(table);
		tableViewer.setColumnProperties(COLUMN_HEADINGS);
		tableViewer.setContentProvider(new TableContentProvider());
		tableViewer.setLabelProvider(new TableLabelProvider());

		CellEditor[] editors = new CellEditor[2];
		editors[0] = new TextCellEditor(table);
		editors[1] = new TextCellEditor(table);
		tableViewer.setCellEditors(editors);
		tableViewer.setCellModifier(new TableCellModifier());

		Composite buttonComposite = new Composite(composite, SWT.NONE);
		FillLayout fillLayout = new FillLayout(SWT.HORIZONTAL);
		fillLayout.spacing = 10;
		buttonComposite.setLayout(fillLayout);

		Button addButton = new Button(buttonComposite, SWT.PUSH);
		addButton.setText(reg.getString("Add"));
		addButton.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(SelectionEvent e) {
				Row row = new Row("", "");
				tableViewer.add(row);
				table.setTopIndex(table.getItemCount());
				table.select(table.getItemCount() - 1);
				tableViewer.editElement(row, 0);
			}
		});

		Button deleteButton = new Button(buttonComposite, SWT.PUSH);
		deleteButton.setText(reg.getString("Delete"));
		deleteButton.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(SelectionEvent e) {
				ISelection selection = tableViewer.getSelection();
				if (selection instanceof IStructuredSelection) {
					Iterator iterator = ((IStructuredSelection) selection)
							.iterator();
					while (iterator.hasNext()) {
						Object obj = iterator.next();
						tableViewer.remove(obj);
					}
				}
			}
		});
		
		Button closeButton = new Button(buttonComposite, SWT.PUSH);
		closeButton.setText(reg.getString("Close"));
		closeButton.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(SelectionEvent e) {
				composite.getParent().dispose();
					
			}
		});

		return composite;
	}

	class TableCellModifier implements ICellModifier {

		public boolean canModify(Object element, String property) {
			return true;
		}

		public Object getValue(Object element, String property) {
			Object result = null;

			Row row = (Row) element;

			List<String> list = Arrays.asList(COLUMN_HEADINGS);
			int columnIndex = list.indexOf(property);

			switch (columnIndex) {
			case 0:
				result = row.getKey();
				break;
			case 1:
				result = row.getValue();
				break;
			}

			return result;
		}

		public void modify(Object element, String property, Object value) {
			List<String> list = Arrays.asList(COLUMN_HEADINGS);
			int columnIndex = list.indexOf(property);

			TableItem tableItem = (TableItem) element;
			Row row = (Row) tableItem.getData();

			switch (columnIndex) {
			case 0:
				String key = (String) value;
				if (key.length() > 0) {
					row.setKey(key);
				}
				break;

			case 1:
				String v = (String) value;
				if (v.length() > 0) {
					row.setValue(v);
				}
				break;
			}
			tableViewer.update(row, null);
		}

	}


}