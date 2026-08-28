Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DA222126C
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787944225; cv=fail; b=mkW4VaWrWe5OB+ZL7Md2A9QQE/89p42GS3VqoP264Otd+1Wksr6nCi85zi72RVAzUGIH/0zrKhaG5rtfmgCTvtg+42ldl9u5Mh9B4HJcNEX7rJdk2FKvkXoKwNihIwGmc/tqCgMn/kexIYpqflbUX9oPq7tVB7skgM2jm7srYU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787944225; c=relaxed/simple;
	bh=NT/yRPdYpPmcqPe8hHKJ8xIqhcRroyoFdO29qvwCQWM=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=UjiCtNDySgcPT/5QuQSBlK1+MvuTTz5z4ygc5bfdy5nfITI9nbthfYDBYLwFz8Y0RFgHW6Fu5oto7KPeXrbO5GwePixgFcHgBUWPtskVRQ4GRTVTYiJDOypcgymfo+S1h07RYUSEbPcpY0OVz4EDt61MbCKa4N+m5lXV4C5BtSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LA91xGGu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HBhvDGKe; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LA91xGGu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HBhvDGKe"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SHKAD03075029
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=UbSv+AhaP/qXjvJREuZafEs9IFX5aAmLKzSYxnSq6+Y=; b=
	LA91xGGuOd8v9a9tuDpPkljxyIAzrfrtZxWhlZLQ8OotUyV420vMnVOf3OPloduA
	FY4QHGLK50tdXZTBx3C2D3zQZDMDa9vBKlEWJXHYdedwC7LT3MxIuymWV3AZ3CI+
	9CVl+vWUgmHJi4tAS1OSxhcYcmzkc3sDa9+YoLPRS1viyfI+9qnbVqRQD+SR/AV4
	/5huHUKIFaqJMhlqhlcMgdfJZBh1ZpF4z01geZmB8vQ5cmHfFoO/CzvWOZzyMB/F
	u2NGEOegGH4tJxemnaO+cYkd9sZMn8IXynUHFBSx5T18LHGmsTu9P2Ke7Z3aFWy1
	70wyRvHz9Rd2zU8FqDhhOA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g74asadty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67SJA7xG015276
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:22 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010071.outbound.protection.outlook.com [52.101.61.71])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4g850yxwss-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OClfJE55GFFY6CKWReo/mRpzm/xJrItmj+9qzz2vZkIkAjx7MhQWoEdtxlSOHCZmDqytdWX1OGId5HxtMrW4Vda+5N29I4KQTCNJdIYd2I0hwvhOwo3UnyqfuaKA+WBNIHllPc9Uh6QFhdIhN7BD8AjUCwu3WuwSNJ0aRV2KfqnMlHAkfM54ZSiNs+05O89AJ+2gyQQjqHPGY4IHQtGX6WIZaHE7Em6UB5JVcfzKjQXo3J9RYhfFdfcxnhHqH+1mwSpZyzI+Yw73hpORgvhGS7uXvbTdriTKnHoCvXz3jjmBkzwHa+KDLrbHK242tvwah2NKKC/5rRCvpG7vQS6YBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbSv+AhaP/qXjvJREuZafEs9IFX5aAmLKzSYxnSq6+Y=;
 b=tzrU6wVZ+gS+VdRWBqkKXHhdt7XIPbtoma+VY3lwTVxSn0yFVblHM1ijvexBVPbyiAl0DTH3Z2t95DbHQPZHXIcUAksotYFYTVHbjkqMxCDagR4+dMMqKqDd0oktVxEUNSuDgA5LET6L8Cmt3UUM/PMRPq3qecrDwhQggw/VLsMcsM1+rxqU3ntEuokjcGiE+8F5ONRc+2zJHRXSCAunufP3CehxQFzyENWyAI/MJOYXXuPwJA7QzA0bT8einLqOfl8h1H7z4UmP76bYbQt7v8jWe+3KQymdDSKIIa129CRE4Nka5qwkzi5d+EEM8PrLE7JjA/pR1C3EaQgGs4S0cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbSv+AhaP/qXjvJREuZafEs9IFX5aAmLKzSYxnSq6+Y=;
 b=HBhvDGKeyurueHRebFhBTD46tKiLhgBIjiSz8EdJAJK/09jKsGTULcgKMRURiKRk9hO+xqVcl6SEye/Q69X1ki239THsW7gSKVuDv6wdqIXFQomEnt/rhH2F4tsa3kVEUs6ZWbjFyeGqnGWsLoQvFuvq/RF+hm+/+JDFF4K5opI=
Received: from DM6PR10MB2476.namprd10.prod.outlook.com (2603:10b6:5:ae::24) by
 IA4PR10MB8397.namprd10.prod.outlook.com (2603:10b6:208:566::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8; Fri, 28 Aug 2026 19:10:10 +0000
Received: from DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537]) by DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537%5]) with mapi id 15.21.0382.007; Fri, 28 Aug 2026
 19:10:10 +0000
Date: Fri, 28 Aug 2026 19:09:14 +0000
Message-ID: <726680d8981034c50eca4b8a174a60ca@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/6] usdt_parser: harden DOF and note bounds checks
Content-Type: text/plain
X-ClientProxiedBy: PH8P220CA0059.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::7) To DM6PR10MB2476.namprd10.prod.outlook.com
 (2603:10b6:5:ae::24)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB2476:EE_|IA4PR10MB8397:EE_
