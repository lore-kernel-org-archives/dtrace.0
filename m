Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F9729408
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776202577; cv=fail; b=uvhU2FNAZhn9lRfClep6iwm8Wr2z+VDoi95uVr29fuEwndy24ij1KJkmY5nXXD0fQp2dgyi02m1oScUBKBzgHp0TW41z8q1EGZaMNuGqwePANZ0zet1ikYcfi20g/9Z67eQ/aN0EeSUy7EvUKzoqIdxKbgrokWJvCCCL8kq/vhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776202577; c=relaxed/simple;
	bh=U8io+DMWz5SpqZwU6dek7OLAaleSfD9raIctDE5OJWc=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=tCfWiTwAXrng5ABdVtfCBA0LKsmPTAN+b0EBwgZHkxJ+XqTVkAUnd9zmTqINSV9CasuvItvSI9Ouyll46faLJbhpFOlNRpje/4whDv83sIQYIpLGLajT9NHaF0mQVDGlu28TmBwTxSLN+w+79RB4GWpEjvlfZH+d3gxMUTOzSJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KftQHVvj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eLJkfUFj; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KftQHVvj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eLJkfUFj"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EJKPgK625887
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=9l4EJDghZxeoTnqjvK
	rWPaMjQggCyMscMNGUf1JFsQs=; b=KftQHVvjdy5sSZ3oww32YpBBetOMs4KBsZ
	l7A4tAjIJ1TG43ENEoQRD6S7HtGMctNCs7s5RVZJcueJGm0bEygVKQ81ARCruBRh
	k7hNJUc+d3ky3CHYp1EQqZcNyLdCWv/4w2ffb6Xw7l40TGZLzvm56JfgXi0KYujE
	Gq01IVHIt5r1kKM84dZTf0Yby1xV09UJoFcMhK8zwpHU03A8A0xRu1Os1P1fUYJA
	CzSL9jKBxDawDSXFfPX5dd4CX9w0cvK+IbZodxikmVPexF2KugeG9uA1jrmgNwMu
	fGJLxyEox64ZRxrFatDxcJ6ckrL49ZP803qFtDKsEV76cHVU7eEg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dh87h3myf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:36:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 63ELYQc1004154
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:36:14 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010022.outbound.protection.outlook.com [52.101.61.22])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4dh7nn2c05-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:36:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WklmHfZDzM8YVA5Rlh+RT+EZ2VfSwgckoVBPFrIuQq9gtubn1ZPxPtc1DaPEtk3HtsdUmt02yYX22CyvKRxqiFD2KsxVUVw6VU67CW3MA0V3OnoK+JwccDcxRqLtA4LfMpOMUGk6IrFW5srmOGkS76hELZAUKbgTyNXIc9/xpmoIe7b1nm7FV0NWcnJx6FTJfOr5umft9S9djsEJzwZsAomxiYYlIGY61N+Jvu743CwDR5WT1eVMRgBTMUjqqdk+qkvEohc+eG0EiOzq7gWoKBfiHJJdSRmMz5qrHMhyw8sh6hrEgrdI3SLH8xwEScl2PJMKDRqvfA9FcynTVwE8xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9l4EJDghZxeoTnqjvKrWPaMjQggCyMscMNGUf1JFsQs=;
 b=nnO4jZBEwdBUH99XBLzUJfSw+EoMkI5HorNYMksWutiPhrm2cFIEj5woRIV6P3td8hfDOs7LZEK3ES7LqunJK7y5nE7jYvbFAyEMfcWbKU5Y/LCt2jFxRtJJj1szRPxih6KSnuyguEqbwGRqXD2wl8zA2pH2aJRX/Mhahe0tXlNdJ576oC44wVqVw+b97ql+6MyMF9g+OoEY93vCxn9LmMOpGurzZHg3JDnWCikBHqv7V/P8uqesz1ESdn1BOo3rt3UIQL7eNWT88MNiW7F/3A1rUPw3WsofA/qFP3+crkMYi0y82dMYqWc4FyUQdIriYW2oyS1AFj6lzVGYME1KLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9l4EJDghZxeoTnqjvKrWPaMjQggCyMscMNGUf1JFsQs=;
 b=eLJkfUFj2EEwCSbHZg21E+jCykYoSwrfMOyOU5bnVKPCewOtUUnXdoR4EgR+8dKNxl5xCrilgdeoxhqkl6oZDA8y9iTNNDClnwxNeaGAQ2oSMGAhenkPhqVPJ8iDicRm9c95k2O0JAnF8/A9P7l+1jjqFxpjcgj5Vehro6yVhKE=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by PH0PR10MB5577.namprd10.prod.outlook.com
 (2603:10b6:510:f0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 21:36:09 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6%7]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 21:36:09 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH 2/6] Simple typo in comment
