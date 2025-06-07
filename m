Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC89258CDB
	for <dtrace@lists.linux.dev>; Sat,  7 Jun 2025 06:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749276910; cv=fail; b=QigRuM7Wz8UDibTF4yiTx5Ie5SRbggAv/UT9whjM5Q/P588rj2A4d3AG2Qx9/OJClNZSaRKQqJYK9VOERud9FNaLYo5xsLsTcZsRowyWYTwg6Lzf963mCqqQGbyzSa9/qIHa0Z7Cn/TPU0Vsi+c9fwC+VX5zQnxGQf4w/UZii0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749276910; c=relaxed/simple;
	bh=fZcNffesM892SUC0pRCQBeQRMAK+NW7khe7GTbEHQJs=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=IYtC7TVgKZTesdkXNaPh+44fFwGUu43Uq4cnNjCM4B3HczjEtMdowHRboFlvhgMdlR2edhwv8hortsP+Ndh6CpCnmrCCXW94eD+R3dwI06OEIL7/PPX5XUVWjqnglYOLkJDGs1vuzec6/wLYSMXe6hB6Q0xkWg0ZG7OjYwsd2i8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fmpZ4QSm; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UMewKs4E; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fmpZ4QSm";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UMewKs4E"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5575K1T9007587
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=hTnMJPkbo//k5cwScgmieVuSW43K43+O9TEcd0tKpz8=; b=
	fmpZ4QSm3CUiUOaepbq3S/k1nW8BM10Ljd+1xblJDROY1Xjvqt/fhAevObNWJ0Ax
	wlffON0UP+ltAmXcA02/BjW0ray4uPoEiZPzcIyVp+qF3PIIsyRMZ1iS/88/LgqE
	BW7GzJIgo9QunUxtRvdymTDXtCa05ajS7a2OJk2sTM/S1v0FZulVHGApp8vR56gz
	Y8M9zfDyzXduREZivFyp1o5gZD7E5glQdesQM0SlEznmqAq1DSbe4CHLVzpOcBR+
	4Z1Q8m1K4aNPvjHxmrphcBxawmKKBjuaV8mtUnAHQIytrQzmOtLC7HtmjPHrnsDY
	S5WQKjs1RKpg+etc23yuhA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dywr1p1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5571Y5pF020395
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:03 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012017.outbound.protection.outlook.com [40.93.195.17])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvc404e-12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MIdIchyCEiPV/BuYZ4+8Urt6QXbkLmThxMQzV9osy0+km7eG9tQSQ9cMf3niC/TI+RY7Frt8+ZcBImp8NpU2JOxY3C3QV8h2SzRxxStfM2xcQ/kNFC8YQCWX8FFpLF9Kd3PYD8HsI85OljIbObiYJopraFUfTb3WSa534PCe5COkU8k0m5iXOSEp2sFR2mq41q2LyxqbrDj+ebkkX3wK3mx/f+xvff8zdx9efNwaEJGoyS2A1EWQJfUIGul/ehZhoN40Hsyjjm8oXaIVlQJtogPAf4lKari4cYGA5G/1R1rn1bYF2nUSAk4zcUgdodmeNPCkAAXNTUmZXSrvNmxExQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTnMJPkbo//k5cwScgmieVuSW43K43+O9TEcd0tKpz8=;
 b=j8oeEwJvkuVNEacbWQdWOwznkJtGLozVieVXW4pw63Kd5qDdf//jBvy11IAl8KddIyw9gEad9TwdSBbOZZbNMt5WABmhEsVIz5muFf6uKfCXRRWRHMEBtDvIz/Jfht2TsiIDKTHb+zOjemv5BkI572RC6P16L8/eisz1I/HYkN/LEQIikFYY+TY7ooj2o07z8Pcxj3+rk/ARq+PLqRjuiaBDOhWOwr0j4ODY7lVxwNBMuhtignCrMA1aSrodVqueicHJSIUlRBjYhcSJrM+WMK6n9iFS0yYNhRYJpIvT3yUEV5RDZR5WJSkxw6DVYk1QJRUNiZvYEbfPCylIg4ryDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTnMJPkbo//k5cwScgmieVuSW43K43+O9TEcd0tKpz8=;
 b=UMewKs4EMnClB1ClyY7hA+64wTyGTWF8SHeUehdty+TkRt1x/HJO7f/DN2TwEUg8iZX566N5bQWcj+Lri3yDMMycHQZGq/z0k60nLtzn4XcnnsBTBHPpqYkW0z2zu5tYf2LrSFCzZIzjz2c3NX/s7SubHfD2eva0gVJp/Zao9IM=
