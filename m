Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7804C55E69
	for <dtrace@lists.linux.dev>; Mon,  9 Jun 2025 18:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749492420; cv=fail; b=ZD1kOTtLi6jd0e6jOT7lIEQuUpnuiulZDG7kEjLoKtTMthj1qrSPa8IEQn7QBJpIj3DQwOCGPO+fdsfH43utrDkkrgqt6XCsJyvVRdOVJOfjy9LbgVdkyss+X8GMeFqgmI18rBEcOmavSmI4N8bTjJp0XyQCIycRTk9a2ka7geA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749492420; c=relaxed/simple;
	bh=bQUC/Tvje3XmWE4HgeNS9zSnAujZ+0PdEbUmUoVALzo=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ieekxi8K6XAp1khm3QilENFe72WzXtYIklS/s/PkI94QCCKzMhW4u8hw015M+PQ7HwKz7ao8xNZl9iWTLBg8sdHwfxLRibv3NLv5dbdF7p0Lm8Av80Ugqw2PQ5iTJHUodapiC0cYZbxmcMB5OkEzoXWJVG69qnb5UWShkd7oPx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iTt/R5nU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=thdyOGC/; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iTt/R5nU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="thdyOGC/"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559FYbcY006885
	for <dtrace@lists.linux.dev>; Mon, 9 Jun 2025 18:06:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=cuSN+nzc38hgViwp0xiswI9AxFNa2kgp38IsKSXLlh0=; b=
	iTt/R5nU7V1gkPqXCioWmsavackde5vXyfZlBAgbWKHPYogtHxSoS+S+JHImXu1b
	HroyHYtQn50/ukLa4P0pX6G9/hu9rObFqpU9fK25/uyf4IdqHN6qzaWQYFNCfHh+
	sLsWjikCnZ6NPUQDKMSGbmqqJxDWI/8nSC6noRKA12TlU6MP38vXwgSK1FWsy3MA
	zM/21goVcltdV6/n4GpTUZPp4ipKYffnxr4krVo4YShtzjARMxKrynNa1UbqCpCe
	j/fhieSTePGnP4WCj/HX1hBA8pXusAS5+6ahwme9qUq8cudafY9Yv5ZFrZ/1ALV2
	H+t0aNf1brTP+BJxMjnTOw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4752xjt1rg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Jun 2025 18:06:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 559HKxNb020244
	for <dtrace@lists.linux.dev>; Mon, 9 Jun 2025 18:06:56 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bve09bn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Jun 2025 18:06:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=llpq5Mm4/5yZiKejkIEpbLG3zod6sJjNxiT+lO7xOaIMi7BMgQyJr0K+M0mRFTHqPQ8+ZwNmFn1FATND5RkiU1lhkDok3LHUHHEjSsVJw7ma2WdjK6oHhHE3o8DHTT5H/UNrb16P9hn53eIw7kIT9O7YZ7izwRg+ajhR7iZXKS98iuYAu4kUs92k2NEVXYRIKryNKdCZYQ3kp3HCV/mDhndhMUm30fwdSVrHC47D10AqS9UrpZlreNR/0HNnfJefuLYVC9+rKodS21GkEBKEDtNeJY6PC726rZ58NUtQnl23PJ+7cki8DEx9hvg/OobtIprPTU1L3UPaAhtaTbDLuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cuSN+nzc38hgViwp0xiswI9AxFNa2kgp38IsKSXLlh0=;
 b=pha05o6RZ9COlUdvz2i1eR0u7zXT5EgCy7l7XCCASjOslt/FyPiOUC8mDGli7IJ0IHQx5gt4c7bTvdey5KI4SpZMdOxj+PJ1tnBhtUKSXtvg/ts3l389M6dM0zZZXoACMcrQMDGm6rFIv3nz+FBIx6Hrs7IbuCxddOQTHDnsfR+vs5vjoeS0+DDSozbn2tzlXGlKWiax5xqtRQ2fJSX0e4TTeoKmIMV802zaMLKBz2XZ+kJtV6EXOCcM0zaWQMR5PyWiKBsanX5APt6cUR/SE+DI4LbWNVDRWJVDRnKBFeMPrjs4IyEnSL42WXMvFqmLMVysQPRP1gXr9/J2IityNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cuSN+nzc38hgViwp0xiswI9AxFNa2kgp38IsKSXLlh0=;
 b=thdyOGC/cW5c09k53fQ5yn+RtGqZOQy1fGSZ08fefiqraFKtAnQ6De8bFhE+C7tph0kzpLQ4QpwVt2/FjQCkdhuhVukQwCu5FI6wPOn/x7AoLExnaZdy4d0xGxszx+yxvID4fV2aCodmNavZpTa37U9rIh4wXD7s9CH3En7R/qk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CY8PR10MB7266.namprd10.prod.outlook.com (2603:10b6:930:7c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Mon, 9 Jun
 2025 18:06:51 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8792.033; Mon, 9 Jun 2025
 18:06:50 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Suppress some white space
Date: Mon,  9 Jun 2025 14:06:47 -0400
Message-Id: <20250609180647.4424-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0065.namprd03.prod.outlook.com
 (2603:10b6:408:fc::10) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CY8PR10MB7266:EE_
X-MS-Office365-Filtering-Correlation-Id: aca71db8-42b8-4e91-1ac3-08dda7806853
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?setlZ44iIku/5yD2BXDReKlqDabCHC1s3whz7xEGFCDpBlLRB5TmlMH75fWR?=
 =?us-ascii?Q?+afv8tB01G2vDP/wgRTVR47m3FD7la4f9QM1z/Soyphb8mOyecE/dFaPGCBK?=
 =?us-ascii?Q?JE7jOhGrvQujlphB7za7GqEgykAGe9cKl3ZXIeQiwqp+18yOlmlYOteTboTO?=
 =?us-ascii?Q?b4XtVymlAK4mXZXgxXsx90Hx6NFyeZrTCPnMTI5LyYJCxmZt96jZAwIx8vwo?=
 =?us-ascii?Q?MxlD3amklMmFO6F8I7mJGFG5p+TFGOe48HvRDIZ400/RoTjBRbDGxf7EIuOs?=
 =?us-ascii?Q?4vAEoB3gCk9QYBP7pfldHD+nKjswmPRAVEBzNGZyMRhmnJQV7c/zhnPz2hd+?=
 =?us-ascii?Q?GFYxH84AouN69tO+u+hjjxUtsWNEHgZS2iqltAlqlHlE+weGzb7MVmrP5sah?=
 =?us-ascii?Q?xZO9gfc4R7QUVi3CYrXI2NyJujcgcUPLJdlSieRutUMQeRl8UAQqwn+lffN2?=
 =?us-ascii?Q?Euco2jajNSLQ8epIXAV1rNyJhcMtBjdJDV+zE+faRY1BjK92lMjvAOu4ESjO?=
 =?us-ascii?Q?WgPX6A86vnhQu9O+kW+Vk0Nir0J3Q1rdLSGNS5h1wDWrLqOvjL54ictjqxNj?=
 =?us-ascii?Q?kJ/rp7lmwy5N8ef4ns2ZtSJ9kvEzna/vnPD/lMEwg3t1Rq5GiVBceY8v+TN7?=
 =?us-ascii?Q?mb8uOX8blp36+5RW9h7Q1hVM+ThW4erYvT+IKStBRY5bprl2AcM6FTCtfNho?=
 =?us-ascii?Q?kEdw2SRmny8+YFp1fDKUeDWRt+fH1k6CAF34R3PmsuxlkmVGwO5gAIYq2NUb?=
 =?us-ascii?Q?lC7qUnBeARuuPupY4LJW5ynUblqbgamIUDsPOVJ8Nm2EuEiE9YaBKOz2W5jB?=
 =?us-ascii?Q?ddq8VFv16iEfCES5ewuJSdBSQ010o2XjPAWQWl3vSowyrsT/wrim2og2RVoX?=
 =?us-ascii?Q?w70uVzWaSzYiAdoQy+bC7lasDrgIFk1X8tbdDQhjDFbyd4LQ0mxSk9soqFq/?=
 =?us-ascii?Q?562VET3okipfmG+7qAdy7EO/T+4RGak5aGp4UaLj3h5OcCtJ6lQsnM+CnQ+c?=
 =?us-ascii?Q?wO+jKNX26yzQUbe7rUMooxQO1uk7F1OiHxv+0VNM87UwMu2B6DLh7+aLOJaU?=
 =?us-ascii?Q?h1P/uNpZoiXCPyyTYlcngjWb2gO9iNZBtelA58cV/5JfTPJCa5mcD0uHaj9Z?=
 =?us-ascii?Q?jrCefteEXDbZ/cGiWbm/SFVvTkqrdUHu0Su19Ac2RE1ysTGxkRLzFAI6z3lI?=
 =?us-ascii?Q?bY2KZMTvev/Pmt9BMxUK1uf3FKmIz62fSGAcx9/shwZ4AF9iKdARzznOUoi0?=
 =?us-ascii?Q?q+hYdgkRXHNw9AooirCrAK/bpUazZqCrNjiWzQbMgOQb07i5Bptw0L0Ql8gI?=
 =?us-ascii?Q?HOAzlec2oimDVaIAicgfopNutVnKFRynFrp+JqIm3bvL+XyV5B0CFeCsG33N?=
 =?us-ascii?Q?qWOoVxAiOWj8L6Ol135U6PlMge+X9ri5n1+EkqKMGdbW/9m9CRA3I2HEe+NV?=
 =?us-ascii?Q?9OdqPsCkSK4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WoHE8hD2gzuXS04HMW/LcICfQf6auJNM61t1Hb5gDJZam3/tIg/wf7kwAtaI?=
 =?us-ascii?Q?i60D4sEPtnC+hiRNMZ/ShnfkXg3B6aafzs4pIKDTnKas4/izlLIpcTmErPX1?=
 =?us-ascii?Q?ndC7pvjv5yARsU790F87tungQGeHjq/0f1DrcJ151z53cDYXbmp75CWmhypr?=
 =?us-ascii?Q?TqSw8irmte0vZioT0phtO23DRkYG1P84K1wgVxQUuLichbN6p/XafULrfG6w?=
 =?us-ascii?Q?QWJdsIWFYKniwxM7RuNJp/bjkyzIE9QioS9QRKDXbXHdLR8qXWu0mM3ZFVCo?=
 =?us-ascii?Q?U0wY4DOXuo/Ju4clSH4OQ5WQtBKrLsjnIPHder7s0b+R+gv0Bna3VksYsZg1?=
 =?us-ascii?Q?U22QKHJF/wDboTE4wvSZcMPES/kC3sa1M1GNqpuHZPmK8FZ+WczDngAutw44?=
 =?us-ascii?Q?Ie1PRux4wMj9xLUKksSefKBvwPSD18Lvl10TBuG7jWb/MzfW1xyin9F3kjVY?=
 =?us-ascii?Q?F+sfrmllFGrbso9nU164ZmcRvilUkeRwoJl6D1kwXGQmAgle2nKNDk0wGlXw?=
 =?us-ascii?Q?HwqoZNsuxUOkgfMs4VUR+xl3IP7Wl/LMwzIKB+nvRm2gjGyids57NoPkrQdK?=
 =?us-ascii?Q?766mbFzcEBM4VWwqaLyFSmRJ+epdEa8EG/ywd9padr1PGfk2uQz6K5YKHxwn?=
 =?us-ascii?Q?8BJxi04q8Wo5tPJx4+9CTAoVWbfbuphqtEP8oj90uHHzJq5+V50Ds2/99ejT?=
 =?us-ascii?Q?1KZafp6EzUzcBsbdhHR+ywCCDNkMTOmRrAkOaWUwOmWfyPkTeqRZi8mC829H?=
 =?us-ascii?Q?yOl86qDlL83W/APd0xLslyVrBNIUOt04zckVF+jMLxwZeqF+esGVXo97gmY+?=
 =?us-ascii?Q?Krn44wJl/xgr0wg8SVcPV0s14Ah/1sUOdaNzdYmJwUUCgXy19o3oZZrMphq3?=
 =?us-ascii?Q?dwrmqAsqCLdXve3uY2uoP+iZ9jNFWzevA0Q8RZhpehBp3FB4h3OV56QAcKvS?=
 =?us-ascii?Q?uhS2BOrl9ZBLh7XPc2aGz1mxJT+eJU2O1nznaIObQ9U2hf4KTrSrEv4hpNw/?=
 =?us-ascii?Q?92siM+4rcDN+XRsiWKljx5Ab8a6Ke1yDhuPN55pPHZS35yUYXAwscAFScvk+?=
 =?us-ascii?Q?eKz35yspo0mnMbh7Jb6cAI6L0LmZFmoKPao5z6FUkWZ1dzloZzVHO34opMw8?=
 =?us-ascii?Q?EcrdI6512gnTj/0Yl4GM6Z8sUmE5UG5GdZ7+SNCXDPTn64zOBrZ+0xR/onFc?=
 =?us-ascii?Q?cVM4hp4TvtfCOeFqiPO5AnG3zC5CvPgBwiVT40BT2R9+bBCs0fPIe15KKkZp?=
 =?us-ascii?Q?glqzouiA4bKFcRi+WmnfTTf0h26V/as4cYbygytAKiFc+ebkRCGarrzy6qHn?=
 =?us-ascii?Q?O8MFgVKy2aEM8uyHsb4wgwfsLMc+UXelf/4XQQlnAcoYZmGvN/AnN6kGUhA+?=
 =?us-ascii?Q?qONNqtY/6fZZiVrCLWcAkQFIsFjwvo9igux5Y+ZddEIYTrPPk7gf/e3UpKqf?=
 =?us-ascii?Q?XprDUM8VtLzXmllHaWOsKqv99D4F/TNWX9Rwk3NkRRM1jL9+72eR5y39cp+4?=
 =?us-ascii?Q?5TAujzkitcM/A2OcJwrMrA6i4a8aywVifT8ByZLXiSiXVPkSTc/5OzMjwcA3?=
 =?us-ascii?Q?/EtoZ+V1SJV0hxMnZKpaYlWfwpdg7iIOnJzI5WQm?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ldHq4np0pSx9pI2OJd8oNq5UmVnJpiqI8ZtMyh/im7+P/JIB9wta3NYOZE/HQzIIetuZ8OeiLcs8XfPnWTC1kixDqzOHnuyd1RPC/w1tuW9SvpePfgc3T9I32CJuxNyhYUhUO4EAsxxnF9gFGlEUfKZaxDM6Nq64afaIy2vzyW3CmeI4Ai6UCG+pO/lXnJLLilx6DLr4mfQcxa3x4X472fbZFgswU6Bp8ZPDCgESCCKBYR9x9Q0TmCQsrZnzFLEgpsp8aG9SXAuOjeVN93BnL4Tbaizs1CLCVJ5Tptr+LZjMYmRCrMEE8bq93oHxEpL7zeibIrHwZd9I+VDAU5+M79W3uFjr3+2uCA1/SxJX6y8ylIa91nsL4mLGqfaK8mNVhOW2Ym3e008gE7FatVp+cdeWk/GGLtwBnNEnVQ+4AUWKxtC68sbFkd1xAl3K1G77Eyd+K2jYbvEucEJUOanugQCTSr5rvGBrFduMA6/9FMFEQF0uD/JSKukoQWp9WUyqojgqQvzegXxYKEexjHEd2UFg34/PYrm+ij3LU7gclv1SfH4mv5y5CzskQiE0wLSsYtc2DES9LD1azkoomYpOONFglag6fdLSVlQJ5iMFBPg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aca71db8-42b8-4e91-1ac3-08dda7806853
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 18:06:50.6698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NI40MRKYIZc8CxauXb63HDzGYkL3NL2YBxjyMlQFMF87w+9pQtUFfM+WGyZf2O7wORGYeVRrZBkBz5zRFVVkWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7266
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506090137
X-Authority-Analysis: v=2.4 cv=K4AiHzWI c=1 sm=1 tr=0 ts=684722c1 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=e6X9r2581amxoreZIvQA:9 cc=ntf awl=host:13207
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEzNyBTYWx0ZWRfX7JoXavde7zp2 rQx04CktixurYPK0ieM9H7vUNUlJ/2fRVvV3/bAtZgxnnAxBOVuz/4mLIZc/IQ/9WzBS13pQJ82 y/5r8PmyA7vmVP3D5x+CacR9BjGrcvawoHSjeRGewsiKlh5wjfwv/KEWa3jWg37VWJdvdB/81q1
 JX3hVuT1QJ9/ZFgG2hwaOtb1O76xkuC2TCCqPSP2Ic+erDQQFOVoWClHQ6UeiL45T8VIVWi2Tx8 ry1I4PuS5KeCDbbMj263L2DF2z7rop0BkM+2x//AIP9VMRb90uMBFj2f4yLIjZPeQyXhHp6Zda9 B0+Ol/0dwNt3wpuBt8xB74Gs7dgLnxkbeyd3PWVeLuVU8Fp0fmTVDJ/MPl76pEcM3xv93RdNIeY
 j3jOyABN2iFo3CPCfOP0oD3GVC+smrXSkERad97nKtRo6S7bcq4sr/6Hi/U5yjEAuzWTbvWG
X-Proofpoint-ORIG-GUID: lbueLmDdXMtedSQ8lx1tpnUgvtxBFNju
X-Proofpoint-GUID: lbueLmDdXMtedSQ8lx1tpnUgvtxBFNju

From: Eugene Loh <eugene.loh@oracle.com>

The test suite turns pointers into "{ptr}" so that results
comparisons will not be sensitive to particular pointer offset
values.

If these offsets change in width -- say, from 0xf0 to 0x100 --
the amount of white space in the postprocessed output can change.

Add additional postprocessing to a test that sometimes fails due
to this problem.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/aggs/tst.ustack.r   | 32 +++++++++++++++----------------
 test/unittest/aggs/tst.ustack.r.p |  3 +++
 2 files changed, 19 insertions(+), 16 deletions(-)
 create mode 100755 test/unittest/aggs/tst.ustack.r.p

diff --git a/test/unittest/aggs/tst.ustack.r b/test/unittest/aggs/tst.ustack.r
index ed26cc5f3..271a0b30c 100644
--- a/test/unittest/aggs/tst.ustack.r
+++ b/test/unittest/aggs/tst.ustack.r
@@ -1,18 +1,18 @@
-  ustack-tst-basic`myfunc_y+{ptr}                     
-  ustack-tst-basic`myfunc_y                         
-  ustack-tst-basic                                  
-  ustack-tst-basic`myfunc_y                         
+ ustack-tst-basic`myfunc_y+{ptr} 
+ ustack-tst-basic`myfunc_y 
+ ustack-tst-basic 
+ ustack-tst-basic`myfunc_y 
 
-              ustack-tst-basic`myfunc_z+{ptr}
-              ustack-tst-basic`myfunc_y+{ptr}
-              ustack-tst-basic`myfunc_x+{ptr}
-              ustack-tst-basic`myfunc_w+{ptr}
-              ustack-tst-basic`myfunc_v+{ptr}
+ ustack-tst-basic`myfunc_z+{ptr}
+ ustack-tst-basic`myfunc_y+{ptr}
+ ustack-tst-basic`myfunc_x+{ptr}
+ ustack-tst-basic`myfunc_w+{ptr}
+ ustack-tst-basic`myfunc_v+{ptr}
 
-       97  ustack-tst-basic`myfunc_y+{ptr}                       ustack-tst-basic`myfunc_y                           ustack-tst-basic                                    ustack-tst-basic`myfunc_y                         
-              ustack-tst-basic`myfunc_z+{ptr}
-              ustack-tst-basic`myfunc_y+{ptr}
-              ustack-tst-basic`myfunc_x+{ptr}
-              ustack-tst-basic`myfunc_w+{ptr}
-              ustack-tst-basic`myfunc_v+{ptr}
-        4             1234
+ 97 ustack-tst-basic`myfunc_y+{ptr} ustack-tst-basic`myfunc_y ustack-tst-basic ustack-tst-basic`myfunc_y 
+ ustack-tst-basic`myfunc_z+{ptr}
+ ustack-tst-basic`myfunc_y+{ptr}
+ ustack-tst-basic`myfunc_x+{ptr}
+ ustack-tst-basic`myfunc_w+{ptr}
+ ustack-tst-basic`myfunc_v+{ptr}
+ 4 1234
diff --git a/test/unittest/aggs/tst.ustack.r.p b/test/unittest/aggs/tst.ustack.r.p
new file mode 100755
index 000000000..16a0451c4
--- /dev/null
+++ b/test/unittest/aggs/tst.ustack.r.p
@@ -0,0 +1,3 @@
+#!/usr/bin/gawk -f
+
+{ gsub(/ +/, " "); print; }
-- 
2.43.5

