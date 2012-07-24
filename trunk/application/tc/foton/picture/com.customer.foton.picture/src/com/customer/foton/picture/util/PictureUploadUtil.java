package com.customer.foton.picture.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.customer.foton.picture.exception.FotonOperationException;

public class PictureUploadUtil {

	public static final String INNTER = Messages
			.getString("PictureUploadUtil.inter"); //$NON-NLS-1$

	public static final String OUTER = Messages
			.getString("PictureUploadUtil.outer"); //$NON-NLS-1$

	public static final String ANGLE = Messages
			.getString("PictureUploadUtil.angle"); //$NON-NLS-1$

	public static final String PART = Messages
			.getString("PictureUploadUtil.part"); //$NON-NLS-1$
	
	public static final String NEISHIJUBU = Messages.getString("PictureUploadUtil.neishijubu"); //$NON-NLS-1$

	public static final String NEISHIZHENGTI = Messages.getString("PictureUploadUtil.neishizhengti"); //$NON-NLS-1$
	
	public static final String WAISHIJUBU = Messages.getString("PictureUploadUtil.waishijubu"); //$NON-NLS-1$
	
	public static final String WAISHIZHENGTI = Messages.getString("PictureUploadUtil.waishizhengti"); //$NON-NLS-1$

	public static final String SP_PATH = "C:/sp/"; //$NON-NLS-1$

	private static final String SP_PREFIX = "sp_"; //$NON-NLS-1$

	private static final String ERROR_READ_DATA = Messages
			.getString("PictureUploadUtil.cannotreaddata"); //$NON-NLS-1$

	private static StringBuffer logInfo = new StringBuffer();

