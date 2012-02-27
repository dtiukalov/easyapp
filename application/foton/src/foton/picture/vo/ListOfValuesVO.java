package foton.picture.vo;

import com.teamcenter.clientx.Session;
import com.teamcenter.query.Query;
import com.teamcenter.schemas.soa._2006_03.exceptions.ServiceException;
import com.teamcenter.soa.exceptions.NotLoadedException;

import foton.picture.util.IConstants;

public class ListOfValuesVO {

	private String[] f6_AngleLOV;

	private String[] f6_BandLOV;

	private String[] f6_CarTypeLOV;

	private String[] f6_CountryLOV;

	private String[] f6_InterLOV;

	private String[] f6_OuterLOV;

	private String[] f6_InterOunterLOV;

	private String[] f6_SubBandLOV;

	private String[] f6_YearLOV;

	public ListOfValuesVO(Session session) throws ServiceException,
			NotLoadedException {
		initLOVS(session);
	}

	private void initLOVS(Session session) throws ServiceException,
			NotLoadedException {
		Query query = new Query();
		this.f6_AngleLOV = query
				.getLovListValue(session,
						IConstants.ITEMREVISION_F6_PICTUREREVISION,
						IConstants.F6_ANGLE);
		this.f6_BandLOV = query
				.getLovListValue(session,
						IConstants.ITEMREVISION_F6_PICTUREREVISION,
						IConstants.F6_BAND);
		this.f6_CarTypeLOV = query
		.getLovListValue(session,
				IConstants.ITEMREVISION_F6_PICTUREREVISION,
				IConstants.F6_CAR_TYPE);
		this.f6_CountryLOV = query
		.getLovListValue(session,
				IConstants.ITEMREVISION_F6_PICTUREREVISION,
				IConstants.F6_COUNTRY);
		this.f6_InterLOV = query
		.getLovListValue(session,
				IConstants.ITEMREVISION_F6_PICTUREREVISION,
				IConstants.F6_INTER);
		this.f6_OuterLOV = query
		.getLovListValue(session,
				IConstants.ITEMREVISION_F6_PICTUREREVISION,
				IConstants.F6_OUTER);
		this.f6_InterOunterLOV = query
		.getLovListValue(session,
				IConstants.ITEMREVISION_F6_PICTUREREVISION,
				IConstants.F6_INTER_OUNTER);
		this.f6_SubBandLOV = query
		.getLovListValue(session,
				IConstants.ITEMREVISION_F6_PICTUREREVISION,
				IConstants.F6_SUB_BAND);
		this.f6_YearLOV = query
		.getLovListValue(session,
				IConstants.ITEMREVISION_F6_PICTUREREVISION,
				IConstants.F6_YEAR);

	}

	public String[] getF6_Angle() {
		return f6_AngleLOV;
	}

	public String[] getF6_Band() {
		return f6_BandLOV;
	}

	public String[] getF6_CarType() {
		return f6_CarTypeLOV;
	}

	public String[] getF6_Country() {
		return f6_CountryLOV;
	}

	public String[] getF6_Inter() {
		return f6_InterLOV;
	}

	public String[] getF6_Outer() {
		return f6_OuterLOV;
	}

	public String[] getF6_InterOunter() {
		return f6_InterOunterLOV;
	}

	public String[] getF6_SubBand() {
		return f6_SubBandLOV;
	}

	public String[] getF6_Year() {
		return f6_YearLOV;
	}
}
