Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391C1243363
	for <dtrace@lists.linux.dev>; Sat,  8 Feb 2025 23:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739056907; cv=fail; b=NGMWMszJOFqJ6+ORK1y7XQ0oAx7qKMp2UplAnkDp9FLmDrg1xi64y/2EnOZDN4dIuzf7S/0bFRvRSABFbgvNb5WHfP4rrsXOWwALfQ7Oa1tOL50J615IR0UuYqgAdOQL9KbapAFC5lM59X94vRSAUBF2Z2eV7+dsXeoUb3HAVN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739056907; c=relaxed/simple;
	bh=smSB0bNt1t9sCedLGmXWLuf/C6iberHZLHc7wohr9Yo=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a10hDq8cqHHWL+HPuT4gIbUDYNHLUVRzz7z1yACaKI/fWv1J04B3kCLXmLax4ADzGj3G4XZq+W4HUwYgitiRzBp9NKBu0GEXYQ+ymv8Ulqe5OE93cw3o15P2pDMRBeKihr8lzxCRgOwklng09QdpeRij4cwU42uIFwFYGs4sGZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PhdI4LR6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Oci2ioxN; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PhdI4LR6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Oci2ioxN"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 518MrX66006631
	for <dtrace@lists.linux.dev>; Sat, 8 Feb 2025 23:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=azEeMuRsVx25rvWgdL
	P9RzqJycGOOvHy3hcVRd1/HXE=; b=PhdI4LR62B6p5Gnus8b05uNFLm0UHKQb4G
	Gu/UWkY60mr82hkxUkWI/gvqLb9wgYFt76KgVQbB9VwntzY2WRrx03POgF8gSEpD
	uRUgIqwGhJUCcmYGGE/93JsEoCzaydSPe2BX0W24yj4H2o8XrzFqNuDNhcLLM3C6
	ntn8aG6GPU5HWEFTNj6FYBeg9Y3m54SNOrQks1wZcbcGbmqq9HysiRZT+6LHsaPW
	bgL9x9DrZXSseGXonG1lcrRUX8i0L0rbDub4g3SqqXcq1oeW911FO2BOgJ91mubN
	BKvxOwRLoJTjL5tEdG+qdROa9b53oDc6TkfwumNUswxbQ2TArnlg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44p0qa8j4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 08 Feb 2025 23:21:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 518KkwnH038837
	for <dtrace@lists.linux.dev>; Sat, 8 Feb 2025 23:21:40 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2045.outbound.protection.outlook.com [104.47.51.45])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44nwq635bd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 08 Feb 2025 23:21:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=spo/iqBJXNg+1FS6QHyk8sNQu6XlwkCGnUNAg2gG3aG+Udk044mdqe1MySeE2HvPpNPC2Yy/opZi/tOWjvz57rk0U25g/YMqJsPFkaxNkiks02fLDJD4ADSSME7ZTKeK+dYSIBIFDw1svvjmQKMDb3S5nqniwYI/IHNU+5pfH6FYjEuUKhDA+a+sjdSQcnM7gMnmeeEFvmjpe3/AyJ+Otn55ASTFLejPOZJBQ97CTcGlHjQTSbgbBprmzo4NVcMtsn2J+foUZF3edWmJTmhtywtRTi07grruP9sU/6Fqkq+pf/iBQAe/znNw3wNdLR4RoZvdOkCOUnwxOkBL/iojkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azEeMuRsVx25rvWgdLP9RzqJycGOOvHy3hcVRd1/HXE=;
 b=eRz1sF/259oEm9UUCbL1MipqNdQruy55Ds1A3FJbBPehOirTefIXxdvUuIYhKVOVaeCrt6yHhVh3JJYdTTGiS9z1X6Xkt7legBGYAxhULLwMdRpNP9feNT6MI4s384CyNmEj8+xUSFN05+1rYkmnQ1++wTdDlPWYmK4hF/xIzggLFDIJUbEmQKGm1jrg5ltojVlZGGaalASx/nQn1FpWCFhK+s4t47tfcpvMIV+CaqQaVt5aDZQkj6gSs2SjhFtFKI74zPmw7ySNecl13B+dTinSRkZ0OEd54I2zy4VqjhGeQ5E4yY2rtisz0B9imZhQp0g2OBLcOlEt2ed9V2S+XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azEeMuRsVx25rvWgdLP9RzqJycGOOvHy3hcVRd1/HXE=;
 b=Oci2ioxNSvK/3cVGCRWAhOfcY9pAW5Bg2/54svNdR9oF3DetYzU0DVSi6LAdmmw1FpBXbhJr36FiwYBYLOQDn3eFouIQiFYtxgzwl4tpy1mps9UQxqfHYU4F0nlRYOeoPplMcYiGJ3JNAFE/AmB3oAdJHqxLX2+sl0Qka8/b5OQ=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by IA1PR10MB5972.namprd10.prod.outlook.com (2603:10b6:208:3ec::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Sat, 8 Feb
 2025 23:21:38 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%6]) with mapi id 15.20.8422.010; Sat, 8 Feb 2025
 23:21:38 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/2] test: Account for pid:::entry ustack() being correct
