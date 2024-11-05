Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C259E215F48
	for <dtrace@lists.linux.dev>; Tue,  5 Nov 2024 21:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730840405; cv=fail; b=r6E/q8oB91OfEDSAlFOnsdMIKVyQbVgWCEJXHvp9DYB5jCMxg1CkQlXw+C4CMns81RfC+g8r/acgK3x4ENXfKbvwXfe9oWeQDnVs+DhPp68iWxlUAAtTSH5IYpUp+PkV+v4YYnsPuOSvb+tW6M5ZeGyv+DnhiwsStCGEe2wQY24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730840405; c=relaxed/simple;
	bh=BL3hjR8digg3yYCSj0d95kb6BOPsZhvEEnEleRN0ZWE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kols0Q9YFM3/U9g3rqqrEn4k/G3NwqMSYt6Ew4jrsx04b+Pxyb92SHkp9RY5Jv5KDPjQsOyvGzr5NyDNLdHKppgEzn9ragy+f1LW5UdY3GKsElhv44QLx5pSA1ymB2VlVdYwcWAssYI2L9freJwWJ3dcN/flF9W1vIk9TuDgK6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bnDr9r01; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rqlOcv2Q; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bnDr9r01";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rqlOcv2Q"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5KfZ6s019850
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 21:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=OZbiaIxA/wAmH3UQp++t6mEx2Bwl5JCqJTUdHBygTok=; b=
	bnDr9r01/KL8khxGHzW1Kr79U1D4PFbWhGFy7/DmMRc2xQVYFRFBAOKW50+R51m9
	TgS4xFmblJ9t188JyCyGMCvU1abIkDS7Ym8MhNhnlsblMAXpEEgm0pnEtJDCxGpC
	ofcT+w778rE1gW4bFICFvzUU9D/t5bhkIpuYbTFgu6Or9Hzb+5sYOZ6/ZcjdW/dJ
	/sHp2vLC6T0xVlulKwg5z4zDa0hIF/z5Ks+lpSy4cLNsPdsHcZhdzKqjkaQ2bL1n
	93Im7VDkpjQpEVeWmo5f3QyqQ2+1EST/hy9IajPQD/soW2gKpJy7YIDejDwOtp4F
	rZPHLFxo/vOJLsp7w7llhQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nav26ff2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 21:00:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5Keb00036822
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 21:00:01 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42nah7nm5m-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 21:00:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCdUzBlvF5vnhRGtw4afKJlQeWXZNOg1wMjEDbF6UgnH4YVXfLJ4XLV3GCiPjjX4SsiPXBi9gOGLij/LY4BiUHmWVpuZmNpAjetcDnCrlQ/dFsbK5fqRXguQaRLexeCV1LlmzmDYwi5NlfsQA5OXEFqVaRgdK7UxeDxVtDV0kiWuje6ntmJSyW9HYtcHDTitd6eXW70HzLUckPY/+3km3FhSFs1S5wY3UZOlfb4cPlaFLO/TI45zK+PtoM8zY1kwWLc7+DyrGbULX49nyxOHJV9WP6ps4uxikxagvJlcWAtDgP3Y4Mh3wSsEHEzzhO+wQrGUlNDDCJExTREkGJrtcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZbiaIxA/wAmH3UQp++t6mEx2Bwl5JCqJTUdHBygTok=;
 b=QnWLNjX2wXeUJBHOfLxZjkpYFMuj+I/S4qd30InYKKQTwhBOBGMPOGqPTWHT1lmNTck4LgXrBrCUfIQzw0Ock9j7GMPRPFAeHISTzqlmt7uNxUugLD1YRZTvrA16k4GSiymsrkmhA3S+REfIUJz/PLp0Pbry9hNSg702nIE1dhV2irlJ9+HQTucjy9DMlxzJKIgbNqNzR39fcg8UEOmLa+KPk0YvErqScY6hUr5Zv6xl7tfwWpspwsScXTKjaUQ/vwyxiCPN6U/LmXmAkW2etXlh0p55AG99qdX6fMuIfvol3HxsLygtrebl/FkYyUQCi0vTzMa+v3Yl/x60TQoG6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZbiaIxA/wAmH3UQp++t6mEx2Bwl5JCqJTUdHBygTok=;
 b=rqlOcv2QBply+K3ywaJ/fE8N8VndN9280BgLFphmCPbPmqSo/aMgHP0xzUZpIPvmHLGuOY/Cc4U1Yimbh231yizZOn+CZvZqSnHzsr+2T9SulAdBGsCcfMP6OLM0pGRgsgCAE4Wvfa0vwX0hPdGnRrxUZZy5N9Dpim4Y3Tiv8WI=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by SA1PR10MB6295.namprd10.prod.outlook.com (2603:10b6:806:252::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Tue, 5 Nov
 2024 20:59:57 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Tue, 5 Nov 2024
 20:59:57 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v6 5/6] usdt: new tests for USDT arg sanity with overlapping pid probes
