Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09469223301
	for <dtrace@lists.linux.dev>; Thu,  1 May 2025 18:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746123783; cv=fail; b=pf7nvr8GDRwjARA7rNRrvcQihYXnXnNwExHXfn21zSwzPCxP/hcz40KYGLNcQAB4jlJoQcjKchC2beqh9ItlJ35JXXKBimabagcN1zkvze30tVDX70SoVD6CYXFxoPYx+w7qgjQcxZyzmcwPJ+LJLdbfPhTg/edCBuQuq6jXI6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746123783; c=relaxed/simple;
	bh=3rupBIMRbaoKUGluhhnwBFmxa6dnadZUR1YCJMz+UoQ=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=tboHAhtwzsPXt5a6dMqToDJcEd65YNi8gmmKPHsFDOobEYuFHwAMPCkuysknPmJiaW4qS9LRy1nGNtETTkGKTPmN6Avm6Fon35J//LWkZPG9ot3+PFXKFOE90aBxLUegvdNjmY8co3bvW5iFPEIBzd1sMVNes2WxuarNS4YS1KQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dtRzDYHd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=i9VcuWAh; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dtRzDYHd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="i9VcuWAh"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541HtsrR019250
	for <dtrace@lists.linux.dev>; Thu, 1 May 2025 18:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=cqSJDBuw6z8FndII6KR6HLo5cQ5Rk/0I3qhOFcStmcU=; b=
	dtRzDYHdy6snQvK+bF6gXQACp/sfEoA7rzblnp+CyDwqE0HsBEx/pgg7BvT8I+bK
	UUCVk4PIRwY1ZvRQt6b0/Df7TAMpZ2XbPuNfyXYvLUo9Hk/j0TGV+W58D5l/DeFZ
	9MtfhLXAM/a0ql9TWhguXnE9Z2zMVk80X01d13WI/YzN3qjqaxvL49RkUKYbU0DS
	Nl9VCg89m7sczMqjZBzzKFdB0aa43uHDbEzlYJtbpHo9MvrcaLRpRb/orieuTnln
	V+QJLSS0guJNS7+xRpid+ViSsALqAGUVmjAnreR4mBFbG3BvaucVuGuLT7EFQ644
	yInqspqniQKFvQjMbUc+WA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6uukmkd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 May 2025 18:23:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 541Grn8W001440
	for <dtrace@lists.linux.dev>; Thu, 1 May 2025 18:22:59 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazlp17012032.outbound.protection.outlook.com [40.93.1.32])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nxcu5ck-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 May 2025 18:22:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8ejqSCCNCffWGxEZai0/5pu8AOebmia2w+2ODJ4494WOblRcHPgnOUAJFWfSpLfRrzYvbt7oQWay7T3q74apgGoTxUK82VpwyIqM9X/TmfJ6rmMfQqo/i2/WeaMHVQdG1YtYmKIH2vSyRCPKOYLvgJtosAqAyqB93jyCbes04AqDMiRLXe/mOelavCJnwiSlp936ki/sLKujcMFGKMqHd20cqlHWN+RNvCI3k0oKloV6ayBwNhKpMobh0WPHHdg3JcRN1MBZUy2NbcFMDSXGincYz3C/VaCsXpERkqN7VIzwd54ufTW2AXjSLIW8KnuAFRZnJpkIpljbe66PNpfew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqSJDBuw6z8FndII6KR6HLo5cQ5Rk/0I3qhOFcStmcU=;
 b=tslnwHaeO8hpLo5/E+NbS9jcSDTBbeb6GZRHuXD1UCWGH/ZCnoH7V1VKpIzR8YaeoPkdMrbxFUokl114u+Sy9eeaxfjDkG4M4jp8YlDhGYjrZzIo2bRRtp7iPzFM3GssUCET14/u8M9DVAoqgnpLP7pitab7RvQ4yVFYJhID026w4Sk0McAePZIxSzCw1juU9qcBQCroFhomQMgMiG0ayKYnRFtTMSherAdOkzBbOLdYUa/aAesRvFZdMsaDkc4WlrM1UVkDb8S33vFKznZQ/iH9QqTtoE7MCc5VG6N5e2nYWPMG9lUDVaqp2Rr7BygTwidwnsQH8U0SJnELi/HFaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqSJDBuw6z8FndII6KR6HLo5cQ5Rk/0I3qhOFcStmcU=;
 b=i9VcuWAhxhpBjaordsYTSmDxCeFRuICrZj29Z6tMf4TAC9mwqAlKFIQc6PnuaaGJgl920uJMjQU4TMasgwcgI1HLk8R5LOUUgC/FU3Fbj7qKskAqRLwARphAQtFTS16bISTk3c2DHcTlkxa8KfVcXXbB+W9ehwhCcVPbVjNXSMI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA3PR10MB8321.namprd10.prod.outlook.com (2603:10b6:208:575::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Thu, 1 May
 2025 18:22:56 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8678.028; Thu, 1 May 2025
 18:22:56 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/3] Cache per-CPU agg map IDs
