Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D251284888
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 18:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758218650; cv=fail; b=dcFUz4Zd63mwKlZC3ab8FtgAN3X8D3s+ulOIgEaEIv5WugjnkMk4sCZkdv1DxDbwgUnxUwziPihQLNhlx6eZDFgGK3DnATqca+mt4g9vtdadc2/P/xJvx5pRhLzPLbSECTfhJCpqsusfrvfs0u0nR1E7BO/ytvn2Fq6tqXpVDpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758218650; c=relaxed/simple;
	bh=hqhnhIZ48txeYU0bjsi/fYVViWCaMUNsdQQtT+GWHco=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LECZAjbznuO58ty3REIWptNFmNKOe0rkm0Fwr1t7lkYTXNbV5URGxplV/po/0ZcKl6ZOwVh34ZsbzC3v/vuOyfBLwJl/4OoCprcKWwv8XXp5brfjQQhGbmiqPob8k/wB9UVj255Ux1+TDplmM0f+Ynd/jCuNLDff734WA2dzz+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=juKZLIcd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jb39t6C4; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="juKZLIcd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jb39t6C4"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IGCm2h029829
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 18:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=zD8IHswNjnjN4Z0w8gfkFuYap/Z9PL+oUC1OgoWmfUg=; b=
	juKZLIcdywyPsR+li+GZF8eFnG9GVwuGI9KVZeRyDnlD4VBM2DTNotCyjegjn7/k
	dUwOMkVOMqWczOk8TCNjmtD675gLWlulioDt4dFvDz0GJAIuX6fi0UCpwwe4644g
	7Wcw9tpkvVDnnImz+NpyrsypWKUqFEqpJn8ZFnZGEKQ2fa6a0PtP45a/wPUj4F42
	//HzWd6Cabrj6bgEVRSE13mf919jMXDhtN30ZrK/Wsrc/8yN6BuN/idZPZdd8hPb
	djPzCM13edKkKOAxU/mBAt1pOJcqxViFt9rCWS1swsL4hzKkLa03F8DpcfZtk8Wc
	3eQPZJCNbVbv7ymA8I8q9g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 497fx8kxd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 18:04:06 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58IHAbnY028813
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 18:04:04 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012025.outbound.protection.outlook.com [40.107.209.25])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y2fgm1k-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 18:04:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BaKqOy09I2J8cIZcJDrzEYwdqrkDq5dXmrU7ZjlnpPaC1bEpHH6IBQwhG7SLiKkJP6WNUqX/mhvsO29JR8q19caQy1ifNuE0D32NYmRtoP2umJIj51gy33ShklJpCBa+MpK7qQFuWgYdqyBjShpAVpZPRTZZTlV0Kbl9ie3gWD+a3zT8jmUKSbyIX5n0ByGZZ6auBDh14YxCw/kLh8UI+vqNnqsYF5J+X77dI8/NA0hyhCm3pDPgExNdAzsRfAq/yimkqL4Qov4hsjX+h30/EsKOLEfOc3nIFRjiW1eJI6MqatVPY28259myw3nvrrXJUNmAYbdwRdnpz8z+DH/6AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zD8IHswNjnjN4Z0w8gfkFuYap/Z9PL+oUC1OgoWmfUg=;
 b=M4KCaHevHp8JcQ/FFvZGyrX4RG6hPaRo6bRFk7JuvlD+AoqBBQt/tlP12s5UzGbtTJHbIy+Vf3bJYy5bjOVXKlxSYkDYC+BicxJtofR9xHdo+8Y0AhEEx4q+dDMIO3UjFtv4BF9c8BliERhw2Zv88fEYhvWPZpG2bp26ROOlwHpmHq1qlY4hcmajWOITVIyZ5Fn8bTPseJAuUhNYJYQ15bYMHQu8WSeFoHndTk0tFHK7VB55ULOHxe4PUcbG1YL9MtG/CvLm+woOCVctD9Oplhl2B3fnZvJ9okBcg4emxyOwYGUoPYvguGLquND+xH1fUtxkE5azEUW9XQE9fBgt5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zD8IHswNjnjN4Z0w8gfkFuYap/Z9PL+oUC1OgoWmfUg=;
 b=jb39t6C4b/KB+vBZmoTt8I6IsKlv9k2rl/7WmK5tOppVrtBAr8hKM6EkTU0J/WTUbjHi/8MtMxik5kg8RMaX9b+wyq8deOhNDqSMWxzH+Q+TZcN216xFikZZugR04iqhdxs6ojflxVMsFn9FkWUZNE9fJeniYjUxM5Clz3byJ6U=