Date: Tue,  5 Nov 2024 20:59:41 +0000
Message-ID: <20241105205942.192409-6-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241105205942.192409-1-nick.alcock@oracle.com>
References: <20241105205942.192409-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0059.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::23) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|SA1PR10MB6295:EE_
X-MS-Office365-Filtering-Correlation-Id: 28652f4a-0ff1-4080-218c-08dcfddccdf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N1yYId1Aex/mxWn1LWxhkMkGtwwSpvQUyLwiSKRu4uTXe0fyWToKL5qjkzen?=
 =?us-ascii?Q?qDQcRma8Qu1fPLAab7cOrHi7LFKMLWQnXfvJ3LDMhyi4Rjb5hwtQ7kVbBq4m?=
 =?us-ascii?Q?3ZvkbO6H/LD2FDahas5NKNHR8MJfJnVF5aDEMAznJPSesta4q37TGthSTy1T?=
 =?us-ascii?Q?QxJCACw+l6iuLrW14TJxF79cskBg0vttN6rOVR/5XU5lD5U9n7K8lyctJ1GV?=
 =?us-ascii?Q?OXJ1upMgwYPUZZAMFjqV7jW0Yg1hkScLz21Vt549dbL293LkfLt5nj07shtd?=
 =?us-ascii?Q?YZx00tvL0/ZgKetPJ1Zp/Ofr9Qiw94xDp5G5gBQLmdHBniWBSNmsNTJ8xbjH?=
 =?us-ascii?Q?kItsbW3CCjmTsMf1J793zkwHbuPT01ZHe4SDwQUM63RSD0c+K3j7c7BJNjkg?=
 =?us-ascii?Q?c/Zv6vTcjDEZCuu4+VfBGZeVHHoJw727MMBWsygQ/uPmhVHNA3U+4ShG0PvM?=
 =?us-ascii?Q?Fa5bv7kRRlyYPqdXUW2mgjOzh1doU9/oedSHOVNEI9KGKLujm/HKU4womR7v?=
 =?us-ascii?Q?KwPJvPryl88KRbwGbZdT7CCFcfluKHy8qO+I/TBIB249qb5UbrESrEN+Dv05?=
 =?us-ascii?Q?mbrF2/ABaKmDYQdEi8Q3LAeCzCRjMQzyLl8Ud7HGA2v8cuhGITtH9xHrmj0r?=
 =?us-ascii?Q?EGzHZWyLp+jHWn1kDKixcI2SOKoszf4Q1s5/FhpR+TmRgKOTMHnoTPHEGkR2?=
 =?us-ascii?Q?sSQffzGcXC6bIHQ+9q8iTa/C3ixZL5w3666CIIQ23LcDDwiKDNOsAXxX2ZgG?=
 =?us-ascii?Q?utc+RKEBAMXAVsSrhHzbsKnUzZ5Tw/kOD8dbPsVKTIOP8pZ7A0FQuqFR/a+Z?=
 =?us-ascii?Q?RvEpT8slAhNBlmA4Gj9fp5u6zqUx5m57ZJlrrK/kdTPL4eH3/p8Xl+Y4KrcL?=
 =?us-ascii?Q?kcLVAcaez6NTJscgimQdnmlCqgeEnhHEKg/Un6addFxmnykXE+/IZe6PKlCU?=
 =?us-ascii?Q?vsjHfnSGpA34+CSq77fMVcK4sLAUkih8XGkCHn6ehJ0vAu2cy247lsg0fmNR?=
 =?us-ascii?Q?9+miU5p1GJkcl3epAPJxoB3zIUVPzIrCTeHmnhQTLAjsp0Q189Z5vvR1T/Bb?=
 =?us-ascii?Q?V4EsT9odkQG59JKNyYEJ5/Y7Px+nQon9pOtZY6+RTfOh1+RK+H5wFwB5nUkF?=
 =?us-ascii?Q?HMEXwLZl8732+UvnLlKSIzlrjCKpDBBVz2XNDyYYt9zWox+LA7Y8To+xI5Qj?=
 =?us-ascii?Q?J7cBCHYwOwymDH7eHBIzrvqBCzxHoYOVtRgj+WgIezVY7sV5XYe/9ZSfO0X/?=
 =?us-ascii?Q?bqOm649PIz9MUwKBpMlE5ehO/zVFwAY6fdGUuLEn1CqLkzUMGCnra0LbaXB/?=
 =?us-ascii?Q?NpL1/ymR+DUxtCzB8py7kK2R?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PfEeb6FpyIT8/ZjmReRXr1Sb8YnLWkQlaS1qP71RSwgE9TRZDBe5+Q3mkEpC?=
 =?us-ascii?Q?lPPTR1Oi0OYx9BSXM6wvkq/+KpR5L2Oy4t4e3eTKnfjNa63e0FudsZHnLu3g?=
 =?us-ascii?Q?TY0qG2HfeC++FeJ3YHN1UciN0ACHGUVTK96XBFMLMuD7Wo4uMMLE3Gn84ZNe?=
 =?us-ascii?Q?WlSdzgvidPoZdvrYHSCTm6EMz4NFGN4j6HKdtZPGcNJqqcQgueRiPwKPt3d7?=
 =?us-ascii?Q?686SzfbSlXISkfpl0+QZdo/ArkZSBb2uryq/WI2upwOS7NvOiSoBpoKllePw?=
 =?us-ascii?Q?rG/KfOHDSs0B3MkX50B0Owy4Jk+ncPArJcUyYj1TY/soO9JbMmDISlLoKbzF?=
 =?us-ascii?Q?oDzfbCPn9HLKNPshEb7Z6F1AFyeXJ1SAbBPUE5bKAQgWbxaYl32Fx/gsszpU?=
 =?us-ascii?Q?1ohAU+4aaS9y6o+e3HQQ7pWbEfAEMgQovBmA/6wzMdjaDskoA+kITCD/fhTb?=
 =?us-ascii?Q?wJe23K3FzwW7KF0YG/figDtPTKrwfNp9ecElb3TLsv18q/BDM8hSZGl3/MRD?=
 =?us-ascii?Q?yUnnnOaoTtnm+fpGfjgjj+6RzzSHzc+kDfh3zy3C/fuu27GYnDZn9d2z42mF?=
 =?us-ascii?Q?dxKPWuR+faJs9LL1ZbEb23ysXZyl+4Fh3ts/CPjtIE2qVJHqmBU/S5k9VtTA?=
 =?us-ascii?Q?erbVGe897HFDj0eJVFfKqiPV93TNC0k95CmhsicH37qey/StJA9HkyZIyXWE?=
 =?us-ascii?Q?UW0VWwZu0OtQTBrQLwBpoEIXzu/fNQzrrpW0qdzQGghHmHvm8vJUl75yyDwN?=
 =?us-ascii?Q?A/Vejmojp4ssHw2yGW98YCzU5l/I3B4waiomejYb+YcUud03ejfwqxMIhhuB?=
 =?us-ascii?Q?vOvBe5uxNfJVvCZw3BCx9o4ni0Ue3N7lzJ6yAAgaRJKLUTCVBwHY9QfvyYDj?=
 =?us-ascii?Q?ZEB2ymgcOpEU7f184LDbLwzxou/qMoD65Zd8plXCJdGnyP0t9tauxapTXdZH?=
 =?us-ascii?Q?XtSIJ9I1OARTdEg65MCBLNjLHQVGQp34AbcNY4xPNdfLZ9cyJcELmERQgvb+?=
 =?us-ascii?Q?sBNWFUCDNjdMbHLct3miDTlJbg6ntVwO9Xo+uXwIZwoHAfPhe5FoPmplExx2?=
 =?us-ascii?Q?aK0W84pWm+bElRkw4tbJH/9loGLUAufMRISrKy2hmfNmhWarUKNLVodeCUNX?=
 =?us-ascii?Q?O5PybPg9hxFxoL235c+8swOcRPKkUiiT35ND5RlH9WhfJRju27d1Fi93bR6h?=
 =?us-ascii?Q?4+JSfUnM0uzLli3H7sioxc6q1UtjwHunPYnPS3e/GkCQLUu4MXoNgo1kyNfH?=
 =?us-ascii?Q?eJLwUiOBGXWbZ8UPDQsiuwudQuTFkIerLcL2XHfccZOGmgEzTWTzPHCxjfKW?=
 =?us-ascii?Q?BggLYSnwS/MPHRENgu3TY7wqPosr8+6HUWRiHNHAVODzV+oxaXV2YEg23aGL?=
 =?us-ascii?Q?umkH8vZIYjTxBk9OWhFtpyV+0L4nfEW5VUeIjrbrD/xWb9zIcRh1ar6FMCXw?=
 =?us-ascii?Q?CDWX97LkHT7KR0sqSLuXL4EyEmbvXx2zuujFsALji3jJFBEFqsdSQMIS9PK4?=
 =?us-ascii?Q?4g3gTNqks2yIoNj5qiuG1ldCHqzAaBVgvMsnr+HlkO/dp+nXm+j5B1RgATwq?=
 =?us-ascii?Q?NpnF9BajHFtzGr/YP+qpBGirC8E5nBFO4hc2npXA2KHHpnUOhdFFwjalUBa2?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QK0kkrm65hWFsZsJmHivFsJVUgWfox4MOOSsAZmIZakKEexIGvJ1h0zM7YTXIuR1TIrSyhVFLjE7gEpt1fgvO6Qh29FC6mCZ2T4YAy0al4FTyGsqwXKYS6Z5/TaarEMqGIXBtuEXVy+2gBKeNxkXZV3n+XR4MCDOdkkQSw+yn17PXYEMw1JOJvDvXfelMCUti2wyPpqvkUGpe7XojX3bUz+ti+98FsjzvFa6OrNbFgPv98xFOCHynife74NGJrYByVFxKa3mdmFJmGACO5wH2KkZNn1lStxGzYaqgxcaZnUdKKVV4dApHdmzx1MH/80jS3DlxMgL8JdlsMTTaJV5XSSHD9JbPL9jRWszR5MAy0vCiBGk3uMrb36FuzbTIGETqKECv0hdxkzVadc85T1cdFmJTpM4C4ykIQ9/ALQwGGVgphKGsnuf9fCv3YXT7ershs2eiF/GcVrrx8NIttRysFvZiFkU2SrVEPgOEcsGgFylRvjxnvHf02ZFwGnrjqCZcRxpVf3ar35uPbHFcMZzygxa8viXuLAGXHo70ILqacIRm5mC6VEtqPYHu+anrkd3PcIhh7PUJUgbV1YdvMyZ9jBXfMODpslCO9P64P//Dyg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28652f4a-0ff1-4080-218c-08dcfddccdf9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 20:59:57.1552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XG7wHNy3cwET1KrZ3f7X3X5BTFBVVPuxPyWxcaioXUfTC1FTRJzNJU9rHTtWCTz5bFwDEcSi2o7ipa7cT1VpPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6295
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-05_06,2024-11-05_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411050162
X-Proofpoint-GUID: RSj8jrDtOTvBNr9apvM9-yPxYHEMbOy0
X-Proofpoint-ORIG-GUID: RSj8jrDtOTvBNr9apvM9-yPxYHEMbOy0