Date: Thu,  1 May 2025 14:22:50 -0400
Message-Id: <20250501182252.27772-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BLAP220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::25) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA3PR10MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: 8218cabd-5197-46ca-5ab5-08dd88dd3198
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ua9dY5hU1wXtguqj8fLnEmcJR91y4JKRwJ4kmmhVYSiToQe/7FFEQzlpFb4G?=
 =?us-ascii?Q?+LHZ13g7dtiM8Uwfunh4DbjAaJXyEdrgFvpJBzLwSfu+RK7sJsY9NKnZoE5E?=
 =?us-ascii?Q?Jsdqj1I4lhvhVfTUksrtgJ8Vfa8JPQTtqj5MIblbzueZAyViDvxTAD25rGo2?=
 =?us-ascii?Q?SPlRPuUQ708xk5Da6qhcwdEldDR6CvuhQDftauxZh2L3RXVQBuDwMIrXM6aO?=
 =?us-ascii?Q?+bzcy2zGpidpptmobUCP2N5Nw0sJfBHVtJvonF/WSffqmsZnY1FG6rj0WEhQ?=
 =?us-ascii?Q?3D1DXshUTWfCP1rk5Lw3gtW0K8cCmyNU2v1L8qTi3zOIkF0QWETsb01wroog?=
 =?us-ascii?Q?lbgXBMK3MA4gMnibDburjjEY6kEgNlozI9ZCftAxlHmV289fsG9+TUazxL9V?=
 =?us-ascii?Q?BC6cAViQnfwhlQHSQxBxnVUYLv3tjMhjbpE8E74kyXK3iKghIsymexAsZd31?=
 =?us-ascii?Q?MSWJJEX3OKQHyB4Ggl/o4HXMh8/6qxdAJBNoixpOHJCFu9/IWzAMjWyYzOWb?=
 =?us-ascii?Q?14zCffmbHV6PCk4OUfQEQG8aSbFkrS/nISvXo2T+31Xi2bWoDaOu2ZLbkOLG?=
 =?us-ascii?Q?TI2U+PrbQ6Hqk66yNbvqT1a4A503JT1f45KYaVqidQz9NelG9QdWJ46LfsWt?=
 =?us-ascii?Q?uiTv7cCqj2+E0mxLky8Rp+tdDQDHT2StR+8/EVLVjVKzuZphfSTmHPVr6afT?=
 =?us-ascii?Q?B8bLoQatA7m7Sl1GkWO+tWGidcoJpZTm5zHLSR8Ri98mtK26egrMw6HDk6xG?=
 =?us-ascii?Q?UkmU2BGAtVSzo5pkgCSCaySv5SoSJ5XA3JNZ7ZBg69/xx7L1ggcjWdHwjHlv?=
 =?us-ascii?Q?YjqQBvr1RMlZEFuqfzisO6W0s78pD38BTEU+UOUL4zh44+w2z6Alg6cpQxeJ?=
 =?us-ascii?Q?TQ4A2w6hoNxn9230RLoLKaTX3d41OU5nKcvVT5A1DVPDWfLUKo6p/e5iBu18?=
 =?us-ascii?Q?nB3Wn9OnIq3QtR+L3fVrmkC9w+BCkPH/NNN7UTMgBvIjqmJISHvuzPXRtdbg?=
 =?us-ascii?Q?DsTj27c6hLlsi1tAsiFv0kVMTeaoot8RWLp3RGV+At93VgytuKDnlvzmMYUN?=
 =?us-ascii?Q?L+BXhIKH4RBftWiYmqMeWQ/OvfTjvIHzYFUUXLoYd1NDBXJIluOB19fcwNDj?=
 =?us-ascii?Q?JPElntLueeuCJIlnEklWq7/XZA7OjLcqEt05RjJhBAN+UJ1+39vX5YmFJNgS?=
 =?us-ascii?Q?rJQAqhrZTjtCphNg0rKsrhH4/U3MbR7INZ1b4go8Sj9/DRUyBROR9iY/0I9C?=
 =?us-ascii?Q?S9EBJNec5+G/VAZcXi9RP8rB0rQKFkMJkMJSWojPSOLY2fX5ffTjrUCvIX1B?=
 =?us-ascii?Q?QCnKtfh7YwoDuilC58kANdkcGd9cE4e0rubkJ/A0uLMzLWvuk4HorICNRl4n?=
 =?us-ascii?Q?bJVVTogYAgdk3qliu1lC9DQBjj+72yt7Fkc40hMxBRrHMtu8N9i0yXery9ak?=
 =?us-ascii?Q?+nSaYN8Sh7M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jCWwpJdA4kcliwZVlTHI8WOG0tJ9hedWWayxoWCptZ04pjsabaI//H13OfOY?=
 =?us-ascii?Q?06FxDtRCXfTnFhVQi46vDDeC0rV9ro10+NKbjMEDStGwfYl/QOLlWdOF2dDT?=
 =?us-ascii?Q?djpXxSQv/VEBMjTmmFyFmd6F7v2YzVeOyk3ab4aopSYyI1jlYMOsNMPsSJGD?=
 =?us-ascii?Q?wjRckv5DtFh5ntOhOHksMsGVSaihp9pZcY7mZJDfGIPPVnmn+ZDchEVbKwjC?=
 =?us-ascii?Q?ksfspGNYPBGANyZ9dBcurC5iXBCRoMiP2SwAu2vT6OuOgZS9MmeELoqcLWWH?=
 =?us-ascii?Q?hKlZHDZ31M76q+I7YiyX2YmTvdaEplRtjSUP8nqxc7vMdpYNsUSuTEeumawu?=
 =?us-ascii?Q?Ug3l2opl8JWqDqr8eJgcUFEig0GwBdMiJ4RMeNoaF42xLqb1Xt4zDionONIW?=
 =?us-ascii?Q?QdFmgfzVAzTfgkZHNABFnB1gNVyq675MFVFljeXWlN4O1mcVNhj+onW4Q+l9?=
 =?us-ascii?Q?7oCErO5JPGN1nyRzCXOdUuxdD11qs7eotG1VdQ0/lgVmikAFgk/C3iB5KLSE?=
 =?us-ascii?Q?DjMlPqe7zLmDz0cV57mihsUHoXbC4wDj/k4WvCIlNbSXl22Pi7oIH4b4q2tM?=
 =?us-ascii?Q?13M78syBl47lnhcpQ3Gwn7kJNARhn9gQvAyxQCpt9gRWGIH8OQh95uyKf/Ws?=
 =?us-ascii?Q?15gzeRNiQf4GP1YsTliQdXBXtpKCk3lg/uUSZnrOm//RxuHdzyxHhzhHM4K6?=
 =?us-ascii?Q?Wr1gYIigov8IttbgPD8MBK6cIj+te7qyVb4Y4ScjC3nsXMaHmeH1Kjmqaoay?=
 =?us-ascii?Q?LXFUG8Vhx7K7UrT7GvqLpYW8+FaLbFAmu39ahkdTqOAjvvtC1QTuJokM1dzZ?=
 =?us-ascii?Q?QDY06LELqmDCQZEBJ3X7sJXPHqgecloFaFTg8IgnC9p//E+abaqjd8AUSq4z?=
 =?us-ascii?Q?1ba0NxyvE6gzmpjaq+DoW9TwMdONQWInbLJiM02ISzJWBP1ZhGWHeOV6sPA2?=
 =?us-ascii?Q?RZKGoHf+HGuKAep69y4AYNmOZ4oqE7R5/BDyXti/LmLa8JOxEEH7p84ecAL6?=
 =?us-ascii?Q?D6tTTU41pwCI9/BEhII+nvSm4NATHbx8NAS2Z/mrl4IYEpKcgASXhnPTANeO?=
 =?us-ascii?Q?QBDBaOs+rNkH26efMjKVpxr/61ElmM2pJAzS/nbk1xFtAlaqNNh4aOJ/MIEo?=
 =?us-ascii?Q?eP8uHwsdmmBmIVcu1bPPuF+TSXdZi8g2gJkqlnF0A++/RyLxq7uW48f5hTqN?=
 =?us-ascii?Q?AwgkZ4AsoqViUc0QLDn/nMKco1sw1VPaqQgRUAJapn++BwJIfNtmmWl7wWfn?=
 =?us-ascii?Q?wijcaUMeUT4OQoSgWYCgcQDna15iSFOmATOupTHAHRtnG/RM20QieN88hL67?=
 =?us-ascii?Q?A3G/YIerBo3FbtnG4ErdCN1ebxepa9Bu97Zymj5HTVlSBzJxon4XoXatueQ0?=
 =?us-ascii?Q?FkVcZB1DsgHZd1Xj8Lvkbhjuc3RGqHrJMIGNIsR4VaKs/ykijm930sCk998a?=
 =?us-ascii?Q?W35hq/KJC1e7qttK6WVuEwghEqqPO40Glpdg+iWhANOwsn4s/I5RbkpWzWR6?=
 =?us-ascii?Q?OCeBtsg9UjebqAImoxkvybJF+6OFQPTfYfy8p0U/BUKD838hosoVGwAVW+ez?=
 =?us-ascii?Q?IVo+j4wlGsurJ4AT3H+Z7zZVQL+29FfqWH5EmmMc?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PhDeFk2SQaaP8xioYk3/s4fTdYhcDNXOB0gEy2r/H3tDGfEp5hLa098C5dZ6QqoEn+kvLsR3vr33Wff/TH9+FcbjU/uxwcCVGwfBqiuxPIY+6ZfJQd/OxiF1KHz/McwNLivNqJqf68MiSC29AXI8If/50R45r7bSs0ZOgGgjvXolvMKT/QfytZE4PJJHGeEDLAYakA7EulhA45VsJiZj0dmNrfo+9ZwrhwrRUv+LcxfLe6RDj1YEDb9Quqskcp0srswq++n3dEcD5nwv13Mplz/M/N6VLxeklMhkJd0xhR/pgkSbguTtRlTwaXPZyhz55VCJhlbYxc5NuGPyWGR1Y+3pnJIA42tsjRuYTt55gJKsAq2LNIzAhri8hJOKRLM0OIcQ6VXcsXDlofR6K5xVLczQ3YnVu1lWMzUTfLic2B4Jpj3Q9GbOXJTHDqGBroOG8XYonyHmatjxqhxOip5c1wYIz+ujYUNv25KamBJC7fwnqf8i7MuXxD580sTZQ0huFTnlnPXnznc5VTxTe+IiqGfx3Ftp/47qW5fYeIMA0JBEFxwhBOTNkF3iw3dnhy+vKdMcQJiipnt2R2QQUDWlFkQ4afb0QKGImYZD3aaU3rE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8218cabd-5197-46ca-5ab5-08dd88dd3198
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 18:22:55.9946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /dJr/qwX+Cg4rCp0Ifva67OXnv1jOAlkxlmuFeZ8aQDW1lmhHcNTbUJq0n82RMoioKCIgGIgaS03jY4z0chgXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8321
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505010139
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE0MCBTYWx0ZWRfXw/BwZkIK/DGX Tm8jP/F+Wi+T6to3hMS6FslT12GCjSDhWgR9Z6W4IwgDwBWDWAGrqzgaGT1rmDvIp1/mYjrzRiV zCm4Yz/YS8999g1ikgKT5Fg8RO5LgYUUCV4sV2K24QW+ZNi4vdeOcDiw1K09eR17FA8+/7aNlR6
 VejBjisRPEPHyt0bHbNZGxmZQ48dFAO81ETPI31qX4nTa+XwGt0XvbdNWA95lScXcovGr6zF0at BaWEtdHzaYWPeuw+pA5t950OML0oATdWbbQ5gI3/9VH2OXZYv472LlGVT4Ldsd+z2Aogvtp6vLs AEP8/RSl6Ej8W9x03+aMld1Qa+kPdBznQtNdad8bFMnPbYZpuKrSYCZt55fWyU1PIPIzH4maN0z
 seEIckp8E3ROo0xd+HXg1H4wyMZRKWKDZcC0CB7HNQLwe0VTSv2b37ia6whDA4EFzU/pTu54