Received: from DS4PPFA0EC85B6E.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d3b) by IA4PR10MB8279.namprd10.prod.outlook.com
 (2603:10b6:208:55f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Thu, 18 Sep
 2025 18:03:52 +0000
Received: from DS4PPFA0EC85B6E.namprd10.prod.outlook.com
 ([fe80::2bc7:d2c4:e59f:d822]) by DS4PPFA0EC85B6E.namprd10.prod.outlook.com
 ([fe80::2bc7:d2c4:e59f:d822%4]) with mapi id 15.20.9115.022; Thu, 18 Sep 2025
 18:03:51 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/4] test: enum tests
Date: Thu, 18 Sep 2025 19:03:37 +0100
Message-ID: <20250918180338.197827-3-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.48.1.283.g18c60a128c
In-Reply-To: <20250918180338.197827-1-nick.alcock@oracle.com>
References: <20250918180338.197827-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0285.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::19) To DS4PPFA0EC85B6E.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d3b)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFA0EC85B6E:EE_|IA4PR10MB8279:EE_
X-MS-Office365-Filtering-Correlation-Id: 62a3fe19-ffa5-47fb-88c6-08ddf6ddb7a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Vi00iEK5E/GkmLk78EdCiBok1HNizWQ45ZBcnkx0wXW25WLVpHgytX4wViCg?=
 =?us-ascii?Q?efMZhqqPWyq+jn3Ohv/HevSSnjICHfEJdQ3Z8XN5i1g0PU9kVz4E4ZYorTdF?=
 =?us-ascii?Q?u7ezbvsXo6hv4+FFOlK+wKPBgL2TB4mR9gJJY8nYQX4dAkvDM01GajQv01U3?=
 =?us-ascii?Q?fmSlJUis0sSTe5eXv2Y60H4Uaplwc1VMbUwKnzqyaqBZ1UcRYhY0RtIs8KSG?=
 =?us-ascii?Q?0fsBQfW9qS65AE0pn8vMTNV6Pw5HcUlzVwki0IVDG2I7GpE0SJZrEa+faYhu?=
 =?us-ascii?Q?0yu52RizY/pAQx1JPCk7FTOX5DffaVWk16MaxCC1X/yRglsLgnjUoBRq+rPx?=
 =?us-ascii?Q?OWBB3hg6E7scMi/JpYs/es8usOwqbrPEDnCMuLFiprlA2HyFQ1UxiapKqhpf?=
 =?us-ascii?Q?OyGQyrewJVw0j1Evo9w7CPhcAnnTwLDgcAryX3v2NSy+OLXrgsVozptesrfL?=
 =?us-ascii?Q?jmLtHvqwh3EyaJsO4i4P5x4iSn88g/QAiyieEKtqdq2BcVbcUEnuD05HHRaF?=
 =?us-ascii?Q?Us5fSy02BXjdzey1xM8HeKneDEkjzOx6TsTwnumNYSU4Ijq4IpxPVZStadhh?=
 =?us-ascii?Q?Ce9Re3ak+ae+dZNgquMYyW9zdbhuI5DWCbYiC+OhfnXIKW612LqdCPmsIl6J?=
 =?us-ascii?Q?bNVYicq26NWyT7zNcO5PLH5vo+7RT1i0QOG1q6OZ7sgxuF2pNM8RoJgLpx/6?=
 =?us-ascii?Q?s7JWTVsbzUxIsH6+0FP9U4hL3tX5FXoiX52UkgYmL0FvknliIzn3vfv4wPdX?=
 =?us-ascii?Q?33eQMGPyZJKOEHyf/TrLK2Al2oHtIVtiIxCF0i18xHhkTQFiFC6pVbLGmxfj?=
 =?us-ascii?Q?xn2mo6Bd/HYlqTNz1L8Yvf5ry++l0GVyjHovUhT6NyUV/dQ4Mmah0NiazEu4?=
 =?us-ascii?Q?qeGsP9p3L9nPLQRmxsXgOX0/tryPdzJz6C1CvtgH17s0u3eeUuTJXG0HpdXM?=
 =?us-ascii?Q?z16xotZEoh3xcYfPD+fthAd8bJIcPInSRCTAnvVbDTiza86OySN8WMaQSBM1?=
 =?us-ascii?Q?lBaIb59dQfDXhustnAXA4xfrwCJe89nXLaT92jb0BQZ92a/ZpLDxDwD/aG3I?=
 =?us-ascii?Q?Ul4rsTeCYHkniaePcRKXCp5JA0XtZYlcpHR8Je4MxDHDgquz84+C5f4jLprQ?=
 =?us-ascii?Q?hvpU7FG88dxciGCdue7XN0mYe7YRd0lBgrVSHFbkRVtsa044moHv2VKEXsEI?=
 =?us-ascii?Q?ydOW4nZMXW1T8WVVOwh936vwIZikyOke8gHBp442d1HUI9CzP78NLFRPpXaD?=
 =?us-ascii?Q?9rthMz6ReSok+UG9noci4TYA4WYihJQvwgrNOcR1D+hby7Hotp9xqFTK/KG/?=
 =?us-ascii?Q?bwgePqZ5BSKdINMiakJUh09Mi9lE+lOgghVr7Htf4TXGu504mgHMY41XVyrS?=
 =?us-ascii?Q?isUY0cVnaAvFe9dQxU83zxM6XyBOJdbtBPZFhqXZ+tpjNJwaIOJ38ThfETFo?=
 =?us-ascii?Q?PVBOMZuxf1k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFA0EC85B6E.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?usEMoU2Vd8CNjU1S5275sRMq1C/vOankEHR6gsdzLa605dnqNIca3IJF1R4G?=
 =?us-ascii?Q?n6Ml2oq8gx8UVAYXE9+4SPci/vdQ3TX7+8NaXfwZVtuOomi6MXp12fOG6axA?=
 =?us-ascii?Q?AGTsPdE9yRtLJnwAjUwAZ4dFiMFsEynTePIjXeSJPZmL+f42haORdf1hNI2r?=
 =?us-ascii?Q?AwJcF7bTGH3Zn02GXZzv5aeJHKLWG9lzvS35cZCVXDXzV2SvfkjgySa7zSlF?=
 =?us-ascii?Q?JLqEqmDTLDJfXZYHMYfnLCTz6W+/cS4Kg72MyUzL7d0Msz+DWaLG90VTgajp?=
 =?us-ascii?Q?4l4w3Qh9YwfSTCS9wm7lpr31GF3IJAdHLvdJtG5HSR5757oXs1Aa+DRM81pi?=
 =?us-ascii?Q?ZBW7JpX/n5Q5c5byGBqkuukX27D8MtpYihv71OGy8ByRvIlL/G3RaG+90epH?=
 =?us-ascii?Q?pBfx70OqZqhLDClO+r+K298ogjezWHGeGFq1PfIyROEhXZWKAiLbfjr3p7Jf?=
 =?us-ascii?Q?J22YrWoxVCdDwY3DkovTTOVn+KNSWxulvFHD06nUBIsSPR2oj1LFOIJhJztQ?=
 =?us-ascii?Q?lJReCdAmFbPdG4DGC0fuiure4bl1ferUGIBaD1XxdPIkIuhnpL+tX6mVxF3m?=
 =?us-ascii?Q?rBJ/FTKf+ENwCbUI6p8Rr4htGmBaz3KZcZED2KjIuRXcOtNK4WlYUDZnd0F1?=
 =?us-ascii?Q?VnLZOxHpl1lJ1NqZ1P7QWwvGJ+5qhI1TI9VWgMuuwkyLJoiA88gIJIVPv8Rg?=
 =?us-ascii?Q?kdroh82MXjzhKfMqwYqfAqd+DMvxHzVc3bkkSOnnpBvt8amz3unsHgUr1kNH?=
 =?us-ascii?Q?43KI95Np8y5Cv8wROEMhUGXPyJUj4AeV4yTkrQ25X38E3M/GnioB4jffJTHz?=
 =?us-ascii?Q?nePbjAOVVKnQWbVZKyXSJO+tGZBesMutNiyaG+I7lJTsWqbZ0pzW1uGzyEZf?=
 =?us-ascii?Q?ew81e9pCP1cj6xh8kUKilgWNztXacI9yEGlW5/ZXT01AzQ3/j372l3IoOtgW?=
 =?us-ascii?Q?pq/BK6IfLtxyKE7adC99Sa1RggR/gDnHAWwExxDMIv7ZrBdo1ihszfMa47HE?=
 =?us-ascii?Q?i1lu5Q4hcSb/Cb71+VBSL5UznRzoPRADZ20GYPxo2gXkba6vg+2S1HuUEOaW?=
 =?us-ascii?Q?lx3XCOpjwqr1+wh0xJyMHuc2HtuSfP/mrTe9/HrgwyNGAK7bfJnnw8VkITEd?=
 =?us-ascii?Q?ntJNROi8Kr5BEYK1uFdH/aYt2JEqyTxAUvcqBlnAIYnT+gDzfbVchX7dD4bD?=
 =?us-ascii?Q?X9ed3NUgxnhPDMfu4AVUhSxxvfNKytZNfGHSIcmr45EIhmcbqHSdQ1kQJuV2?=
 =?us-ascii?Q?ETMYpgr1hC27LeQe4o0i++BEkAuyjexF4M+h1OiUwVI/eXRmCh/tXm7SpzQa?=
 =?us-ascii?Q?VTtxMYbMXRvawzxnNKPfRcNuY/Sld+EGfmdxM5g4SSAzxBVgGdCFpz7ErXry?=
 =?us-ascii?Q?C2p5sMozaKKG2BVzHfUxgunqSmEijSEogWn3SPWKdcIR3jbdn3jGJv5OCMf2?=
 =?us-ascii?Q?foXVJgPy2mjFi8EtAH29Bv+nmwyosURFSLexRVH2mIiYBJxRupjo+zZ1ZEKU?=
 =?us-ascii?Q?oWwtc1C9wDuTyAdGPte3b/D0Noc4i2XJgC3xFpeA2dGUiY1LutzkcoownH9L?=
 =?us-ascii?Q?7u4cL2Djve6fjT6b1ndQv/pcmNNwhLdFVYeujz/hB8BhIXMGzKTFjXRhnXN5?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OTlT1ZyyPynltUqLA1bKpz3+2a3Cb5gaz2KgDMLFTDr4FimqD80gnuvWSxZYyZ+wciuwJbl57l9OWfyGJviWeCKV3vULBZ9d1OvtBGrirO1Bu/FVSZoa7EGBFOTEQnxrzz9rR6jdYFSHqO0q+PvRCUpfnEoWRc2M5hzDDPxsVQbHzGd8uwY+F95tCg5VXZGjmfLFy1F88J3K0cDqJQygcw8yXM26Xnxtp6aNDj9P9JlcZZ+nFEfG3u38uDl1GEaF7HhU5TvIfsjHBa32jv0eBVaeMD3N26NTqiVB2kzejHscW2AvfJjE0Y4UCSmRCSBEPLOPc6D+6hR+0ZXDc36cSKW9GzgtAJx7u1ouoYepqIVfvzAAQ/csaEVD8+pLv9aUtclFPOogpwj/0NI2k9flLhsy7LGjqIblcFyVMtl5elcnqNwBKXUY+rVNpl8tZTeyquSUxh+F4zow7sA5F75qjFa9R5cOIVlYDT10DU4xm4Ujih9kuz0vbyFOpj2+kDy7aQpy1iLm1VC9xYdov7kqQIXC491n/8lElmZiqPQuquvx1ksInvipOmWiRHFcN5Z/M+zFP9N7I5XrdouVqzaug1PrTthXdOejkt2tmT8xEmw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a3fe19-ffa5-47fb-88c6-08ddf6ddb7a9
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFA0EC85B6E.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 18:03:48.8445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: omiVrJwlmC5Il4EmKI2hTh+gL4TDoj+dW4ka5lv0K4KbgMRpBzkqmUN8H54E69eh+AKlafFVtkMp0htcrvJtbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8279
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_02,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509180160
X-Authority-Analysis: v=2.4 cv=JNU7s9Kb c=1 sm=1 tr=0 ts=68cc4996 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=NEdZTHQsPob5c7_JkpcA:9
X-Proofpoint-ORIG-GUID: TL7Nra8y5IIdQfLFwsNGnpZuV2Kx5q4s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX7vt0H2mrAVUc
 BJ9YDlj6+9TDBgaFAO5V/To1wy1MPNJ5b1Ic7ZPYqPFxS5fAQDSqbbZZ5sXlmXzyA+MW1SNZag4
 yI1qvn73xTWWH1I3ld+jI8T71lEwGrYLNI9yKRE/31whIvUJAXFM9y2JJ2OeGazeKJHPFznNjih
 jxgGQ8S7mrup9Xm/l5642HfDq513ArXLoYe/ot/zJwzeuDI2mbB9AU22Czgbmkrfls271qSrFMw
 0GPnrKABwBR92jYA05cbVOcQgUF9ek4e0LABBUQ6mu7VQxABgLOCjtj4pVLzi597+EdR0++4MlN
 kHslNekElxvPETzZ4ouuIzU2ZgOI92LN/o+i0p2dbVl0cIUEOR1mVS2ZbEDygRP1dDC1TzyFC/D
 jgjF8meZ