This generalizes the existing tst.pidprobes.sh to check the args
reported by the probe both with and without arg mapping in place.

Everything seems to work.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 .../usdt/{tst.pidprobes.sh => pidprobes.sh}   | 56 +++++++++++++++----
 test/unittest/usdt/tst.pidargmap.sh           | 11 ++++
 test/unittest/usdt/tst.pidargs.sh             | 11 ++++
 3 files changed, 67 insertions(+), 11 deletions(-)
 rename test/unittest/usdt/{tst.pidprobes.sh => pidprobes.sh} (82%)
 create mode 100755 test/unittest/usdt/tst.pidargmap.sh
 create mode 100755 test/unittest/usdt/tst.pidargs.sh

diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/pidprobes.sh
similarity index 82%
rename from test/unittest/usdt/tst.pidprobes.sh
rename to test/unittest/usdt/pidprobes.sh
index 25fee85537fc..aedc6256f195 100755
--- a/test/unittest/usdt/tst.pidprobes.sh
+++ b/test/unittest/usdt/pidprobes.sh
@@ -5,9 +5,12 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# This test verifies that USDT and pid probes can share underlying probes.
+# This test verifies various properties of USDT and pid probes sharing
+# underlying probes.
 
 dtrace=$1
+usdt=$2
+mapping=$3
 
 # Set up test directory.
 
