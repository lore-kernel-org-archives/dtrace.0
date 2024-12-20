Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A851A3BAD
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734733541; cv=fail; b=YyU/I53MgqtKZJ9jqBZRdzEEtDsHG2RoKOoIzSszlnuLLD5yOM12vUXeZzF/9jlWXTxLpBEc6loXopKuIhnYM6UrdNmeA4ItMGXK3Uel4d1p1Y/P1fR3jke4p8S5uWxL0GJf9b3Hxpso7IXYI7PtzbXFnA8JFFb6WWGwOpM3Kpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734733541; c=relaxed/simple;
	bh=J0uFIrxPvMIxEMLT7Z+mGLdcBXx4GNrUqYSdVllgKkg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C/cLAKL++DCmQPCd2ntOHObHbmbwWwRkAuN7KBSK//i4Nh1I10B6hsLZIifoUaC/yDrk3UnNk+6H8SCMhl24WQU0+zszjExOTzakKMvhdyG+g7ReO8bMccZ9EAQlNDDIblwPCB4BsCpjVsCifypqcBatt3zIFwBEK2irYMGemE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aGX0uRJL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QmjPKcAo; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aGX0uRJL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QmjPKcAo"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKMNrYF032571
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=Vu2mixR1GRhPK34UA3
	X+hWkn7l5ciersq5FBUSmv78k=; b=aGX0uRJLm9n2M4ov0LZOQstcUSA+WKJXSi
	gIR0qrKL5jDimUtxTSiE5NpdazPzXOpp2GBJTyrrikdQQOlSEZS1xmllfwulxHjG
	x+YI6UVvawxKpAvHb8YfjCJPH004zHi5mrNHxRv+pBlJLB18x3FXX0iX+GtKRTr6
	/JcBNg8Nwqp8RZHnNhbkWh9qkrvl2JbW+//c1Z0UU++t3dkZuOXWsU1WnHRnVgKA
	SCOHS5TXHatHINYTwm2lE2U9sNVkwVcqtRyc8DKysR+7SGcWIXpKsi1ZoBZ9Vi+f
	VGanXZEp0Gymiu/Mtpm7qOfxgmyomOMMvWVx2J8B/Ioik+9cb+XQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43h22cx460-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:25:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKM0Uuh039255
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:25:37 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43h0fd2d6y-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:25:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chJruuboa1WaC6TTUPy63+7Nij95Q0dIM9r2Wqk7poPcUuOYo/eOURLx5n+MwFB01St1gy9U8U1y8fdM64oh6B73H/88n+TTIqXak6pOsUjQL9I4N8Fm0FqBidUIaDCe+16jeiNseBJhUiBa49sprXa28DDGbrm0U5cmY7lH9n0k6mSMsg2n+7sHhFAJBCBUX1OYAG03pXdJthbH0sTSs6Q9wBeFwDe3kapn5cGsCvcjvtZ3Yuv3/hs1kyEQwh7t2iPezvbxgdIGOzN7rs058LlRNDHhI3d1B320zCgYBGVEu69KBEy89eEd9Nn4jP3qviFRqIaUYaz4vK5+txPu4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vu2mixR1GRhPK34UA3X+hWkn7l5ciersq5FBUSmv78k=;
 b=CpqZNHLQoJHj7ypwkls+d0O0z+wecn981YdZWcKvJrAh8roRbYHFF+BZ2e9+mJ7GXmb6re7Ch+d6z5hnSEdlPo7O/tudLS0Vq6+Qbg5ZFJSEvLCer79vTajbMFoEL66NgP6xyce11XGOf9aXU0wB4i/pYOR+59XJmqKZWq1EZkt2O9pxxIcxUw1Ult9/P1/2oMbfNp8/4X/lQQGPTuREsUDYgEthWM4uvtjLroNuN2Cw0xW52g4S8u4gn36V2h4S67zlHPHNz8F7xFU2QzOv5BRg0ua6rbm/m59pPB+OghvsOQBf6qfTmoYoxUTUFJVt9/ZijBeMMV7i6dCTdqHm7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vu2mixR1GRhPK34UA3X+hWkn7l5ciersq5FBUSmv78k=;
 b=QmjPKcAo0g3arD16EJFotbA3knGcJ8+sE6dp5ZqepqCWDI5qTObxIyO2RKIWErkatSkp+7XzsMDOWxvLgs7aXii8PrgS/1G2nPtf5LUO1+xMNrOw0uFKNQ3tlTYvBsYorUuxt0oipP/TMN8mfBbV2vNfW2dV/ejgRGLhvkWV+NE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4594.namprd10.prod.outlook.com (2603:10b6:303:9a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Fri, 20 Dec
 2024 22:25:30 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 22:25:30 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 5/5] test: Disown child pid for cleaner stderr