Received: from IA4PR10MB8374.namprd10.prod.outlook.com (2603:10b6:208:55c::22)
 by IA4PR10MB8636.namprd10.prod.outlook.com (2603:10b6:208:568::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Sat, 7 Jun
 2025 06:15:01 +0000
Received: from IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab]) by IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab%5]) with mapi id 15.20.8813.020; Sat, 7 Jun 2025
 06:15:01 +0000
Date: Sat, 07 Jun 2025 02:15:01 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 08/17] dtprobed: fix probe name debug output
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:36e::16) To IA4PR10MB8374.namprd10.prod.outlook.com
 (2603:10b6:208:55c::22)
Message-ID:
 <IA4PR10MB8374B1A8962E080B950EF42AC269A@IA4PR10MB8374.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR10MB8374:EE_|IA4PR10MB8636:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a3e4040-74ee-407a-7456-08dda58aa30e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QPfY4SlVBssTmNAiJAa4k/YPuGwpklbNP1r7gjJz0B+GtlxTh+YP29Lt8Hio?=
 =?us-ascii?Q?ofyRywevQZOYjGn5DD1VnOLI+5mkIBYYDM7vU/cfNcttaVzT9kiYOkybUlzi?=
 =?us-ascii?Q?XoUgrxckG2QHdccLPsYvMUaVKZ4y63XufO5l25ATaPU5kQJ1jzl9+pFJGCV4?=
 =?us-ascii?Q?0sJtXOEMQO+/WoewQVCs7+s+kOIYneYb99HBcctc+LSfpidufCUl4myAzxrm?=
 =?us-ascii?Q?B0JX+jOiRc0CPiYfxX2SP9q8+FsB+dTOYnzuikse1Lse2NuTX6+LfRKhSBmp?=
 =?us-ascii?Q?m4qZkL8R2w3Qf3bNZncujmREFw/qcZ6dVo+LXe+dp/Aw1h56HiErve23UoX4?=
 =?us-ascii?Q?GS2YIlO7brdpxDMxe80T260mSNSqcpmh88d8v89wmyjRUhWGAG58jz41HF0j?=
 =?us-ascii?Q?Qmbw2qVslkgE0bReAv8g5jULM2FL+CSfGKdDRKCpW8IKjU6AchTTvXzgXCHD?=
 =?us-ascii?Q?J0g3oUILy+0PopfbX9qAxOArQzLplfot0LQXEhS1xoeU9Nr4Mig43hS4k+7J?=
 =?us-ascii?Q?CLkYe8juDJ9O6co++hBgNBx2znCWb46x7tl4htwyCmVu98AK8mT+wqEW34sZ?=
 =?us-ascii?Q?CSYuG8bPb3Qa04vaMHUiq7MKL3CZA8lxg8njq5urwu1VKQc0MG1toLjGm+4D?=
 =?us-ascii?Q?/udzs3ucbcl8hLb3JBCfb3+NVL+5PBpMltfpJFpDbnkxNSHVXXwQZyTViPpO?=
 =?us-ascii?Q?vrK8cIZfapFbEM50rkWuoYiE7Ds7PwWaWRayKUQUfoW2nx+VBq1hSjZHgRUO?=
 =?us-ascii?Q?Rm7kKqC57mZHhBq5+avrsVse9kXjeVSJTfhPotFs4+faNgcOEQarNRuCAeGi?=
 =?us-ascii?Q?pYZN0tf+udkrdwKnugVPE4ki3WR0Hy4W0cnS3cZ/ZM3a9OVB2GUtrMUcoZz6?=
 =?us-ascii?Q?j/5mHvMn7mZMjUcNMbU9mMB1c5yBKe7/IrwPxAozpcKczV4ij3Ny9pBFTWc8?=
 =?us-ascii?Q?YsBgzUc8A83iEHO1KHIwRIwuK21L2rhDhIGPM/5XTTW285i/fGuK0vDqusZm?=
 =?us-ascii?Q?SXllKmyYICl1E0C4310Q5zLDc/gUbRi3ePiyVSDCaHISJxGp4B6VxryF1LM/?=
 =?us-ascii?Q?kifpWFI+9f9NhgJkr+PMrDIKcA7eKWpTttEvdPBaOeSfYt5NTS2PqquXX9Nz?=
 =?us-ascii?Q?HJurK9XuLoYzanuw2gOBtIR3yEywkio0H1yY+nYzLQoyu6D/a8wQfebESKLY?=
 =?us-ascii?Q?8rxDY7aaofqhCjFnHOOEXc8KDkbNrepq81r4Kaq2oz6jk4qBuswWw/6HOqKU?=
 =?us-ascii?Q?jiMEKPOfQG412KqAEW6DR8WLJa6q8zQOs4LZoIisxvfQ/Thmp7vlvmuPnczp?=
 =?us-ascii?Q?gVhNsTcfab7rlvMJFjU3nfdgHb3eJnYgDTS3yJZc0E/euZQSbxcN/MMRD8Ol?=
 =?us-ascii?Q?2HFSxdl7gj48SvlscdnVqTZQfYaiPIMQRFspyRIYx2r6MoGnrTGYf5F17gJk?=
 =?us-ascii?Q?x403DRLYQGc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR10MB8374.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m8hSQC6RfSFgvice3yDpaqtpvJVM3Sw6NsY8smaVKUcbpcjBQXqACs7Qx0bg?=
 =?us-ascii?Q?JgTkBRuwlK8RY+QEHm0+JP0IDFeizPxQhIwO1i5SV599bsl2kzcRFSg9255f?=
 =?us-ascii?Q?x95zXFEco8COHtPlSO4d2qtl73XbgkG5T3huZIghDQ+tr2/4Jnt+GJL+XBhi?=
 =?us-ascii?Q?bOIXFM7Qj6H0OGvnMkhTxcQ0rJODJr+zVmnp5wedWtKbgDl5hTEY+WqHIG1o?=
 =?us-ascii?Q?AG5U98ifTrhpHs0gexBMcgBz8e1yceNc9BRVNmPb28/v5S0b/xwbRFqPpfVn?=
 =?us-ascii?Q?Q55jAbHhjyxkrt88ADCst2j8U1ayGm885EoN33BkZFz3Q/JLRb7pr6xXbBIV?=
 =?us-ascii?Q?3cHyiruGHgs3l9TP8IbRphpG/MthH8B8BfnC05rTfsmHlm06nlq8yyksvWtG?=
 =?us-ascii?Q?vRCeN8x1NG4y8BpOrdSHvbgTnAfrD9+X5+eH1fqoMiyJ/+6XbfzSpHilsW9j?=
 =?us-ascii?Q?D0WEN+yiXk4R4KmkVzoj+4Fpb7rS5PWD3NSYrVZgi/Q7ue2hvseZva1JldUS?=
 =?us-ascii?Q?BKBA2ZIBMrknD45bB0cYGcBDEJ5mkqtau/4TN/Oc98Vb7shjME8/B2UbDJf0?=
 =?us-ascii?Q?bzopiapjJMmNX94+k0S0LqRW1ZA3W5tY/TkcpqqysIpHA2ybLkzQF1PFKkbm?=
 =?us-ascii?Q?Js6+f/z+BhlTS0/rKtUccXJdaX9e2gTXi4bH2orXWRwnBzcw+t1iZqGnU/j8?=
 =?us-ascii?Q?kPOxlH5CY1Ci2cbl1CBvnuOueW1NhjP6mpykRj+qbQ3WpiHqu9gB9yD/tvz2?=
 =?us-ascii?Q?8Ula7L4M8DIi6UquSs+IKSPp6vsMag9oJ4G5Cb9JLGJpKyZDR+7OXp6UeS40?=
 =?us-ascii?Q?HUTo8Pqin7VprRdeFaXs30grbkZBNWpgisW9b8rml1yG5DJjK8ccPsrn5BqN?=
 =?us-ascii?Q?x8ZlQ7SWOd0ZtrD2U6wIDewTUpFmcQ99AF0vmZxGwO0H7pXgHa0TJcdwd+ny?=
 =?us-ascii?Q?8f21HkD2t4VcDYfzYUKPcqXmJol+frNIu2KGQI2w+fm/e9cPLSxlYd71pVab?=
 =?us-ascii?Q?EFrLMiY+3GraKolRGQ9oLOe4Ypbizye66hvZ+USNFNyX3Hc3XllhXo4jHiEw?=
 =?us-ascii?Q?v9xYpLFmkqj/DhX6qNs5RfSoMXwIKEI0BwKe7SbmNNbTOmcI3vmfjCr/LZvS?=
 =?us-ascii?Q?PQfqAbArwdXPK/fBzRHEr6l3U0xV+5bE6w/CwO28jmOVScH6tOvwaBGmY6B+?=
 =?us-ascii?Q?rSWiC15FbMIIA3fuUoXl4PDj9kWjKs4M52w2D+/ocRL71yAJxsn0JUtgfSzT?=
 =?us-ascii?Q?cQKeXKky7982rYDxeH9+bNaaM5G9Pg3v+yT5ELEiXI69vJ9SyTSRQsSpOcs4?=
 =?us-ascii?Q?jlFUAG/OzOmce67O2v0UpZuiT8ER3T1RhGO9uW6hbnuIqBqMsAvh5trTecyk?=
 =?us-ascii?Q?CnEth4b1vkbuDma3Sb01BNB7nJW182AqE0Cq3XFEQgN4XjV80QrCd+DwjFgP?=
 =?us-ascii?Q?OAAPNupLtZBfo+rly54/6dQuKc6ALvjloifXR0u6Vw5SJZPwpXMBDGwkMx/S?=
 =?us-ascii?Q?vLJWtDvoWZTnvhxIibq1pjN4HSs5vh8a52VOJYLpqawpEwaXadd92Kpb6X3b?=
 =?us-ascii?Q?XF09OuU6MYzD587y+O4gO7YL4wrqe7t44p2rtqDDbKHiWiqp0EWHw3eTVkuQ?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0QRaHrOHT+fyM/qtgn/RESyxBi/YFo+lgR+rtJKbnfAcxy5QIE63I1JiDfkI2hRGzBp+u6KNp8/7iGqjsER3DnoKASpSdtoloEv2lfT914xXdaAcEPato8ycPsIGtx9pC/filbnMfeDm4iTy0B2+H1dSXMZLMCfmcpIfoQv/RpEpHGr90HEpreLBxy4vFAiX3O9cBjqVJEHJyg/+LCXJGfdGf70hC6rHZ/NQysawk27QbIUVX6XVIkvZ9CTB7JluFBPtMOaCjV/NuSdBwGq8ad0vAJD2VfyqqknFcwY8Lg5ZFp8taFbwjSOrmwcFTanV2bq6+/4T+DA3NIi03ijKJrvtQAUfX98K/48lmwlvfmdGiV/CnWQtdghkGTli2sH5n0ykldqA66Uw/3OZYawyoTMV4Py5Oxeax6ZKPq/IaIlOxNjQapQkCa1e011dd8RylNWTcgyfXfr8qvBD2JLTVgComPw2mx9QMOEhKMsD9f+0cD/3yOxx6LzD7P4TciUBPi7v7UtDU1F/AJo+B8TmOVqZvy7Luxv5bar4UMwBzOvGKpcsRt7tQIw76jfbECCIjep7R0CSTUQXjwWktXXdiMmgNVcVAlFJ+y2c0/MyB9M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3e4040-74ee-407a-7456-08dda58aa30e
