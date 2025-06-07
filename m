Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E2D258CCE
	for <dtrace@lists.linux.dev>; Sat,  7 Jun 2025 06:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749276907; cv=fail; b=ThMjFmoS49590wns558o9/uFAL7pmWAIEWTEWh3FNNvhnBSpZ7QowKju3wAJhmsycoJ1cKBc/bOC6MWETZeW78agIWyGBBouH+GpMxZIoXshvL8dcCzpdUb6op7eXIvo5EZUCl9krF1NiQDPoy5hrv8YLQBe4AQL+I89UU2V3bs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749276907; c=relaxed/simple;
	bh=YQiNNxnW/pUdVe4NjHJxpWEV+wtkzQcF4gQ4knGCkqQ=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=YV0OLEOFeQj2pm0cp39cWPvri0Btttg/OXfDPp/EK+PgV5JQ8RFjj1cj/6BtHcY47lTycxPcoI+YotgBjgU0QheEQYq5n/mGPEbWZ3rVYwJhR6/pU7rHedU6cEkdCL8UYOjNrvLM2T8glDC2GGM9AmW6Wgv0S9yiDaGYjMZWJks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=U3kgjoP7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JxqSNiTV; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="U3kgjoP7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JxqSNiTV"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5574ibdM013604
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=XJgZauRHTUmxHxG9TC86WyLQwoj/yqlbKY7u8Aj37pg=; b=
	U3kgjoP797ZFCuJA9D14ewHRm0NGucDaBh2flwAR0lEq81rjidLF8+8ID14arrs7
	uedANttQr6w+Bfc1lS3cDJt8lZDjhQc0VyFVZUYxGLUasg2aURrtQo7EBTOCBR55
	O4vu5WhLd1A6fivk3AQd1FxpIY9vG2W5fcUdlnkMkDAZBsBgHHp1YEHErmZD7bMA
	Ld5TPsaeb04EUFeYis7Y8OiUb6fKF/y4OjdfLBfpwpqq6Zez15W0Xi5IPVIZfrpq
	NNwgSpZINUR661bw7K9Pys83bPi+MNy6Ar0SHO/KnHeApW+JFW6IRkJrFKrZV8jT
	1Ma175iWDdKRAPfyiaADhg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dad025f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5571Y5pE020395
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:03 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012017.outbound.protection.outlook.com [40.93.195.17])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvc404e-11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ajeYLCDXG6LmkpWl6FC/TeAFy8B0xVn48WScN7p6Dr+3/eZR8WeLtpG2LJfRiFD6bY+8GtjuCSPa2ihg7a1tBV8/qyY7/cyaBnxzqXhoIcg9Qo9jbO+uqVjpnRYvDpWptDn6PuwJE3pfBfUzMjlpto8jMWQhuNvaC4bia56OvdUTFrrTC48/7FLIX8NR6R6u44SilGTOVW8S8W7bFGPKK3b7rdaJqHFjhefWjsVsByvgiOrsJFcSx7Ty9ivCFaBUFAGuTbrVZ259Yzi4QohxrWuJkokgP6prQUfNMeO1dMGjL7aKibqhQqnt36h6zM5IfNhzZBwUz+Z4aLy96lGWFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJgZauRHTUmxHxG9TC86WyLQwoj/yqlbKY7u8Aj37pg=;
 b=GeifZq0L9hH9y1AbePXGlixq+y1VXXXLcNAs9SMtYzgRLBnn8qMXzLSg7WxNu5irdUH0GMBJAesua4YvkVviQ1q2LiHC0AYyYFtNwOnAh+eJ2PcXioUgKtivkOqRcdoBmmyb278LiDvRYqg9RsA68uRYAjpENujRC3i09LModtQ8UVmJRO5hIEvJyttmdX2uqP2nZmo+kMDRHjxS2BO9X/mVLRtNoYMvUmmzF333W8hOBkxwnp8/EhW33Rab9m7BRbwp+TG5MpNbVilbiVv8LMmum/oGRtT1by/0puj3OZFQ7oKFUvn0dxVotUvdAxgXJ/i7EXKuW9MzPRu4T4YFrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJgZauRHTUmxHxG9TC86WyLQwoj/yqlbKY7u8Aj37pg=;
 b=JxqSNiTVBpnz1r1FnjOcW1cJchydENJcHiUjcbsc2F5Q+iOIP8CT2BRjKJ9/uMPfl8VxPDL9ObdXL3Njnrqqh02WscPT+H+J2TVQviwBwl8b2KcppLvLzWc7lf71iYYA0iaUx4znhD7LlIJ8mywAkTKGdLSQyqvLqhLbUpNJzws=