	public static List<PictureItemInfo> getPictureItemInfo(String absoluteDir)
			throws Exception {
		List<PictureItemInfo> pictureItems = new ArrayList<PictureItemInfo>();

		File f = new File(SP_PATH);

		if (!f.isDirectory()) {
			f.mkdirs();
		}

		File parentDir = new File(absoluteDir); // 根

		if (parentDir.isDirectory()) {

			File[] carTypeDirFiles = parentDir.listFiles(); // 车种文件夹集合

			for (File carTypeDir : carTypeDirFiles) {
				if (carTypeDir.isDirectory()) {
					String carType = carTypeDir.getName();
					File[] countryDirFiles = carTypeDir.listFiles(); // 国家文件夹集合

					for (File countryDir : countryDirFiles) {
						if (countryDir.isDirectory()) {
							String country = countryDir.getName();
							File[] bandDirFiles = countryDir.listFiles(); // 品牌文件夹集合

							for (File bandDir : bandDirFiles) {
								if (bandDir.isDirectory()) {
									String band = bandDir.getName();
									File[] subBandDirFiles = bandDir
											.listFiles(); // 子品牌文件夹集合

									for (File subBandDir : subBandDirFiles) {
										if (subBandDir.isDirectory()) {
											String subBand = subBandDir
													.getName();
											File[] YearDirFiles = subBandDir
													.listFiles(); // 年代文件夹集合

											for (File yearDirFile : YearDirFiles) {
												if (yearDirFile.isDirectory()) {
													String year = yearDirFile
															.getName();
													File[] innerOuterDirFiles = yearDirFile
															.listFiles(); // 内饰
													// 外饰

													for (File iofsDir : innerOuterDirFiles) {

														if (INNTER
																.equals(iofsDir
																		.getName())) {
															String innerOuter = INNTER;
															File[] innerJBDirFiles = iofsDir
																	.listFiles(); // 内饰下两个固定的文件夹
															// 局部
															// 角度

															for (File innerJBDir : innerJBDirFiles) {
																if (NEISHIZHENGTI
																		.equals(innerJBDir
																				.getName())) {
																	if (innerJBDir
																			.isDirectory()) {
																		// String
																		// outer
																		// =
																		// outerJBDir
																		// .getName();
																		File[] angleDirFiles = innerJBDir
																				.listFiles();// 角度

																		for (File angleDir : angleDirFiles) {
																			if (angleDir
																					.isDirectory()) {
																				String angle = angleDir
																						.getName();
																				File[] images = angleDir
																						.listFiles();

																				if (images.length > 0) {
																					File image = null;
																					for (File im : images) {
																						if (isImage(im
																								.getName())) {
																							image = im;
																							// break;

																							if (image != null) {
																								String time = getCurrentTime();
																								String imageName = image
																										.getName();
																								String imagePath = image
																										.getAbsolutePath();
																								String sp_jpgPath = SP_PATH
																										+ SP_PREFIX
																										+ time
																										+ "_" //$NON-NLS-1$
																										+ imageName;
																								String sp_jpgName = SP_PREFIX
																										+ imageName;
																								try {
																									ImageUtil
																											.changeImageSize(
																													imagePath,
																													sp_jpgPath,
																													ImageUtil.JPG_WIDTH,
																													ImageUtil.JPG_HIGHT);
																								} catch (Exception e) {
																									throw new FotonOperationException(
																											"image change error!!"); //$NON-NLS-1$
																								}
																								PictureItemInfo itemInfo = new PictureItemInfo();
																								itemInfo
																										.setCarType(carType);
																								itemInfo
																										.setCountry(country);
																								itemInfo
																										.setBand(band);
																								itemInfo
																										.setSubBand(subBand);
																								itemInfo
																										.setYear(year);
																								itemInfo
																										.setInterOunter(innerOuter);
																								// itemInfo
																								// .setOuter(outer);
																								itemInfo
																										.setAngle(angle);
																								itemInfo
																										.setJpgName(imageName);
																								itemInfo
																										.setJpgPath(imagePath);
																								itemInfo
																										.setSp_jpgName(sp_jpgName);
																								itemInfo
																										.setSp_jpgPath(sp_jpgPath);
																								pictureItems
																										.add(itemInfo);
																							}
																						}
																					}
																				}
																			} else if (angleDir
																					.isFile()) {
																				System.out
																						.println(ERROR_READ_DATA
																								+ angleDir
																										.getAbsoluteFile()); //$NON-NLS-1$
																			}
																		}
																	}
																} //内饰整体 

																if (innerJBDir
																		.isFile()) {
																	logInfo
																			.append(ERROR_READ_DATA
																					+ innerJBDir
																							.getAbsoluteFile()); //$NON-NLS-1$
																	logInfo.append(LogUtil.enter);
																}

																if (NEISHIJUBU
																		.equals(innerJBDir
																				.getName())) {
																	if (innerJBDir
																			.isDirectory()) {
																		File[] partDirFiles = innerJBDir
																				.listFiles(); // 内饰局部

																		for (File partDir : partDirFiles) {
																			if (partDir
																					.isDirectory()) {
																				String part = partDir
																						.getName();
																				File[] images = partDir
																						.listFiles();

																				if (images.length > 0) {
																					File image = null;

																					for (File im : images) {
																						if (isImage(im
																								.getName())) {
																							image = im;
																							// break;
																							if (image != null) {
																								String imageName = image
																										.getName();
																								String imagePath = image
																										.getAbsolutePath();
																								String time = getCurrentTime();
																								String sp_jpgPath = SP_PATH
																										+ SP_PREFIX
																										+ time
																										+ "_" //$NON-NLS-1$
																										+ imageName;
																								String sp_jpgName = SP_PREFIX
																										+ imageName;
																								try {
																									ImageUtil
																											.changeImageSize(
																													imagePath,
																													sp_jpgPath,
																													ImageUtil.JPG_WIDTH,
																													ImageUtil.JPG_HIGHT);
																								} catch (Exception e) {
																									throw new FotonOperationException(
																											"image change error!!"); //$NON-NLS-1$
																								}

																								PictureItemInfo itemInfo = new PictureItemInfo();
																								itemInfo
																										.setCarType(carType);

																								itemInfo
																										.setCountry(country);
																								itemInfo
																										.setBand(band);
																								itemInfo
																										.setSubBand(subBand);
																								itemInfo
																										.setYear(year);
																								itemInfo
																										.setInterOunter(innerOuter);
																								itemInfo
																										.setInter(part);
																								// itemInfo
																								// .setAngle(angle);
																								itemInfo
																										.setJpgName(imageName);
																								itemInfo
																										.setJpgPath(imagePath);
																								itemInfo
																										.setSp_jpgName(sp_jpgName);
																								itemInfo
																										.setSp_jpgPath(sp_jpgPath);
																								pictureItems
																										.add(itemInfo);
																							}
																						}
																					}
																				}
																			}
																		}
																	} else if (innerJBDir
																			.isFile()) {
																		logInfo
																				.append(ERROR_READ_DATA
																						+ innerJBDir
																								.getAbsoluteFile()); //$NON-NLS-1$
																		logInfo.append(LogUtil.enter);
																	}
																}
															}// 局部
														}

														if (OUTER
																.equals(iofsDir
																		.getName())) {
															String innerOuter = OUTER;
															File[] outerDirFiles = iofsDir
																	.listFiles(); // 外饰下两个固定的文件夹
															// 局部
															// 角度

															for (File outerJBDir : outerDirFiles) {
																if (WAISHIZHENGTI
																		.equals(outerJBDir
																				.getName())) {//外饰整体
																	if (outerJBDir
																			.isDirectory()) {
																		// String
																		// outer
																		// =
																		// outerJBDir
																		// .getName();
																		File[] angleDirFiles = outerJBDir
																				.listFiles();// 角度

																		for (File angleDir : angleDirFiles) {
																			if (angleDir
																					.isDirectory()) {
																				String angle = angleDir
																						.getName();
																				File[] images = angleDir
																						.listFiles();

																				if (images.length > 0) {
																					File image = null;
																					for (File im : images) {
																						if (isImage(im
																								.getName())) {
																							image = im;
																							// break;

																							if (image != null) {
																								String time = getCurrentTime();
																								String imageName = image
																										.getName();
																								String imagePath = image
																										.getAbsolutePath();
																								String sp_jpgPath = SP_PATH
																										+ SP_PREFIX
																										+ time
																										+ "_" //$NON-NLS-1$
																										+ imageName;
																								String sp_jpgName = SP_PREFIX
																										+ imageName;
																								try {
																									ImageUtil
																											.changeImageSize(
																													imagePath,
																													sp_jpgPath,
																													ImageUtil.JPG_WIDTH,
																													ImageUtil.JPG_HIGHT);
																								} catch (Exception e) {
																									throw new FotonOperationException(
																											"image change error!!"); //$NON-NLS-1$
																								}
																								PictureItemInfo itemInfo = new PictureItemInfo();
																								itemInfo
																										.setCarType(carType);
																								itemInfo
																										.setCountry(country);
																								itemInfo
																										.setBand(band);
																								itemInfo
																										.setSubBand(subBand);
																								itemInfo
																										.setYear(year);
																								itemInfo
																										.setInterOunter(innerOuter);
																								// itemInfo
																								// .setOuter(outer);
																								itemInfo
																										.setAngle(angle);
																								itemInfo
																										.setJpgName(imageName);
																								itemInfo
																										.setJpgPath(imagePath);
																								itemInfo
																										.setSp_jpgName(sp_jpgName);
																								itemInfo
																										.setSp_jpgPath(sp_jpgPath);
																								pictureItems
																										.add(itemInfo);
																							}
																						}
																					}
																				}
																			} else if (angleDir
																					.isFile()) {
																				logInfo
																						.append(ERROR_READ_DATA
																								+ angleDir
																										.getAbsoluteFile()); //$NON-NLS-1$
																				logInfo.append(LogUtil.enter);
																			}
																		}
																	}
																} // 角度

																if (outerJBDir
																		.isFile()) {
																	logInfo
																			.append(ERROR_READ_DATA
																					+ outerJBDir
																							.getAbsoluteFile()); //$NON-NLS-1$
																	logInfo.append(LogUtil.enter);
																}

																if (WAISHIJUBU
																		.equals(outerJBDir
																				.getName())) {//外饰局部
																	if (outerJBDir
																			.isDirectory()) {
																		// String
																		// outer
																		// =
																		// outerJBDir
																		// .getName();
																		File[] partDirFiles = outerJBDir
																				.listFiles();// 局部

																		for (File partDir : partDirFiles) {
																			if (partDir
																					.isDirectory()) {
																				String part = partDir
																						.getName();
																				File[] images = partDir
																						.listFiles();

																				if (images.length > 0) {
																					File image = null;
																					for (File im : images) {
																						if (isImage(im
																								.getName())) {
																							image = im;
																							// break;

																							if (image != null) {
																								String time = getCurrentTime();
																								String imageName = image
																										.getName();
																								String imagePath = image
																										.getAbsolutePath();
																								String sp_jpgPath = SP_PATH
																										+ SP_PREFIX
																										+ time
																										+ "_" //$NON-NLS-1$
																										+ imageName;
																								String sp_jpgName = SP_PREFIX
																										+ imageName;
																								try {
																									ImageUtil
																											.changeImageSize(
																													imagePath,
																													sp_jpgPath,
																													ImageUtil.JPG_WIDTH,
																													ImageUtil.JPG_HIGHT);
																								} catch (Exception e) {
																									throw new FotonOperationException(
																											"image change error!!"); //$NON-NLS-1$
																								}
																								PictureItemInfo itemInfo = new PictureItemInfo();
																								itemInfo
																										.setCarType(carType);
																								itemInfo
																										.setCountry(country);
																								itemInfo
																										.setBand(band);
																								itemInfo
																										.setSubBand(subBand);
																								itemInfo
																										.setYear(year);
																								itemInfo
																										.setInterOunter(innerOuter);
																								itemInfo
																										.setOuter(part);
																								// itemInfo
																								// .setAngle(angle);
																								itemInfo
																										.setJpgName(imageName);
																								itemInfo
																										.setJpgPath(imagePath);
																								itemInfo
																										.setSp_jpgName(sp_jpgName);
																								itemInfo
																										.setSp_jpgPath(sp_jpgPath);
																								pictureItems
																										.add(itemInfo);
																							}
																						}
																					}
																				}
																			}
																		}
																	} else if (outerJBDir
																			.isFile()) {
																		logInfo
																				.append(ERROR_READ_DATA
																						+ outerJBDir
																								.getAbsoluteFile()); //$NON-NLS-1$
																		logInfo.append(LogUtil.enter);
																	}
																}
															}// 局部
														}

														if (iofsDir.isFile()) {
															logInfo
																	.append(ERROR_READ_DATA
																			+ iofsDir
																					.getAbsoluteFile()); //$NON-NLS-1$
															logInfo.append(LogUtil.enter);
														}
													}
												} else if (yearDirFile.isFile()) {
													logInfo
															.append(ERROR_READ_DATA
																	+ yearDirFile
																			.getAbsoluteFile()); //$NON-NLS-1$
													logInfo.append(LogUtil.enter);
												}
											}
										} else if (subBandDir.isFile()) {
											logInfo.append(ERROR_READ_DATA
													+ subBandDir
															.getAbsoluteFile()); //$NON-NLS-1$
											logInfo.append(LogUtil.enter);
										}
									}
								} else if (bandDir.isFile()) {
									logInfo.append(ERROR_READ_DATA
											+ bandDir.getAbsoluteFile()); //$NON-NLS-1$
									logInfo.append(LogUtil.enter);
								}
							}
						} else if (countryDir.isFile()) {
							logInfo.append(ERROR_READ_DATA
									+ countryDir.getAbsoluteFile()); //$NON-NLS-1$
							logInfo.append(LogUtil.enter);
						}
					}
				} else if (carTypeDir.isFile()) {
					logInfo.append(ERROR_READ_DATA
							+ carTypeDir.getAbsoluteFile()); //$NON-NLS-1$		
					logInfo.append(LogUtil.enter);
				}
			}
		}
		/*LogUtil.writeTxtFile(LogUtil.creatTxtFile(LogUtil.loggerErrorPath), logInfo
				.toString());*/
		return pictureItems;
	}

