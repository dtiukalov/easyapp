/*=============================================================================*
 *         Copyright(c) 2009-2010, Siemens PLM Software Inc.
 *                          ALL RIGHTS RESERVED

 *  FILENAME : 	ArrayPropertyTableColumn.java
 *  PURPOSE  :  define column class for ArrayPropertyTable, use property name as 
 *  			name, property value as column values
 *  
 *  HISTORY  :
 *    DATE            VERSION        AUTHOR            NOTE
 *    2009-02-09      V1.0           Tim              Created.    
 *   
 *============================================================================*/

package com.saturn.ph.views.table;

import java.util.Date;

import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.kernel.TCProperty;
import com.teamcenter.rac.kernel.TCTextService;
import com.teamcenter.rac.util.Registry;

/**
 * column model ,here set earch arry-property as a table column
 * 
 * @author Tim
 * 
 */
public class ArrayPropertyTableColumn {
    /** IMAN property */
    private TCProperty property;

    /** column editable */
    private boolean enabled;

    /** column with */
    private int columnWidth;

    /** values */
    private Object[] values;

    private Object[] loadValues;

    protected Registry tableRegistry = Registry.getRegistry(this);

    /**
     * ArrayPropertyTableColumn construct
     * 
     * @param property
     *            IMAN property
     * @param enabled
     *            column enabled
     */
    public ArrayPropertyTableColumn(TCProperty property) {
    	this(property, false, 80);
    }
    
    public ArrayPropertyTableColumn(TCProperty property, boolean enabled, int width) 
    {
        this.property = property;
        this.enabled = enabled;
        try {
            columnWidth = width;
            values = loadValue();
            loadValues = new Object[values.length];
            System.arraycopy(values, 0, loadValues, 0, values.length);
        }
        catch (TCException imane) 
        {
            imane.printStackTrace();
        }
    }

    /**
     * row count , return value count of the array-property
     * 
     * @return row count
     */
    public int getRowCount() {
        if (values == null)
            return 0;
        return values.length;
    }

    /**
     * get column width for customization
     * 
     * @param colName
     *            column property name
     * @return column width
     */
    public int getColumnWidth(String colName) 
    {
        String widthStr = tableRegistry.getString(colName + ".WIDTH", "NoValue");
        if (widthStr.equals("NoValue"))
            return -1;
        try 
        {
            int width = Integer.parseInt(widthStr);
            return width;
        }
        catch (Exception e) 
        {
            e.printStackTrace();
            return -1;
        }
    }

    /**
     * column type, return data type of the array-property
     * 
     * @return column type
     */
    public int getColumnPropertyType() 
    {
        return property.getPropertyType();
    }

    /**
     * column name, return displayname of the array-property
     * 
     * @return column name
     */
    public String getColumnName() 
    {
    	String pName = property.getPropertyName();
    	String dName = property.getDescriptor().getDisplayName();
    	if(dName == null || dName.equals(pName)) {
    		// not localized properly
    		TCTextService ts = property.getTCComponent().getSession().getTextService();
    		try {
				dName = ts.getTextValue(pName);
			} catch (TCException e) {
				e.printStackTrace();
			}
    	}
    	if(dName == null || dName.length() < 1) {
    		dName = pName;
    	}
    	return dName;
    }

    /**
     * IMANProperty, return the array-property
     * 
     * @return IMANProperty
     */
    public TCProperty getProperty() {
        return property;
    }

    /**
     * get if column can be enabled
     */
    public boolean isEditable() {
       
        if (!enabled)
            return enabled;

        return property.isModifiable();
    }


    /**
     * load values from array-property
     * 
     * @return values
     * @throws IMANException
     */
    private Object[] loadValue() throws TCException 
    {
        Object[] value = null;
        
        switch (property.getPropertyType()) {
        case 1:
            char ac[] = property.getCharValueArray();
            if (ac != null && ac.length > 0) {
                value = new Object[ac.length];
                for (int i = 0; i < ac.length; i++)
                    value[i] = new Character(ac[i]);
            }
            else
            {
            	value = new Character[0];
            }
            break;

        case 2:
            value = property.getDateValueArray();
            break;

        case 3:
            double ad[] = property.getDoubleValueArray();
            if (ad != null && ad.length > 0) {
                value = new Object[ad.length];
                for (int j = 0; j < ad.length; j++)
                    value[j] = new Double(ad[j]);

            }
            else
            {
            	value = new Double[0];
            }
            break;

        case 4:
            float af[] = property.getFloatValueArray();
            if (af != null && af.length > 0) {
                value = new Object[af.length];
                for (int k = 0; k < af.length; k++)
                    value[k] = new Float(af[k]);

            }
            else
            {
            	value = new Float[0];
            }
            break;

        case 5:
            int ai[] = property.getIntValueArray();
            if (ai != null && ai.length > 0) {
                value = new Object[ai.length];
                for (int l = 0; l < ai.length; l++)
                    value[l] = new Integer(ai[l]);

            }
            else
            {
            	value = new Integer[0];
            }
            break;

        case 6:
            boolean aflag[] = property.getLogicalValueArray();
            if (aflag != null && aflag.length > 0) {
                value = new Object[aflag.length];
                for (int i1 = 0; i1 < aflag.length; i1++)
                    value[i1] = new Boolean(aflag[i1]);

            }
            else
            {
            	value = new Boolean[0];
            }
            break;

        case 12:
            value = property.getNoteValueArray();
            break;

        case 7:
            short aword0[] = property.getShortValueArray();
            if (aword0 != null && aword0.length > 0) {
                value = new Object[aword0.length];
                for (int k1 = 0; k1 < aword0.length; k1++)
                    value[k1] = new Short(aword0[k1]);

            }
            else
            {
            	value = new Short[0];
            }
            break;

        case 8:
            value = property.getStringValueArray();
            break;

        case 9:
        case 10:
        case 11:
        case 13:
        case 14:
            value = property.getReferenceValueArray();
            break;
        }
        return value;
    }