Received: from IA4PR10MB8374.namprd10.prod.outlook.com (2603:10b6:208:55c::22)
 by IA4PR10MB8636.namprd10.prod.outlook.com (2603:10b6:208:568::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Sat, 7 Jun
 2025 06:15:00 +0000
Received: from IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab]) by IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab%5]) with mapi id 15.20.8813.020; Sat, 7 Jun 2025
 06:15:00 +0000
Date: Sat, 07 Jun 2025 02:14:59 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 06/17] dof_parser: restructure the dof_copyin*() code
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:208:36e::20) To IA4PR10MB8374.namprd10.prod.outlook.com
 (2603:10b6:208:55c::22)
Message-ID:
 <IA4PR10MB83746CD260A0400A66CF401EC269A@IA4PR10MB8374.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR10MB8374:EE_|IA4PR10MB8636:EE_
X-MS-Office365-Filtering-Correlation-Id: 39d79766-ad83-40dd-0e72-08dda58aa244
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4F+6dTc/M5snY0NDhSeky05AMzeMC+MQwNCTVN5dHz4AlTjQI61ehXvGBxsv?=
 =?us-ascii?Q?D19yyG3nKd7aV039RzSCQiWNTtVR3k1kqfPUoXwUOB7HnMFBW4kPmOQzi4zg?=
 =?us-ascii?Q?ifhAVnUl6VLIAg0asYOO8GLGxeSh1wkfnMgwtwW8fGFSkEU5d3tYpiw1ax/0?=
 =?us-ascii?Q?IRXhuPnRwnbb8M6mxA2jV5JCMe/a1oHfiXm61CoJJuyrYCg4xIvu1e/HK5Aj?=
 =?us-ascii?Q?ECBGffxr1dsY0M3hJ0sRu8zHp4ryW013PsVK2iEBsuYu7Q9Iu588cSyD0WDL?=
 =?us-ascii?Q?E1Tr75cDZH8Nyy1wnGD+L0rFN0ItLc+P51NCDxL5efmlpqRG6OWlPqpHNSaB?=
 =?us-ascii?Q?VF3oppYvwN098GieKAvIL7byXQ4NIN6uVnhFgZ4qLhfsZAO2N4iBhbweQW4A?=
 =?us-ascii?Q?s+dZKZqEgEUq+PjgO6AUwXMjRJmCcWfJ1yAqkhRZPvvKp2nxfrA4Qbn2u4sa?=
 =?us-ascii?Q?EzMpa4w3f6FGa8wx3BVnYNMNTgfMi3Rk3UimLdA1M0JHSHnUv3q0VSIuVtCU?=
 =?us-ascii?Q?jWCv1WSD3mhoqieyaYCw2X6L4FMxrTQgxnEp0NIz9BcGRpI9lqUFX+fpJJr0?=
 =?us-ascii?Q?qx8e7moWEYRmKIj+4Ga04j6t7IzX+DzjTtuTCVasF9TKyHFR1YF7oonWBstQ?=
 =?us-ascii?Q?sXdbxjYmg53fIiMHYzQizCVQ/SPDerh8UpBUggtCN0mwTJXxjz0aCt6MUOmL?=
 =?us-ascii?Q?wxvslZWJyDFFQBfXCCmjyOpkIPhMTstmj5QQcGKar6NR36llJa7mAfCaLBLw?=
 =?us-ascii?Q?7GGXe03xesnBNiVR88qKHo2qaNuSZOaHDpf2iBgAxr+/PhO7jr0CM/w+qKVT?=
 =?us-ascii?Q?/Wg9e9/7GKuBOuiOX2L5RxmLnLTY8SLvzbHo6SOv6Jk8Ly76m00GRwQNn+If?=
 =?us-ascii?Q?KvINObGAYJCuTLv4gMvzs+77gk/XiHePcpTwTGe0r3VaZIVc9WXOLiJEFgg5?=
 =?us-ascii?Q?fTJTppn+FFOkDpVL6FUXup8TmiI+VTfDZ8LCJ74929uOjGLwChZPdzxj136K?=
 =?us-ascii?Q?y9kHqEYeoAAc8CrDPucXIpXoVaHidan8wLQ7DlDupquOVaO31EeTo7h97iIg?=
 =?us-ascii?Q?fhXOf2OK9nKStlMIKxzRq0c/PcJjFMiMSerU6/SiLxUsEBUKAMZdAoVtJpE7?=
 =?us-ascii?Q?GrB5ar+9RGVRAsSNPHVyVvrsYCFFMzkf5tX6ckTdRJ2KWkSS6WV8EE/S641k?=
 =?us-ascii?Q?MBejgdNNlkvfD1qPLkoI2TJUZiB16dFKlCPOPwAj6EsREeh8OY9LcA8KtfaA?=
 =?us-ascii?Q?mW8r7//2c9BfBw+qkU1vFg1lWmvajlwY6d4kUuir95xWt7VhKDErVFFfSsEA?=
 =?us-ascii?Q?32/rP658a83YSbOwbsqqENPNxV1J/Rzu/Hi8q8SeLbTrJdOpysI6x/euXVwa?=
 =?us-ascii?Q?vw2qax/vbj5aZvmrz1gkKJSjZgZ9kY10sLavOYwC6p/aLS/e3wdAAsNzM/hX?=
 =?us-ascii?Q?KkmClHPlwXI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR10MB8374.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MLgilI2tahVfEpuDiZyBmeZPop7kThVuoAfBYUreZW56kVj4zcbgs6tkj8xb?=
 =?us-ascii?Q?YZd51DmagB0FoJcHQSRyWGDwI7clQJljOT7VdKUqyPlzujV292MmCdzkH2Em?=
 =?us-ascii?Q?pphV0Bg6D7m6tYuUpjzSv91lQKksVlcNp/bJ21bXlTw8YmbGa5KFC1DI7pGk?=
 =?us-ascii?Q?urym9eITP/8guEzNltrOPKByok84nvdObJAEajOmp6RgyIVAMzBf/Up4U7qr?=
 =?us-ascii?Q?vhTYY+MpdecAUgIlh++lGW/kMCOA52OUCNL/pb7dMs9vuisRLTwbANsSZt5t?=
 =?us-ascii?Q?DOazNa54UpW+urns6Sn6UqqZrgXc4mLPEx1fu1Cz4vGAhgBaMkSi2vbRnksh?=
 =?us-ascii?Q?VQyEvnq5tnVSl3Gb8GFSo1BK12kQILUlRZrQ/y4d/u0EqpBTlKtRxPdKdodR?=
 =?us-ascii?Q?nYVz2C4b4zeubAFlcxC5BMFyK5Ihurq2secScZ6c+zTPeoUC3+B3oLMETpyB?=
 =?us-ascii?Q?jYKiymMYNFWZ9XcKryxpeTtV/E+564z1yX7fTA+tqUU6mnsx/85ZOhReupjA?=
 =?us-ascii?Q?666Lb8VQnJgrH+z41BxuCchFI+sgAqKp/XUO0qR7nvSmm2qa1rgxfSZdHPiy?=
 =?us-ascii?Q?42GrqzAENxXS7Nfzmx1RL0AXLC+jMcZip1oAv4KjgXNrfkFC2d8QMbqJmsd2?=
 =?us-ascii?Q?VBkKlAvxWqoFd4njVoAHN1jpbVcOkI9fT+ndY52R/ynSUOV1tWtOMqFyPo9D?=
 =?us-ascii?Q?2UwKaTw2FLEN9kQav1eWleA/hIqahBLI+Na28KETGm6mvTPjRctxvLGYxYUB?=
 =?us-ascii?Q?y7AO11cz+y0JHfnrQgRApEuz14RZj9w6HLvv+Jjt2yDjpHDGDR1QdE3R3zPB?=
 =?us-ascii?Q?scw9v6nB07BKK35Eg+Ks7SiLDKvwSSy8jU0doqcSlWjs1gtuwLAhHXl4b9lH?=
 =?us-ascii?Q?Mp+XpZIoKxIOMGnhp7ks+s9xpNXj/ZTVDabT+e0dipTEZHddwf/QoQV3Thtr?=
 =?us-ascii?Q?7NmwJcoszW/tviLAyg+bZDbNS3yJCIFp4uvp+GhYtcLLD6+juSRVbuG4dKJW?=
 =?us-ascii?Q?ReIY67dFDKnVsMru34Q5Gmunjvew1LOqGvk06jKL0eXajrhGLJZDUcYmUuMX?=
 =?us-ascii?Q?gPXanpXK7giyTlMcFznwfQKJh05OtGJrARLcyY5jitjEUm1NVlho333CkzW+?=
 =?us-ascii?Q?/7qyK4b4RjTQ8jQytihbNy/9JWYiLurOTiNeqEWkm1Rwy+a4PDkuytEBIeep?=
 =?us-ascii?Q?5QK6kQkUWq84leK9GrSz0De+QuRXRlNADjBq+OadvnJ+DCFCv1dT6fqAeh3y?=
 =?us-ascii?Q?KvXejl3tunq0KA8i7oSfen7f7XUIPtJf+Jl0Mc/YvtvNx7Ma2CDNAq1T0ZaK?=
 =?us-ascii?Q?lK4Tgy6DwTowoFMZeF85enngq3tcsmU19NfpswUpgWZbWvup8s61qORxBjKY?=
 =?us-ascii?Q?ZbRv58fQRtZUzK0G9RGlI3lRtiCM9vzrOqNUg4uKt85fecDo5qU6J2aTKilY?=
 =?us-ascii?Q?NvhleX5qspiVwjPGYJRmEguUMm18dJLQI4OnyVIMW2S/pzYTTcDDzMP9NNKB?=
 =?us-ascii?Q?4xAjMtsH9TGQaYePVoQn8A+iA3ciLzNZYiJXQ+VzX6qGKSwFxfkl3FNtxEm8?=
 =?us-ascii?Q?04JZzxp40kpz4u2ppnBBb47OM2jDpWFvqR5zOOmLrg3rBJqRKZBqsiq2AJQw?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OVI4eucYEi57wA/JYHcJ05xkpYRJ1I8uZIpa96U45YQGV33ebiZpCY9L/cb+4oJXbRcxbWQsdINIXTXKVVPO6oIfN5MjVs8zA4lS7VTLt2lxzI2e/7ozhym342PFPguwGBzWsTygcuq6FNnbj51W2uJaO3seYxNRbH9ngBNw9KQBFFTclwGfHc0gcZnaXXXue4qhqLvCKGkEtqiXNfAPFIVPAxRK5GEfrZQ2f22PbAQ918Zjnmp+KhJdM1hUHhDcvebIKL2PDnjBjUFfCpE9aVjCBlCCjbd4gaBtKLeqVuCd1+tWx2lb1rNPdRfXu4TbebAnGguT2D2hmACmMBQ3uOw+pZSuILmUyAgVdwnIGvuaje83Oe0Pg3nYFvnI4hoKxZ7UqDtQbvuUgtXs3RCRVEzvTQWvWz1/uh2zMaCVrH0R+xKshJFL9heQdi4rtncPMYN1csBiwu6wxUz8PDx6oLKgqAwQdwqGPNPqI6B8A7yFKMp+1BhoEqLzMRAelfVcw1w7klLJC9IP/OwKqDpz/RFL3hJ4a8Etq2pegMbX+SagFaWyfBwAhVSX+N2mX7AJFv2q1Xj8/kgqICOppoP2JflO/wownR+AWWWQe4p8dGY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39d79766-ad83-40dd-0e72-08dda58aa244