In-Reply-To: <20260331010224.16165-2-eugene.loh@oracle.com> (eugene loh's
	message of "Mon, 30 Mar 2026 21:02:20 -0400")
References: <20260331010224.16165-1-eugene.loh@oracle.com>
	<20260331010224.16165-2-eugene.loh@oracle.com>
Emacs: the Swiss Army of Editors.
Date: Tue, 14 Apr 2026 22:36:06 +0100
Message-ID: <875x5t2pix.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0035.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::8) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|PH0PR10MB5577:EE_
X-MS-Office365-Filtering-Correlation-Id: 92d9b84f-69af-4d2a-5b76-08de9a6dd776
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	KcN1C8TNeUOo124XmTRzCgC3f0LSOVxgECvod5oIDmxCFRuk8nI4tP1CljVjbSDyp0d/uhUBTFNt6aAafuSGPbRj0L2AA3bRsEyUixXNeS97ldsprAMhri2NQZyae2uH/jTUhmeEXTwf/b51wP1xSFDptEhHk9kKg7CJ/LXaUPhDzOk4PDT6YmpwW+TLx2t5uMUNkUjWMvuNCmCcD8aRHfoKtPBLZJvyF1JPOXClZLN4fTNvxxPXU4sO7mmYMkW3OkCASDwIWwhurE5lvCBk83AB0piZV5O2RUIDWHYQ3hybURdcY7bhoyj9DHb+sW9XNT92RDiZiocO+tUXF+XL1W3Q9rwr9jTqDZ+FfsNfAKuS21hvy6wS3tpxtkH81u1SNz/yXKBetRTqFYHkDt/LWAsIms94blbJ1zoVoyI5eNYYQMEoByJBuKY47b7RKpM04bUYcnvg2XcHW0aPMcaJCMIfJ7Mu3MrkRWwIuhcOAGyArmzh6w5Ovm8LICM+ORSbDvJhxUx+hShZU7DOOxL009v9f5DBrPqTle4vVY4kIpptGG0QDky8kvZ5DRaKR+VfMLm99qzGx4YjbYA74U/wJLagRyIoszC5rbGrxaitZBMkfCvabqoNvLmz8p6TwMQOIGbEHWdQlJr+sq5Rli8BJuS5PTeQ3pQVk8u6scci8qs4HTkcR4GHdk/ftW3ofboVHa1bX2/F4IB5TO6NGtQdS9YwPhCg9/P+7hRwnPmxq6A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1GJNLcjLqk6KNhtKIMV8wbnqkc9xYnYsymq1g8O4AUWorl4If2VU78RFO44f?=
 =?us-ascii?Q?fVb1L1e2D6sDtIXKOt5XDiY/ccxUP1pmxM9IGjWiXuE3INosmYPHTjl5Uyld?=
 =?us-ascii?Q?IH9+vowlRNefAZ2j+m4tGGz7vRvJOK5O12yAUsqRURPJDGCzv/+tqOGTQlK/?=
 =?us-ascii?Q?h+SyRPVnI/f2jmGXCsUct3ayNe2vuOiNQoUDbF8IpGZJXuZ8+TIL1yPIm993?=
 =?us-ascii?Q?tcr7ueYTcuzsRtUHg3TSMl+/bMTZWCinVuL4V2YjilGjywwCIXYYpKMv7pYC?=
 =?us-ascii?Q?5F+bBVSIwwml2iLT7o4SLG0R7qiplaQXQ/PSBAWaxErxlMh54EsN8iA9PEsW?=
 =?us-ascii?Q?dpp7a7dvUG9XzsX/4UZZBAyJsAXvEAdlCUmXig2ZWhKtFWA8IvMry7nQZnQQ?=
 =?us-ascii?Q?BOeMe7uuzfz1FinHBPV/R8Zxx4FTjGlog3QiW/qmuzT7+hiHCFhOy3bxi93v?=
 =?us-ascii?Q?/u7xLKE+EAVGigMj9tSHGIx72jMtiAoHyne5xltTti/8E11QcHn59A81arqk?=
 =?us-ascii?Q?8EAUryF1GMvyswP4XdqWrbSivQ79VTau0dd5YhiaUg6oGr/dqoPkVIttcUUy?=
 =?us-ascii?Q?mwyp/cjKg5dBhNEOWoHyWYOWowpFNFoyn0g65pYYwKyBOIJF8477sMRgGNle?=
 =?us-ascii?Q?HyZYx8UIn0YMhwnp5AusSBF8DJKHRakTOuxAUxnlFitHUlPDGwH6hbI46FWK?=
 =?us-ascii?Q?mGASOs9i6h7lftRilJ8X4nV7FFRnZJq2SZVxv+BlQ1yzDRdHobb7j7cXbDKm?=
 =?us-ascii?Q?GmFr13L2UhSzu3jaxCACfyoF6Gpl4PpgrBt666A/fH5wE9JYSjaIOavo6Pwh?=
 =?us-ascii?Q?AoTcEVz9zQlck1blg5dlLaSKN0a41sOcOr4QzOq2s9K9ZISe5xjXFV6QETIh?=
 =?us-ascii?Q?SOaYSjsqVqFZNYNHOAgXIVkAe69HJ3u9+2BUtLmYrhHYh26klDX3aWLIpptp?=
 =?us-ascii?Q?rYrGP++Wt4lXuZWU7znUAh6EAV33QpatsM/GvWfJldSysiKBqCcx4ARrp2c8?=
 =?us-ascii?Q?UzO2djqMAV8Tr5cFIVDqZS/eyfFqGPivl1Dw0Igv4vCsDUpaaB0b7iukJ/qa?=
 =?us-ascii?Q?c/3UzTMI0teYXQYw7ITT6BQyyBTpNw2GZwm9CJZ8Zvy6JfgZJL6G+twBHBSC?=
 =?us-ascii?Q?YU5BVzFCTFh+l/Ixl/NJQ8PrKB4V7GyAJjdQ4s7CRUSgOr+zHYZLkdPIc9Fz?=
 =?us-ascii?Q?3IiwLDo1Nua6gnIUhSf636Te4DBpWtz03N95l3tP39+jFVkdl4bxnQsGCPVE?=
 =?us-ascii?Q?J2YRC3jXSN9mQZ9jubXMp8H+sf2a+3iivvwVyPYZt9KOokVMQGq5XwTB0w+x?=
 =?us-ascii?Q?zrNmgcpHTBMGXEekO39A6Z89f1AlUH+MVsK57LTfAkw9gv5EIofBKxbjcBMH?=
 =?us-ascii?Q?MZSksfyPIlrpPPQcpNBDhxVqxTMCPkpU8ZBj+jYAneYsYmEtJpCu2RrAHzFp?=
 =?us-ascii?Q?/qSECPUkVMNTdMnJeaG6MBOAPOvq13fJRRdnfggZxw0bW4imL1IvoVMFQwKU?=
 =?us-ascii?Q?6myGu2LZDP8Ujz4OrMpZg2JMvPIS+Xx/053CSL3T+XjrXU05lsboPY4x00jB?=
 =?us-ascii?Q?kxeH0IwvphnjGokZklxJvk55r9VwA2CxIpIrr2wXk0tQawdho1mgepUcIvHo?=
 =?us-ascii?Q?US+bXh9ejq+7br1Xot4UPbThE8cqYumFXNCgeVzdx15PNMrfuDDyxmhN3eiQ?=
 =?us-ascii?Q?bpvcfRvSW6XWf8aoaFs9OK/S1ycHAIt0PRGEpt2wfTMkzrCu8Ktl/SF1ld1n?=
 =?us-ascii?Q?Y8HADfceww=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	A6RSDE2aY8bC+HQCSwV8QaxIxr4TqtUVQlKZvpfmemaGWB79vO1VqBf+g10AjhWOyNTSMuZrJcoJpvbSHoW1ir9MO07MgraC1xa/FE9ilCHMfwAmaYViGuZeEDhSUyLG8tjVRc8qlWjkiYv8BrZoaamiVpCjcVv6tsLwesNuh3pJNmSDKYxQreYY0KC64bO5+PZ5ke+d4Afb/hRpaE6DG4IYolxQC3QyOrA5zk8y+PMk8p3qqpqCb/TCNn7pcuyUjykF25//Cx3zbBwCT4sNWaIJb1fJjePspVEs6KBSVjmSNaVNgMV/Be1OLwFGyz1oqVHo9pGRb3AK4SKEorsU/A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7CiaGF2PK0Vv5kiDdc+IFUoCBbioGZW+imYLFZN/rEufdxU63PPyP6udnlD09Fe8KEmwkJIoCP/IMAgWQZaAc2QJ9vdRJNLhTr+dbhSTTzwlFH69dNH9vcumVsAt1McWCEQn9ZYfpx7slZRnjyz4L4bmZCyHFtnUFv7qm2ZrATLycO0cfp9sn2oor8CIM8ESEdTzu/B2DnIeQwp7ttOkTJH3TYa5NMXDzDUjGtz+EWBChHO6GN3GX/TeEb9h9mqHSKQ0q8acConn3LVSNSVuZv4hAJh3LxBPW89vsRPcS6epT/m0J1QjW1Uz3Xv6xSs3Ep+RmLIWzgLLGFsApJdUQ7lmYtJmv2qmpJDttuSBjMrearTvbP+pKiaUTCh/KgfQfGh31B+OVqkwXSx+y/NjYdQ1ZNoMATLu5k4ttJzqP8OJIZjVdcKOboOxQG4hquIv3Muxt6o0pHWFsmL6Ym5iROPyDc4Vr1PBqqXfonoJFA7vQjK8bTHFP7kHF2/ni0mk9cI3v6qq1d8oGgfdsnmBhxDHv/z/GobWVnFUjojYXzZ0mo4AZDnueFuu6rnMAH+3lxdDrwYtYxoCfze+VqpeyjWqwXBCLKVzFSTxmqXJU2w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d9b84f-69af-4d2a-5b76-08de9a6dd776
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 21:36:09.1538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qEA8aQJAsz7hvlOxfB5G7d7BS49w1xBpT9VZM+IbZ/0chUSM68F1HSI+rDSyFDtjbYnlE+TRb8cXZItNc/H6Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5577
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2604070000 definitions=main-2604140201
X-Authority-Analysis: v=2.4 cv=eJUjSnp1 c=1 sm=1 tr=0 ts=69deb34f b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8 a=ttqUlfu53Zy3l2AAJ6wA:9
 a=bQS9OzEy0soA:10 cc=ntf awl=host:12291
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDIwMSBTYWx0ZWRfX4HahWn8ijnuS
 F/RZD3tdtyUyoa9JHw12VDMzj8NNneafxdjLS4vsLOf7yIu5uneI0YI7iaxXFt2E5h2lOZAiYux
 83s+dnuiMRxf9CJig8ozJdJXCpBFqI3uVT12AYsp2sNH12vIWdE9sGg/MjgPuGNvcp97IJhFzQX
 j/tzSC+6Esaw9Sz8ALtxBThifZ/GYi/0W9QmEP/pbELuJ5RRBs31NcTNLD2UIsjG4GcxT35GLN9
 uSvF9fX3wi6xVyglBuJegE/LoES5VbXtaQYf0bJKgAJabdol9lljb8nBjyu88xZkXI9DTFnKcPK
 Ei6qvp8d39EZH1I4IL5LM/klLDiLREYHE2QbEaU7oe6gQ/Y6+sau0mnhI87VUfuLLnHzkZwpcAp
 kogNW+PSkgnYahdbCcbrXV+pYMj1LGyKLIG/C7X4kl3Y6zX9BRTuBVBfvlx51+/38x/XLxm/4QB
 pgLAJogdSoupO8qGBP8gveVjlKs5Dh2D59qNDv54=
X-Proofpoint-ORIG-GUID: -_vqcPEAOpZJ9fXIIuAiIWR4HXz0DqPx
X-Proofpoint-GUID: -_vqcPEAOpZJ9fXIIuAiIWR4HXz0DqPx

On 31 Mar 2026, eugene loh said:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

-- 
NULL && (void)
