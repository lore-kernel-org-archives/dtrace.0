Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1F51C6B7
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466528; cv=fail; b=qACDWGq3AqD6FpuEdyWBDCJetMCalRO2uwCkkB0nb+h+r1zXWIAo+0engm1owyNo8RbjRPBY1M8XlB3vnOHawMZJLtj4keJV3wena8bMhgG2rKPeBmeJY5iAbk7gDmWRchIs7eLvvenjFQ0BvDIAkDuEbinzLJEsozEUYpDi6Z4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466528; c=relaxed/simple;
	bh=gMyQK+T0LxZMrJjkIuoHoAVMqovemf6ymeDGFZrC+2c=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DpqXehhQFft2qmOAnlydMGzRDvu5VYGI+NJ7zIfskd+gbT9nJIeIalWFokgqKQMmByTp+hOx+zd36n90XIVA0rPF9gG881A5zLK+YpvnnziaUyP9ZbvztIvv4ZT7bt8mV/ydxipuvSs8JFihWyLG0gsoNSgK7WXIdO35gWgZVHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QfZ1447i; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EROlZzpF; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QfZ1447i";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EROlZzpF"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMS6H013845
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=hPy+MgmPQ2L7Zn
	v2vIvlZZtFFkh8izMeZDcAumggKOc=; b=QfZ1447ij+I34twsc6wODbtBdi3L5F
	V/wfDbQRFAfeumlqoLWvUjW51aBNIFN4yFpmnBJDJOu/ZKMqvYwxTMinHx3sNhAT
	jx/31+a9b6SkCM0dZj/KBMlkt4joouttGQnIN1MKGhAnyBN8z4sMcfQO7DDDBBOx
	xFVrLLYsmofFhVONpSYuqIbJsTcAyRjveEC8wwM70nwq9WL4ah/xKis6mJtTrxDy
	ubNP6+BUE20BnB0Uw9jNII+czIyX8BWoDUdfm8Z41ALWuKYAzk1dixtXbJrU6w7m
	P0/z1ImnGkinSxEB47bwv1V03OhXLdRtZIF8gDwCAr+TZhiSFzhNp4hA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywnd2n0t4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R4xiRK037089
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:25 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2afd3b-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WEFI3MVOVri0aJfVbWrXk++7jBOdhfjljqqTvdvEIW+gP5Y11kIzeoSeLMgstzSw/Ql0JuQ3Fx7ZZ45XCvU5MQIF5UzgqNN73Rf0jkrawS+BMdnGHPkxWXFQ2XkWncFx7InP+Almmy2EyrwYSVID6zZztAunHIliX4gNIPiLiH0csMIQZN2LSmzO+XJzIEvjbZviBsVpAdmvOTlOXb286eBQzAura/rJayZr2tjeeP8bF+D06xGZRz8Xh0Vir50O8C0+BrJ2hgue2lVVxgsZUlY1FcpdLSfMerz9KnFJQswwqbIUBauU+LCNoeNXucZACe1rhjAYSZJQ97Fs1HJH3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPy+MgmPQ2L7Znv2vIvlZZtFFkh8izMeZDcAumggKOc=;
 b=FeQ1mXABR9Lk9qrINZ2e+VoU6ydo6VR1ocqB/6Mo0pCPOOjDsK3wVeIIknXUYZfEn8FhIxkODIQquiQUZRxcN+vZuT4FKpL5wfaw6maZNg8R/ZRz4Mo8D+HVzsrzi2uAaUiirvbmrl9Qlq9B1D1kJBQjuqHgLoI7+eqkogFQNnf0Fe0Zsq0ihWEGe7oSCkvZUn+UBzgdsMG4ejbhbMC3pRz+1qV7lYGTsU7c6gKqFaczEwT1zIV9rEWI8Com+Oq6DUmo5+zLadphGK9S2nWBnGXKiqzeK3PvSiDlamNeBcUQhKNN7Al8BS/mKi5fIv5j/SnKe3/ZBEfBzX+3kynzuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPy+MgmPQ2L7Znv2vIvlZZtFFkh8izMeZDcAumggKOc=;
 b=EROlZzpFrgVz4UIeynZ1jH7gj72yVXi3Kom87vNWIpztjGsSKmuBeJbrV82DuXhudY7bJXNjFgxAv5joVXQWz6A2+cFagWVqqmhS0A36RtlnbOaq2TtU0hqaFiMmlDG0J47asQElHFIM/RT2EOOzlwJotUO52lja9OrWJ123TqA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BL3PR10MB6041.namprd10.prod.outlook.com (2603:10b6:208:3b1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.33; Thu, 27 Jun
 2024 05:35:22 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:35:22 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 08/38] Fix comment in dt_probe.c
