package foton.picture.util;

/**
 * 
 * @author emily
 * 
 */
public interface IConstants {
	/**
	 * TC_SOA FMS 下载完的图片保存位置常量
	 */
	public static final String DOWNLOAD_JPEG_PATH = "FUTIAN_DOWNLOAD_JPEG_SERVER_PATH"; //$NON-NLS-1$
	/**
	 * TC_SOA FMS 小图片保存位置常量
	 */
	public static final String DOWNLOAD_SP_JPEG_PATH = "FUTIAN_DOWNLOAD_SP_JPEG_SERVER_PATH"; //$NON-NLS-1$
	/**
	 * WEB 批量下载图片保存位置常量
	 */
	public static final String DOWNLOAD_ZIP_PICTURES_PATH = "FUTIAN_DOWNLOAD_ZIP_PICTURES_SERVER_PATH"; //$NON-NLS-1$
	/**
	 * 数据字典常量
	 */
	public static final String DICTS_XML_PATH = "FUTIAN_DICTS_XML_PATH"; //$NON-NLS-1$
/*	*//**
	 * LOV: f6_Angle常量
	 *//*
	public static final String LOV_ANGLE = "LOV_ANGLE"; //$NON-NLS-1$
	
	*//**
	 * LOV: f6_Band常量
	 *//*
	public static final String LOV_BAND = "LOV_BAND"; //$NON-NLS-1$
	
	*//**
	 * LOV: f6_CarType常量
	 *//*
	public static final String LOV_CARTYPE = "LOV_CARTYPE"; //$NON-NLS-1$
	
	*//**
	 * LOV: f6_Country常量
	 *//*
	public static final String LOV_COUNTRY = "LOV_COUNTRY"; //$NON-NLS-1$
	
	*//**
	 * LOV: f6_Inter常量
	 *//*
	public static final String LOV_INTER = "LOV_INTER"; //$NON-NLS-1$
	
	*//**
	 * LOV: f6_Outer常量
	 *//*
	public static final String LOV_OUTER = "LOV_OUTER"; //$NON-NLS-1$
	
	*//**
	 * LOV: f6_InterOunter常量
	 *//*
	public static final String LOV_INTEROUNTER = "LOV_INTEROUNTER"; //$NON-NLS-1$
	
	*//**
	 * LOV: f6_SubBand常量
	 *//*
	public static final String LOV_SUBBAND = "LOV_SUBBAND"; //$NON-NLS-1$
	
	*//**
	 * LOV: f6_Year常量
	 *//*
	public static final String LOV_YEAR = "LOV_YEAR"; //$NON-NLS-1$
	*/
	
	/**
	 * 搜索条件常量
	 */
	public static final String COUNTRY = Messages.getString("IConstants.country"); //$NON-NLS-1$
	
	public static final String BAND = Messages.getString("IConstants.band"); //$NON-NLS-1$
	
	public static final String SUB_BAND = Messages.getString("IConstants.subband"); //$NON-NLS-1$
	
	public static final String YEAR = Messages.getString("IConstants.year"); //$NON-NLS-1$
	
	public static final String INTER_OUTER = Messages.getString("IConstants.interouter"); //$NON-NLS-1$
	
	public static final String ANGLE = Messages.getString("IConstants.angle"); //$NON-NLS-1$
	
	public static final String OUTER = Messages.getString("IConstants.outer"); //$NON-NLS-1$
	
	public static final String INTER = Messages.getString("IConstants.inter"); //$NON-NLS-1$
	
	public static final String CAR_TYPE = Messages.getString("IConstants.cartype"); //$NON-NLS-1$
	
	public static final String CREATE_DATE_AFTER = Messages.getString("IConstants.createdateafter"); //$NON-NLS-1$
	
	public static final String CREATE_DATE_BEFORE = Messages.getString("IConstants.createdatebefore"); //$NON-NLS-1$
	
	public static final String UPDATE_DATE_AFTER = Messages.getString("IConstants.updatedateafter"); //$NON-NLS-1$
	
	public static final String UPDATE_DATE_BEFORE = Messages.getString("IConstants.updatedatebefore"); //$NON-NLS-1$
	
	public static final String OFFER_DATE_AFTER = Messages.getString("IConstants.offerdateafter"); //$NON-NLS-1$
	
	public static final String OFFER_DATE_BEFORE = Messages.getString("IConstants.offerdatebefore"); //$NON-NLS-1$
	
	/**
	 * 查询属性值key
	 */
	public static final String ITEM_F6_PICTURE = "F6_Picture"; //$NON-NLS-1$
	
	public static final String ITEMREVISION_F6_PICTUREREVISION = "F6_PictureRevision"; //$NON-NLS-1$
	
	public static final String PREFIX = "f6_"; //$NON-NLS-1$
	
	public static final String F6_BAND = PREFIX +"Band"; //$NON-NLS-1$

	public static final String F6_CAR_TYPE = PREFIX +"CarType"; //$NON-NLS-1$

	public static final String F6_INTER = PREFIX +"Inter"; //$NON-NLS-1$

	public static final String F6_INTER_OUNTER = PREFIX +"InterOunter"; //$NON-NLS-1$

	public static final String F6_OUTER = PREFIX +"Outer"; //$NON-NLS-1$

	public static final String F6_YEAR = PREFIX +"Year"; //$NON-NLS-1$

	public static final String F6_SUB_BAND = PREFIX +"SubBand"; //$NON-NLS-1$

	public static final String F6_ANGLE = PREFIX +"Angle"; //$NON-NLS-1$

	public static final String F6_COUNTRY = PREFIX +"Country"; //$NON-NLS-1$
	
	/**
	 * 每页显示条数
	 */		
	public static final int  PERCOUNT = 30; //$NON-NLS-1$
	
	/**
	 * 暂无图片
	 */	
	public static final String  ERROR_PAGE_NAME = "zwtp.jpg"; //$NON-NLS-1$
	
	/**
	 * index页
	 */	
	public static final String  INDEX_PAGE = "/index.jsp"; //$NON-NLS-1$
	
	/**
	 * error页
	 */	
	public static final String  ERROR_PAGE = "/error.jsp"; //$NON-NLS-1$
	
	/**
	 * login页
	 */	
	public static final String  LOGIN_PAGE = "/login.jsp"; //$NON-NLS-1$
	
	/**
	 * login页
	 */	
	public static final String  LOGIN_FAIL_PAGE = "/loginfail.jsp"; //$NON-NLS-1$
	
	/**
	 * right页 查询结果显示页
	 */	
	public static final String  RIGHT_PAGE = "/right.jsp"; //$NON-NLS-1$
	
}
