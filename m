Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45E734A783
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 06:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776148076; cv=fail; b=Ik7Gt/YWJEz/ugUaItl0LNVHZmawdDXBViX4GVfsUNvXtwULYPeiNkZORo+WG5hbBic9QHRt4KBcRgzb+IAiBQISTAP9wdR1Ur0NWxHMLlSKo089DXQmEQgenXhooYOlj+knWWXapbv7kTe1U6yXd7eDsSvdHQ+UTjuacbqv//k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776148076; c=relaxed/simple;
	bh=T50pxoFIEgRjBrsAa+CAgTX/Y/Hy4H53QnSuoCFc7mg=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=G3Jy8PGdBXE2LSfMq9slYunFSWNr3O0VDEAb9rpYbh/xVYkWgtxkIbI1MjbEZMBylfnX6iuQkVtV1AOycy/P8QHLx0JpHjGAHeSDifjbIgiehmvxqTbGROlXoxhOKwQVPSU7rTxqyzgcHiVL6YwTffWS1wVDcBJB+XETasGEc/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jmBUyr2m; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UHUMFjzZ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jmBUyr2m";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UHUMFjzZ"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E1SalO1674022
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 06:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=xXT32/qL87zqDYbUbf3eqHV08KXlBxh2EnQxpTZOGl8=; b=
	jmBUyr2m5Kqt4etZoAMiN04VnDMQOkrKG2QFDq2cz5o1tGssp+9e7aAhKBinQTW3
	gW1FhIoyKRoAAiigkzN3FDS4BGPoSnq6IdjdSjCo4z1ecBRHXBf3VZwEkp5gr3+l
	20FSBDlDZgavoXc1wbdECKTOQjJX5lQK+jW+W4XoM36+O6fL3cZ/F81oYxQgeoCn
	p1tJ2hIhUftFdZ1DwEH4YO3H3Dp4SFb50EavNIb3lH7wpxBfNAELtFcN8zOxhnDw
	XivRPgwZvmouTHMcG96WxABKpr7YTFdK98YEvMs7BDppgjHOYXcXvJE0UpWdUa24
	jpVeRT5VyQ+ld+UkuZw0eA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dh85jgmfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 06:27:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 63E6OP1i000817
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 06:27:52 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011005.outbound.protection.outlook.com [52.101.62.5])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4dh9jnrn3w-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 06:27:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OmlIGnBAuRdpalr1ZhWZLaQOCRqByU5XMb6lDra5TRYf3FN/IW8so1gA+ecv9APGMH+GXLhzacSll8PiUgCvC55vlMlGHCK5MvnF6/n6V2U6NpEV4lLdmwyQoqgUKH4ewKp/ycRCmJIkD+TTOF99viFXZ5HQil/X8VUre+b2Hs+JEQAD+73YBkLxRecE2JiDwGjzVImB1pJLDs7tarQZ5UJl16xRgg9pcCljPSK14P3a66MX0Fq65uM0oYbMNcYThxRiD0f0jZoNVb+YulUDr541AOgyTfD/Oi+subTfcFo+SF6wLOBmb1IoWdSHCRl5Zibzt5FaX1w9/Ol/nCHBnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXT32/qL87zqDYbUbf3eqHV08KXlBxh2EnQxpTZOGl8=;
 b=maDsSfbOveCqIEwEidGvxAnfbBP1yknn8lVnIm8xQ9pU3cSmx0q8xH0A8t/Sv7YzUAf+scpwMtnNDhuLlAoeq3CLAmP+yBLTjL+2EijHzqqAQGIkk7/JHVUw9DV0livFPu2Eqnn5ppGKB1HHbp4zwyVHuqGtvCenSUEY0tbAJGRz81kn9mL1R46Nr5Mbc9FLsq2z0j4iZtxFwAetdDReudsgg5/Z2NO88L6sVlHGiBOS/BZlBKCklgaSOaQzlRRC/KdzFR5idVNrR1ORI0lgv1PwPIoTqvdkLNjdf2JnYw5KS2Xp4obK7CNHMhEFVYnDaOE0LL3vPdI0KVqOFrAojg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXT32/qL87zqDYbUbf3eqHV08KXlBxh2EnQxpTZOGl8=;
 b=UHUMFjzZE0IgDWyunXv02ACZkTFX3rjvo25XHU148ltQaiupUp2qfNuD/EZb4+CENh67qen1Hlhzw72sP5qRvKcFo4aqikMx0guJddrnKwafKVZbXL4uduAADwm5TKvC+RIvSLcBraO/Wl93ZkqJTYOG91HBD4mNfEqHn8vys+E=
