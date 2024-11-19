Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAC714AD24
	for <dtrace@lists.linux.dev>; Tue, 19 Nov 2024 23:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732060299; cv=fail; b=XqsF8GiC2EgmtfV9ZecOV6iPvGFZkN3NQE4eXN8GKC1LbJb6AmxjnRSUlXXXU/cJ8xgxrCQNdNQd3C9EnxyKvJC/BtmzP/o9atA8DKi4PQqlJzR+uWby833mOCtvgHwAZ4XKwcRp3upy8w9fNsSVKDnlWUhHT1hCtDMk0TiWSyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732060299; c=relaxed/simple;
	bh=YHTweyf8szVlo0A7Z4em/p6UCINE70OUd73wf+JQ81g=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=hNy3UVDtSDmEBtshOWxUcjnZLjhhD2thtCVVGEqM2y0+hyUrwVsPgCCGFob/aUMeE9yylJc60MNK9caHD8vHioKjMMbyO6eS7cym+EDUtWLiFrWxO2UdyRkfl5YyqOzDvW3ZoX/uPB0C/z++s3xMVa3/6GSSn0uCucQTn8DibqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nxoQbCZM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qHuYy5db; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nxoQbCZM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qHuYy5db"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJMfbG1024567
	for <dtrace@lists.linux.dev>; Tue, 19 Nov 2024 23:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=GBI6mQ6VlZqtdLJWCRvTAu4lJSWxE5fDlEXJAqEkbSY=; b=
	nxoQbCZMJwbOlO8/VZ5q7FAS2XNuZlzkiDZ9wcPTw2z1txBGCQocjemsRsyKySod
	TGjMtXGrB4w/05/NWNrYKie5CX85zwB/ETrC1ByFFQozDnzd9lrW13xZEQnjSGv5
	Jz00hZcfBDt7hupPmAHCefW1nvogS8KKpxdKR9lcs758T2JlZFhkq9J0F2EBNAq7
	Jm1ETEXJVbXo8loQxuubNjkkPtAdEAzg+dOfnRmdXg8qdFNo5TKtqU2J3M6SSt7h
	uNxlZooYQA4o+nhsA72EQBK6XT9DuYIUJxSj/X7AAPmvdRqzFrGzNsWGZS/yjZqS
	FrX9ZIkpX8K1tGO061UoRg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42xjaa6a97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 19 Nov 2024 23:51:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJN5a8b039232
	for <dtrace@lists.linux.dev>; Tue, 19 Nov 2024 23:51:36 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2045.outbound.protection.outlook.com [104.47.70.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42xhu97mh8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 19 Nov 2024 23:51:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHeuq5NU1Rs8CVvMakG3OKi36fSg5/vscIyt6sC2JgVqD53l9NMYucxocsEQUM2MvL/Zb1LibH63UbvI+bG85EB9EiG2l8Kh4AfXdbqRneZEP9AjuVcpzStNVYX842xhLHaw+FymPAFltf6REjcImTPB40Vwkf/4nzkH8cSCitzcRl7hyGU1sUYTUxxtGKzrZ3x29PragvHBkIhf9PTdvNEeEU5P+ritmr19TpJxGGWmu4ZQKHZB2HvgkWUFya0/TJROPOYoo7lqoreb/PP7v3yUQknNgQmFueh72rnmr8Qt8wlPX4WV+t6fxGkJWIg8hofngtMRFefUPDcBW94Jwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBI6mQ6VlZqtdLJWCRvTAu4lJSWxE5fDlEXJAqEkbSY=;
 b=Dy5ruzyTaS8ZVZpZxi3daqy+X5IqqmwpnjA7dMCCZfI/BRAETZiahDSyIRStoDKW0cy/AU+rRIVOt24OMgMDLrCnK4Qexfx394udbVvHrw4HvYNTIVYOw3qMIs52zyAnzhI9FFFkNq4GP5ZGxOgwF9ngX7L31ayhnNLqf7MKIXgAL2jRnQ/jbabVk6YCWfySwK2z7VlK0j6KqrZjF2FMGa39xo2fHvBBn+qO9dibj6LJamFIr2/OC6UzT1Y+dCs3tSEXzKVt/5XZdvu+/OWW8SlgO7YgRA1qeeHPIsJiifP/HFBkOafp7q32Ez4Y/WqmTUM+SYtT5GSSTC2RK1Hcmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBI6mQ6VlZqtdLJWCRvTAu4lJSWxE5fDlEXJAqEkbSY=;
 b=qHuYy5dbWfbCzpuE15STSpuhyDy0aCoe6bMf8YEVSGJDhB8wJK+nT29j03+EWRRudJgWf2+3hsXZiVYQ/un1ZbqK3QCkDmvetXCGzVgSNnr/CSxAFQYK4h7jhCD+B6Xcdif9290NGoTQilyNBHNcMs9ZuQ4P8w46ng6wXjWQ624=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB5857.namprd10.prod.outlook.com (2603:10b6:a03:3ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 23:51:32 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 23:51:29 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Preface usym/umod/uaddr with pid
Date: Tue, 19 Nov 2024 18:51:25 -0500
Message-Id: <20241119235125.20254-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0225.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::14) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB5857:EE_
X-MS-Office365-Filtering-Correlation-Id: cf087cb0-8a27-4c2a-d628-08dd08f516ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uFlBDC8WKcJ+YWKQtZVznoGbZU3Hl60jROW9wVzF0/YPRzGgoQDUxFmmTfBr?=
 =?us-ascii?Q?q7L8/BgPZAXQVHCQeuHXIku2N1tu6KnhWXdti6yBJ3Mx5TXQY5Ki8nAGM6sr?=
 =?us-ascii?Q?7ijz18UxGhIlo5svlznUy3prdGEuF0k1ivFen3e+L17eUk5hIb+z3vpEs6RZ?=
 =?us-ascii?Q?hTEY8EzDiqXk0jK0uowQo809GDpqMAGCZFbX3Tj80xnm4oiIIXiIc+Y9BqBU?=
 =?us-ascii?Q?SgSFHpJU0WQBPMCuOcHf2YBw3p54mziSdjH5JPNEw6muHBPn6Ml4l9Rsgu1W?=
 =?us-ascii?Q?7zPgugbxCtWtchOPuzIoWz2bCLuBQyTnIknFTt6VCxgIUBUUOY5WNXsJqOHS?=
 =?us-ascii?Q?td0WxUwcLTFfiGFVvABNCuMai1PozC35TrCvsyFcmywh7EQ1YAdNdr4qlzFE?=
 =?us-ascii?Q?Jee07OgAqMqxidT4AJvaeAcIFndo+uceiYNsE3h1Rcq6upCX5P3y8bkeFv1W?=
 =?us-ascii?Q?/2kB3qdtaldwRRXcLPFF8A7BzrRqpe4WEw77goTBKhcWAFhWvp23CjTcGC7g?=
 =?us-ascii?Q?Ql4I/hafBYfKFuypFXNByFRXivD9s6dOdoZ+wA660Hzp53tkwlAvUA9RIzLF?=
 =?us-ascii?Q?AFLXxUQh1Hk5a1QSGm2oljSCa9bIQJhJTPV5sH9gRFRr6m7zjpqaJ7URfLv7?=
 =?us-ascii?Q?E0KpV8JDTty2x+19sdsQLHFHzSLMrJLdIcBE0USgZuBFzLf0Cu9JPE0oOCSO?=
 =?us-ascii?Q?zvrO2ji+K+GTuAzHk4Fr1An4DJwj7r36fNRMZgE2rMnadf8dUX3Tz6lRrluY?=
 =?us-ascii?Q?Z0l4wC12jyjB4XQFLz4urayb9VYXOqACH9x6RJykzvYuOgtFHGVkMFZxQXUg?=
 =?us-ascii?Q?wIkUbizTHLNL1EOLu99081hl4uhwvRJTxLJq+/gH2Y2dMry6jdKfajA4mPZv?=
 =?us-ascii?Q?UvuFOkk+qsFyon+v9uD/RX1CV170kEEc5GtnMIRyRrttrce6jqpcMYL2HoE4?=
 =?us-ascii?Q?wY3bhQ1An37BB1CZjz/v/967HXhpjmnxUfzSKM+eqxyAW5CYDCffsgggHUQm?=
 =?us-ascii?Q?TjjPmCxdzMsjp6QNcyw4/vFaH8hFHH8eNpp5O46B0TsAlRVKoqF91uybmPvA?=
 =?us-ascii?Q?qNBLhZWEpaAhn/QqWO0edW/gPsS+sRcHpl5WD+Yb778R5q6MaJjdNB502MK3?=
 =?us-ascii?Q?IP8RQ8Q+cVJZ5fdlQWY3DX1MAVhutJI2dUBBtNKp+4g4JO6jPUWu5RyEIIok?=
 =?us-ascii?Q?LDi5zIz5fuVUgomnYfk/v4P4K1P/8+slIM+o6ydQFbysMToh+19SwbdoveEW?=
 =?us-ascii?Q?4Lgw+fQwrwkC0N+DhtOA8ZJXoKVNVFVg7iVWBQoaiPMFQhxRqgZRNM70NmP8?=
 =?us-ascii?Q?/GcQI3I6lqRlN3DZmSB6wgp0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a7zH8h9XlZz4taj2WrkTbWu4EaVc3XX30pVRWDCb7C3oF9yeKbeJWQtEg13H?=
 =?us-ascii?Q?FDta4XOd3K64rw7Ra4KTPoxK7pTQAcOM7BZXnHVCQPgpst0BGxkf7NWt+0lh?=
 =?us-ascii?Q?3Gwzu3BSJ6yZ3UuWAwTJ12f1kPSS3H/i/HFB4AzpRRbSI0o6HwBVq66ToxLB?=
 =?us-ascii?Q?l4XtrPEtUkFTLegGJQ9EOhfjeu28Ix5uxk3pHrhhDgNRanpaffFLVFazNEoK?=
 =?us-ascii?Q?eVvAS+7+QoFxOVitAVBs3AFLxeUaYwMXRONI4zy2vo2JbvAcHzGmpxl2hEAB?=
 =?us-ascii?Q?vKjfrWARJVPy78u+33SfBjCH59G6N7pe+b1Xxpmv3bsiV6Ns+5fdpGvJRbrw?=
 =?us-ascii?Q?No14ScqXidUDkftGK/99JqiqSIrvlAN8LjDj9eYJKriVqYdKOuRgAju2MH3q?=
 =?us-ascii?Q?As2xjcZujwrW7ohI30ln807tgnOJjWGJIOy54u3L+cJHAdRXgx5pWViIQDbd?=
 =?us-ascii?Q?RjLt4u46KCq1/jPMx3cv+2bouo3W4D6I7nhiav+MJOUtH4QyauxWJ6EuCobF?=
 =?us-ascii?Q?yHV1B4dG5AAlUC1O5x2FZ0NTh03B4eo721XKiSd51a1K3bTBzrbV5lM9mndO?=
 =?us-ascii?Q?1FBoU86UwHNWxX5fi26C8mcCfxqCy5t5QgoOsMrP2utGt+y9GlEYm/KodWBT?=
 =?us-ascii?Q?LpNO/GuLRSD+YGb6IsGoCIEy8mlte77VmNnNQlMQBvnwkYwcZ538fG84CMdZ?=
 =?us-ascii?Q?zNrlEKx3cB6pt85j2sbLwkUsK24ELKPqSebjlLtkya/Zdoen79UwUW0JTy44?=
 =?us-ascii?Q?bk+hO5REX+hiLUSKcnvgDDpJS8/vkKBOhwIpjT5Iie17IfMQdeC/RqADGl+x?=
 =?us-ascii?Q?EvAQ3CmPqfnBzH6kgW3MiiBAjQ/2GThbh2dySqNA/nyrDw+D7rfIPVGl3DzQ?=
 =?us-ascii?Q?OT2Po8VWhPeSJ9VEzIIwxR9VxigjsAOvIXfBQXxpnFJVKWkBSLFQqqLpXdZg?=
 =?us-ascii?Q?z7u89zq10tLL+JUb94LzvCC1+KApAPmroEBNSr2psnROa/rZF3qDo/SU++bt?=
 =?us-ascii?Q?MgLr9kAjFljp8C7KeThkw3tmpxJb+BIxmQi5M+/VHy0oM1fnSUv83MGyd+NT?=
 =?us-ascii?Q?aNF/z3nX3GLUB7HtrlaO8E4VYKM0mB7U8e20Lhf/GsEisKo3dueVYCNqbeK8?=
 =?us-ascii?Q?eXoeoWU2Q1XAWXTzj1PUBwmu7g3bNyXORuWO8vjeAdzy1TXwLrDaLv5C/4d+?=
 =?us-ascii?Q?2zgAm/WDdmRIKJhZaQJfwrhD9lrKbVAZj+b4QQYdQC0GQoXtxh8b7HFs+NA+?=
 =?us-ascii?Q?/uP5YyazJF/khi9vRYUjPnBVYeY0lMrD4r28XO4IbxOlOOmzWzi1Wd1wV6HP?=
 =?us-ascii?Q?r0XX6zSrWB97J6/uELS2/QuUqIZlDco6mOLoLCsDkp64KkRDzOgmNkhmyi4t?=
 =?us-ascii?Q?300iBjP/fOyvJoxGrbZuyxnOjBB0uxzuC+W47ZYAdsfvhMkfrsLgHCMOVTwS?=
 =?us-ascii?Q?VhI/B6gm4Ku+3mEi/CI88Owg57e33rhbpmDy6j/uMBfQqPR7z5T54JnsXaqD?=
 =?us-ascii?Q?sDFCPgC7sNspRHlLedsBYvMhlzvFBABrrmVg9wnHRJhQ+JTGqfMs+SgU0czb?=
 =?us-ascii?Q?QhObcvHWP62xYbg76Y9CcLKk8l8ZdOR9SBK/lz9b?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	f0/d41JbUtTq5nA6ixJdlbh2JyU2W54eyj4BvEOq87025DVkDvD3LWgm0qxzqAOYm9kQFQf2uG98s4U/oG0hrusc7dTJiSQm5Xqt4uGAmrAvxxJIsaPSSGdaGKftzBWVjEdk6zolQJRiCHGKODpqacAbhUf1Yo1bZNlnVV+G2xKm/Sm/koWyy0V1NbPUG7T9mFlkDf/gaARKKKrpqGof2Vymj+xQ46pk6oc4rolSud52qz4nv3hTEjgLUGaJB8RLJvUPS+D1QmO6Ao7dHqI5EoZb2lFnv4jfEfFVOX6yoDgk/9Ar/SAyK8DygiXVZ+5VHetM23N4YKWxRjwVH9d7h/tNUk7ahHhX/BpUdAQxOz++qy46xycIsiWrw0rhBCsf+sYiv5ELkNj4kq7EGmweGSX6A0Db6XD2CPX4afPDtzQlD0y7a6udjaEByv7MygOYNHhDulUd82Um7gBZkTCMnWKUHQrQswdiedw4/KHpd2OcDiFAJHMHhJsgwCXrQPfqFWK17Op65PQB+sfxwJZQOH33E3ZSipVCxuFr5/OzOJlmy9kxNOYYjL3GkIWd4n1SOCYczaxYC6bdkZVySyDdr22rmQvjsawDTWq4tsRBco4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf087cb0-8a27-4c2a-d628-08dd08f516ab
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 23:51:29.8278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KjxLkxT1z3aZ9p2KMv9E1RwZ8TYMXRuFuUljtjMKcKai4YUQwGYfDeLc8iEBXZxbuuivpI6fXqqxPC5S1uNXWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5857
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-19_14,2024-11-18_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411190175
X-Proofpoint-ORIG-GUID: Pu5yg4HLYYDUYUl49ZvYy7t3P-lXAN-Y
X-Proofpoint-GUID: Pu5yg4HLYYDUYUl49ZvYy7t3P-lXAN-Y

From: Eugene Loh <eugene.loh@oracle.com>

Translation of user space addresses requires that we know which process
to use for the translation.  We have been prefacing the address to
translate like this:
        /* Preface the value with the user process tgid. */
        emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
        emit(dlp, BPF_ALU64_IMM(BPF_AND, BPF_REG_0, 0xffffffff));

One problem is that the IMM "and" operation is a no-op.  The 0xffffffff
is promoted to a 64-bit -1, leading to no %r0 bits changing.  Another
problem is that we are pulling out the tgid.  This means that the
translation will fail.  Further, even if the consumer knew which part
of the pid_tgid combination to use for address translation, keys for
aggregations could fail spuriously due to different tgids for the same
process.

Convert to
        /* Preface the value with the user process pid. */
        emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
        emit(dlp, BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));

