Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4987B1C9EAF
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 11:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729769921; cv=fail; b=ZULtWvOapkZwjH5766kogTGvlZ9nl195Ml56Xpu+zxsR/5mDIuI/XJlCrplBFvl8MzNwGSjMX9hR0QxHscUd0bTroe/+k0gra3lLG9SJfcvSDmMvgOXkw9q+si1vbTj9LM0CnYb+xUEZl1fGyqGId8PbAdMvWUrO5z4+uTuUyZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729769921; c=relaxed/simple;
	bh=q4Z/ezUZjUywQSGrnjDin/mWYicZTwkLIXIku9bIwJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FUGbnDB0QxYWOOeN+bcoz0LbqUM+/z8xsboFOssCX5zvwOiaOX3Z6uMwuH4gpDFENW1Kd6qPHxl8Lyox3vv8NJUhpnnJe8UIO6EHGrycM636ObjeZizenhSPe6RxGx642H9Q6Emg/r5Dq61QCd7Zi0jugpHL5yGp44LXc1ElZi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=V+ww8DfX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zdh+504W; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="V+ww8DfX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zdh+504W"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O2fp4g008681;
	Thu, 24 Oct 2024 11:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=EOEsU3E1nmMo0ODaS8GX6vGKm5KRUFp2shrhdXoxJEg=; b=
	V+ww8DfX/3i6Q6D60IxaGX24qdjLdCOXGb0TPf0a2jM481C5nowl13crUO4gixpt
	tcrN3lNxiXX3SEo46K7SRfXYUyUzxkHPpx8DHwgYXfOWJL8nMZb3evHhYMo7j8is
	b2K6ayVw50gNKcmRO/JHyI7KaxTnHPW1MK9kE8n51gI15IGpAYaW0lq/4g3XgCia
	Y0dLcBjFlDljGaHfGMQzhYmdNEQLPvFHnXzxt6bFGq9lWz8HQYz/TptECPVXaZVi
	BOzqnwGByfuYFI1rMp8OJqcBqZXu42j0kNFV8N1YAdA65Y+kP9itlG1d4OSg6yfq
	2EnpWRCDLIWMV6aNHbN1rw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c55v2bp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:30 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OAUPNj027356;
	Thu, 24 Oct 2024 11:38:29 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emh45ych-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3QUWcBht+8MkoPmyJL6GAvjE3eyj+cJ4cucRI0IOpX6UoyzjDST+j9V14zoo4SFNgRuxM6wAzwqzMOvTFYwMBsJyIiiwXupeuh20IywYT73IetZVJUfdSatYYqvVU+PotBKLEp3P83CjSFeS1qd4jZwASU35XDXYle6lLbSuK+9uJLzXz6wWUCbeJ7ckuUcmozeGuHBjeLATgikH8GQGUmkH84pGdphzgnnYPfBKXoGiwmb0s+MXkejZrgTcFNkhAsYGmvEQF5HNRZdSNwd2OuUEmD9JFce8/rIJ4WnMLIqdGqTYLXEkL4DZzZChTvUZRE9exdhmNiTe8XWZFp1tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOEsU3E1nmMo0ODaS8GX6vGKm5KRUFp2shrhdXoxJEg=;
 b=UicJmG3gR0A0uk/6VXfzNvD9xG7wvTNWwA7BM+2y55e4Qf+slBtRjjLuX2v6KyhnRsE1W6AzphhoTt99YlMm9Ml88hkHgBekb88lwl63/j8DuMw3y8VfnKRn4QQn4bzIYJd6UoGchtZX69Pg/O6H9CpVzq93McvKjjGhcEk9NQZ3uUOiMtOwwIzkaRBUGD8fewM0GtXmSf8PtA9cuu4f6r+uO71Iq97a5RY7g8auTVvG5umRfIAgT4pzwHJ4dkJZ3YI/BnH9nUxRAEDPHiHny4QdbRg94kIhsy45N+LdU1nqpocBF3sOs7JlFVACm57uXkKIjbJw6r8OXOY2rh3cHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOEsU3E1nmMo0ODaS8GX6vGKm5KRUFp2shrhdXoxJEg=;
 b=zdh+504W1L36QVFZOl5QmArLHyrfywVYaO1DffXekVlG/tL+ecYS/GIj10XZ7RjAZ5GFqXGTQIuOnTUJwV82F3pkFVnqTIWV+eW3AWPvZJrhPGOrHfboUkQggga7of0IlT5TGEBlI9OPj75404O7uU9oXbzVQ+8Xa4SMdDfb17A=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by MN2PR10MB4269.namprd10.prod.outlook.com (2603:10b6:208:1d1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 11:38:10 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 11:38:10 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org
Subject: [PATCH 04/14] build: substitute LIBDIR in pkg-config files
Date: Thu, 24 Oct 2024 12:37:48 +0100
Message-ID: <20241024113758.182050-5-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241024113758.182050-1-nick.alcock@oracle.com>
References: <20241024113758.182050-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0591.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::13) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|MN2PR10MB4269:EE_
X-MS-Office365-Filtering-Correlation-Id: b192d09b-a66c-431e-607f-08dcf42055d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W5Hg/SxFttrDNxez0aPQ9rAzBEDgqPj1PFX6bCfKMXaQyUkpDf6QqcmoiSXU?=
 =?us-ascii?Q?/9dvNhgrt+c/ZKgpwwBE2ogvoc112AvjRXgmYa7TogWQ1jLBAUbus0GWYrI/?=
 =?us-ascii?Q?60Bx5Y1PVXxRDlxOUekrmpijR9TrCFlr6COBD8fH4f6jK4a+q36z6Pj+Eqv0?=
 =?us-ascii?Q?kpjOvAs9+Fe6XeDTWIIY5crPBlVDa0o2KGuBeCAavf33GuvsyDuC5LDcG1w/?=
 =?us-ascii?Q?dOWe161JeAvjLHH67AqqjL6JsjzKSF0cOSG4/ULQttwGOGLjMaPFB/BwjA3Y?=
 =?us-ascii?Q?jfUgVKOHUTUclClos13XZBuR+cv/0XZrSCaRnWvjUEBn+qj1w0wE2ZenXDLa?=
 =?us-ascii?Q?IjXj3VpPzfh+yooMsfHNKyBo5Vcpi2AFQbTBQSorNZOG0WnPoy09qcMRwbkk?=
 =?us-ascii?Q?qEa1XkVoTPfPvLRB2CcHHRF9ouQoKIWQkHsUNMlV46sKlpePZ+SYFfRJI5G+?=
 =?us-ascii?Q?rUbeJUTrkEbsUHKCGSM+gBVJIm7se6JgZfi4Ocvsu6pnqktaK5b8I6BpFDkX?=
 =?us-ascii?Q?90D8Dorlbr+YelXNKgSIxioDbU4cJR9IsfYV0m1c9kXGnmX06PFZfldHanic?=
 =?us-ascii?Q?BXFG+8z5alXBXY9LlH3vYVfk1s3Xs+ke7ms3qpSFLmuWAhNfuARw77dhaZwa?=
 =?us-ascii?Q?D/MUWjX05fmddHEIBbCsaQFbfhl36fCNk5dnVb/mNUoWfd5eIhZ1aE9RguS3?=
 =?us-ascii?Q?2RhmyFIkcI4Pzc1xrrUJEGVNhIaXv5V8BKwRalI3WQeOMO08VfVKFyGNk1Hm?=
 =?us-ascii?Q?VBdCWgBt7S3vpSTnALN+5DANITvV5wWbHa2tejARhtHtqcN6AASYBruGGumZ?=
 =?us-ascii?Q?PzOotY9pmN4h4nc4gCBlbrlEvBQVsftzUKSP3H8iVDZbnJ9ggAejizgsqzow?=
 =?us-ascii?Q?gH/jRr4QC5hcMBD75iUfMF/FmUHxtUIze0i5bPeR745jbZOCXWUpNqehaP3H?=
 =?us-ascii?Q?Bc7KIVLrViBCYwGAu9L5rOdetye2K9lhmh8R+GzI2DXuw6NALVX1fiPxNydf?=
 =?us-ascii?Q?OX/ZoeOms9ZbfyPuob2lsPuvNj1yTO8NCUQ1VDRsTpbG5cIVQSNvWh0q0rW6?=
 =?us-ascii?Q?XJesLuo3qxtMcV0s20+3fhK6pHWtu+oecB+/Xln66RbftTcS4hz75nHxXi8Z?=
 =?us-ascii?Q?mPAj9ys3BYV82h7+BXC6wJbj0MuaBrRKw596Mjt33B5Sq/G+OqXGIQOFwghg?=
 =?us-ascii?Q?y39EVrlRcRt98V5t+DwtCd4VQDf97pZ0qMUw4sXnwwtM/1TtF8CAb3mF0gw1?=
 =?us-ascii?Q?GRGvd1bphQ0q+Zlf6qKm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cGNTWhWuXKjBq7c/+PHc/l0/32q+e0YXWPGUL8jyvgXwkTmjsoRYA74fOtE1?=
 =?us-ascii?Q?F2bwN4MgFcrcRMO6EOAGH3pZ8ePsWBq4Fdk/JtJY2Xs8ibgXtYha/rcy2rO7?=
 =?us-ascii?Q?YK2Dz4r6nnCnf13fTgvJyVMl7cBRdpxj9RT3DCBPRmDeVjG+2QUlLblhSC4R?=
 =?us-ascii?Q?RXEGqx5kkQQPxZdT5269DX40LF3BGMouaCWj9D17YeFw2dH0csRlZ+LdbndU?=
 =?us-ascii?Q?I65K3jxGPXvImP7jd9a86lREwxM/Pe0/C25RuWHunkxXsDj7gaqk/Er9iw7v?=
 =?us-ascii?Q?PoBt79n3wUqF9F5c+PNDOFObZGO5w9YT97kWcVo2x6jY4nzlfFCqiUh0LXvg?=
 =?us-ascii?Q?12dJHpVcM47UuRkp9buba9iI3P8t8wGTh6w+jWemsFRkGzdBbibRKku3a9rC?=
 =?us-ascii?Q?Gs0kxb4tc5BCxna+FZ0emY4xiPs/iVFIIzRp1sCpKNQuYvSRy9HfuMHgKXK9?=
 =?us-ascii?Q?317RZUhEjL6Qixnsy3mR8vEbs7qVhQTELFgM+iGVtHMPOSplNpByUYplpVGF?=
 =?us-ascii?Q?Inn+BM4li3qfctxrLbHHps87TYEv7pGn61JLuA9h24Vwjcmbq3TOUHXT8v+L?=
 =?us-ascii?Q?Frd2Vv2O57V3krCH/H37bSQhcRau78w95HEDCjZF/PVAz5w5ubuGkR9TN02o?=
 =?us-ascii?Q?pU4o0uB2DjSEjzFNwHk39p1EsHLb9FxdYQCybgyGsHNtEClooLSlGmGZsf5v?=
 =?us-ascii?Q?xDYaG7+Xs7dU3/vwb4CsHJH7kVTNcz4wcs0H+2iArRuccWpXK+zEYDw8/Xg0?=
 =?us-ascii?Q?5hdmQWZPTLpYzfUN2mEeJpq47oij2zEmm7suRK3C3EQ2OI1Al1G6Xm2smX+u?=
 =?us-ascii?Q?mKlfK4hzMOGN0es1X8j2zj8CL7+0sNyWOHbLexnD0iiGD/ZkudEKDzTV5Gnc?=
 =?us-ascii?Q?rx4gUHuEcJ3v6xTVclxLqzsH+0DRU8oiJ/lUB8HicnhzLJhdLFP840QrMVTl?=
 =?us-ascii?Q?LGe3GrmcNSIjdo76Xag0lSyC/fLxUqGnSrV1U2W8Jp/Xxv+xz4ILpzOYheOG?=
 =?us-ascii?Q?hG66kDAcB/VC8DEDhwmTFRlz3EN1NQ2HQLWpvX6VnvdgRPH/OH/4xvItw2M/?=
 =?us-ascii?Q?ISt18zsi4Uc8xQfx2BoybrzhI2ys80t6F9+2xJ32KmWw2xUAPc6Sdagrbsyv?=
 =?us-ascii?Q?/iTjHdqcTIahGoKIn75TOUPKAPGjmOV0/89ZA5ttadGbMbdwWR2dw7BTYm1j?=
 =?us-ascii?Q?KNfu2CJC1xF/+d244CcLw42luazbQgMK0DSkjP0JHQYd02cOOlmVx4d6ro4q?=
 =?us-ascii?Q?bChAwvhfugTe4Ta7j9qaeVCGyfnipQyoO+7Adgtkg33HqUlI318qEp5n6KN2?=
 =?us-ascii?Q?18XMSSi3gkVFKu5evRhQP26xEru35XL2bFlb+28cykD8nVhyJnWviCzEWnPu?=
 =?us-ascii?Q?vj9sxlugr19/RmVZOF37g98ICCpCnCAvZqIvgiaxPQl60iX++FcyujdvDE4E?=
 =?us-ascii?Q?hOmNNjOBvpU2y14FA2BKvSbj/pFSYDpNj0r6ZqHQQ+VGCmDt9zcNyp8+ea3p?=
 =?us-ascii?Q?SeF8j7NNlAiP0HlULGY2y9xbilclOTo0b4fZxV2jmreW4IkCFgoK/R/gorG0?=
 =?us-ascii?Q?qnXACL/P68oxcVuQz5OGY+BLMfr6MDQNipyZPm5e2JYLUMRmtynBv8mnlHTq?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	L3r7ng+TOAMfjE9n7tfrstQpFcW/OUtMUTRNcWhX+CcmD3sk+psBW2rKZrhuEojSOckE9AcYe6ggLYDwmRdO3Ri8M4cV2GM1mpmm//qa6YcWmfBLAI3BYAkOtnsRzCo/kd63ZveqX3W17oc+hbZ/U/aDJs1ePSusccXt8xoGmGmOBkI4YFBr+mLCrHZEwMyaPsni5t/LV5gslcLvzRd8rpi+ZDzrph/EXCVqpshhi4Ld6wZhi4HTx9Tm0kIc1ENT6ltPKlKG4Ypa2WgspSj4n2ch0Q1WzqqXuoZ8JIvs5wnai1svuoJE+OfhkMuqxT15TwyeO9kaxpBLBcX8qm0WaxA7CeIcp/NlXx0/bjY0VNXI5upbpGEvsyqa+wKW2nnaNaTl4B14hyaVxmZ1xxInqu7oCplUjVkFA0Vrbaaw8WB4D+yuZtJQmw0PZNahTkF0W7jqrpet4v8emOl9Z60TxfUOBOEb/6+9Y/oGnvR+ypg7gNO6lt8iYyF+O4i64gKVlPMpVQ74Eg9ykXtj1tnKkUnK54er63lZvVoRnop8DtJgLF4XdpBTXx5g5oxcSE62i3OOLY9SL0iW+Fhs+ZRcga3cG8HDGosYnc36qwKvO+w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b192d09b-a66c-431e-607f-08dcf42055d4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 11:38:10.1750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DfGJBx96gQtg71zLQtEP11t0jL2WEhjAXb4Rn14mN5M5rPSAX92C1ACH4fUamxMEcQ2GyvZbOinwYtsWpf/piw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4269
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_11,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410240095
X-Proofpoint-GUID: I89CprFrwZyOzQ5t9OkXh30svgmZSIka
X-Proofpoint-ORIG-GUID: I89CprFrwZyOzQ5t9OkXh30svgmZSIka

/usr/share/pkgconfig/dtrace.pc says

libdir = @LIBDIR@
/* ... */
Libs: -L${libdir} -ldtrace

which is unlikely to work.

Fix by substituting LIBDIR properly.

(I looked at these pkg-config files after installation I don't know how many
times and never once spotted this incredibly obvious problem.)

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Bug: https://github.com/oracle/dtrace-utils/issues/104
---
 uts/Build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/uts/Build b/uts/Build
index 181819410624..65ddc39845c1 100644
--- a/uts/Build
+++ b/uts/Build
@@ -37,6 +37,7 @@ install::
 		(cd $(uts_DIR) && \
 		    sed -e 's,@SDTINCLUDEDIR@,$(SDTINCLUDEDIR),g;' \
 			-e 's,@INCLUDEDIR@,$(INCLUDEDIR),g;' \
+			-e 's,@LIBDIR@,$(LIBDIR),g;' \
 			-e 's,@VERSION@,$(VERSION),g;' \
 			-e 's,@DTRACE@,$(SBINDIR)/dtrace,g' < \
 			$${name}.in > $(INSTPKGCONFIGDIR)/$$name;) \
-- 
2.46.0.278.g36e3a12567