X-Proofpoint-GUID: TL7Nra8y5IIdQfLFwsNGnpZuV2Kx5q4s

A couple of new tests verifying that type names appearing in enums are
forbidden, as well as that kernel-visible identifiers are permitted;
and a renaming of the D_UNKNOWN tests now that libctf can be assumed
to be everywhere and it's probably more common to have a libctf that
emits a good description of this failure than the converse.

(The previous commit changes the error messages in this case back to
what they used to be in the old days, too.)

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 ...iers.d => err.D_DECL_IDRED.RepeatIdentifiers.d} |  0
 .../enum/err.D_DECL_IDRED.RepeatIdentifiers.r      |  2 ++
 ....r.p => err.D_DECL_IDRED.RepeatIdentifiers.r.p} |  0
 ...dentifiers.d => err.D_SYNTAX.RepeatTypeNames.d} | 12 +++---------
 .../enum/err.D_UNKNOWN.RepeatIdentifiers.r         |  2 --
 ...OWN.RepeatIdentifiers.d => tst.EnumKernelDup.d} | 14 ++++++--------
 test/unittest/enum/tst.EnumKernelDup.r             |  1 +
 ...NKNOWN.dupenum.d => err.D_DECL_IDRED.dupenum.d} |  0
 test/unittest/types/err.D_DECL_IDRED.dupenum.r     |  2 ++
 ...WN.dupenum.r.p => err.D_DECL_IDRED.dupenum.r.p} |  0
 test/unittest/types/err.D_UNKNOWN.dupenum.r        |  2 --
 11 files changed, 14 insertions(+), 21 deletions(-)
 copy test/unittest/enum/{err.D_UNKNOWN.RepeatIdentifiers.d => err.D_DECL_IDRED.RepeatIdentifiers.d} (100%)
 create mode 100644 test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.r
 rename test/unittest/enum/{err.D_UNKNOWN.RepeatIdentifiers.r.p => err.D_DECL_IDRED.RepeatIdentifiers.r.p} (100%)
 copy test/unittest/enum/{err.D_UNKNOWN.RepeatIdentifiers.d => err.D_SYNTAX.RepeatTypeNames.d} (72%)
 delete mode 100644 test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.r
 rename test/unittest/enum/{err.D_UNKNOWN.RepeatIdentifiers.d => tst.EnumKernelDup.d} (57%)
 create mode 100644 test/unittest/enum/tst.EnumKernelDup.r
 rename test/unittest/types/{err.D_UNKNOWN.dupenum.d => err.D_DECL_IDRED.dupenum.d} (100%)
 create mode 100644 test/unittest/types/err.D_DECL_IDRED.dupenum.r
 rename test/unittest/types/{err.D_UNKNOWN.dupenum.r.p => err.D_DECL_IDRED.dupenum.r.p} (100%)
 delete mode 100644 test/unittest/types/err.D_UNKNOWN.dupenum.r