X-MS-Exchange-CrossTenant-AuthSource: IA4PR10MB8374.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 06:15:00.3718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0qFgdNdYkLzdNBP3m0xZEMGobcnJKYAv6N2sCDbpvhTMtK9ReriFuA51EFMb/aseqy9El64goqvYU5B0hCn84XCgQguUexaXqH1zDdDIJhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8636
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070044
X-Proofpoint-ORIG-GUID: TjeUK9Il9OvOoSXD_ubs2glyJoJptKxl
X-Authority-Analysis: v=2.4 cv=EJwG00ZC c=1 sm=1 tr=0 ts=6843d8e8 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=758q3k7yciHrMhNOdH0A:9 cc=ntf awl=host:13207
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA0NCBTYWx0ZWRfX6MHc5F/utLI9 vbKLBdMRRqLr9c8i3XkT2FY/8/R+eeOx4ZMS18Xp7Ti6RT76iDFOiRYZcZR2d4y5KW5Lw5jTlj7 J6o2Ps6OyQ6QxAefWWo3+uuK7LPByQxnUTKiqqBaBnz7qejfpslUo+DGIVfoQ25qz2CRgB1xqdn
 ibxqAYmgUbdP1fB9pGBmESdFnOea1paqg/wO3uQgT9PLNkXiiD/SVlm1Ev8qSXy2QG8KiJmsQLG hyVrjoGd8IiKSsUYDEVUp2sojuR3kl3tzvGwN1Bvr5xGC/06yjL9/tSlTej4e3bJi6C+Qv5IWp9 gRiOEnQFvtIyoUijJkJAvulGWSLIf1OyjgiSQODr0cT5EmVTL7FFk74ojWTWBX+tLxgIrieeX5T
 mNQr8lwRYDMJLEkMan9YYlHlhPOZp/YE8HE4fhJ8r2qgKvK6QvbW/0W8Mr9Z6n78HzszS27X