Date: Sat,  8 Feb 2025 18:21:06 -0500
Message-Id: <20250208232106.27146-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250208232106.27146-1-eugene.loh@oracle.com>
References: <20250208232106.27146-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0435.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::20) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|IA1PR10MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: 73233133-6c7b-4b6e-cf20-08dd4897562b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ytDk3IWMVBjlj8YVZW2fvdljPXgNOpSKTQ8U1sCVP98txLurbPL1t6hDBqP1?=
 =?us-ascii?Q?gn1GFnhEOtYYpdWcrDlCsATCQr4LKDPk4fgYDA03WX/mAeTVevOVEpFxLQkT?=
 =?us-ascii?Q?+OYQG0RQZ8hxRRtbc6zCI7O8CiKErzfj5Rm1Rw1zuTRGYPtvMjFZIlqEzpE+?=
 =?us-ascii?Q?k7QBtl926w6r2fU0tTnfpMPtXG1Obj2cpMHe4HizSw3BuGzYIPHrZo7XCfoj?=
 =?us-ascii?Q?e1nnczfDruOH7XMCQeh/4WN8RW+YnG6b1exws6f0NH+Ov2eFdXkRcqbSutMb?=
 =?us-ascii?Q?E9a8XO83i9u+HydOZnpKT/XuiTIZkT4SadwadvgBSdQolX1RVrLA0DLLcngi?=
 =?us-ascii?Q?Iw+7Zb2qmnDmGOttyBsm/O+h9JtoMvtXCPK/Xi/31dmYvckF1B5TBucgNjC8?=
 =?us-ascii?Q?Bi56R/UqkYyRd5SDneKuV63xNmDltDE53zqQOLfKq3aw0Dmoc2M9bxJoJE73?=
 =?us-ascii?Q?Sd+SdRQjuZyjEMmWOG+5o+5MAGO9vn8CcW2/wH+Uucvn3qreHsMa8c8JZNfA?=
 =?us-ascii?Q?M7ZkkHq8B8Uv4UpFVD4I3eAlsYfrWb4RyxK/UZrF+Zqqa2wILuQzkL3J7vCa?=
 =?us-ascii?Q?PtKWOGfYKkS6a7+KmIgT9jXE6vHriL+QZ0+BhLULd0WzzaVIHaUH8lQdJf6Y?=
 =?us-ascii?Q?uN9oMuvIYp8EQeK0IcDxE2Ja1DjECGa/ETdm1Biu5FVTr4y4iOMRiefLl3UC?=
 =?us-ascii?Q?+bDSGOry5OTm/Whf54+Tkmgf8Yq9tQcAlzSNC1B/ChYEQzsGn+oXxlrfSA7f?=
 =?us-ascii?Q?JN11D2k7y6hFoUzv1NBzTSr0EhTzx9e9pusFbThOcswl46BZk2N9f2K1/OGB?=
 =?us-ascii?Q?awspvh/Aga3BUyXlJfk2dyumJxlUE9HiA079ALK973R/3FPjd77jrRR6E2yz?=
 =?us-ascii?Q?YqKemfS2XF2c6/IK2iGi4MzgUMZ41DCf0a2meF/pAEFtaznzjvT4e3f0iA/O?=
 =?us-ascii?Q?JCmdPC7q58AVvK5fSiLAvyGu9GZGVuvJuvHO+mp+2SZL6lbzEevV5dMbDXfL?=
 =?us-ascii?Q?+2GVUTrq3W0+cOY+gaRAji2n7X+aQfD4ChC7Qv5M7yyVOY3QGTDluelEX194?=
 =?us-ascii?Q?vkQwf0PoPsU5gs0LbU80BArPKRrg2meQinNgBFZchpQX0tZvQa5j8DE0oVCy?=
 =?us-ascii?Q?n/LgbZBBc5qdor0w3TUnrW8xzxavngouIMvHnAYD6IAyFqkgml0oTv1TJ3a3?=
 =?us-ascii?Q?8LoGXdFa68Ab91HK+pcUgcWrFuIPoTfV/isTMU87gZ52aBjcUvgIsfSvv/mP?=
 =?us-ascii?Q?qWAzX0CIo8DLNXaGPdyPFD8Q6MjgMZMwKEMiwOk0Qu2tZcjrqKjeCAASdKyr?=
 =?us-ascii?Q?r81TJIMk7ezWjyfttVH12//afyfuIPrtGlOoAjgoyUryNhAf+04HrndGSUOS?=
 =?us-ascii?Q?hyACA7Pv98Cqg08WisVc2opo/VCa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9f2YcAC7Nr0PYnJZZWK3homzgnjQCB9YPUSlI8XLnGaGUEtfszdvP4ERuEpj?=
 =?us-ascii?Q?KAspkNoRJqNg8M8ajAHgduj6iPcVwAyk0w6U1eHoKPkqXvoKM84FbtWB464O?=
 =?us-ascii?Q?viPuGS0/rlEO5qSg09N940GTrZidgCjInkZgdBxo+C4qiJ3wTQx6uHvqkGCG?=
 =?us-ascii?Q?8WaKKNFTVosL7DR7agI6eTQemOqrbHNj9DW9cmlogk7qHyqcdl/h4yMH1Hd1?=
 =?us-ascii?Q?HZp/8H/aEO0tNeeT+gPQhu5v1R6Ri+qOfkSi5aCBqWXbgk/5psbVvdi3H93k?=
 =?us-ascii?Q?4TnBL8JOvkEHt2GvyxC/EoZucfG3cCCSkR0tvEPBwbYsqwJRbMpi2wW065gy?=
 =?us-ascii?Q?qLM+ypilDJ7dIbbMnZ/KSSbaVzHfyV3MShMTkTqyrVfin2yIPopDd1ZDqaBG?=
 =?us-ascii?Q?p/GGY1UMaHgCbyvwd4aRMsSwUt1aShOOgW5862227p5BBib6iHQExHIWaRpm?=
 =?us-ascii?Q?U6cd4/Pk2YocSz/jjkACrtD9ALULjIYK8pWEz5Dk/LWEcIl/6KiJM97SOLMU?=
 =?us-ascii?Q?tGjiJ/S22oP3mTJhvIlnTN1lr7FWjOpyxBImX2ciL9QuB+XHoeedVExZrqr1?=
 =?us-ascii?Q?ZOLyokGX0tWAdXrxARIKfFc7bSgPMGukKkYhlSzrMqiXVXaNzygVKSSUXXlS?=
 =?us-ascii?Q?azKO0WEIt73XqiJBxEXkcEW2kFHtaiEThH5bqC1gEXIEyJYB2YwanDIIYaPA?=
 =?us-ascii?Q?AC03QlXepJv+hEG8aK6BhzAv+l0jczYnBIAA08W5RyMpODrUBuE2TZupvsx8?=
 =?us-ascii?Q?uAObkoMkKx3wfNnIEKmBmy1tZA4ZdkbqJHONFAk45JqUtPa5mzHjzbxNLqBG?=
 =?us-ascii?Q?0iYH3xd3MitUAKKLYpSyKNZDMq9Tw5619i7Lh9cf9sFA83hVkPjKn1bzEvzz?=
 =?us-ascii?Q?DVpD8z+S5nNycdj7HaiB5HSQYBgud3SG3HFUCM019FPBIVCjgg2RQjeO/o/6?=
 =?us-ascii?Q?lwnddeIWpdSeJiEPooyIwnYATZt6sTihiTCQQtkoxt0g0gYDWZRCdZJ+mbqg?=
 =?us-ascii?Q?ls/VT2EGNrS3V45IZmqj046e6koC/4qPVEG7TkZtxE7qcEx/BlmdpSBBgVeT?=
 =?us-ascii?Q?wKThQA/sFkbLxScIkiOY7Zt6uL7faNmuOMSQFwH65IcIO2Jdp7gIjZfOEHIV?=
 =?us-ascii?Q?/2biAXXKPpjXv8VYUz6li326zxt6z9zayFKgq60Wpx2FiUnYpBaltVTSWVln?=
 =?us-ascii?Q?gcnvON4/w/jvIjuffgmKJNJBSVQB5oIEa0QCmueu1mCz33BF5MsODfpgSQeJ?=
 =?us-ascii?Q?lEtxgNQSSaBDYWKcfoP7I3/B8SuEMHy7ihzYRJN8KsAzW0pt+jaUDnMuGzeh?=
 =?us-ascii?Q?C5pJrmUs+dLZ54hNuUFJdWjRU7TBdQkT0ToPBNCBRB4Zkb71t34qSM7noXgM?=
 =?us-ascii?Q?bqjECnRQSvCFnTbkOWKTnlh1XZsPjXWANPO43yN3mOGCpGKsKEWKHLg1G75V?=
 =?us-ascii?Q?NLtbevIEDChnYK6XPy70IBNCtDv5h4Uu1J2xm/0HeiS84sBwNRAS7Lo/2gw5?=
 =?us-ascii?Q?ahrz4NlEIQcNoO06G5n55ATO/rku209FpITdmCmG+TJ0h2Jcv494L273n0tu?=
 =?us-ascii?Q?S48WZP4imTRnOKmnK81oEw+CsjeWJI3avDOeHRGS?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mox8Ek2XRgpZR/WpGa3gjR5Nqlut6FK3mE10gEagG0c9uYxoRvru090hIZL3mfYcrqynMIk+hJLhng1kQWoeZuBs1HuDjscpZrm65valQJSAlAGQ14VKbUda92oBeNRG08dh5beCeEPZD+HD46aS0JREtmzL088ocppZon6N5fJDL72hnaUnylBDIgXVe6fVbQjwNpQzOlKYMAHN1MFbshUNCNocSF7zBx9L1yMFjrmO782w+nW03AESoJXoNmmZH6/Az8wLDul2ZkbnJM9gZnTZb5zCYYEXxEnrx54t7giRM/wf3JYeJ6a2iJUE12JqZSPcPHI37p6HsBGTbcJbn1PHecCI4itN0ZTxvtOtLy2BwteF/6ntQdpo2SfJmOrJpAF6cw+u/uCIuU3lymp1G2NC5mRPrGnU/yuGoZVGAbUiJkHlHvPhLE0gcOCm27x0PtKd59xT8yy0vndim9dkBuvQNC/Fxgu97l47NUrrlX1HDnwej9ZfO8Wyu7gVu0C1jRasWKBgYff4nSaZ+S+6QE18zoopxQwrxOaQns5JGlxgKPGTJAo15XBpykJEugpDzthHNHruSvwewZvCcZS4gY7Wx83xgLmMsmw7Vz+xNys=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73233133-6c7b-4b6e-cf20-08dd4897562b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2025 23:21:38.1135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQa3fMuKAr6sA11g5TI9BvuDcJsQd0SNAkW24DO/acexfz/cI2e01d2iS5jrmZUvuOWwzsR4i5iVgBNNXmtfUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5972
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-08_10,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502080200
X-Proofpoint-GUID: eaM4EusQco6PP4JRlB7wO0a81lLQy3jj
X-Proofpoint-ORIG-GUID: eaM4EusQco6PP4JRlB7wO0a81lLQy3jj