diff --git a/test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.d b/test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.d
similarity index 100%
copy from test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.d
copy to test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.d
diff --git a/test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.r b/test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.r
new file mode 100644
index 0000000000000..424d6b0775810
--- /dev/null
+++ b/test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.d: [D_DECL_IDRED] line 24: identifier redeclared: GREEN
diff --git a/test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.r.p b/test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.r.p
similarity index 100%
rename from test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.r.p
rename to test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.r.p
diff --git a/test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.d b/test/unittest/enum/err.D_SYNTAX.RepeatTypeNames.d
similarity index 72%
copy from test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.d
copy to test/unittest/enum/err.D_SYNTAX.RepeatTypeNames.d
index 43837c78af9f2..74afdebf98082 100644
--- a/test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.d
+++ b/test/unittest/enum/err.D_SYNTAX.RepeatTypeNames.d
@@ -7,22 +7,16 @@
 
 /*
  * ASSERTION:
- * Repeating the same identifier in the same enumeration will throw a compiler
- * error.
+ * Enumerations cannot have the same names as already-existing types.
  *
  * SECTION: Type and Constant Definitions/Enumerations
- *
- * NOTES:
- *
  */
 
 #pragma D option quiet
 
 enum colors {
-	RED,
-	GREEN,
-	GREEN = 2,
-	BLUE
+	int,
+	not_int
 };
 
 BEGIN