X-Proofpoint-GUID: TjeUK9Il9OvOoSXD_ubs2glyJoJptKxl

All logic for reading data from the DOF parser pipe is now consolidated
in dof_copyin().

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
---
 dtprobed/dtprobed.c    |   6 +--
 libcommon/dof_parser.c | 115 ++++++++++++++++-------------------------
 libcommon/dof_parser.h |   4 +-
 3 files changed, 49 insertions(+), 76 deletions(-)

diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index 5f260f0a..a9944894 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -302,7 +302,7 @@ cleanup_userdata(void)
 }
 
 /*
- * Parse a piece of DOF.  Return 0 iff the pipe has closed and no more parsing
+ * Parse a piece of DOF.  Return 0 iff the pipe has closed or no more parsing
  * is possible.
  */
 static int
@@ -312,9 +312,9 @@ parse_dof(int in, int out)
 	dof_helper_t *dh;
 	dof_hdr_t *dof;
 
-	dh = dof_copyin_helper(in, out, &ok);
+	dh = dof_copyin_helper(in);
 	if (!dh)
-		return ok;
+		return 0;
 
 	dof = dof_copyin_dof(in, out, &ok);
 	if (!dof) {
diff --git a/libcommon/dof_parser.c b/libcommon/dof_parser.c
index 58bbd604..ec80cee8 100644
--- a/libcommon/dof_parser.c
+++ b/libcommon/dof_parser.c
@@ -83,22 +83,24 @@ static void dof_error(int out, int err_no, const char *fmt, ...)
 	free(msg);
 }
 