Received: from IA0PR10MB7325.namprd10.prod.outlook.com (2603:10b6:208:407::20)
 by SJ2PR10MB7787.namprd10.prod.outlook.com (2603:10b6:a03:56c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 06:27:49 +0000
Received: from IA0PR10MB7325.namprd10.prod.outlook.com
 ([fe80::edc9:d2ca:45c2:b41a]) by IA0PR10MB7325.namprd10.prod.outlook.com
 ([fe80::edc9:d2ca:45c2:b41a%6]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 06:27:49 +0000
Date: Tue, 14 Apr 2026 02:27:48 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 4/4] fbt: do not provide untraceable functins (for fprobes)
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:36e::23) To IA0PR10MB7325.namprd10.prod.outlook.com
 (2603:10b6:208:407::20)
Message-ID:
 <IA0PR10MB7325BFFD3DC90AC2FEFCADD9C2252@IA0PR10MB7325.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR10MB7325:EE_|SJ2PR10MB7787:EE_
X-MS-Office365-Filtering-Correlation-Id: 483548c4-d15f-4c2a-587f-08de99eef32a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	pvt/w1HHUFSRXMZMdnNc3m0Dq4daLdoUlAN1xD8yb3jYZCC4kihdfdjBqpyFXJ5qbckfoC9NtRUIc8E+ajbRDGbkkqq6+Eh1WAV7GZA7sbUOwMQSX4qc5AfJg1/1aD0axAuopzKoShBqy0OaXdxrtRjI1aWPzcqvRD66TqqJN0oRrotH4sNUfSz5FREuWFwGv3ADxiFJRZe0RI5GRVvYwb736ejjemX0zBHMA+KPpF3gZNiKbcVaq2eJvN6L8g41qb36kyXCu++EPCs5sqjAgSqw24rVaoTSn1mTPokNLJI/XSc8BiRxXbasWQorMZrGpwVbII1tfFkWuI76S5SGzqVHbT4IuriIJAI3Gu5VzmR9iL0aK4d+yYNnh5QRg6y23IDclDGw+T5krhjsDzccut6cM9AhJJ5c45m+u3Voe6W3LVfN5ydC9tNgKd6N8p+sFm4618EZ4ezOZSzKI0oO9GS929yG6hsqAScAKrqvJPbn5KXt4t57zGIYXNve7tQcq7C1+09BB257EbcoO5hKPbNNCgwROiHEemp0LRIZucpKy2iJ7pPzMEVEOKXuiex2dl9ZYzLBSvFonY18inSrbRO5x5499U067GF3tLyHvDMJftfcDlrhhNMctiLGPIHM8UQ8lHKJs3g+UiCZepuByrvtlu35PGVvUBo1M0azHuWNJ2cR66Pd5O50/pxlKk5GiGWIYScjZs+FeQp1ZZh32FqAfk3NcKH2WzNWVEDMu4Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR10MB7325.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rLQb8q7nOi2t928eopXA8n0p3uIt+DL8bFUsSAfdPjZ2IUAHP9CFkes7cAEz?=
 =?us-ascii?Q?4ZdT6lukybYSTc8vEL/YJI4ZZWrI0KeYoU95gj3mo50z5/C2QOLuOsITMIuI?=
 =?us-ascii?Q?RQdC5XsuPzjZs2jtu3OUBhUEmpkacATiaq9jJ1YrQMKw/BShUV8HaBtQbS3p?=
 =?us-ascii?Q?mleZcjR50oCEq/SKk77DEoEtL/NLI1cqKCCsrSS0v0H1n8D5jcb/dmzY3ZXs?=
 =?us-ascii?Q?br6/E1bbEj4ABj3KPZbONm9fkgZl1AixplW3vMbbi6XbpKei4s7ZFj+RqczZ?=
 =?us-ascii?Q?21B70W+3Z4icXgLsjZsOpAJUuCLi7iKH+c+3B6guLU4zRQtCvMVZSAvOVPIu?=
 =?us-ascii?Q?KvfnBIDVGTZihGRJMIsCGv6SGLDkJajEUfmqSe1eV4TIzVtDc5ug7CyO9VlK?=
 =?us-ascii?Q?AYYwdb4qFgcZ+7VX/TVpEgHKpnsSrDHZ8rXLy6xn74GKgO+W6qhNsgZH22lX?=
 =?us-ascii?Q?hLoGNOx6oq8XzLLam4JFx9fw3feNWy9VmObkYNojpm72fYUwsinZkzpEQvi8?=
 =?us-ascii?Q?6eUcMuQ4jcMgqVirhiGv8ZYO9mvqAFcO0saBlsfROC6bctUbGWOJC52BlInz?=
 =?us-ascii?Q?tu+wbdRovvQd8JEgg+xq8pPMqnPB8VVtB8cJJVa0zNVgeglA//q+0yDHZGFF?=
 =?us-ascii?Q?7wqyPQDtV0ReJYw/ELWtCDUEv1VcdtmXUWFSMB1wmRhbF2Vn5VSyaCx5AmIo?=
 =?us-ascii?Q?/qhmql7Y/Wumlnbeu6xxhsBtDjI39ZbP8+FIApDg8RXbPhnqXOCKlsnrVJvk?=
 =?us-ascii?Q?pUnxEeqQ07NkvtbTG8rpp6pvfPeP6YtaQz3727hhhU1KgXOCJrHbAVJJ5N6y?=
 =?us-ascii?Q?K75laBy956Yq5yFrvYZkAo0QMLdoxvhCvp+YxNtfo41+LmkciVgxcPXo6YqP?=
 =?us-ascii?Q?sajsNQN4mIB2ESk4FFoGBdFd2s4oXxVnupu2fQD6dm2HlRtIvNXW6UpGBmku?=
 =?us-ascii?Q?1ZSFZCYYDUoErH0zOOMBad6IRRvbOq7UR/yn3dYang7mu9kVoZX1PuTfdyjg?=
 =?us-ascii?Q?xWxx/QvwK4gTIiVYxjg2NJja7RARXLgrvM301pQhLdlSZYOZzcafHelQy6dQ?=
 =?us-ascii?Q?cZe0WEo0qG7EPtCTNzFsyAsb4Aw2xW3DtHOInaYOiAmKy2F+JdEpKljJrm9Q?=
 =?us-ascii?Q?IO32/d/GwrzlTWv7SudWMXN0nFfhIAG/cExqKy+DS8jsPLlKo6K0R4nikLTj?=
 =?us-ascii?Q?l4uA9sbZ3swYmsPkqNenv/G/iHZ1GiSTYbHlZQrdza0gLnbuII0e/V13pq+K?=
 =?us-ascii?Q?ekuLtnUnXhjHFqhX2pI4IKUugw8crLDnxILZZ66DNoStyVfxpBQ50V6+G+5B?=
 =?us-ascii?Q?bAShxvbjqn48FEmGJSVfDd+MJ4OxWN8Ywjw3/g/9twkNlF/Pd5f5WlEXYr8J?=
 =?us-ascii?Q?LoWorwlhBBZilk6J4tkeouE3bVphJharnEmptnY1KBAEuUjXbzQZdvjT1ojz?=
 =?us-ascii?Q?N+ag7oRji8aLB0Sdq3MgdKaaIPkjMUzY44qQeKEvCx7RptsIcp5cRdEmlyg4?=
 =?us-ascii?Q?49HFrnxIHAlqe1Muahjbk95f/SParV0CmLR4i7HT+ehEDpSfL8pN5IjUekn8?=
 =?us-ascii?Q?H5EKguP3RtwwomakHwza+StCQTjGjCDwjorAI3NwUntR/+eBc69JfK188+Oo?=
 =?us-ascii?Q?0342B26/w/M/wGR2Yb6GlRrMzVn9CJAPH16xaba41xzswfbgCT8UOEAITF9s?=
 =?us-ascii?Q?GczrMXnJyoyvvAJpgjeJX/VINE8auumre7xxm7fhyu65vgkk3t9piT68VHVx?=
 =?us-ascii?Q?E35C8qN6FA=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	PbXyZTWV+RhQ5vAem25C78xqKAQmHH/PwnTJgZX915lQZl4jozFRTSyQ4aXG20V41o1YlLD4WHmgcFO3oENqkeNS1sN7WQ0Sl8P3k+PR46T+qV0IeR/sevQu9Nf+Sat5luqiimjh4FlgQPMG/aPWFwj4KMRyswuUY1vZXe3MKcFmYj4p7jmiwUFtNRoTHwzUO5MR7fYdyfPWg4gbJ5mjq0xPRB9/rO4KFBb9sEBmCzjvYgijj7xZsYHccirTotxBvwr84GUNvzTnlxA8BdkfEerG4RzE4oPbQGiTDCL/WXsi74mJNi5ty6z6AYCj3epeYLV/zMypmzmgJ9H8nLb6oA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JHa8pAtYHAXWIYwrtp1BJ4FbV4f24JtUaJ12RJ5Cqzr25H9tpogS9I0VAfDTxL7mXuQZtTtn9QxD027JTEUxkCzwPMzbH1Bfi5/6PvogqyV75Nwxgk7yLWfH39xhWesTOEAMehAc1OQOjC/xiUjKTJWHypaZCXWR3HcI/L3FMv/LyQNFyGDp/svRjkpGExI/Q/0FJo1jNgtN6EIdXdTU6uwFlBJoGNlKqNsA+ofxqlyes8zBQWlPa1oi+7Fu+qrenikUrlgtqO2Q2PEN33cVearWtVwnYVUXkS/ZDSV8VOMWMdYKy3kN9QL32OjgN+kWp/uhyWw8UV501FPpRASnrfmIx9OAua8cnnOxnTAtg4JD8Dq/xUznZeK6IGC3Y54+r3pzO96A2vkTg6SdKPmF3YFlodmU0En97ffWgvg/z6oRKhO5t1+HNcYJA1kOBDtfNO/WLYwqZque4UxXI1whAB9QH2/LBTqMwSqH4ag2riz4cbPueV6Ip6TvmByxXZhF/Kli3LUD7gZqR0bJ1f1hHXxmmj4MnZWQjRwaV9b4IsAzygtTPk8ODvSz6IE6XB9190F3u2hr0MrmcxerUjyJamQ9btMAYtN0J1O7PLKNB0Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 483548c4-d15f-4c2a-587f-08de99eef32a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR10MB7325.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 06:27:49.5109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z0aMCUc2M4UfviuABnNiKpyoJLu75BOCnK9Vym8IIxVHvRL7zbrac9/ke4mVvsWiqc/QdBXGeh8JGX6z9LDgR8BBhlnUX8NnoaWJCQaRUos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7787
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=906 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2604070000 definitions=main-2604140058
X-Proofpoint-ORIG-GUID: DSAvwGU8Owt5Tvccs0O0WXEIDa0o8iSP
X-Proofpoint-GUID: DSAvwGU8Owt5Tvccs0O0WXEIDa0o8iSP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA1OCBTYWx0ZWRfX3+pEKMDSKVuQ
 7AAqiQjDULNpHUCrj3BfiDdEs136S3uAekLwsxMYIFBJ51uO+q0Ox2BlT3eHV7CNrtxW44wYseh
 pRtmNZpkUOrP99S3DRLSU7K+rg2+FpIyworLTv66tRDN1zxH5PIbRETbq+kf8izUF5y9LkSy+TM
 yMqkeNZwEwPnnQt9gqvPftm8l85ETjp+UtWhyUlkLbWlNszbYrGg6gu7OJKyMaxEbXS2VfB0rNE
 3K/sdxBOVA543kpILPDcep0jDSF2xLWUaJkQ2zvW6Yk8ktpgEUKUftbqWFDUc0KKh7C/xSicHAO
 YkFplLbnAMnM/B97AZ7Kw7N+U6IIcNhwb26+cWGe4qOky57WemTnqQs1v8eGb/Vj9etmQCJju9b
 pmbPbzJ+dw0BJdYdlZHi1oVtojLT/7fSTf12yQiWqO+eCP3/z/LH+lEdBElPsICMIDYIhuVpREy
 qo2ICdTU04JSpKTe7ng==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=69ddde69 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x4eqshVgHu-cdnggieHk:22 a=yPCof4ZbAAAA:8 a=ez-uVdGb03LBgEr2iaIA:9