    /**
     * this function use to check the size of value, makesure all values have
     * same size
     * 
     * @param d
     *            compared size
     */
    public void extend(int d) {
        if (d < 1) {
            values = new Object[0];
            return;
        }
        Object[] newValues = new Object[d];
        if (values == null || values.length < 0) {
            values = newValues;
        } else {
            if (values.length >= newValues.length)
                System.arraycopy(values, 0, newValues, 0, newValues.length);
            else
                System.arraycopy(values, 0, newValues, 0, values.length);
            values = newValues;
        }
        loadValues = new Object[values.length];
        System.arraycopy(values, 0, loadValues, 0, values.length);
    }

    public boolean isModified() {
        if (values == null && loadValues == null)
            return false;

        if (values != null) {
            if (loadValues == null) {
                return true;
            } else {
                if (values.length != loadValues.length) {
                    return true;
                }
                for (int i = 0; i < values.length; i++) {
                    if (!values[i].equals(loadValues[i])) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    /**
     * get column width
     * 
     * @return
     */

    public int getColumnWidth() {
        return columnWidth;
    }

    /**
     * get values
     * 
     * @return values
     */
    public Object[] getEditValue() {
        return values;
    }

    /**
     * set values
     * 
     * @param newValues
     *            new values
     */
    public void setEditValue(Object[] newValues) {
        values = newValues;
    }

    /**
     * save values to array-property
     * 
     * @throws Exception
     */
    public void saveValueData() throws Exception 
    {
        int len = values.length;
        switch (property.getPropertyType()) {
        default:
            break;

        case 2:
            Date dates[] = new Date[len];
            for (int i = 0; i < len; i++)
                dates[i] = (Date) values[i];
            property.setDateValueArrayData(dates);
            break;
        case 1:
            char chars[] = new char[len];
            for (int i = 0; i < len; i++)
                chars[i] = values[i] == null ? '\0' : ((Character) values[i]).charValue();
            property.setCharValueArrayData(chars);
            break;
        case 3:
            double doubles[] = new double[len];
            for (int i = 0; i < len; i++)
                doubles[i] = values[i] == null ? 0.0 : ((Double) values[i]).doubleValue();
            property.setDoubleValueArrayData(doubles);
            break;
        case 4:
            float floats[] = new float[len];
            for (int i = 0; i < len; i++)
                floats[i] = values[i] == null ? (float) 0.0 : ((Float) values[i]).floatValue();
            property.setFloatValueArrayData(floats);
            break;
        case 5:
            int ints[] = new int[len];
            for (int i = 0; i < len; i++)
            {
                ints[i] = values[i] == null ? 0 : ((Integer) values[i]).intValue();
            }
            property.setIntValueArrayData(ints);
            break;
        case 7:
            short shorts[] = new short[len];
            for (int i = 0; i < len; i++)
            {
                shorts[i] = values[i] == null ? 0 : ((Short) values[i]).shortValue();
            }
            property.setShortValueArrayData(shorts);
            break;
        case 6:
            boolean bools[] = new boolean[len];
            for (int i = 0; i < len; i++)
                bools[i] = values[i] == null ? false : ((Boolean) values[i]).booleanValue();
            property.setLogicalValueArrayData(bools);
            break;
        case 8:
            String strs[] = new String[len];
            for (int i = 0; i < len; i++) {
                strs[i] = (String) values[i];
                // System.out.println(i + "---" + strs[i]);
            }
            property.setStringValueArrayData(strs);
            break;
        case 12:
            String notes[] = new String[len];
            for (int i = 0; i < len; i++)
                notes[i] = (String) values[i];
            property.setNoteValueArrayData(notes);
            break;
        case 9:
        case 10:
        case 11:
        case 13:
        case 14:
            TCComponent components[] = new TCComponent[len];
            for (int i = 0; i < len; i++)
                components[i] = (TCComponent) values[i];
            property.setReferenceValueArrayData(components);
            break;
        }

    }

    /**
     * check if column can be null value
     * 
     * @return true that can be null
     */
    public boolean isNullEnabled() {
        return !property.isRequired();
    }
}