diff --git a/test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.r b/test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.r
deleted file mode 100644
index 0bf0acdb0702b..0000000000000
--- a/test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.r
+++ /dev/null
@@ -1,2 +0,0 @@
--- @@stderr --
-dtrace: failed to compile script test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.d: [D_UNKNOWN] line 24: failed to define enumerator 'GREEN': Duplicate member or variable name
diff --git a/test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.d b/test/unittest/enum/tst.EnumKernelDup.d
similarity index 57%
rename from test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.d
rename to test/unittest/enum/tst.EnumKernelDup.d
index 43837c78af9f2..429e2d0a01f66 100644
--- a/test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.d
+++ b/test/unittest/enum/tst.EnumKernelDup.d
@@ -1,14 +1,14 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
 /*
  * ASSERTION:
- * Repeating the same identifier in the same enumeration will throw a compiler
- * error.
+ * Enumerations using names also used for enumerators in the kernel should not
+ * raise errors.
  *
  * SECTION: Type and Constant Definitions/Enumerations
  *
@@ -18,11 +18,9 @@
 
 #pragma D option quiet
 
-enum colors {
-	RED,
-	GREEN,
-	GREEN = 2,
-	BLUE
+enum dirs {
+	UP,
+	DOWN
 };
 
 BEGIN
diff --git a/test/unittest/enum/tst.EnumKernelDup.r b/test/unittest/enum/tst.EnumKernelDup.r
new file mode 100644
index 0000000000000..8b137891791fe
--- /dev/null
+++ b/test/unittest/enum/tst.EnumKernelDup.r
@@ -0,0 +1 @@
+
diff --git a/test/unittest/types/err.D_UNKNOWN.dupenum.d b/test/unittest/types/err.D_DECL_IDRED.dupenum.d
similarity index 100%
rename from test/unittest/types/err.D_UNKNOWN.dupenum.d
rename to test/unittest/types/err.D_DECL_IDRED.dupenum.d
diff --git a/test/unittest/types/err.D_DECL_IDRED.dupenum.r b/test/unittest/types/err.D_DECL_IDRED.dupenum.r
new file mode 100644
index 0000000000000..0b6369e523cb2
--- /dev/null
+++ b/test/unittest/types/err.D_DECL_IDRED.dupenum.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/types/err.D_DECL_IDRED.dupenum.d: [D_DECL_IDRED] line 18: identifier redeclared: x
diff --git a/test/unittest/types/err.D_UNKNOWN.dupenum.r.p b/test/unittest/types/err.D_DECL_IDRED.dupenum.r.p
similarity index 100%
rename from test/unittest/types/err.D_UNKNOWN.dupenum.r.p
rename to test/unittest/types/err.D_DECL_IDRED.dupenum.r.p
diff --git a/test/unittest/types/err.D_UNKNOWN.dupenum.r b/test/unittest/types/err.D_UNKNOWN.dupenum.r
deleted file mode 100644
index 2d6aa3069b94d..0000000000000
--- a/test/unittest/types/err.D_UNKNOWN.dupenum.r
+++ /dev/null
@@ -1,2 +0,0 @@
--- @@stderr --
-dtrace: failed to compile script test/unittest/types/err.D_UNKNOWN.dupenum.d: [D_UNKNOWN] line 18: failed to define enumerator 'x': Duplicate member or variable name
-- 
2.48.1.283.g18c60a128c