X-MS-Exchange-CrossTenant-AuthSource: IA4PR10MB8374.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 06:15:01.7066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k9wtZo5+sOCymF1xVGet5J+8zAXhko9aFsEOgcNChMI6uZtvMZWYXeD/yiHUGgic4eQdw0R+Gssg034yMURt0/M91Px+QFQ+xyO6qnDEWBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8636
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070044
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=6843d8e8 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=pfvF96fypuQoHP2ePVEA:9 cc=ntf awl=host:13207
X-Proofpoint-ORIG-GUID: cQl4QEZZtOcgubNCCkxeRdjaKbvJOPGK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA0NCBTYWx0ZWRfX4pNHvPEKKs65 CTqeZeAMC5zpOONzDDu3FtfViB+7WYgGmuYy+SeZ3pOELV6YUw2OOTq8sfXnufAjifCPoIiC9LC KnqK86/liWD+V91RrOp2SxKGhuv8J2Uk3FWrIczjBMwBshh2R7rIOzndvuRn44TnoRUH7mvKaPc
 SOx9UpEhLDfsizKwKqgQ21AnHIve9VpFMwfxtQeTMxHRWT3vgxCloU7XcWz02G7t1dHK7j1Xrz8 4Fp18AnPDYq8sWR7HLfnLRg+VRGaGcs8CZDTh5qPd+Iewz4XS3NeusMd4GWvlJJeqHmBAoaw+54 rqTcGNFPrW9feDHb0jW1Yacgki6dR9wg7dIlEGdxQfh9hGWwkzo8mLRl02YCEWyuh4bTIfOS5pW
 GCLfzK2J6pXxq2G3Ig2u77Ya0LiTOZW7UXOPs4XbdSg89hKsvXRTG7+1SFOwggHJ2USUuYE7