	private static StringBuffer generateLog(StringBuffer logInfo, File file) {
		return logInfo.append("[warn] : " + ERROR_READ_DATA
				+ file.getAbsoluteFile() + LogUtil.enter);
	}

	public static boolean deleteFile(String delpath)
			throws FileNotFoundException, IOException {
		try {
			File file = new File(delpath);
			if (!file.isDirectory()) {
				file.delete();
			} else if (file.isDirectory()) {
				String[] filelist = file.list();
				for (int i = 0; i < filelist.length; i++) {
					File delfile = new File(delpath + "\\" + filelist[i]); //$NON-NLS-1$
					if (!delfile.isDirectory()) {
						delfile.delete();
					} else if (delfile.isDirectory()) {
						deleteFile(delpath + "\\" + filelist[i]); //$NON-NLS-1$
					}
				}
				file.delete();
			}
		} catch (FileNotFoundException e) {
			System.out.println("deletefile() Exception:" + e.getMessage()); //$NON-NLS-1$
		}
		return true;
	}

	private static boolean isImage(String name) {
		if ((name.substring(name.length() - 3)).toLowerCase().equals("jpg")) { //$NON-NLS-1$
			return true;
		} else {
			return false;
		}
	}

	private static String getCurrentTime() {
		return System.currentTimeMillis() + ""; //$NON-NLS-1$
	}
}