@@ -17,13 +20,21 @@ cd $DIRNAME
 
 # Create test source files.
 
-cat > prov.d <<EOF
+if [[ -z $mapping ]]; then
+    cat > prov.d <<EOF
 provider pyramid {
 	probe entry(int, char, int, int);
 };
 EOF
+else
+    cat > prov.d <<EOF
+provider pyramid {
+	probe entry(int a, char b, int c, int d) : (int c, int d, int a, char b);
+};
+EOF
+fi
 
-cat > main.c <<EOF
+cat > main.c <<'EOF'
 #include <stdio.h>
 #include "prov.h"
 
@@ -48,7 +59,7 @@ EOF
 
 # Build the test program.
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >&2
 	exit 1
@@ -61,12 +72,12 @@ fi
 if [[ `uname -m` = "aarch64" ]]; then
 	objdump -d main.o > disasm_foo.txt.before
 fi
-$dtrace -G -64 -s prov.d main.o
+$dtrace $dt_flags -G -64 -s prov.d main.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >&2
 	exit 1
 fi
-cc $test_cppflags -o main main.o prov.o
+cc $test_ldflags -o main main.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >&2
 	exit 1
@@ -75,7 +86,7 @@ fi
 # Check that the program output is 0 when the USDT probe is not enabled.
 # That is, the PYRAMID_ENTRY_ENABLED() is-enabled checks should not pass.
 