From: Eugene Loh <eugene.loh@oracle.com>

The pid:::entry uprobe fires so early in the function preamble
that the frame pointer is not yet set and the caller is not (yet)
correctly identified.  In Linux 6.11, x86-specific heuristics
address this problem.

Post process results from this test to accommodate both cases --
missing caller and not missing caller.

Orabug: 37459289
Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/ustack/tst.ustack25_pid.r   |  1 +
 test/unittest/ustack/tst.ustack25_pid.r.p | 37 +++++++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100755 test/unittest/ustack/tst.ustack25_pid.r.p

diff --git a/test/unittest/ustack/tst.ustack25_pid.r b/test/unittest/ustack/tst.ustack25_pid.r
index 89b35c028..e7732fb81 100644
--- a/test/unittest/ustack/tst.ustack25_pid.r
+++ b/test/unittest/ustack/tst.ustack25_pid.r
@@ -1,5 +1,6 @@
 
               ustack-tst-basic`myfunc_z
+              ustack-tst-basic`myfunc_y+{ptr}
               ustack-tst-basic`myfunc_x+{ptr}
               ustack-tst-basic`myfunc_w+{ptr}
               ustack-tst-basic`myfunc_v+{ptr}
diff --git a/test/unittest/ustack/tst.ustack25_pid.r.p b/test/unittest/ustack/tst.ustack25_pid.r.p
new file mode 100755
index 000000000..6486f7ec6
--- /dev/null
+++ b/test/unittest/ustack/tst.ustack25_pid.r.p
@@ -0,0 +1,37 @@
+#!/bin/sh
+
+# A pid entry probe places a uprobe on the first instruction of a function.
+# Unfortunately, this is so early in the function preamble that the function
+# frame pointer has not yet been established and the actual caller of the
+# traced function is missed.
+#
+# In Linux 6.11, x86-specific heuristics are introduced to fix this problem.
+# See commit cfa7f3d
+# ("perf,x86: avoid missing caller address in stack traces captured in uprobe")
+# for both a description of the problem and an explanation of the heuristics.
+#
+# Add post processing to these test results to allow for both cases:
+# caller frame is missing or not missing.
+
+missing_caller=1
+if [ $(uname -m) == "x86_64" ]; then
+        read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
+
+        if [ $MAJOR -ge 6 ]; then
+                if [ $MAJOR -gt 6 -o $MINOR -ge 11 ]; then
+                        missing_caller=0
+                fi
+        fi
+fi
+
+if [ $missing_caller -eq 1 ]; then
+        # Add the missing caller function after the current function.
+        awk '{ print }
+             /myfunc_z/ { print "              ustack-tst-basic`myfunc_y+{ptr}" }'
+else
+        # The .r results file has an extra frame at the end in case
+        # the caller frame is missing and the 25-frame limit goes
+        # "too far."  If the caller is not missing, fake that extra frame.
+        awk '{ print }
+             /myfunc_b/ { print "              ustack-tst-basic`myfunc_a+{ptr}" }'
+fi
-- 
2.43.5

