Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2BF1C5F22
	for <dtrace@lists.linux.dev>; Wed, 11 Dec 2024 07:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733901710; cv=fail; b=PjtSqb7Ta4bQU8sYKOwfjFOPg8Q6dJvDdFOg8VF5dMiuEyVasE/tChZYDXqGnCkWP4NdV4RFIvJ2gvyyYfZQ7WKsLVWa/q+pUPq4W8z9xYuEnIkUE80KH9xlU3kU54GqqU+1nYPRWuuaX1LCOJsFIlr5ERo5BwbE/cMQGWbI5sc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733901710; c=relaxed/simple;
	bh=JA2MaoVoWY0p8Rw/EbnQhe9opYPKVcaKE2WGn5r+MRo=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=GVR3b19vcd2V+NDTVQn8SCOgEH7rjbHNy+kSahDr+AcC+1FMV1urX7sr2j7DsF7UiElHjQSHgWNzma7ARuc0vioOcyanNQmcgQ86E2YIlMRcZ4MywDJ4xYguA65bKGEDdWTV+IY4JxvGL4W3M6QqX6LT8KizGrOuJ+SLk33fsEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kTJtXWv6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hzetLXwa; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kTJtXWv6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hzetLXwa"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB1NMks030951
	for <dtrace@lists.linux.dev>; Wed, 11 Dec 2024 07:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=AhmhVzhzrPD+bs1i6ASrhwjeIBTuSJkzttPJP5Z9FnA=; b=
	kTJtXWv6xhQw7MuuxgGrJkSHnbVo9cB9Vlcl5/kKIXkfHcb1crNrmXZ7OegPmT7I
	MOQG61dg0cKHkxo9wza1Pj02dk8qGbEl/kV1qK6LADGj5HePoLNZ5L8sVEdmcv+n
	n4caY2SBOOyhv5pwrPte67Zyu2mXNfB7LwF35gnr09QfcBKkTXwXhzqZxwHsAEet
	QmmnDaiGXrjrt0QNSDEzRq1K1dxSq8eKqJugqeUYecW9lF3Ecj5y2IVaA8mHiufJ
	hogUaEges3SAqGpOlfrdWpP9wPj5EOCxQgpNHlPGURnVR8dZnKKMJlTdUr3dlHUJ
	Os6/uTbbgHsmmnFs+snjBg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43ddr65yjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 11 Dec 2024 07:21:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB5X25W035550
	for <dtrace@lists.linux.dev>; Wed, 11 Dec 2024 07:21:37 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2042.outbound.protection.outlook.com [104.47.58.42])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43cct9n9w0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 11 Dec 2024 07:21:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sLXQDq6HXiSe08uC2vhBLYBJ3BY3MejeME7kVD9P+5IJjk6LplRHPwhruYThpS2t3mNgj7iK3YnDB7FJ8SgYkeZPYdBhsvC91jTon3iaSSxuqjZH3oCGDghWtBgMtwVVgctOUI6PE/TnA2J6vX9cisnPg6lwZ0cuLVUWvFW4WpRQ1OGK2bx8bX8kWy2gnY9hf4HXtUaoPyhPOZkKRMpogdmoNMckhOqEo4G23qUgGbTmhuGFJFfN5pR9s850b7bSWnQixwOqvhQ1vMVQ1kFyQcMuvvumM8JlRyeZPhqR1YfVnmL8zm8kAV+tN63u7peQw2R/INPW8vKFWPXpuBdBKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhmhVzhzrPD+bs1i6ASrhwjeIBTuSJkzttPJP5Z9FnA=;
 b=ifvRI/kxjToe9YpHV4mh3mPTBXgQOc7sNTVD/3m7DB9XNAUN5XZjO1I2rK7uyMZrxg18cbgTn8k0qN3eZxnRX7Q/fCohHsXEme3IkuFmp4KpZb3DYH6SEk2SD8kLg13xll+9lUw19CV6zF9LgvYUv8jqAMTHJ8kCObrr/K8O9V7mo5bgW5YfpVes1Dono5PlM/SOgQ+25o7qUUqzASnWt33cGzi7I/q8rtoXUq4S6hnJKJf4P8DLPLSThqqI/u+r13zf+q+6SZ0bOabDJ71xnSB7oEhMzPut6dc/dFKxoijXiTYCHM60DydduY1HBCO3kvchACxcEvjn3yONBoyIkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhmhVzhzrPD+bs1i6ASrhwjeIBTuSJkzttPJP5Z9FnA=;
 b=hzetLXwawmYz5pEjbvkwpo4oB7aId0i3bOoRNH4+vviHqB6pz2OX6a7ECm1W5yw7mfbw323261KEt7DcQEyzYt85z3MNZr4ZXqdyAjQLxU0Sba+XgQjdDTJi5Ga0wkbkcRN5vJ3Q98MNYz1JFvBWtbTTrvb4MTtZFXGEyx6owF4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH8PR10MB6552.namprd10.prod.outlook.com (2603:10b6:510:224::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 11 Dec
 2024 07:21:34 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 07:21:33 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Lengthen the delay in USDT defer trigger.
Date: Wed, 11 Dec 2024 02:21:31 -0500
Message-Id: <20241211072131.20602-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0292.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::27) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH8PR10MB6552:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c2dc821-e560-4b6b-1668-08dd19b470cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IvciPMT1iXcXefqUTy+2cAwbtRA0ULKPrfPfBFyx9hil1hSOJwLJHEuFJmiy?=
 =?us-ascii?Q?0cwQr48SNfM7YUrI4/lI2ex3OfLiGIOwK1F8ybVBQthnbpE9GpVd3c1GO3Ot?=
 =?us-ascii?Q?aYSLUZfZZER9cfdYyF7+aF8JQsDnxhpg6heH8bX0EE2QrjUXPBpoj22uZbE6?=
 =?us-ascii?Q?5FsTj9kyTKtynLAXokWT4+dgpiLpOi+2STP8OVt3k8LyHvGLYvPMv/9mUK3O?=
 =?us-ascii?Q?uwY/kQ0hN4McDk3owOx/qrUPZYwT+MxvC6Jqk67saebLWimCrdHFzZF7u7yX?=
 =?us-ascii?Q?4WeREA/O42qPUmwl4Gj3FTvKzU1eIZXc/EammdjbyEC5B+QP8b4vRXYKjadC?=
 =?us-ascii?Q?hy+T2O2UV0I6uZ+3bmA3IkBgPx6kBE7QJyJpIYMZbQqpv2+fJODrWe0IHoc9?=
 =?us-ascii?Q?X80EqJ46hrARaQpnUgJoVkPVLzzyWu6CCy7ux9AuuCSPp8VsbiUi4TorApW9?=
 =?us-ascii?Q?WovnnnSoMkE0JGGnJDGMnG3ZYwcRJV6fD9ka8pI7qMiqu8f/c2eg2+AbEj9I?=
 =?us-ascii?Q?OrAoAqCxdiot8PggktBDv7RaxIqIFIGoCGAcDqnZkzekbeMil742GUzBL8cc?=
 =?us-ascii?Q?lvFFXRLPLMftCEKmG48RttaJF0ZzK+ry1q4fTATSyzdbtQk92k2gpuOMHU3w?=
 =?us-ascii?Q?8+rKGJVo/qxORK1XdwZOI3AsPYRXKyqiYG+lmmV5gBq1F6aRpjUolOOsNW+V?=
 =?us-ascii?Q?39v43WSPfgVvD/T10JmGGPyeJvtWWC329LZwEZWuJI60G8gNj8YAdOMOSiks?=
 =?us-ascii?Q?DvQbOJJ+TLodU9+Hocnh9jj/nvcUK8W0R1q0s0tlN+Udw8PxsVIXwUc7RGAr?=
 =?us-ascii?Q?ooQIHahgbyVvfdX9kgSUO0zWGS98BhlHgD4m8Y+bJq4PtaTIDXAHWaQd24GD?=
 =?us-ascii?Q?i/DaLCmK6O40lUqGRbdISEMcRNlqjqMyEmXiTk7WiCA/EG9gt480hE4M8u7D?=
 =?us-ascii?Q?ZPJkIg7hgxHnKCWx6D/Wyr0xDh8Qw7/mxVCwadPjta4Sn9DezXGR9XMFI2Pu?=
 =?us-ascii?Q?6GvhMKjhJxyTBbI0igwwX/tgjp7wZLw8C3+ZgSeHBjZs7NqyETwZt/r5wIIp?=
 =?us-ascii?Q?t+N2as/0ebQqr0gXVlKteThd7JrGEtonOzjfyDkZxTzW6kZIkguYT9sYlXk+?=
 =?us-ascii?Q?P37Fxn0xChLm9ttU3wz5Syb4wsCPiyKroTZdKTlsPAEY/qTTsF379SDpORJB?=
 =?us-ascii?Q?xaQTYb8seP6z4KvNwc/BGqXTvPure4S4vRQDI7dpumSYbVIw2YG+rkD+THAq?=
 =?us-ascii?Q?OjZhIMSzFayxdnG8nADgLjpM0gkcgKyzgcHW/Pw4ztJvDv/bHYzedXyMW3dH?=
 =?us-ascii?Q?JCxTdi25LnOI+rk+4vmE9npZTniZdAf0k1zH6NHZFmiplg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P7WwYlBx8SNuYIZhD5KPUZ60SVL/J6RWcvNATa84j8dgA85buNEAFlEIc9vj?=
 =?us-ascii?Q?AdPQU9Ieh6+CsiyOQsvNCG6feE8VJK1FUMEl+4ClcrxsFVBMJvr3bFZwMhdz?=
 =?us-ascii?Q?0Aiev6OIZunxSOmvad9q8rMCt+Llwjr5M3vCYBpuosWP8jX17YgoLaJDYXHa?=
 =?us-ascii?Q?lPdBi9h4QHlLWIRFnM8YtZ+e6QYpKtGG7xglla8Owb0zkjebP1aAPGmL6dL6?=
 =?us-ascii?Q?0vIRyQtzgi2T+CJEktR+GYR54e3VWuIoKAud0gXd0/EnH1h94An3XNeU5tqJ?=
 =?us-ascii?Q?UNCfCiKsznmLelyJkUr2P8qaqP/lry/NMY3xbn07kfWcBzQEJiUif3rIHoXI?=
 =?us-ascii?Q?UzzWv+Sq4pgsrKoiBthhPjjQEOo5VU+6oFtdkYhQQhZw9XSsE8cQex3e5K1N?=
 =?us-ascii?Q?uslE9A9uTtLLVDura2x5Fl8f1y0XkksrJOWUIiRxdqXshjJd0eX/aMJ9qUbg?=
 =?us-ascii?Q?elcg/5j3Y9wUadL13fC4NBiGPaPPfKtmjeMjgRRNhtqKDUMgAa7ThS6To4XK?=
 =?us-ascii?Q?XDHZnrRwMmQ0aILfqDQQaLypyv9T3eHfXi6oyU1Nf49mKQkotE2M4oUTOeeS?=
 =?us-ascii?Q?5EOmxusLUbvLe6USmwd3Y8OQNqNgPf8TY5jWm81xvK1GEub+xSSIO+c+sq53?=
 =?us-ascii?Q?4LN6Y/6npXH6p2+jPia3qImGlujIYUeZnaydjRNxxW5QMMKD0Se9K1aiCaAw?=
 =?us-ascii?Q?iSPvViVkcurDKfMa+ZE7E6VOcWrrlWqv0AjdRb5f70/WJAYxrjQ4g5M7ESY8?=
 =?us-ascii?Q?5jO76UarQm98f2Cz42NILIbG48mvc0UyoiFQvsOkOkh4wU3nXk+LHOqPtdYO?=
 =?us-ascii?Q?YhfPGtIBEpgcUh2tUMyp5D8i3j/ydGM+9clFUFwxxjQoccI59C4pkbVvGrZu?=
 =?us-ascii?Q?qTgWVeDazY07FoNW18M0pCcqura8pSD7tGK+/95bLZIoIT85aSBqyUY6QDyh?=
 =?us-ascii?Q?YkiNCckIJtFrgr6BpqMeX3SCSeW3De8Cy2QHXxSQjvvS1GI3u1B0BKhBu95m?=
 =?us-ascii?Q?5hNtBnIwX/OCgUCdLaNH1kb9lLR1HjBqnEzrWXBpGKJNiSXtToNBsrz98Ljh?=
 =?us-ascii?Q?zJtc+eUSrHp6U9q04XuCi79WgX0FN81EOmYgW56zOT66KeErBdX+KToJRe3E?=
 =?us-ascii?Q?H27tBPVOE8ujcbdaTYmR1TTmgPzp2PzNpOI04vG/jsMHW7P2JqmVWKlF/yty?=
 =?us-ascii?Q?WgIKbFrRXtkpv9ZYw5NXo+sz9UlSbGZCUHf6qs2RXHBSFPcs0mBijC4z849o?=
 =?us-ascii?Q?KcnGmHc2mSK42hTueHKczIKKEyxaFRduDGqUIquR1zZUqx1ZQ5afBt8rvGjE?=
 =?us-ascii?Q?DbXelF5LedJgYX598w8ld/KFJ516daY09+aumOe4s18XBSKTusbpU5wiACmX?=
 =?us-ascii?Q?4Ltjhj1RWaqU00bUcXaGC9BdBPmZ6MpVMMqhcQ+02FaQGUy+L4tw81hVIvAi?=
 =?us-ascii?Q?swQ8VHSWDGJRNxv9gpZ41C4vXc6AbiGnXas5VugKzgfuC27Wt9cQwZKFi/oR?=
 =?us-ascii?Q?sSrxW6WrceZgOLWqkEF7ydn3wzOz+aZrvtnfUzoAMR+abCPq/UaN8GygXQku?=
 =?us-ascii?Q?Qvfo4vxk180OWE+JR4d8Si2jT86AAcKXFyS+ZgAH?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0QnTA+bL9wdXGriKyBCPbUoaiyYOMCMnY6XsTdwbZQ0Ubh+PW8Gv+yy6laDtZYveW2ERprrTdkrJLfxCMDQDva9jeMzsPuEiVgGqezMBmX/UQR8vqGUASzM32WV7+EZ5C87+PSJD40bzL3FNtz+VReY9ihlb2nancgkyjZKpxcxuUS4ELXiJmw8X4ImGj/vqPhlsMT6VidK1CMZKqetvb2VczByuNu9OSgT+RqbKD0IEjXIQuSAYxMqWBjAU3UsPl8ddyNFEBc+Hy1zcplI/FkHDAxYkqMc/LL8iqs3RafytHGu270Ab0wO29iAWdLnhlDCU1V2ImddpX6OdpLbqkVTAEm1xPMYwYu2PVgOtwpiJXYA5Y8nn+lwK30hTttFX1hjH4EJ4T3yjFetepLg58myAsaC8LzLRdx+1reyZyJPm5r6A9GFR4yTI7cHGHPwh3H87D4pPQ5wxUoKEbapElTXRagZKLDzLVgQ3CER1GKUCcU27+qVhYOp6DQfuKrPLHC6mkhn9NZ9z4tv/d29n1NM+qpwaFavT5Mzu/b5PeJCMUrO2/nl13fbu3MR7Eh7UBJ4YG8053BH8VtNFNDAY7wtXPeD8ZS3wqKLCCjhyrQo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2dc821-e560-4b6b-1668-08dd19b470cb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 07:21:33.5822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 86amp8j5Ci4hVZG7AS7CpRTKZFwkZy48PU6elOeyT5xsTfhmJNb/j56wpxbrTXpcUqdOcdodfS9lsiOK+9+Ynw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6552
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-11_07,2024-12-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412110054
X-Proofpoint-GUID: _GBshdsZ82KmxGdeJlIfFAhwkBIjqOLo
X-Proofpoint-ORIG-GUID: _GBshdsZ82KmxGdeJlIfFAhwkBIjqOLo

From: Eugene Loh <eugene.loh@oracle.com>

The trigger usdt-tst-defer.c expects that, as soon as probe foo is
enabled, so too are the foo and bar is-enabled probes as well as
the bar probe.  Since they are not turned on absolutely concurrently,
the trigger actually has a microsleep after foo is enabled and
before further activity is resumed.  Nonetheless, there is evidence
in occasional test runs that some events are missed.

Since there are no guarantees how concurrently these probes are
turned on, lengthen the delay.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/triggers/usdt-tst-defer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/test/triggers/usdt-tst-defer.c b/test/triggers/usdt-tst-defer.c
index 2df5401b2..51125de2b 100644
--- a/test/triggers/usdt-tst-defer.c
+++ b/test/triggers/usdt-tst-defer.c
@@ -57,7 +57,7 @@ main(int argc, char **argv)
 	}
 
 	/* wait for probes to get set up */
-	usleep(100000);
+	usleep(500 * 1000);
 
 	/* in phase 2, just loop over probe "bar" a fixed number of times */
 	for (i = 0; i < 10; i++) {
-- 
2.43.5