-./main > main.out
+./main standalone > main.out
 echo "my result: 0" > main.out.expected
 if ! diff -q main.out main.out.expected > /dev/null; then
 	echo '"my result"' looks wrong when not using DTrace
@@ -88,11 +99,25 @@ fi
 
 # Run dtrace.
 
-$dtrace $dt_flags -q -c ./main -o dtrace.out -n '
+cat >> pidprobes.d <<'EOF'
 p*d$target::foo:
 {
 	printf("%d %s:%s:%s:%s %x\n", pid, probeprov, probemod, probefunc, probename, uregs[R_PC]);
-}' > main.out2
+}
+EOF
+
+if [[ -n $usdt ]]; then
+	echo 'pyramid$target::foo: {' >> pidprobes.d
+
+	if [[ -n $mapping ]]; then
+		echo 'printf("%d %s:%s:%s:%s %i %i %i %c\n", pid, probeprov, probemod, probefunc, probename, args[0], args[1], args[2], args[3]);' >> pidprobes.d
+	else
+		echo 'printf("%d %s:%s:%s:%s %i %c %i %i\n", pid, probeprov, probemod, probefunc, probename, args[0], args[1], args[2], args[3]);' >> pidprobes.d
+	fi
+	echo '}' >> pidprobes.d
+fi
+
+$dtrace $dt_flags -q -c ./main -o dtrace.out -s pidprobes.d > main.out2
 if [ $? -ne 0 ]; then
 	echo "failed to run dtrace" >&2
 	cat main.out2
@@ -106,7 +131,7 @@ fi
 echo "my result: 10" > main.out2.expected
 
 if ! diff -q main.out2 main.out2.expected > /dev/null; then
-	echo '"my result"' looks wrong when using DTrace
+	echo '"my result"' looks wrong
 	echo === got ===
 	cat main.out2
 	echo === expected ===
@@ -262,8 +287,17 @@ for pc in $pcs; do
 done
 echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $1);}' >> dtrace.out.expected
 echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $2);}' >> dtrace.out.expected
+if [[ -n $usdt ]]; then
+	if [[ -z $mapping ]]; then
+		echo "$pid pyramid$pid:main:foo:entry 2 a 16 128" >> dtrace.out.expected
+		echo "$pid pyramid$pid:main:foo:entry 4 b 32 256" >> dtrace.out.expected
+	else
+		echo "$pid pyramid$pid:main:foo:entry 16 128 2 a" >> dtrace.out.expected
+		echo "$pid pyramid$pid:main:foo:entry 32 256 4 b" >> dtrace.out.expected
+	fi
+fi
 
-# Sort and check.
+# Sort and check (dropping any wake-up firings from deferred probing).
 
 sort dtrace.out          > dtrace.out.sorted
 sort dtrace.out.expected > dtrace.out.expected.sorted
diff --git a/test/unittest/usdt/tst.pidargmap.sh b/test/unittest/usdt/tst.pidargmap.sh
new file mode 100755
index 000000000000..0c83f8703539
--- /dev/null
+++ b/test/unittest/usdt/tst.pidargmap.sh
@@ -0,0 +1,11 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# This test verifies that USDT and pid probes that share underlying probes
+# do not apply arg mappings (incorrectly) to the pid probes.
+
+exec $(dirname $_test)/pidprobes.sh $1 t t
diff --git a/test/unittest/usdt/tst.pidargs.sh b/test/unittest/usdt/tst.pidargs.sh
new file mode 100755
index 000000000000..53cba7c39624
--- /dev/null
+++ b/test/unittest/usdt/tst.pidargs.sh
@@ -0,0 +1,11 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# This test verifies that USDT and pid probes that share underlying probes
+# get the arguments correct for the USDT probes.
+
+exec $(dirname $_test)/pidprobes.sh $1 t ""
-- 
2.46.0.278.g36e3a12567

