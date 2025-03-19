Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FEEAD2C
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 06:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742365963; cv=fail; b=ePBxdQ4goYuAEU7g+UD1N2fqU1339FqpbXGMI5hKww9bsNE645VVqaknHUM3d2ya+xLUCY1AXm0O4r5RkakiWBpcPvMt030KlfSK8RnvNg1UX3/Ob8xIhM87GMn0cKwj8UfgQRPfbhT0O7yv9dwts7dP30fSG+dxPrdyBj8jFgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742365963; c=relaxed/simple;
	bh=+Xsde/v0BjS1X9nnqrOR1TPuO7onJG48KpHJdjrNa3I=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z/FQu1qC19f7jOrQhEIQy5Ar8W/1aTQnYmpMyP0SFmvHltxQU0r91myZisGyMKoO6suZD+JW/o5S9T6SJh+zEasumoBO1DphtyFT1RCR9Dull6o76K3yZtVnwT3u2S+mQ7zec+T8GA85WR+5QL4h2gcGO3i6QFzBN8dV+ZIwzzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NmJC2mqd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xSYprI/e; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NmJC2mqd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xSYprI/e"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J6FMau019459
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 06:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=uD9X4Z8JR7r0vnHfYX
	t4eag247Ine2oG90pKkeS6CJc=; b=NmJC2mqdu9nO7aK6dX0vRgSNKl8cjm2OKt
	Foh8pxn4JCbhXULO2MLFuRwt5mKK2DbA2arGOndoFmP4b0Lz4tqS86YuqItNglTt
	ml9hIo0TjSDZ29UEqdZzPKGKLKPPSTh73apbBaV71ojVf/g7su9DbwtsQQVEAqI6
	SaVlnEPy5PzR7wE6Mru8KKzCnS9y4X5PQwOKuHOvXdea88LCiysHlsbpoL3qk952
	ICVrI35/UqRxTq+kM2PmvqyDORUf/8+1m5Nml2uhTSkSzX4YcsPqjxJ2ABWs3Br8
	/wOb6ZcLCeyyL8mEE80HFWAAMBcPZnoqFHxmhVlNGoHKHOSfjnMA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1kba7yx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 06:32:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52J6Gmvu024498
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 06:32:38 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45dxbjfwb0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 06:32:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sM44LtWxVsXXJbnjrNaw2DFlQOGB6GsszQpGbJ+R3TY4BDo+x0q/yh6KW6AzcV4dDpS2MBLRUW2vfDHO4oaJ6XA8WSE0jGPPgSo1CFnFNaz7xzBhp9a9Ns9N2hD79K2NJErHsIkZHohed2Og4TK+qO+vV09flg+YCsqVBlWH6OTit6lZCVdh/vsTzAeCrY1IYR5kmslNmEgMZU2CsHtYx7CcvhwTTXc6Yh6WvtdlkrAPV5oVyOIZiTJDzdz0Ww4gFJ/AgxxC5Qe5Ntu8I1GRPrfsIyAznFMfTDeeEW6/tUyWsI1KSTxL9s56a1YjcSHvXs3pH37U3jnoK+DnHnpCzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uD9X4Z8JR7r0vnHfYXt4eag247Ine2oG90pKkeS6CJc=;
 b=ZTPbWIsveKcd1m3Cj3o1uXpyd4fkJXv1GmTobq8UVd0GHAI5MmT/m2v501+JSLFea0T2187VxdBsj/RmtaaJwx4lcsbQSP0vvGVvwEaSZxlgpVAr6pjchWXkTNtRTJaRZw7svWmAEWNSsCNYxmf+NyvnGYL/nD9suPe2/KW+Up430AEFuKL/6K1U0qZuTf/PklzUzHRTssuVs6+/8AB5UmmlJlxYQhk9AEUesJunEt3enN0NBVQ4YGcS9KL8DoB+DrYVjkQM3SUDY/IIJF9ntPVEbIa5peSe03noa6dHCjw6eX4Tbhhgb+yn4rTrXDdt4I26rA5h93JAVmpzxFZHrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uD9X4Z8JR7r0vnHfYXt4eag247Ine2oG90pKkeS6CJc=;
 b=xSYprI/ecvaIiHM62TYirnau3LvHULoGWeT4lVC0Pn+vGXs7B8/GFSqhn99k+RwuPgH3H+iC4B+Pr9Ah8P7NLMwjzZtihclwcDYCw8j/Egfv6vnhvSILJGSrGlPp9cpYkr9LDf5PnreXRzhKWuJamS1aBcKJa0kGYXJohnAcjvw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW6PR10MB7638.namprd10.prod.outlook.com (2603:10b6:303:248::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 06:32:36 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 06:32:36 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Fix dt_bvar_probedesc() for late USDT processes
Date: Wed, 19 Mar 2025 02:32:27 -0400
Message-Id: <20250319063230.28171-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250319063230.28171-1-eugene.loh@oracle.com>
References: <20250319063230.28171-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0175.namprd03.prod.outlook.com
 (2603:10b6:208:32f::14) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW6PR10MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: 13bb5477-ddb3-4ccc-9acb-08dd66afd6b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?px5FUntILugljUNDZkUmmpAIktL+yQQwD8nCYHerva9ojJ0TjTkvvWzNz9XY?=
 =?us-ascii?Q?H2XXW3/4uZgC1Ukshs2EqVqV2/NgwsaKadbK2zjrNNsTZW//fbcoaJzbTYQO?=
 =?us-ascii?Q?1tR/VK0Sp0omCIOOX8Hp7ktxBi745tIaWJMitSjvIyE0XefKys5IGmt7uqnk?=
 =?us-ascii?Q?xYDGCw9/ZO4F7hbLzwsxj3YsI/0HQkJz9RzxqZstqRGAz4CBH2WIFvfj89dl?=
 =?us-ascii?Q?hxUx9RveXXTify+oLqWpgFJQPtyBaaMjSrtjHy3WY+2dN1AYNI3s9NaO9X1g?=
 =?us-ascii?Q?yk7NQ2DxbFAc++mNanLq+qrkAnlS284AZHWEY8nunM2HDwhn1HHW68k+BW4K?=
 =?us-ascii?Q?8oQ3H2Q0aKTRvgOgyU3HznqwwbJPmf5/DpFUBYXcifsbNfgzqwjgt5pt6j2X?=
 =?us-ascii?Q?H/RZvd98yTtTeIj6ymUMsG+FkPdpC8qm8nftmV1rxugmFuImi0x+4U0Dykjc?=
 =?us-ascii?Q?gi/PusDrFOUM2i9u0x15Yue6ohLbS7IXJKEoOm8Lx97+j2TX/zIuBGjOazKR?=
 =?us-ascii?Q?MvJ8E3dmz2p9m7mM+ab+RNZH4MZzdgTf8i/JbcMfBbC0RBUq0RVrNk911ljU?=
 =?us-ascii?Q?aMdMEQ4x/uSI0Lw3bnz0AfcQaKTKVIVdXrMuqdAf9nYcxKn/pmy0YO6xN6uE?=
 =?us-ascii?Q?+1xt26xZUjLx7I6c9vRC1zDWLgRfzc/c5JzW36OjwHbzFDrjEncvCgFR8ImE?=
 =?us-ascii?Q?QgTxL0mhj7Fj34VRkHPSgcy6jzHwu1GPOMp8NMmFnnRmMt2vJnqP/KGUTWHp?=
 =?us-ascii?Q?5xiJbWIe4g9KeB5da3tnoo+6dxm+KCqvjck7ZJbuyO/2eLQLZUTNuZgTOgZw?=
 =?us-ascii?Q?8zttail7x+RwCz/LBimTurjBz3htx2gWcop/U/lhJywElKG4CnfKy/sde0Sm?=
 =?us-ascii?Q?4+xQQBSUoHWN1rPUObxLxfoCWsorrRZlldmLdB3zHJz1sTHEfoFQITB1/+gH?=
 =?us-ascii?Q?G0AaBlU258UnPmxag6g7FF+hARxiZ81y63v6Xs9zhoOgu5YFOaRDIfwAmnDx?=
 =?us-ascii?Q?UrDNF0xYWKfh2iZcAfqaK+SRLref2aOpgVDtfEs3pOf5RwZv9PBhyGOkPfLj?=
 =?us-ascii?Q?FOwj1KcuIX+n0ikjwVsMYM+rjcuv27q+RtRKVL1hENI0wGkUwXd3Q3BY6oDr?=
 =?us-ascii?Q?P0JlASzjTdEN7GWuLe+iOPAIA0SavkWUBUsXFmt/vrXHTwJAdhA/48uZxHCV?=
 =?us-ascii?Q?T47Thz+sJoFfWXsB+1/RMVzJRMRSXbrYmtHC210l10v7YMItD9qIatMnqulq?=
 =?us-ascii?Q?+QjQTa267X44ExUmtZX52tBt9tCI/KgAFaNSWeh1hw1aKTh/zBdeIYOskRN9?=
 =?us-ascii?Q?fkwunxTMzYAZeArlalg9N6eonRICbwoPkd1X5/WxcCr8+GTyKPFWOrKs2h+8?=
 =?us-ascii?Q?2df6G2SqCsla1a7z+JqdEjnUWpmy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hTPg+MB2dyVNVnTpVC5IONyP4+2aCLDLDyrJdBOMRU5L3rxBAixCr6ei6efc?=
 =?us-ascii?Q?mcN0E/LlPU510susEOjxTw6bki5OBCaw8nmsU74zhpGiVKTEZbOgdipRASA+?=
 =?us-ascii?Q?ERg1tNjls7GMtXBXWzEhkkbUNukN/PyiLap5NwB0UyQA8f945PISyzl4WM0O?=
 =?us-ascii?Q?+syFH8P8qeO1ENY3OJHAbToBE51YHdxDCRzkg20yAwUGlgfcJaXlVs8Qmi18?=
 =?us-ascii?Q?3lqo5OcynLlsFJWqTsKiCSk94ori4N9gGV8n/zHtbdFGLDR54Q2RB9S8Ppyh?=
 =?us-ascii?Q?a8NMtH+TxJWtUdEUcdaPQ0Z9fcrOl9Vd2WbcMc7InniXAbRBy0vLrJIEqxEc?=
 =?us-ascii?Q?kY35GMFdPO06kdUCjIn+lvNQj86dfkSG+5d74gmdV6hLYJkk9fXA0U9fP395?=
 =?us-ascii?Q?C1XSaT5ov9z9f9PHCpt97TVSvoBZDmg+P4QRQA3OhXcf+aTKU4/36GmaoE+W?=
 =?us-ascii?Q?MtokHiufYawZ7zUsw+cAxsm6TkCPx3UFK41xr7VP5umPKCVnCg33Aog4eo7K?=
 =?us-ascii?Q?eniM9sBLZl4G0d+F4/xxHNakONTHiKpZidYfpns6rAoKG1UE7ZDdRKDxNhby?=
 =?us-ascii?Q?jA6G4oHxjeDqDlUnqu3eZzRZZ9+13g9DM6Tcqv5kVP06ODxKzCHhjSVXrGty?=
 =?us-ascii?Q?KC9XysSfA0x3lCRcpOkfpoX4051+6tfZmaUOImbcQgksAHGvHBxMbUyYOSkt?=
 =?us-ascii?Q?H+ZuK8oKJW0nJI9qYBwCdXvgNKaYRMmmyDibkjIULWHIMClrv4dVy5nnvE5I?=
 =?us-ascii?Q?bIy6SDggLQ5uPxKDzEJglDUNmIQn77+gTzY6X2r/XG6ywA0qd1jxLjWheZJq?=
 =?us-ascii?Q?guHeWQ7J/Z/W4rJcJkKFN+Zl/Psmp6xRcoGyLF6+jaD+ZW4YY6gYLVlZRimT?=
 =?us-ascii?Q?30xywYM3wxqUjH0N8UWl/0tiyryUfv+SNR7FxLsI/v56HU4RAp6hYRFGYiAN?=
 =?us-ascii?Q?R3w+jZ86IvFLp8MV3zFnrxlrQ/IHrUm32DOVhOrCKnWUg46qfUmNnfX1GbFp?=
 =?us-ascii?Q?Jj3QMiJ/26JelwnEE2URz1keoHpqmuN4RGBCHTpHz/tZCDciabdBKJGagYnT?=
 =?us-ascii?Q?IdRQEGlS5itUEEzUQ7oX8gzvLE/SqZC5KpUy2WkU0HLK9A6EzTNr/ybMWksf?=
 =?us-ascii?Q?5gxxYVME7dwuWJ8ORtmHGyMfmlVgClHuGJA8CCE+sJXTNlNeDdpBWshky5kM?=
 =?us-ascii?Q?Vn95XxW+4ftMO4QAkeQz0QSDVwKxPEt/Rs1v1SRiRXPi5Q5mCfZ07aNqymf0?=
 =?us-ascii?Q?aBBtnPLrNcp2pwF+hYC7Pw3tFCFXAeWZ7ZB+VZE1o4oVszMrjQaPNAhSIvRu?=
 =?us-ascii?Q?nsOaeZuJM1WUrmiGqdhGK0OiQo9bFwLTRhp9kUFepWY4XZCvFiAmxunrJCTJ?=
 =?us-ascii?Q?pS2sMAmk1EpKYpDFaMc17uTLrWbxCS8pmYAHXQDay4XGGKR2PamFVBW3e5cj?=
 =?us-ascii?Q?H8m0n/w5WSxKBM3xA27jxRaSfR3wX802tDSffR9tsa5sSQETc3xC6KIfPKZE?=
 =?us-ascii?Q?N+vvgAxZPBEy1Ujo9Obq7eJThC+yGH5InKwOhvgbsJWwL88cb5au0KJBTaOs?=
 =?us-ascii?Q?35m2heidvsxh+UMKdpeRUjJwEN+YPA+eUeJwr7Tx?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2Y3GtJVFomCOk4ZVT0u4gJ/Itv3HW1MFRDcrljbU0p/hLIbg72X5uFq43fmkwg6cIRWC0oy9nYr+D46qLyRAnt0pKEjOGHqSOAu275uhqK0qopSgZuHtO6upxcHdLivYhwu7p37dtRJb+/W/dMMWCRk+LdL6TWDuIbi9h7m3dxQKllGUZ/ULEb+pq/5Sq0srBRy9zhONBjzW7sfYWTwXOZva4pDRwcZ0bzq9DkiSzXS95VM0+INy8YMX9KI9p5I9252bafjkFi7Ziazici5BkVhlUKM/4fwOVEDZSJtzty72lU8a+CMUK1zEddKnZusVyJ2BAk4TFHUcQNdIq1L7GqEreqfaWldQSXvI4/andnM5cIqXGdojxjBR3l3mmzY8wFt9AmtENXxPez4poAJRLN0peIPkAEeZ/Sqof/8BaUZ0eTxYFuirjc/vDG+B5i8hL3ow5yqsJfLymEv0mF9RtWeh8CuGVHrdtBo8aCvgioBBtOp2pCYfNN0yEUSHbPm2GphTrwPibmJs6sneb3e8w4KWNMqclKUtjjOG+vjKKaT8sR5G9xu6e+Vtl+pyZBHIH+PizxwEqdPP6TLnfQkdtNzn5lNSr3oapphii61Bduo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13bb5477-ddb3-4ccc-9acb-08dd66afd6b7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 06:32:36.4968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fMnOrOkMfz+C/WGsesfRlMB5VQCRA6vMplbjTrudxVWopOpaBjb9sqMC8QRkG3qnOpUDwqnLu/kZzg468Eh1hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7638
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_02,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503190043
X-Proofpoint-GUID: UeGjAyaBhg8Ts1RoOARNW3NzJ3Ah1FCk
X-Proofpoint-ORIG-GUID: UeGjAyaBhg8Ts1RoOARNW3NzJ3Ah1FCk

From: Eugene Loh <eugene.loh@oracle.com>

With commit 8bd26415b
("bpf: separate bvar implementation into separate functions"),
test/unittest/usdt/tst.nusdtprobes.sh started failing reproducibly
on all platforms.

In that patch, the get_bvar() function is factored into separate
functions.  It includes a change that looks basically like this:

    uint32_t    key = mst->prid;

    if (key < ((uint64_t)&NPROBES)) {
        [...]
    } else {
        char *s = bpf_map_lookup_elem(&usdt_names, &key);
        switch (idx) {
  -     case DIF_VAR_PROBENAME: s += DTRACE_FUNCNAMELEN;
  +     case DIF_VAR_PROBEPROV: s += DTRACE_FUNCNAMELEN;
  -     case DIF_VAR_PROBEFUNC: s += DTRACE_MODNAMELEN;
  +     case DIF_VAR_PROBEMOD : s += DTRACE_MODNAMELEN;
  -     case DIF_VAR_PROBEMOD : s += DTRACE_PROVNAMELEN;
  +     case DIF_VAR_PROBEFUNC: s += DTRACE_PROVNAMELEN;
  -     case DIF_VAR_PROBEPROV:
  +     case DIF_VAR_PROBENAME:
        }
        return (uint64_t)s;
    }

That is, for the case of key>=NPROBES (that is, for USDT probes that
were added after the dtrace session was started), the meanings of
prov, mod, func, and name were exchanged.

Restore the correct meanings.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 bpf/get_bvar.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
index c760126da..fadb06c00 100644
--- a/bpf/get_bvar.c
+++ b/bpf/get_bvar.c
@@ -185,13 +185,13 @@ noinline uint64_t dt_bvar_probedesc(const dt_dctx_t *dctx, uint32_t idx)
 			return (uint64_t)dctx->strtab;
 
 		switch (idx) {
-		case DIF_VAR_PROBEPROV:
+		case DIF_VAR_PROBENAME:
 			s += DTRACE_FUNCNAMELEN;
-		case DIF_VAR_PROBEMOD:
-			s += DTRACE_MODNAMELEN;
 		case DIF_VAR_PROBEFUNC:
+			s += DTRACE_MODNAMELEN;
+		case DIF_VAR_PROBEMOD:
 			s += DTRACE_PROVNAMELEN;
-		case DIF_VAR_PROBENAME:
+		case DIF_VAR_PROBEPROV:
 		}
 
 		return (uint64_t)s;
-- 
2.43.5