Date: Fri, 20 Dec 2024 17:24:55 -0500
Message-Id: <20241220222455.18351-5-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20241220222455.18351-1-eugene.loh@oracle.com>
References: <20241220222455.18351-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0188.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::13) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4594:EE_
X-MS-Office365-Filtering-Correlation-Id: f8c1ebcf-c847-473f-cd72-08dd21453680
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NsVLFFplKwM7h3ha+RKKzA0+rmAYNzGj/fYDXfKgo+mHOuJYYd0Yon6ub8Tp?=
 =?us-ascii?Q?dQWmiOJJkWVkRKZ1mqmsuTYbp9ZONW3aHhDfR9oKkivRcYCiR3ir+OL7ipDF?=
 =?us-ascii?Q?led9LAjdsp40LfY8jrcyxmqAXnN5FxIvNFnMp6i5kyNjSdtLNsdc3goUKVyS?=
 =?us-ascii?Q?WxG95fGciIHWesZha0lMLX+hu6g3fi6RfG6UDSiJseeGxnqTRY/hrBkBXivH?=
 =?us-ascii?Q?uga5rgoAal0XOOITuiYQ7WZD/eRGA+Iuwu6MmKBNp74KASv36H4+ebKHLRBM?=
 =?us-ascii?Q?WHwKua6WD8hf/Cl9fYXsAzmMEPLOXvqhIcd1VQl7whAAD+0CoOUS1H/fXPnl?=
 =?us-ascii?Q?GRYsLk+2ACpebipWqLBc0Wg0vVVIbBFvktnz98Qx+Ht8L3yNnlarCM77HMEa?=
 =?us-ascii?Q?7NCcbn6xoMEwnrSt+3GeN+/bg7/Y57UJicgDB0KJaIKkpywWFuh+shoz3y9d?=
 =?us-ascii?Q?wNUgxWMKpf6Cy5Skit09g5c3JQwAer94auWc0vD2LPRdRongd+AXQrpc/sJm?=
 =?us-ascii?Q?mimTUpepkys4QQOdZVKCoipYXyH3cVNQ41nF3aXSend1bZp7T9sUtsH/LMgX?=
 =?us-ascii?Q?ztUf1XOCHBLK/MGJ6UGQ+v105SyoEU1y6wRb4i0O+vqdsif6vuQSLtLDBiIv?=
 =?us-ascii?Q?y6VF26gdCK8Rz0m6Zn+msrN5E9UbHjxUEiRKpEuF8CjQGg1PBJISm+JPDxrx?=
 =?us-ascii?Q?8Kk6jU3r8Wsja48OzRohBkfHN192vBkMPEH01rzhDfBLymORmU4KZlS+qZHq?=
 =?us-ascii?Q?/cyh3DHzhbuqqF5x7Pc2ZUWP+KZdv0loqokf5nHCj9Pv706QsBYUwy+jidyb?=
 =?us-ascii?Q?OQg3wcCgM8PHLlFv+0ij/uJLqyc8XYmSSRGNXXo8U5z2O5Rwugchag2ZruLI?=
 =?us-ascii?Q?h+6I29i0zQ9V4zcAoVpv2C1hZb5WrMtEFAgZ/ziHLHSQqZIgkaYgK37h+ceQ?=
 =?us-ascii?Q?FRHshLY5Kijqkz1rvtSKdCC4m5m48abIMLDgzmZRC6MPGTgjBZA6mhaA8c2Y?=
 =?us-ascii?Q?jJWAmDuYaanIDpGc0eNbPtx/lhC1eIFlcIcd/Jte2jo+74LD8jWFNf6gkbxO?=
 =?us-ascii?Q?ZHX5zn6X0bKIfgwQHxrZuoDkoVAxWUZJG+G2ZTqYJzutl8r53i6k4VHt17hj?=
 =?us-ascii?Q?EdXwkJSGeF8kOT+RRHcSN13ek+hAFf9cvWBNb3xJg36rweG912LtEA3CeJ4n?=
 =?us-ascii?Q?OAeagj3QANQpn+oFQJ7RcBvBYmAIMwk4CHCrb8XICCnpb3uITDSf6BSbAdax?=
 =?us-ascii?Q?sHecdflEOojuHOneA8dMGQz9QPcFkqW8TQ5nDkMKzP9BrziQYTehtdSXO054?=
 =?us-ascii?Q?+u8rHvT1+haZYWJk5wchBkYzCf1pSRVBe6qUVWex8GUlDxUhI+LCJJTqHFgP?=
 =?us-ascii?Q?UsrW5k/zsTw05lR62HXREbyEVmYX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DC+scWN+EK31TbAIckCFSdPVlAcqwNZnWeKvfv66eSktaOZMwnYfsZTgfnnX?=
 =?us-ascii?Q?ldHfAN5MsIVYC53N7Z78MvEGKcObAYmkTJa/bbLctNye7MuCsuw+r8VkiHx2?=
 =?us-ascii?Q?P51CjLb/9lpl5tAMvM1HyaBWb1mFv+DtFpVpAJ5/Pgn1mEbjeP0hbNbdi29w?=
 =?us-ascii?Q?L2ToAV89gncxx3+HRHTQXtZ5+JZuhJPJqyUE0B/N2xiNN1/v3nfm5Izarm6c?=
 =?us-ascii?Q?f2ylE3Qlmv3ak0ONldEMHJ/H73EBApNIDvZSk6xrlKqBKf5lOB2EaxUzG9DF?=
 =?us-ascii?Q?Jy5AXPxEJVEGjIOEqbN7RwXVvSehV7WHSRcPzpeBYhaZt/i/s93JPSmsLrv+?=
 =?us-ascii?Q?LImNVfKj3+APZgz4PHvXundkaPfhZofeb8hXO7IKFnPYiuFHbe6ec89im8Zp?=
 =?us-ascii?Q?F6sDxymw1tlXlpfq+ObatfyN48Yp7w8egYAoH60OuFjoNYH7NzdIUFP/RAZX?=
 =?us-ascii?Q?hDp8rJ6VIg/P/U9KOgNzbplMR0KlOANsgtLFAPNlimSv8d4rvY1Ss3WZcQb7?=
 =?us-ascii?Q?mUbDq7mVMGEd1cZ7iIBC1W/tgn06zmZhIdmYPgKd04GEXGgYRw53SMBurmgG?=
 =?us-ascii?Q?pucABuMXyoLA4n3Sf7KJ6G0FgGrXRBNLtWDovu8HWELnzQBaEAN1ZCEIxHFU?=
 =?us-ascii?Q?jnVmyZFB8dIzKO3ac7VA/LFIEnyahuMZSfHdR7gM6+3XXYgs2ZhE/Il5R3AO?=
 =?us-ascii?Q?u0QKbVEC6kvQ22jjSvw1S5i941aVn4H1h8pHS9Gm9nSMs60sC+yx7RPmKXdI?=
 =?us-ascii?Q?xPJSmeNNkowLg3Q8uUr5HeFR5mWeyKrPowFPieIxZRgF0vga1vVYE5bahcnK?=
 =?us-ascii?Q?Sx8rTnouVXecz0PtnpFYHHD3UqmuM3wZvWNqH2Q2BGGeXffhqSdbtK8WoJCn?=
 =?us-ascii?Q?rUl/+/LaAh/W2eu3PEklPQXnr5/+aEmJmUb50FgJAid+FecKlugFHeGDvUym?=
 =?us-ascii?Q?htvD0msMBG5l+2aCzo7PsDswUas+aHNTdcwDho6LBZoL0ib7R2NoM1vgC7dP?=
 =?us-ascii?Q?X5x55Kar0VCPL+Bbtfq4I0E5eLYIKGwQukVK1GD2E/IBsUnN/otjsvJTgzEs?=
 =?us-ascii?Q?OjCi1drUOi1FBJ8nHEiaWMxy4GixwVN4U3MehgOZo1aRQVDT4ERyH3PSBpYQ?=
 =?us-ascii?Q?ZHxYPEGdA8hJGeKi5OkjMeWFWc0rt7rPeJI+PJQMQ8eJwCoUl3wEaYjp+hac?=
 =?us-ascii?Q?JZokfMKlgZ+9z5h97C3phGfXIccyxYqeDGrIvGXfZdUkvxTBKcfAHeXW6/RL?=
 =?us-ascii?Q?Sw24TiImUqj1758mJFtwHammVOJghGt9Kc/c30zAYtrh19p87x6pxlKFj53U?=
 =?us-ascii?Q?ui951xh3Y5ShZxQo+jRv1neXhutvv0JDXendkwethhImIZ1GCJNvaMh+mHeS?=
 =?us-ascii?Q?cKIiNrcHoTHfuQ5CQiCWF0wsvVo0dX8lwuA13/p09BbGbv1o5bveja/5Ehch?=
 =?us-ascii?Q?qpJ7Fc0P91Hr/IjU76+cxD+c91WvYyM0MNSLKOYFrJNHxTNjPKkHKi5HUePk?=
 =?us-ascii?Q?SYHtqQWx1ZqlbZT0W8Ztsn38sKDOQSr1i3uItiJCCkyhriMuIisq2Adj6MVC?=
 =?us-ascii?Q?WeZomM3yqev/dkMwaA9vNWfIV/QNuUh2mnJhoEPW?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	c18DL5UUCbOjqw4XLemAQhQMoAp6wZHkOI723NJUSn2L3Y/ZssKjx8Go1yRZmBWPZ/wE2vRPvWYj/wVNG/bOfIWocW52KApeylH72P7xgcBRjr51HpgrorAAObvrJ0FL8F7Gj7HA1dfK6iqZtzhsfmGk8UFeH9AYPTn9WVDV5vJ0wK3oqJGFLpcZkHBtLW02RCWYq12xXvVssQfzEvXR1pXYjFgv9qfbpkUN/PYHP298/oNDKOokNrpfs0yGq3lOewWS4MllX1eqCbJYs7d/6OP9WMtgo1m5ruZRPDFRxNB2jJmXTNIimiPaQ2UbZNPdPIEej56gnwE6z1wC//J9rwgnvwjrAU6wRaynHRtWE/yCopZgtkcXaCEabtt8TGOTwo61Ea17JRT/d6rYWXfCMPe2rDo0Kbxnrm3wy1u3slgNXhmNnti9coRXY3bZPrZAqkDLEDfIVL4UXueQs30RqOYoTjNfyTHDx0gY7fTHOffp2jx+GSqqvsMESWDjRdySu7ZUjnj2aW1NwEQCB7GSPdIh90VsHXBTDzTuz/tOwhF7TlUiaiQ94r0JQOsI/cDVTLnvlasmtiFv5M/USbZu9fNDQxdt4hlAFpjoAvhMhwE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c1ebcf-c847-473f-cd72-08dd21453680
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 22:25:30.8125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FD4mA6Fauj2DSpDyx+4qSzHf/PQOHt6KLioHfATkGfE/c28opLX67CNM6VbJQerPTWV8SYT6A3HFkLsKQONYFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4594
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-20_07,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412200181
X-Proofpoint-GUID: BOOdc3WDuDO202m0KjGKNT0mxKMIQeNq
X-Proofpoint-ORIG-GUID: BOOdc3WDuDO202m0KjGKNT0mxKMIQeNq

From: Eugene Loh <eugene.loh@oracle.com>

Extend commit 9546afc22 ("test: Disown child pid for cleaner stderr")
to include another test.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/usdt/tst.dlclose4.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/test/unittest/usdt/tst.dlclose4.sh b/test/unittest/usdt/tst.dlclose4.sh
index c13404caf..a84e34600 100755
--- a/test/unittest/usdt/tst.dlclose4.sh
+++ b/test/unittest/usdt/tst.dlclose4.sh
@@ -192,6 +192,7 @@ function unload_lib() {
 
 ./main &
 pid=$!
+disown %+
 sleep 2
 
 # Check.
@@ -204,7 +205,6 @@ unload_lib
 # Clean up.
 
 kill -s KILL $pid
-wait $pid >& /dev/null
 
 echo success
 exit 0
-- 
2.43.5