X-MS-Office365-Filtering-Correlation-Id: f42915c7-5c5f-41ea-a5ce-08df0537faba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|6133799003|3023799007|18002099003|17002099007|56012099006;
X-Microsoft-Antispam-Message-Info:
	NnC1mOQCNjbqJPuUBThVDZNx7WECRhgIDiYof9qYqBG2bE7lutKBieneLjq8vved2/7MP/OguC7ompayvnAY3LtNAno77dJJccT8P755HT3P/o1k+Gs/AscSnB7PKYySel0W5ZLJaaiMAb7iC/gZvXstDGCYFQClCtTLa/kx24VOIxGJ+egvFHn/WxOHl/4wTa1zYv91NGXF1mkRSN1eZycoVYBNkB4ED+PyOVBxQv9GZS7RjlScd4r9nVtqsfAqFYYyvshqXr987hrg6xr+ZAVG4fTEwsPRIrcwNdpORb9JYwzRgQlFu4Uxmg9xad2KMW6n2B5LPZSShsRcBlDLJV76e37xmS8XbUjZzeLwsWm2BoGUICHFvvYtEFLOjtzrybAiLfajHQcgYfg6OsuemUmTKmxHiTbSZB+ik1X0/EEqoBCHFKGcJydxsYNKtw6x+dhap3jfGw8OYucdq/yP32r+JO4B42UaGaNQOT/Q1D8Q3FRY+LWyMyF8QvXQMsahHudGvgBZItgsXbnPc1Hgvzg9yXEYXTagicDUevmrol361ggYKkZFwbzDBwTLdZ3T5roRMG8fyoP3q26BI4cNyLKg9DoI459h4HFmfBFWK+ZSEawI95/0FV5yEicex57o9QHJKI2NwmbEOJ6srT3i8Xtu3iIevig/1bbUAMc2ZSQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB2476.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(6133799003)(3023799007)(18002099003)(17002099007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3s/OuQJzX9g6NnUx0qDvcIXWIwBo8c0Zxg+m//iTzfk+KBTnhtJjxfFVjrgX?=
 =?us-ascii?Q?fTaLVy7NGeJSgGk1VmoWd04J69MFawoftQKhFoLyTr0ljGxCj44PO50Jxd/F?=
 =?us-ascii?Q?09Zw4/MQPyunlKHLCnrC5uHwx4wUjZveiQFzxQxM06svwyNaAp6yqgiuPxvz?=
 =?us-ascii?Q?/BmQSlPY4JNmYokCkbB4PyxMqJeFqwi5ZUTzFaDUQvSHz2I165+++xyCHzWP?=
 =?us-ascii?Q?Qwzpwf5DAx5+djZA5Y7G6Ic4QSiqtXwkePov++JAL9Q5eWfCY15Z+xjdbU0V?=
 =?us-ascii?Q?5/zjc5Ow/5ozTmgDgHQAlmZFW9+oJ72HWypQaEBbSAMSegfBH2fxnOC8RrZ/?=
 =?us-ascii?Q?So6sHPJOhgPGzGw6oCTyqBSafGhvZGyxVBH42Pz+Hw5WQyea5tUGx5zNK93Y?=
 =?us-ascii?Q?FR2OMujp3NWAumjmTukrvzmcOwAn4V4AxDotwzhEgTvHj9oH/aWswUJJO+gY?=
 =?us-ascii?Q?ahSc0AMIkI0MReX0b63rUjVzAkHYoX191o/e1A6wXpndxhvIgTI5juFEaca7?=
 =?us-ascii?Q?7jFgAKUAKxp7nK757K+ugdpvBJh7cS8aCks6IX6LCp4yow0gxVkFI6p/20+W?=
 =?us-ascii?Q?Mi1H4W4JjtxmVrw2OVIuCiM/N0S+VShwNkPWmxSVws36tJqBrJf77lJfErkX?=
 =?us-ascii?Q?+51S72vO0lY/qJ5/4lZunzzhoZ6p5+bzLkosAuSAOD49C3vEUgCPvsR2VXfF?=
 =?us-ascii?Q?l8+gNuYG4tmIzdvX8rcaKCj5l/3uPLBZ8rZHiyWRfJKp00JEIRTs88dup6qn?=
 =?us-ascii?Q?2fvaJP3ctW1e2uRIN3MbO/6SVdLPGU0O+rGdvZidOgC4laYnzoKdXBFUNqAK?=
 =?us-ascii?Q?x5PS+HnEY7naF6iG3/4yobMsOrilOkYmbfNK+oECLccmQJXTvxSN6HCWh1mA?=
 =?us-ascii?Q?xpwg811FfGkfi7tAname7LAPovuk5UsqbnIYc/XdA+gDe7Dy+bux4xTBv2Dm?=
 =?us-ascii?Q?HpHJ76jlwqHk9zBA7ZJj4UHdi8RMmoudrKUwamRZMs2fC50BLTMmqLU5aiH/?=
 =?us-ascii?Q?D83GoGRM3j8JODHHuWO0KDE4+uOpZfwKt69oPed/CJXlcxgbecZmI8N03bDk?=
 =?us-ascii?Q?/IeKy785CU7+2/swoSI7pS4jGaW3+EipJLEOwEcWN49mL7Vg+NUWKpF8vAl3?=
 =?us-ascii?Q?YdeF4wVKj2Pfc55DVa1PHDakqwkS1tpRSrAFzBGPHkV7onkP7KIV5w9wBFYu?=
 =?us-ascii?Q?00fDlMMC4BTC3mmjFI0htxmjjG8+6ZEKtbcxLokU+7ISaeLowYfOUt0J/L5W?=
 =?us-ascii?Q?y/YnMBIhEQhPVGSRP522S0WkJipTV9MkYecXbUkFJaw8FiGSHUIssDx2w4qB?=
 =?us-ascii?Q?5LuCr8dJEz5CCS8AbcrfxLi9HHksLaygPsy/xXvWeV8pNwuOTCiq8j2R23Kk?=
 =?us-ascii?Q?6Cr3tPu2VKhf2VCoeVieve7eU0Yo8oMsrra8bdYMolOj1M4Yt/JFs/2anSNv?=
 =?us-ascii?Q?q/KzA9YNYhZs59vxgvFU+61QhKJTXSC6sHdOo4L43RQylhgTzBZPkNw1+1ch?=
 =?us-ascii?Q?vAbDCJKJeo3BNS6ESUpEAOyLHlt/ly7mUc89PPaX+ojNqlyF3tDhYMZLScvU?=
 =?us-ascii?Q?Tce+g0e8x60OrpbuVLDah3XQZXDhVE46kcchaNxcotTQk6IrcmgIjVVqAU+7?=
 =?us-ascii?Q?XvLergvgWB/dpwwXljs2hZkxSnQvnuvsR0w5XDAocGxWSMOwrKq2Iv22W+z5?=
 =?us-ascii?Q?0CURBYVkfTwbp7SMFCqYovnInTjMe/0JmJMINa9ACAYWKKtSFmiLifNWQtrY?=
 =?us-ascii?Q?JUEk+k+jt5OFEXK+1WEtp0PIrnJtxd8=3D?=
X-Exchange-RoutingPolicyChecked:
	VKmp9wON20t0l/DN97VIHs2j7W2wEw5Z90hkRfRDnBi0F9/X5KAU3Pq0ejBYCCpkVlEQEm2OojZMxT5dE16uV2dOacwpvyTpj10ii7KwRFs4OSaAVLmTBPlARu15U8WU5Py8gQsZw0+vd1WKYKQoRXWc5/Bu/2kTcfIYsEWMcnvE1i3UDZKlHixrGWbkywuT55Yb/yUARkr2mjgCHC7DE2HXuqMOxAEBf+BrRFL9pmj2ogcR+uctJ4AZlZbmiCEhhUkpwtUqEjSy+Wlkrk9j9ivi/Y7DavEtYU30n1ZN78hcLPi+zki0jXlMGuzdROFVQRP/RWkLqS04hGxDMvkfew==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MihlhaI0wWIosCer1Hnu9UNVvCwO+HBvgU3YnxmLn7jW6hNiknCgoAT79+jDUJR//FpDgttEmDAj71yDGPZ8EHYXYX030qB9KPHpnTfg9RvJF3Nc+9l/99ZEryylgJbaR7jS6u4qk6Uuwf/pdUl22O5qEMzPA/DJ/CdZDDOa4YiLGN+AxTAEbznrGg9nx9UwlaS88O1joTQwlFN2tC94Bagy9cOz/iomy0838RRK/KC1kTwPEHinsj2HZNKnnmsSLDuqSNJ9hhMeuNkAl0IRAZkieHC4sHgKn0FTEw+xOjQU7wb2GCajB83bYqvnbA6RhaYHRCM3cSFg/On1qlGD1u3C46O/RONjl7SAOTvH98gMFwkslczTMtZ6XUel6KiTPhE2bblUqlj7GlI2VIQFwkPxVJotaNWnQiApjMqbj5sve8BigRu8QeTgjpofToTIlFsj0AqTdP7cKfjPrmVa7sodCmnUePa1T6MA0gDSRLNkqvqsX+i+sIEn3zOvpchkKwVLGSFGJ4TRY0b/jqe62Qb39GkQIumgRWemkUX1mOSkATOtB+CEDv8sUeJxwwBGivPY9Bg4nBXQMBCAQP1rzGznnTIW9rl3gPcikoQBOoU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f42915c7-5c5f-41ea-a5ce-08df0537faba
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2476.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 19:10:09.9267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4o47gyvzSRRqhRbRb0OzWvs5tWZST/kIxM3alHb2GcHrQNceQAAUZU6G4zOV2WTH8xTrq8Js4ztRkAVHJB/D4XieYPxVdqp0uJlS2xmwJLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8397
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606160000 definitions=main-2608280167
X-Authority-Analysis: v=2.4 cv=StygLvO0 c=1 sm=1 tr=0 ts=6a91dd1e cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=7Gl3-_t3PgB9XO-mQDs3:22 a=yPCof4ZbAAAA:8 a=3SKV51kbMdS3KCy6ErcA:9
X-Proofpoint-ORIG-GUID: BdBGf7pUj55ZrzQnqeEf7gv0eFs4b8kD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE2NyBTYWx0ZWRfX0gLVgZFk6Ved
 n9oRoMYnFuhn/LLQfZJeNqdi0NGgAsoKMI+DmQjDae2zPsbgZqPAA/vuXTU40mdH6xjrz+iaVVS
 Xe1TkGlUAG2HbA92DjnWz+GucsIJ/GHbLaf+/QRZ2W24ogeYCMvJnJYIiBuBwLtXtmdeP6AQ7N8
 z3CGdIufDRDT3g2oqYYWkmJ+lTD55UAvrkluuFDceQFk9LzqCHNGeE/+1bwjQkVZF0AWHjC0tf9
 yBGtfXy2j5VPtx6dQiBH+kEuGvidyw8Jxmrk3YOXCFsBjOmKz312hUpCt1gKbW3g0SLifP3+Jea
 6JswpT4xL7r3CGYWAiwClUHu+jv+YddD9om6opD0HVcuv7MWzPOcwDGu/LYiCfsSckQLCAQJwTl
 1JgL4DwUcli6xahJAtNc3KLS/ANRhw2mmg9yoxL3E4f4bXyDTqi2Zd0vjImV+u7oCYkp9qsKjUB
 ScT1/6dIgPqterzxpVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE2NyBTYWx0ZWRfXyd5U49nYiptu
 OKC5QUDsO5oVYNTEDplRhvE+/EU9vS2v5BUnjYFa4nm1r20aSdScRaV9hEpC4mHVGsFCs2xVVYZ
 rc6V0+xVqVGvxLrgqaY+KLUO0zuK4YPZplJIavhAe4FyCnsdY+Ev
X-Proofpoint-GUID: BdBGf7pUj55ZrzQnqeEf7gv0eFs4b8kD

Validate DOF section metadata before use, require ELF note strings to
terminate within their declared payloads, and check parsed DOF record
sizes before DTrace consumes them.  This keeps malformed parser input
or stash data from driving out-of-bounds reads in either the parser or
the host.

Orabug: 39352038
Orabug: 39352051
Orabug: 39351967
CVE: CVE-2026-46831
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 include/dtrace/pid.h          |   2 +-
 libcommon/usdt_parser.h       |  10 ++-
 libcommon/usdt_parser_dof.c   |  25 +++---
 libcommon/usdt_parser_notes.c | 106 +++++++++++++++++++------
 libdtrace/dt_pid.c            | 142 ++++++++++++++++++++++++++++++----
 5 files changed, 233 insertions(+), 52 deletions(-)

diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
index 4a239b07..88f9366c 100644
--- a/include/dtrace/pid.h
+++ b/include/dtrace/pid.h
@@ -45,7 +45,7 @@ typedef struct pid_probespec {
 	size_t pps_nargvlen;			/* (high estimate of) length of array */
 	char *pps_xargv;			/* array of xlated args */
 	size_t pps_xargvlen;			/* (high estimate of) length of array */
-	int8_t *pps_argmap;			/* mapped arg indexes */
+	uint8_t *pps_argmap;			/* mapped arg indexes */
 	char *pps_sargv;			/* list of arg sources */
 	int pps_flags;				/* flags */
 
diff --git a/libcommon/usdt_parser.h b/libcommon/usdt_parser.h
index b11207d1..99fc3033 100644
--- a/libcommon/usdt_parser.h
+++ b/libcommon/usdt_parser.h
@@ -136,7 +136,7 @@ typedef struct dof_parsed {
 			 * Mapping from native arg index to xlated arg index.
 			 * xargc in length.
 			 */
-			int8_t argmap[1];
+			uint8_t argmap[1];
 		} argmap;
 
 		struct dpi_tracepoint_info {
@@ -171,6 +171,14 @@ typedef struct dof_parsed {
 	};
 } dof_parsed_t;
 
+#define DIT_PROVIDER_HEADSZ	offsetof(dof_parsed_t, provider.name)
+#define DIT_PROBE_HEADSZ	offsetof(dof_parsed_t, probe.name)
+#define DIT_TRACEPOINT_HEADSZ	offsetof(dof_parsed_t, tracepoint.args)
+#define DIT_ERR_HEADSZ		offsetof(dof_parsed_t, err.err)
+#define DIT_ARGS_NATIVE_HEADSZ	offsetof(dof_parsed_t, nargs.args)
+#define DIT_ARGS_XLAT_HEADSZ	offsetof(dof_parsed_t, xargs.args)
+#define DIT_ARGS_MAP_HEADSZ	offsetof(dof_parsed_t, argmap.argmap)
+
 /*
  * Host-side: in usdt_parser_host.c.
  * The host is the non-jailed process that talks to the jailed parser.
diff --git a/libcommon/usdt_parser_dof.c b/libcommon/usdt_parser_dof.c
index bc8e185a..e2166985 100644
--- a/libcommon/usdt_parser_dof.c
+++ b/libcommon/usdt_parser_dof.c
@@ -275,8 +275,8 @@ dof_slurp(int out, dof_hdr_t *dof, uint64_t ubase)
 		return -1;
 	}
 
-	if (dof->dofh_secsize == 0) {
-		usdt_error(out, EINVAL, "zero section header size");
+	if (dof->dofh_secsize != sizeof(dof_sec_t)) {
+		usdt_error(out, EINVAL, "incorrect section header size");
 		return -1;
 	}
 
@@ -462,7 +462,7 @@ validate_provider(int out, dof_hdr_t *dof, dof_sec_t *sec)
 		return -1;
 	}
 
-	if (prb_sec->dofs_entsize == 0 ||
+	if (prb_sec->dofs_entsize < sizeof(dof_probe_t) ||
 	    prb_sec->dofs_entsize > prb_sec->dofs_size) {
 		usdt_error(out, EINVAL, "invalid entry size %x, max %lx",
 			   prb_sec->dofs_entsize, prb_sec->dofs_size);
@@ -615,11 +615,11 @@ validate_provider(int out, dof_hdr_t *dof, dof_sec_t *sec)
 		typeidx = prb->dofpr_xargv;
 		typestr = strtab + prb->dofpr_xargv;
 		for (k = 0; k < prb->dofpr_xargc; k++) {
-			if (arg[prb->dofpr_argidx + k] > prb->dofpr_nargc) {
+			if (arg[prb->dofpr_argidx + k] >= prb->dofpr_nargc) {
 				usdt_error(out, EINVAL, "bad native argument index "
 					   "for arg %i: %i (max %i)", k,
 					   arg[prb->dofpr_argidx + k],
-					   prb->dofpr_nargc);
+					   prb->dofpr_nargc - 1);
 				return -1;
 			}
 
@@ -748,7 +748,7 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 	 * flags.
 	 */
 
-	msg_size = offsetof(dof_parsed_t, probe.name) +
+	msg_size = DIT_PROBE_HEADSZ +
 		   strlen(dhpb->dthpb_mod) + 1 +
 		   strlen(dhpb->dthpb_func) + 1 +
 		   strlen(dhpb->dthpb_name) + 1;
@@ -786,7 +786,7 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 		size_t	nargs_size;
 
 		nargs_size = strings_len(dhpb->dthpb_ntypes, dhpb->dthpb_nargc);
-		msg_size = offsetof(dof_parsed_t, nargs.args) + nargs_size;
+		msg_size = DIT_ARGS_NATIVE_HEADSZ + nargs_size;
 
 		msg = malloc(msg_size);
 		if (!msg)
@@ -808,8 +808,7 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 
 			xargs_size = strings_len(dhpb->dthpb_xtypes,
 						 dhpb->dthpb_xargc);
-			msg_size = offsetof(dof_parsed_t, xargs.args) +
-				   xargs_size;
+			msg_size = DIT_ARGS_XLAT_HEADSZ + xargs_size;
 
 			msg = malloc(msg_size);
 			if (!msg)
@@ -826,9 +825,8 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 
 			/* Then the mapping table. */
 
-			map_size = dhpb->dthpb_xargc * sizeof(int8_t);
-			msg_size = offsetof(dof_parsed_t, argmap.argmap) +
-				   map_size;
+			map_size = dhpb->dthpb_xargc * sizeof(uint8_t);
+			msg_size = DIT_ARGS_MAP_HEADSZ + map_size;
 
 			msg = malloc(msg_size);
 			if (!msg)
@@ -922,8 +920,7 @@ emit_provider(int out, dof_helper_t *dhp,
 	}
 
 	dhpb.dthpb_prov = strtab + prov->dofpv_name;
-	provider_msg_size = offsetof(dof_parsed_t, provider.name) +
-	    strlen(dhpb.dthpb_prov) + 1;
+	provider_msg_size = DIT_PROVIDER_HEADSZ + strlen(dhpb.dthpb_prov) + 1;
 
 	provider_msg = malloc(provider_msg_size);
 	if (!provider_msg) {
diff --git a/libcommon/usdt_parser_notes.c b/libcommon/usdt_parser_notes.c
index c98c9fb0..7742024e 100644
--- a/libcommon/usdt_parser_notes.c
+++ b/libcommon/usdt_parser_notes.c
@@ -73,6 +73,10 @@ get_note(int out, usdt_data_t *data, ssize_t off, usdt_note_t *note)
 	}
 
 	note->name = (char *)data->buf + off;
+	if (memchr(note->name, '\0', sz) == NULL) {
+		usdt_error(out, EINVAL, "Unterminated name");
+		return -1;
+	}
 	off += ALIGN(sz, 4);
 
 	dt_dbg_usdt("ELF note '%s' (%d bytes)\n",
@@ -272,6 +276,25 @@ static dt_htab_ops_t pmap_htab_ops = {
         .next = (htab_next_fn)prb_next
 };
 
+/*
+ * Return the length of string 'str' (excluding the terminating NUL, if it
+ * terminates before the supplied 'end', and -1 otherwise.
+ */
+static ssize_t
+cstrlen(const char *str, const char *end)
+{
+	const char	*p;
+
+	if (str >= end)
+		return -1;
+
+	p = memchr(str, '\0', end - str);
+	if (p == NULL)
+		return -1;
+
+	return p - str;
+}
+
 /*
  * Return the cummulative string length of 'cnt' consecutive 0-terminated
  * strings.  If skip > 0, it indicates how many extra bytes are to be skipped
@@ -284,10 +307,12 @@ strarray_size(uint8_t cnt, const char *str, const char *end, size_t skip)
 	const char	*p = str;
 
 	while (cnt-- > 0) {
-		if (p >= end)
+		ssize_t	len = cstrlen(p, end);
+
+		if (len < 0 || skip > (size_t)(end - (p + len + 1)))
 			return -1;
 
-		p += strlen(p) + 1 + skip;
+		p += len + 1 + skip;
 	}
 
 	return p - str;
@@ -298,14 +323,21 @@ parse_prov_note(int out, dof_helper_t *dhp, usdt_data_t *data,
 		usdt_note_t *note)
 {
 	const char	*p = note->desc;
+	const char	*end = p + note->hdr->n_descsz;
 	dt_provider_t	prvt, *pvp;
 	const uint32_t	*vals;
 	uint32_t	probec;
+	ssize_t		len;
 	int		i;
 
+	len = cstrlen(p, end);
+	if (len == -1) {
+		usdt_error(out, EINVAL, "Unterminated provider name");
+		return -1;
+	}
 	prvt.name = p;
-	p += ALIGN(strlen(p) + 1, 4);
-	if (p + 6 * sizeof(uint32_t) - note->desc > note->hdr->n_descsz) {
+	p += ALIGN(len + 1, 4);
+	if (p + 6 * sizeof(uint32_t) > end) {
 		usdt_error(out, EINVAL, "Incomplete note data");
 		return -1;
 	}
@@ -342,13 +374,18 @@ parse_prov_note(int out, dof_helper_t *dhp, usdt_data_t *data,
 		ssize_t		len;
 
 		p = (const char *)ALIGN((uintptr_t)p, 4);
+		len = cstrlen(p, end);
+		if (len == -1) {
+			usdt_error(out, EINVAL, "Unterminated probe name");
+			return -1;
+		}
 		prbt.prv = pvp->name;
 		prbt.mod = dhp->dofhp_mod;
 		prbt.fun = NULL;
 		prbt.prb = p;
 		prbt.off = 0;
-		p += strlen(p) + 1;
-		if (p + 2 * sizeof(uint8_t) - note->desc > note->hdr->n_descsz) {
+		p += len + 1;
+		if (p + 2 * sizeof(uint8_t) > end) {
 			usdt_error(out, EINVAL, "Incomplete note data");
 			return -1;
 		}
@@ -374,8 +411,7 @@ parse_prov_note(int out, dof_helper_t *dhp, usdt_data_t *data,
 		prp->ntp = 0;
 		prp->is_enabled = 0;
 		prp->nargc = argc = *(uint8_t *)p++;
-		len = strarray_size(argc, p, note->desc + note->hdr->n_descsz,
-				    0);
+		len = strarray_size(argc, p, end, 0);
 		if (len == -1) {
 			usdt_error(out, EINVAL, "Incomplete note data");
 			return -1;
@@ -384,7 +420,7 @@ parse_prov_note(int out, dof_helper_t *dhp, usdt_data_t *data,
 		prp->nargs = p;
 
 		p += len;
-		if (p - note->desc > note->hdr->n_descsz) {
+		if (p >= end) {
 			usdt_error(out, EINVAL, "Incomplete note data");
 			return -1;
 		}
@@ -411,6 +447,11 @@ parse_prov_note(int out, dof_helper_t *dhp, usdt_data_t *data,
 				q = stpcpy(q, p);
 				q++;
 				p += strlen(p) + 1;
+				if (*(uint8_t *)p >= prp->nargc) {
+					usdt_error(out, EINVAL,
+						   "bad native argument index");
+					return -1;
+				}
 				prp->xmap[j] = *p;
 				p++;
 			}
@@ -432,7 +473,9 @@ parse_usdt_note(int out, dof_helper_t *dhp, usdt_data_t *data,
 		usdt_note_t *note)
 {
 	const char	*p = note->desc;
+	const char	*end = p + note->hdr->n_descsz;
 	uint64_t	off, fno;
+	ssize_t		len;
 	dt_probe_t	prbt, *prp;
 
 	data = data->next;
@@ -441,7 +484,7 @@ parse_usdt_note(int out, dof_helper_t *dhp, usdt_data_t *data,
 		return -1;
 	}
 
-	if (p + 2 * sizeof(uint64_t) - note->desc > note->hdr->n_descsz) {
+	if (p + 2 * sizeof(uint64_t) >= end) {
 		usdt_error(out, EINVAL, "Incomplete note data");
 		return -1;
 	}
@@ -450,10 +493,15 @@ parse_usdt_note(int out, dof_helper_t *dhp, usdt_data_t *data,
 	p += sizeof(uint64_t);
 	fno = *(uint64_t *)p;
 	p += sizeof(uint64_t);
+	len = cstrlen(p, end);
+	if (len == -1) {
+		usdt_error(out, EINVAL, "Unterminated provider name");
+		return -1;
+	}
 
 	prbt.prv = p;
-	p += strlen(p) + 1;
-	if (p - note->desc > note->hdr->n_descsz) {
+	p += len + 1;
+	if (p >= end) {
 		usdt_error(out, EINVAL, "Incomplete note data");
 		return -1;
 	}
@@ -463,9 +511,18 @@ parse_usdt_note(int out, dof_helper_t *dhp, usdt_data_t *data,
 		return -1;
 	}
 	prbt.fun = (char *)data->buf + fno;
+	if (cstrlen(prbt.fun, (char *)data->buf + data->size) == -1) {
+		usdt_error(out, EINVAL, "Unterminated function name");
+		return -1;
+	}
+	len = cstrlen(p, end);
+	if (len == -1) {
+		usdt_error(out, EINVAL, "Unterminated probe name");
+		return -1;
+	}
 	prbt.prb = p;
-	p += strlen(p) + 1;
-	if (p - note->desc > note->hdr->n_descsz) {
+	p += len + 1;
+	if (p >= end) {
 		usdt_error(out, EINVAL, "Incomplete note data");
 		return -1;
 	}
@@ -510,9 +567,14 @@ parse_usdt_note(int out, dof_helper_t *dhp, usdt_data_t *data,
 	prp->is_enabled = (note->hdr->n_type == _USDT_EN_NOTE_TYPE ? 1 : 0);
 	prp->ntp = 0;
 	prp->sargc = *p++;
+	len = cstrlen(p, end);
+	if (len == -1) {
+		usdt_error(out, EINVAL, "Unterminated argument string");
+		return -1;
+	}
 	prp->sargs = p;
-	p += strlen(p) + 1;
-	if (p - note->desc > note->hdr->n_descsz) {
+	p += len + 1;
+	if (p > end) {
 		usdt_error(out, EINVAL, "Incomplete note data");
 		return -1;
 	}
@@ -537,22 +599,22 @@ alloc_msg(int out, dof_parsed_info_t type, size_t len)
 
 	switch (type) {
 	case DIT_PROVIDER:
-		len += offsetof(dof_parsed_t, provider.name);
+		len += DIT_PROVIDER_HEADSZ;
 		break;
 	case DIT_PROBE:
-		len += offsetof(dof_parsed_t, probe.name);
+		len += DIT_PROBE_HEADSZ;
 		break;
 	case DIT_ARGS_NATIVE:
-		len += offsetof(dof_parsed_t, nargs.args);
+		len += DIT_ARGS_NATIVE_HEADSZ;
 		break;
 	case DIT_ARGS_XLAT:
-		len += offsetof(dof_parsed_t, xargs.args);
+		len += DIT_ARGS_XLAT_HEADSZ;
 		break;
 	case DIT_ARGS_MAP:
-		len += offsetof(dof_parsed_t, argmap.argmap);
+		len += DIT_ARGS_MAP_HEADSZ;
 		break;
 	case DIT_TRACEPOINT:
-		len += offsetof(dof_parsed_t, tracepoint.args);
+		len += DIT_TRACEPOINT_HEADSZ;
 		break;
 	default:
 		usdt_error(out, EINVAL, "Unknown dof_parsed_t type: %d", type);
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 7e6e5d90..e20bc82b 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -782,25 +782,93 @@ err:
 }
 
 /*
- * A quick check that a parsed DOF record read hasn't incurred a buffer overrun
- * and is of the type expected.
+ * Ensure that the buffer has enough data to read the record of the expected
+ * type.  Ensure that all records have at least 1 byte of payload data.
  */
 static int
 validate_dof_record(const char *path, const dof_parsed_t *parsed,
-		    dof_parsed_info_t expected, size_t buf_size,
+		    dof_parsed_info_t type, size_t headsz, size_t buf_size,
 		    size_t seen_size)
 {
-	if (buf_size < seen_size) {
+	size_t	data_size;
+
+	/* If we have read more than there is, we must always fail. */
+	if (buf_size < seen_size)
+		data_size = 0;
+	else
+		data_size = buf_size - seen_size;
+
+	if (data_size < headsz || data_size < parsed->size) {
 		dt_dprintf("DOF too small when adding probes (seen %zi bytes)\n",
 			   seen_size);
 		return 0;
 	}
 
-	if (parsed->type != expected) {
+	if (parsed->size < headsz + 1) {
+		dt_dprintf("DOF record too small: expected %zi, got %zi\n",
+			   headsz, parsed->size);
+		return 0;
+	}
+
+	if (parsed->type != type) {
 		dt_dprintf("%s format invalid: expected %i, got %i\n", path,
-			   expected, parsed->type);
+			   type, parsed->type);
 		return 0;
 	}
+
+	return 1;
+}
+
+/*
+ * Validate a payload containing CNT consecutive NUL-terminated strings.
+ */
+static int
+validate_string_payload(const char *path, const char *payload,
+			size_t payload_size, size_t cnt)
+{
+	const char	*p = payload;
+	const char	*end = payload + payload_size;
+	size_t		i;
+
+	for (i = 0; i < cnt; i++) {
+		const char	*nul;
+
+		if (p >= end) {
+			dt_dprintf("%s string payload too small\n", path);
+			return 0;
+		}
+
+		nul = memchr(p, '\0', end - p);
+		if (nul == NULL) {
+			dt_dprintf("%s string payload unterminated\n", path);
+			return 0;
+		}
+
+		p = nul + 1;
+	}
+
+	return 1;
+}
+
+static int
+validate_argmap_payload(const char *path, const uint8_t *argmap,
+			size_t payload_size, size_t nargc, size_t xargc)
+{
+	size_t	i;
+
+	if (payload_size < xargc * sizeof(uint8_t)) {
+		dt_dprintf("%s argmap payload too small\n", path);
+		return 0;
+	}
+
+	for (i = 0; i < xargc; i++) {
+		if (argmap[i] >= nargc) {
+			dt_dprintf("%s argmap entry %zi invalid: %u >= %zi\n",
+				   path, i, argmap[i], nargc);
+			return 0;
+		}
+	}
+
 	return 1;
 }
 
@@ -908,13 +976,13 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
 		char *dof_buf = NULL, *p;
 		struct stat s;
 		char *path;
-		size_t dof_buf_size, seen_size = 0;
+		size_t dof_buf_size, seen_size = 0, payload_size;
 		uint64_t *dof_version;
 		char *prv, *mod, *fun, *prb;
 		dof_parsed_t *provider, *probe;
 		ssize_t nargvlen = 0, xargvlen = 0;
 		char *nargv = NULL, *xargv = NULL;
-		int8_t *argmap = NULL;
+		uint8_t *argmap = NULL;
 
 		/*
 		 * Regular files only: in particular, skip . and ..,
@@ -929,7 +997,7 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
 			goto per_mapping_err;
 
 		dof_buf = read_file(path, &dof_buf_size);
-		if (dof_buf == NULL)
+		if (dof_buf == NULL || dof_buf_size < sizeof(uint64_t))
 			goto per_mapping_err;
 		dof_version = (uint64_t *) dof_buf;
 		if (*dof_version != DOF_PARSED_VERSION) {
@@ -945,27 +1013,50 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
 		 * probe.
 		 */
 		provider = (dof_parsed_t *) p;
-		if (!validate_dof_record(path, provider, DIT_PROVIDER, dof_buf_size,
+		if (!validate_dof_record(path, provider, DIT_PROVIDER,
+					 DIT_PROVIDER_HEADSZ, dof_buf_size,
 					 seen_size))
 			goto parse_err;
 
+		/*
+		 * Ensure that a validly terminated string follows the record
+		 * header.
+		 */
 		prv = provider->provider.name;
+		payload_size = provider->size - DIT_PROVIDER_HEADSZ;
+		if (memchr(prv, '\0', payload_size) == NULL)
+			goto parse_err;
 
 		p += provider->size;
 		seen_size += provider->size;
 
 		probe = (dof_parsed_t *) p;
-		if (!validate_dof_record(path, probe, DIT_PROBE, dof_buf_size,
+		if (!validate_dof_record(path, probe, DIT_PROBE,
+					 DIT_PROBE_HEADSZ, dof_buf_size,
 					 seen_size))
 			goto parse_err;
 
 		mod = probe->probe.name;
+		payload_size = probe->size - DIT_PROBE_HEADSZ;
+		if (memchr(mod, '\0', payload_size) == NULL)
+			goto parse_err;
+
 		fun = mod + strlen(mod) + 1;
+		payload_size -= strlen(mod) + 1;
+		if (memchr(fun, '\0', payload_size) == NULL)
+			goto parse_err;
 		prb = fun + strlen(fun) + 1;
+		payload_size -= strlen(fun) + 1;
+		if (memchr(prb, '\0', payload_size) == NULL)
+			goto parse_err;
 
 		p += probe->size;
 		seen_size += probe->size;
 
+		if (probe->probe.nargc > UINT8_MAX ||
+		    probe->probe.xargc > UINT8_MAX)
+			goto parse_err;
+
 		/*
 		 * Assume the order given in dof_parser.h, for simplicity.
 		 */
@@ -973,11 +1064,16 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
 			dof_parsed_t *args = (dof_parsed_t *) p;
 
 			if (!validate_dof_record(path, args, DIT_ARGS_NATIVE,
+						 DIT_ARGS_NATIVE_HEADSZ,
 						 dof_buf_size, seen_size))
 				goto parse_err;
 
 			nargv = args->nargs.args;
-			nargvlen = args->size - offsetof(dof_parsed_t, nargs.args);
+			payload_size = args->size - DIT_ARGS_NATIVE_HEADSZ;
+			if (!validate_string_payload(path, nargv, payload_size,
+						     probe->probe.nargc))
+				goto parse_err;
+			nargvlen = payload_size;
 			assert(nargvlen >= 0);
 
 			p += args->size;
@@ -987,11 +1083,16 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
 			dof_parsed_t *args = (dof_parsed_t *) p;
 
 			if (!validate_dof_record(path, args, DIT_ARGS_XLAT,
+						 DIT_ARGS_XLAT_HEADSZ,
 						 dof_buf_size, seen_size))
 				goto parse_err;
 
 			xargv = args->xargs.args;
-			xargvlen = args->size - offsetof(dof_parsed_t, xargs.args);
+			payload_size = args->size - DIT_ARGS_XLAT_HEADSZ;
+			if (!validate_string_payload(path, xargv, payload_size,
+						     probe->probe.xargc))
+				goto parse_err;
+			xargvlen = payload_size;
 			assert(xargvlen >= 0);
 
 			p += args->size;
@@ -999,10 +1100,16 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
 			args = (dof_parsed_t *) p;
 
 			if (!validate_dof_record(path, args, DIT_ARGS_MAP,
+						 DIT_ARGS_MAP_HEADSZ,
 						 dof_buf_size, seen_size))
 				goto parse_err;
 
 			argmap = args->argmap.argmap;
+			payload_size = args->size - DIT_ARGS_MAP_HEADSZ;
+			if (!validate_argmap_payload(path, argmap, payload_size,
+						     probe->probe.nargc,
+						     probe->probe.xargc))
+				goto parse_err;
 
 			p += args->size;
 			seen_size += args->size;
@@ -1017,6 +1124,7 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
 			const prmap_t *pmp;
 
 			if (!validate_dof_record(path, tp, DIT_TRACEPOINT,
+						 DIT_TRACEPOINT_HEADSZ,
 						 dof_buf_size, seen_size))
 				goto parse_err;
 
@@ -1073,9 +1181,15 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
 			if (argmap)
 				psp.pps_argmap = argmap;
 
-			if (tp->tracepoint.args[0] != 0)
+			if (tp->tracepoint.args[0] != 0) {
 				psp.pps_sargv = tp->tracepoint.args;
 
+				payload_size = tp->size - DIT_TRACEPOINT_HEADSZ;
+				if (memchr(psp.pps_sargv, '\0',
+					   payload_size) == NULL)
+					goto parse_err;
+			}
+
 			dt_dprintf("providing %s:%s:%s:%s for pid %d @ %lx\n",
 				   psp.pps_prv, psp.pps_mod, psp.pps_fun,
 				   psp.pps_prb, psp.pps_pid, psp.pps_off);
-- 
2.52.0