-dof_helper_t *
-dof_copyin_helper(int in, int out, int *ok)
+static char *
+dof_copyin(int in, char *buf_, size_t sz)
 {
-	dof_helper_t *dh;
+	char *buf = buf_;
 	size_t i;
 
-	dh = malloc(sizeof(dof_helper_t));
-	if (!dh)
-		abort();
+	if (!buf) {
+		buf = malloc(sz);
+		if (!buf)
+			abort();
+	}
 
-	memset(dh, 0, sizeof(dof_helper_t));
+	memset(buf, 0, sz);
 
-	for (i = 0; i < sizeof(dof_helper_t);) {
+	for (i = 0; i < sz; ) {
 		size_t ret;
 
-		ret = read(in, ((char *) dh) + i, sizeof(dof_helper_t) - i);
+		ret = read(in, buf + i, sz - i);
 
 		if (ret < 0) {
 			switch (errno) {
@@ -119,89 +121,60 @@ dof_copyin_helper(int in, int out, int *ok)
 		i += ret;
 	}
 
-	*ok = 1;
-	return dh;
+	return buf;
 
 err:
-	*ok = 0;
-	free(dh);
+	if (!buf_)
+		free(buf);
 	return NULL;
 }
 
+dof_helper_t *
+dof_copyin_helper(int in)
+{
+	return (dof_helper_t *)dof_copyin(in, NULL, sizeof(dof_helper_t));
+}
+
 dof_hdr_t *
 dof_copyin_dof(int in, int out, int *ok)
 {
 	dof_hdr_t *dof;
-	size_t i, sz;
 
 	*ok = 1;
 
-	/*
-	 * First get the header, which gives the size of everything else.
-	 */
-	dof = malloc(sizeof(dof_hdr_t));
+	/* First get the header, which gives the size of everything else. */
+	dof = (dof_hdr_t *)dof_copyin(in, NULL, sizeof(dof_hdr_t));
 	if (!dof)
 		abort();
 
-	memset(dof, 0, sizeof(dof_hdr_t));
-
-	for (i = 0, sz = sizeof(dof_hdr_t); i < sz;) {
-		size_t ret;
-
-		ret = read(in, ((char *) dof) + i, sz - i);
-
-		if (ret < 0) {
-			switch (errno) {
-			case EINTR:
-				continue;
-			default:
-				goto err;
-			}
-		}
-
-		/*
-		 * EOF: parsing done, process shutting down or message
-		 * truncated.  Fail, in any case.
-		 */
-		if (ret == 0)
-			goto err;
-
-		/* Allocate more room if needed for the reply.  */
-		if (i < sizeof(dof_hdr_t) &&
-		    i + ret >= sizeof(dof_hdr_t)) {
-			dof_hdr_t *new_dof;
-
-			if (dof->dofh_loadsz >= dof_maxsize) {
-				dof_error(out, E2BIG, "load size %zi exceeds maximum %zi",
-					  dof->dofh_loadsz, dof_maxsize);
-				return NULL;
-			}
-
-			if (dof->dofh_loadsz < sizeof(dof_hdr_t)) {
-				dof_error(out, EINVAL, "invalid load size %zi, "
-					  "smaller than header size %zi", dof->dofh_loadsz,
-					  sizeof(dof_hdr_t));
-				return NULL;
-			}
+	/* Validate the DOF load size. */
+	if (dof->dofh_loadsz >= dof_maxsize) {
+		dof_error(out, E2BIG, "load size %zi exceeds maximum %zi",
+			  dof->dofh_loadsz, dof_maxsize);
+		return NULL;
+	}
 
-			new_dof = realloc(dof, dof->dofh_loadsz);
-			if (!new_dof)
-				abort();
+	if (dof->dofh_loadsz < sizeof(dof_hdr_t)) {
+		dof_error(out, EINVAL, "invalid load size %zi, "
+			  "smaller than header size %zi", dof->dofh_loadsz,
+			  sizeof(dof_hdr_t));
+		return NULL;
+	}
 
-			memset(((char *)new_dof) + i + ret, 0, new_dof->dofh_loadsz - (i + ret));
-			dof = new_dof;
-			sz = dof->dofh_loadsz;
-		}
+	/* Resize the allocated memory to fit the actual data as well. */
+	dof = realloc(dof, dof->dofh_loadsz);
+	if (!dof)
+		abort();
 
-		i += ret;
+	/* Read the actual data in the allocated buffer. */
+	if (!dof_copyin(in, ((char *)dof) + sizeof(dof_hdr_t),
+			dof->dofh_loadsz - sizeof(dof_hdr_t))) {
+		*ok = 0;
+		free(dof);
+		return NULL;
 	}
 
 	return dof;
-
-err:
-	*ok = 0;
-	free(dof);
-	return NULL;
 }
 
 static void dof_destroy(dof_helper_t *dhp, dof_hdr_t *dof)
diff --git a/libcommon/dof_parser.h b/libcommon/dof_parser.h
index 75aa3082..de6cea4c 100644
--- a/libcommon/dof_parser.h
+++ b/libcommon/dof_parser.h
@@ -180,9 +180,9 @@ dof_parsed_t *dof_parser_host_read(int in, int timeout);
 /*
  * Get a dof_helper_t from the input fd.
  *
- * Set OK to zero if no further parsing is possible.
+ * Returns NULL on failure - no further processing is possible in that case.
  */
-dof_helper_t *dof_copyin_helper(int in, int out, int *ok);
+dof_helper_t *dof_copyin_helper(int in);
 
 /*
  * Get a buffer of DOF from the input fd and sanity-check it.
-- 
2.45.2