X-Authority-Analysis: v=2.4 cv=Ve/3PEp9 c=1 sm=1 tr=0 ts=6813bc04 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=X0gCqtZUwW0la6ck9WoA:9 cc=ntf awl=host:13129
X-Proofpoint-ORIG-GUID: pm5hQkszCUNlUhCtI9DidHPyxj8buUvQ
X-Proofpoint-GUID: pm5hQkszCUNlUhCtI9DidHPyxj8buUvQ

From: Eugene Loh <eugene.loh@oracle.com>

The dt_bpf_map_lookup_fd(dtp->dt_aggmap_fd, &cpu) call that is used to
snap or truncate aggregations takes a few milliseconds, which seems all
right.  For large systems (e.g., 100 CPUs) and many truncations (e.g.,
tst.trunc.d, etc.), however, a trunc() might end up costing a minute on
the consumer side, which is unreasonable and causes such tests to time
out.  The run time is due almost exclusively to looking up the per-CPU
agg map ID.

Cache the per-CPU agg map IDs.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_aggregate.c | 5 ++---
 libdtrace/dt_bpf.c       | 6 ++++++
 libdtrace/dt_impl.h      | 1 +
 libdtrace/dt_open.c      | 1 +
 4 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/libdtrace/dt_aggregate.c b/libdtrace/dt_aggregate.c