Also, in the umod test (which uncovered this problem), add ld-*.so to
the list of shared objects we're going to skip.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_cg.c                   | 8 ++++----
 test/unittest/profile-n/tst.umod.sh | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 461a68270..b07aaea3d 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -1647,13 +1647,13 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
 	    kind == DTRACEACT_UADDR) {
 		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, 16, 8, NULL, arg);
 
-		/* preface the value with the user process tgid */
+		/* preface the value with the user process pid */
 		if (dt_regset_xalloc_args(drp) == -1)
 			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
 		dt_regset_xalloc(drp, BPF_REG_0);
 		emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
 		dt_regset_free_args(drp);
-		emit(dlp, BPF_ALU64_IMM(BPF_AND, BPF_REG_0, 0xffffffff));
+		emit(dlp, BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
 		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_9, off, BPF_REG_0));
 		dt_regset_free(drp, BPF_REG_0);
 
@@ -3823,13 +3823,13 @@ empty_args:
 				if (tuplesize < nextoff)
 					emit(dlp,  BPF_ALU64_IMM(BPF_ADD, treg, nextoff - tuplesize));
 
-				/* Preface the value with the user process tgid. */
+				/* Preface the value with the user process pid. */
 				if (dt_regset_xalloc_args(drp) == -1)
 					longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
 				dt_regset_xalloc(drp, BPF_REG_0);
 				emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
 				dt_regset_free_args(drp);
-				emit(dlp, BPF_ALU64_IMM(BPF_AND, BPF_REG_0, 0xffffffff));
+				emit(dlp, BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
 				emit(dlp, BPF_STORE(BPF_DW, treg, 0, BPF_REG_0));
 				dt_regset_free(drp, BPF_REG_0);
 
diff --git a/test/unittest/profile-n/tst.umod.sh b/test/unittest/profile-n/tst.umod.sh
index a5b1127ff..45d2b1e9b 100755
--- a/test/unittest/profile-n/tst.umod.sh
+++ b/test/unittest/profile-n/tst.umod.sh
@@ -53,7 +53,7 @@ if ! grep -wq 'bash' $tmpfile; then
 fi
 
 # Check that modules are unique.  (Exclude shared libraries and unresolved addresses.)
-if gawk '!/^ *lib/ && !/^ *0x/ {print $1}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
+if gawk '!/^ *lib/ && !/^ *ld-.*\.so / && !/^ *0x/ {print $1}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
 	echo ERROR: duplicate umod
 	status=1
 fi
-- 
2.43.5