Date: Thu, 27 Jun 2024 01:34:25 -0400
Message-Id: <20240627053455.21567-9-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053455.21567-1-eugene.loh@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::38) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BL3PR10MB6041:EE_
X-MS-Office365-Filtering-Correlation-Id: 1384bb65-439d-4721-b970-08dc966af03e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cKdcNrsesTGKeXMgiSOy8Q3CdtpXpNEl2P47+5IDy6xYM+9SuKoQaPmrft6G?=
 =?us-ascii?Q?JJO5EpFDW2HE4D7Yg0g/Rdjo6QhPTdOc7lj0gV4M5FYpynvnqTeXXn4cXRQb?=
 =?us-ascii?Q?nknIAYEjgT/LtggUFKNb/1dDDfUn528x++luEuvoMKruAfIEQEl3wyMZwtzO?=
 =?us-ascii?Q?s7iy1w0iB4g1wK5DBnJts0jqhvSVn6TyVsujajAK2naPAPGjRssJTkQNh00o?=
 =?us-ascii?Q?SJCEwrvs2O6zu4h2RXzAKs5D671C0wv3AXe90gzB3hv6IbjILaJAaO3HQvz6?=
 =?us-ascii?Q?bM1uInzf7Ow/NxruXk/UDbgAhkZgY84SGZw0H1Dv4cnBh107rxlKfFJKkb4Y?=
 =?us-ascii?Q?sh0e0pXDtKWDLxyF6H+gkHFFNFy76HKv6fJ3eyFBtbqeH5j1hLL/PNG1Ez8d?=
 =?us-ascii?Q?N+TMalmy8wf6PnXsUWs1QTSdLU5Gi6MrrRbSwFbEcUomFTzcHmo2XbmhiBT4?=
 =?us-ascii?Q?9bKgIrRhi6d6/m4SnLIimHk7sntVmvuYqt9gVfM+3nCJW/Ogoc3UNwDOLf+c?=
 =?us-ascii?Q?8Wo1zDs7WuKxXvdrzViVi0COKKZIOkcZS9I378Rk4kH+l56+kawtv1iglN9/?=
 =?us-ascii?Q?DCG0gSSUP2NaLvA+/rX3EggD74M5dL4DSU8LovPlKJAHGITLUV/97/5bR1td?=
 =?us-ascii?Q?o5OBTudlo2RTfgir+BbRAxEHrgHZFv1EXnCCneoeY3xKiAKIWc96UJThMW5d?=
 =?us-ascii?Q?6QQQ2/cQy+l/0gej1thCC1KewmndHLz0BOZupE5isiGWJe7ycam/keuKi0oc?=
 =?us-ascii?Q?9grJ7MfEm4RfzWKbwGcN2hOUIABBY/QIL1i1VlQ3TqvqMJ2mHiTXvnM9p0Ox?=
 =?us-ascii?Q?AhXAXT3oR8BesD+yISZ/ZFZ6P9JHYEjLADJDdQDTWcvd7K+mQnpifX3cd+yo?=
 =?us-ascii?Q?AWRtJK80nfJcYGDWiSUIZ3+5wfQv+PcZ4Zex0iz0dbjVOMXQoxei+j53XijT?=
 =?us-ascii?Q?MsNMLNOYzs2Q/BzRADIC4itsneTFn1DGIgIWZOsoa7m9uPXwEMcRzuUP6uUv?=
 =?us-ascii?Q?3OTrlJ6oSiUVQuqD5jfTs6w11HX3Zq+ZEbAf8FKeIdbj0q7X6HkiYRF9T7m9?=
 =?us-ascii?Q?UBnzq1T3Mj5znbq+lr6kSIexrqQdXMP+bRjgxH8cPPMBVfAOw+nIHBj157Sq?=
 =?us-ascii?Q?rOxNHIRIOYJu75ffi6u+VMFAeJN2vUeToNjmHDwgQAuWSvIALGW/xYq2fIT0?=
 =?us-ascii?Q?2Xu2ghGbVquXzEJTMowj1JqDfSrTCdCioQOBpGSxYK7UXZ6r8ppT9e++L6y8?=
 =?us-ascii?Q?zTE4tCjfV4lJ+1p7UzD09LIqNUvyAwX5bJ/TgsZFyTLa8hiUHR1SrQhsWmfh?=
 =?us-ascii?Q?Qufn96yn+FsuBqMG1GPuTEHe?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9/qTCGjTI4zX5INMvrqukFjhe8hsGx8WZdbZeNog2FHFcsVVREWM55QYNeSN?=
 =?us-ascii?Q?IMvIm46afuibUIHm7sXWKYHbhazNlNbumq9nr7cpxM9yeiihFW1BQhPlyEer?=
 =?us-ascii?Q?1KQZ1qYxVlaOS347c1kXLQnncPKgd/r46WZ5RvEbN6J4sK2PKb5bc7PwPUMD?=
 =?us-ascii?Q?zTiiTv8JbaGz8Zm9aziSuW584aCGGCoZHmIjmND8IfyS9iFuXskLQSQhmMkU?=
 =?us-ascii?Q?KVNIlgp3X8iERGosFSxNrBNIwyVBjREwvAhn41a9kPkbzO2ZdjcqHJCfe+aZ?=
 =?us-ascii?Q?fPrRTV/8INNo7MXuWzHAWpv7xbrj2MWbYg4t4MiGFwrDfSXjtxslDrSW2NRq?=
 =?us-ascii?Q?p8rXJmZ/2UmGlcc7w/9UJ3njf4L/mRuAti69N/R429nR3YcRusxEk0ktOeq1?=
 =?us-ascii?Q?4sNfm0kBw2G+gQtrveUmcCHHmYjpdvL4APUVK3GySJ1VMExKbmgzOXNhpuga?=
 =?us-ascii?Q?zJI1LvtIlna2POIScHRVAWAFWCDimy+e5G7gyGNNT15B0nQrEbQg+Ax9Kju7?=
 =?us-ascii?Q?cq1ZwJxuinnLRelRMm2IZQ8lOsonuhZEgCpJPetVCSurE5ME7Hfk23heMgA/?=
 =?us-ascii?Q?6Ux6yBT4E6Sb02LB1bf64jN1+EGqKHtko4PlNi+qwTLGwZMnrXOKZ+aLMf5Z?=
 =?us-ascii?Q?d05KUY9ueS8es3iBK2LjcgPBwwKorYAnUwWVKN5A6V/3N0sGVJXfjs3t2Axo?=
 =?us-ascii?Q?tvdbPPkCP/TwZIaYc5z4ciTP2Fwix5dGmFPDoVz4Ulr/xIwmNqT/sLyu9iBt?=
 =?us-ascii?Q?3ZWl1ERK+TGL3ik7MqtHkPrScRK/QE9qaOp4909mcNJ/h9hmmKt8u6vbF3OJ?=
 =?us-ascii?Q?zzfK8famZyVUvqvmWYLIdHLsuPQeXxXR+xqYPCgj2icC1h8bnm0aooOPhW9f?=
 =?us-ascii?Q?31UqMXnzZwIT0CQ0eE8PBG59o0ko6O/aX6rqNUwe4c3KWyq0fDYxrK8F9Uo0?=
 =?us-ascii?Q?aWhwsmXfeWtqvpM24iZRNqz1F6oIPlilU6YXhehbr/sPheT8pfFnNKfZF0r3?=
 =?us-ascii?Q?stCvaH+e2/GIeBx8k8KGO+Pd5oBXyDT2u9a3nYd3Ihr7VJF/KIeTI3ROkJhF?=
 =?us-ascii?Q?xlgJ/cN7WwKfQgEW3qRTRbp+1yWSwuB1hz//73ku0pbb967h2Z7c9XTW55Oh?=
 =?us-ascii?Q?CAqDt5OX6sokosGe5lVvdV2RNUsmw2E+sRVWRkSQuQ9550RZOnfTyov341ZK?=
 =?us-ascii?Q?pCMw/nyiZKLI4C//VYR951ycZYmoHGZukPEt9fQPDnKLAUq9N3CcFHFphboR?=
 =?us-ascii?Q?YZSwnzV84JDhaWI/4qDdUA8gHO1nJ7yijlLAHnds4yWp5YHviVufhmz0Zjd5?=
 =?us-ascii?Q?OGiIlgpqnjANmsKPqO/k3fqJhq5XNryF3UiSHS/JFDDZeoGZ6N8Po14TdfW0?=
 =?us-ascii?Q?RZj63mHT45O1XAKf5vYZjHP7Pa8lDF2AAf6YC0KkHit5t/cxUO68JnnxF5dT?=
 =?us-ascii?Q?CaPYmABQjfn084Ft+XipZCea6UgAdAD1YmjhOFBXwELbQeNgzsevdiiIpBBX?=
 =?us-ascii?Q?k/6Uf7Vc2ziDAPJ1Zezq7EKF6v5IHtHb3GsZ+HfZH1M+t+xaQ5ojg7lsxECi?=
 =?us-ascii?Q?/UVjSQ1SsHUjJSNLD97vlIHn/NAFS4cDBdwcqYO1?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	qNXtF59iwsyfUHJYwwqw1Mp+5i/raRPJFqZ5LNo31CqXYkJ0Clws6VgOC9J4JYI9F267W11jdSK6lmcXuidbfsDXe2r68hGfrh/iDGyRei9zptvmo186P+xXBfcJ7rRhc8OrKCNCTcIZcXaaupS+hUn0d1F8dttARpTv+MWMWJkZZvAh3AryS6nAfDsgMIirpYKZVY6V6cXN7mRFCTJxQRF0z2+hVBYdf+S+7KxGG4vEMzDtScFJt4z4RaJlfIq0vc9pO/P8WvIDfYtlIjRrf+9dMBH0u5NKYng+MyVNsqAsATdvRhQameTqfeOnIFl7uOfSby3QiKIt6rjP47tD/s+iqszbfg3jccD455DQKEwaHqcgOgL05A02WwqWaM3mupysH0JtxmZGDQrlNlp4UqBIR5W/10+pPzVtzJEbyKj5mTC5qXh9XIkI/jPcUzSga8WX7ZfVzDcL8BZlj+zDJDtVkjO0Wi0X/OV/hOVwkERhW07NZHr7bJ4k4pmHsfIFHvOX5+qOt4+RnA6MAknPEZgGW2Ck1+vDOxVLZ6J0orFTeLMM6M8hSq1MLtyCe79YR3OY8CR4UbR7xzrwkkQv0xI8p+f4dyRAalceVA7uF5o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1384bb65-439d-4721-b970-08dc966af03e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:35:22.2513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pP/e6wxQPmVPK3acAtlp65qbCMmw0XTxdT1gIC/I8mUTTcu4ReR1jje5FDB0n/pUAWShP/aeAVUFI5oZOOh7tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6041
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270040
X-Proofpoint-ORIG-GUID: xfHuiMWmAURh_mPLsR4_S8jrIXFdX61k
X-Proofpoint-GUID: xfHuiMWmAURh_mPLsR4_S8jrIXFdX61k

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_probe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
index e1099d75..0b53121a 100644
--- a/libdtrace/dt_probe.c
+++ b/libdtrace/dt_probe.c
@@ -838,7 +838,7 @@ dt_probe_lookup(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 		 * To avoid checking multiple times whether an element in the
 		 * probe specification is a glob pattern, we (ab)use the
 		 * desc->id value (unused at this point) to store this
-		 * information a a bitmap.
+		 * information as a bitmap.
 		 */
 		desc = *pdp;
 		desc.id = (p_is_glob << 3) | (m_is_glob << 2) |
-- 
2.18.4