index 9e47fcab7..86f9d4d5b 100644
--- a/libdtrace/dt_aggregate.c
+++ b/libdtrace/dt_aggregate.c
@@ -800,7 +800,7 @@ dtrace_aggregate_snap(dtrace_hdl_t *dtp)
 
 	for (i = 0; i < dtp->dt_conf.num_online_cpus; i++) {
 		int	cpu = dtp->dt_conf.cpus[i].cpu_id;
-		int	fd = dt_bpf_map_lookup_fd(dtp->dt_aggmap_fd, &cpu);
+		int	fd = dt_bpf_map_get_fd_by_id(dtp->dt_aggmap_ids[i]);
 
 		if (fd < 0)
 			return DTRACE_WORKSTATUS_ERROR;
@@ -1232,8 +1232,7 @@ dt_aggwalk_remove(dtrace_hdl_t *dtp, dt_ahashent_t *h)
 	memcpy(key, agd->dtada_key, agd->dtada_desc->dtagd_ksize);
 
 	for (i = 0; i < ncpus; i++) {
-		int	cpu = dtp->dt_conf.cpus[i].cpu_id;
-		int	fd = dt_bpf_map_lookup_fd(dtp->dt_aggmap_fd, &cpu);
+		int	fd = dt_bpf_map_get_fd_by_id(dtp->dt_aggmap_ids[i]);
 
 		if (fd < 0)
 			return DTRACE_WORKSTATUS_ERROR;
diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index d6722cbd1..635780738 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -689,6 +689,10 @@ gmap_create_aggs(dtrace_hdl_t *dtp)
 	if (dtp->dt_aggmap_fd == -1)
 		return -1;
 
+	dtp->dt_aggmap_ids = dt_calloc(dtp, dtp->dt_conf.num_online_cpus, sizeof(int));
+	if (dtp->dt_aggmap_ids == NULL)
+		return dt_set_errno(dtp, EDT_NOMEM);
+
 	for (i = 0; i < dtp->dt_conf.num_online_cpus; i++) {
 		int	cpu = dtp->dt_conf.cpus[i].cpu_id;
 		char	name[16];
@@ -702,6 +706,8 @@ gmap_create_aggs(dtrace_hdl_t *dtp)
 			return map_create_error(dtp, name, errno);
 
 		dt_bpf_map_update(dtp->dt_aggmap_fd, &cpu, &fd);
+		if (dt_bpf_map_lookup(dtp->dt_aggmap_fd, &cpu, &dtp->dt_aggmap_ids[i]) < 0)
+			return -1;
 	}
 
 	/* Create the agg generation value array. */
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 68fb8ec53..1033154d9 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -388,6 +388,7 @@ struct dtrace_hdl {
 	int dt_proc_fd;		/* file descriptor for proc eventfd */
 	int dt_stmap_fd;	/* file descriptor for the 'state' BPF map */
 	int dt_aggmap_fd;	/* file descriptor for the 'aggs' BPF map */
+	int *dt_aggmap_ids;	/* ids for the 'aggN' BPF maps */
 	int dt_genmap_fd;	/* file descriptor for the 'agggen' BPF map */
 	int dt_cpumap_fd;	/* file descriptor for the 'cpuinfo' BPF map */
 	int dt_usdt_pridsmap_fd; /* file descriptor for the 'usdt_prids' BPF map */
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 71ee21467..7da4c82cc 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -1233,6 +1233,7 @@ dtrace_close(dtrace_hdl_t *dtp)
 	dt_probe_detach_all(dtp);
 
 	dt_free(dtp, dtp->dt_conf.cpus);
+	dt_free(dtp, dtp->dt_aggmap_ids);
 
 	if (dtp->dt_procs != NULL)
 		dt_proc_hash_destroy(dtp);
-- 
2.43.5