Ensure that we do not provide FBT probes for functions that cannot be
probed using BPF fentry/fexit probes if fprobes are the default.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_fbt.c | 47 ++++++++++++++++++++++++++---------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 59e4583b2..a2f20c9bc 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -86,14 +86,30 @@ static int populate(dtrace_hdl_t *dtp)
 }
 
 /* Create a probe (if it does not exist yet). */
-static int provide_probe(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
+static int provide_probe(dtrace_hdl_t *dtp, dt_module_t *dmp,
+			 dtrace_probedesc_t *pdp)
 {
 	dt_provider_t	*prv = dt_provider_lookup(dtp, pdp->prv);
 
 	if (prv == NULL)
 		return 0;
+	pdp->mod = dmp->dm_name;
 	if (dt_probe_lookup(dtp, pdp) != NULL)
 		return 0;
+
+	/*
+	 * The BPF verifier does not allow fentry/fexit probing of variadic
+	 * functions.
+	 */
+	if (prv->impl->prog_type == BPF_PROG_TYPE_TRACING) {
+		int32_t	btf_id;
+
+		btf_id = dt_btf_lookup_name_kind(dtp, dmp, pdp->fun, BTF_KIND_FUNC);
+		if (btf_id <= 0 ||
+		    !dt_btf_func_is_traceable(dtp, dmp->dm_btf, btf_id))
+			return -1;
+	}
+
 	if (dt_tp_probe_insert(dtp, prv, pdp->prv, pdp->mod, pdp->fun, pdp->prb))
 		return 1;
 
@@ -173,16 +189,15 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 
 			pd.id = DTRACE_IDNONE;
 			pd.prv = pdp->prv;
-			pd.mod = dmp->dm_name;
 			pd.fun = pdp->fun;
 
 			if (prb & FBT_ENTRY) {
 				pd.prb = "entry";
-				n += provide_probe(dtp, &pd);
+				n += provide_probe(dtp, dmp, &pd);
 			}
 			if (prb & FBT_RETURN) {
 				pd.prb = "return";
-				n += provide_probe(dtp, &pd);
+				n += provide_probe(dtp, dmp, &pd);
 			}
 
 			return n;
@@ -190,22 +205,20 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 
 		sym = dt_symbol_by_name(dtp, pdp->fun);
 		while (sym != NULL) {
-			const char	*mod = dt_symbol_module(sym)->dm_name;
-
+			dmp = dt_symbol_module(sym);
 			if (dt_symbol_traceable(sym) &&
-			    dt_gmatch(mod, pdp->mod)) {
+			    dt_gmatch(dmp->dm_name, pdp->mod)) {
 				pd.id = DTRACE_IDNONE;
 				pd.prv = pdp->prv;
-				pd.mod = mod;
 				pd.fun = pdp->fun;
 
 				if (prb & FBT_ENTRY) {
 					pd.prb = "entry";
-					n += provide_probe(dtp, &pd);
+					n += provide_probe(dtp, dmp, &pd);
 				}
 				if (prb & FBT_RETURN) {
 					pd.prb = "return";
-					n += provide_probe(dtp, &pd);
+					n += provide_probe(dtp, dmp, &pd);
 				}
 
 			}
@@ -242,16 +255,15 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 
 		pd.id = DTRACE_IDNONE;
 		pd.prv = pdp->prv;
-		pd.mod = smp->dm_name;
 		pd.fun = fun;
 
 		if (prb & FBT_ENTRY) {
 			pd.prb = "entry";
-			n += provide_probe(dtp, &pd);
+			n += provide_probe(dtp, smp, &pd);
 		}
 		if (prb & FBT_RETURN) {
 			pd.prb = "return";
-			n += provide_probe(dtp, &pd);
+			n += provide_probe(dtp, smp, &pd);
 		}
 	}
 
@@ -323,10 +335,11 @@ static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		 */
 		dmp = dt_module_lookup_by_name(dtp, prp->desc->mod);
 		if (dmp && prp->argc == 2) {
-			int32_t	btf_id = dt_tp_probe_get_id(prp);
-			int	i = dt_btf_func_argc(dtp, dmp->dm_btf, btf_id);
-
-			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_8, i * 8));
+			emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_8));
+			emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
+			emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
+			emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_get_func_ret]));
+			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_SLOT(0)));
 			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
 		}
 	}
-- 
2.53.0