X-Proofpoint-GUID: cQl4QEZZtOcgubNCCkxeRdjaKbvJOPGK

Debug output while reading dof_parsed_t structures was printing the
probe names as provider->provider.name and probe->probe.name, but
probe.name is a 0-separated concatenation of the probe name elements.
It only printed the module name.  Corrected to print the full probe
name.

Also moved it to the proper place (when a new probe is read rather
than for every tracepoint).

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
---
 dtprobed/dtprobed.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index dfdce02c..de15e546 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -802,6 +802,18 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
 			if (!probe || probe->type != DIT_PROBE)
 				goto err;
 
+			if (_dtrace_debug) {
+				const char *mod, *fun, *prb;
+
+				mod = probe->probe.name;
+				fun = mod + strlen(mod) + 1;
+				prb = fun + strlen(fun) + 1;
+				fuse_log(FUSE_LOG_DEBUG,
+					 "Parser read: adding %s:%s:%s:%s to stash\n",
+					 provider->provider.name,
+					 mod, fun, prb);
+			}
+
 			if (dof_stash_push_parsed(&accum, probe) < 0)
 				goto oom;
 
@@ -814,9 +826,6 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
 				    tp->type == DIT_PROBE || tp->type == DIT_EOF)
 					goto err;
 
-				fuse_log(FUSE_LOG_DEBUG, "Parser read: adding %s:%s to stash\n",
-					 provider->provider.name, probe->probe.name);
-
 				if (dof_stash_push_parsed(&accum, tp) < 0)
 					goto oom;
 
-- 
2.45.2

