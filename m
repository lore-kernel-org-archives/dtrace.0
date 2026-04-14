Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF3934A783
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 06:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776148074; cv=fail; b=cyyw0svmSzj4Lzd3B60ZztvKW3QqZMZ2cqC4lEC3f1jbb07/zhXHJ1C4b9ki1KlHt9M6lSeVIAxF2MBFFrJCdUC5pfYqR8YHasjdJBV5Pw0oANhdXm6Et+xzMFsCTsZ7yq7Ot+jZyQczBAsgfNfhIo1k64jxHP4ClibJ2GVkmlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776148074; c=relaxed/simple;
	bh=WxPpVm7Lb80wZxqj6Lv9fdQ1ZTM5o33laHiPBouyx6U=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=PZmWKrIGJg+OwRfrJLYqoW4b1clS5uO1Mmn3MBlhB0+x2xpL8AoGEShK7PZDFpDNVbwXYb7LWVSwkDEB7ZI7lM0ylphnA7KfzfJ0qKaQOw+I0bK/+N8ZEJrk2X8eJwUVGdGBJ+mkTKQw1nQ27GcTc/GaBFvoUK1VzWkiiIqLGT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=K4xCjCwV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nigLR3+L; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="K4xCjCwV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nigLR3+L"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DL9o7u1734145
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 06:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=hl6P6nzkZmjCl206jdgJCpkzDIxyzicENypNh0RO6bA=; b=
	K4xCjCwVQVC8yBHfBy10cOT4iId23LOfcrUTS5wKpFpWQbCW8AMxdCauBFxcc/l5
	xi0cHkL8jsgjTJaHvOyWcamxBl15Gd36gvOrk3VP55VgKaKBAxhJM8zml5TYVC7X
	d92mnO/NBjV/5/yKvkbxgsJjFBq8a3szHabiG1qaH4PQSEY3kgNndhWTFduaGow6
	Y0w1kCn/JvyAMMEmKXuWwLxIFIgDMNkpkzG3TtBFQFdpOqI9L+slH23IcihLPXHO
	iK807VkXWcx1hlfpUZEJ+uts+LEuQdnijC25MP9+8SnFirSxpsDRzjWAOPVh0z+T
	jZJpMaC205/AaOSv5vsmjA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dh85q8mcc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 06:27:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 63E6OP1e000817
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 06:27:50 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011005.outbound.protection.outlook.com [52.101.62.5])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4dh9jnrn3w-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 06:27:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKVeCruZSe7HmAs981erJN/kYuVuvxzpoqeuFUWmJ8d8ZmVd4rW8bTXBdU7eobj8EXgFJjr2+3xmyDavY/U0dICXP05lUzJS7XAW8aeaoAhccWh/TaXaz1S/qydCTUZSgwqr7Rtj18HUOfshbCu5vH+YSmozZg9/bXAyEY92Tfjcg9Z7kNEWO8iW0SAxvDobxUuCG9LdUinMz9kp8+InzWhpEUMSAqrbGGrf5JeH6H2eH9ciEbdi7ZvAQ2lg2/HbHQYk5p7YV+hnBzspozYfqQr1vs7jJNptAJyAtQuE/qZmtat7BcoE2U/aWMt2Vhjlj2u+dwQzbrzepziQtvTJsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hl6P6nzkZmjCl206jdgJCpkzDIxyzicENypNh0RO6bA=;
 b=A5w4dJpq1rC6BHm1ubIZvgVK4YR+W6Tt1rTab5jVtEddmRRyI5NPPtjgz+nhxXVJoEjDbZAOeR+myOeQRomkQgSjVbKeCcWub9g3hGV+/LVzo4JPMR0EiYm8Joj95pUFLF7Lzt95vs+yu92saecl03IG8M1FfimVqwVlBypLvRWInLboRZO0FuT2Qy0r6s+Gd3HxOk59vL76uDddUMeEBWpR30fe6/OZEem2TG3ivPol8gniVCrzw5niMigORrO+jT4mBjSk+uSTvr9bVh8vjKb36i+4pz4/YUdtZmOQc0q4yq8Uk5US588ZhMdfWXal5g9auNmVF3TPvWNFdAVtiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hl6P6nzkZmjCl206jdgJCpkzDIxyzicENypNh0RO6bA=;
 b=nigLR3+LGf/oMZLnx0I0ffJys2/uxA3Sc/itXrawZ1RYY3ZHA7yIyV9toX/25wPfHmmdd37lJXh/xqMs14hhNY/mnPLscEKJ8dovhTJZWZCBWqikXP7fIT+A38lceEQbB6Z7vWYBNpWoA7ZovivRbybSoqm5N09Ut3s64nnkdgM=
Received: from IA0PR10MB7325.namprd10.prod.outlook.com (2603:10b6:208:407::20)
 by SJ2PR10MB7787.namprd10.prod.outlook.com (2603:10b6:a03:56c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 06:27:47 +0000
Received: from IA0PR10MB7325.namprd10.prod.outlook.com
 ([fe80::edc9:d2ca:45c2:b41a]) by IA0PR10MB7325.namprd10.prod.outlook.com
 ([fe80::edc9:d2ca:45c2:b41a%6]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 06:27:47 +0000
Date: Tue, 14 Apr 2026 02:27:46 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/4] btf: use dt_btf_real_type_by_id() to resolve types
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:36e::10) To IA0PR10MB7325.namprd10.prod.outlook.com
 (2603:10b6:208:407::20)
Message-ID:
 <IA0PR10MB732561FE075BF04C79C5CA54C2252@IA0PR10MB7325.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR10MB7325:EE_|SJ2PR10MB7787:EE_
X-MS-Office365-Filtering-Correlation-Id: 35251048-713c-4a9f-a653-08de99eef211
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EnImHOXB568pKRYhd8do4RdzkxL5TNTs640NYhpQICh6SglBrF2k0gvMqkzT2baHuhGmEp/90HxqiSQzP02FvE0dqdcbIsPcuyIcn59jeYxgLvPJARvMXQCrBE4TAjLSU1uelDrQEiMElESz98Z7Ck6kWawrVU7o3BPRMHia1fsVEfxcNBdOfKFMGnVeq9FrjeFQAslQ9JF+7P0oFZqGzbrrKQSYSNqGDpN53x+M5RDz7Q0AA70BwZ7bjSmg++QwatBejDHCg4u7kkOFLKo9P9ELus5bodJqD9KPAjsQYaxpjLwQ5ca5oBLoCuHr/GOrsxD6123p4KkA8945ZUdy7k+Nk9bxJk+nAR++YEoGqUMV0GdwbR/na/H4NyRbC6n0bPX6NJNN7LTl8rrrxcDtHNOHMz4sBUgP24Hk2FHlSVD9YEwOlUT8bMpZi6tefcXmSn6gSGAqVPq67S1zFbZ0ZYbN4wX2cbsUsJPWINIQ+W57gmhGbPv7dKMpF1PHG51lNRAIJkDntDIJOeid5TYxYgGO2aKQeQC5ixQgRo2CJztVirI5zh7fq0WDQ3d7BYqMVhQwPWsDZw+J3xzMfvIBR3wInEqy7kAS5ImjiOdQv053w+rWS3PtzNbIYY7oWl7lE9oJ2ELMyUKE02cNSZe2D47mSuYT8c7n8iCYYqt/bGlpSYE9vk94W7FWEltOLkto4LnWB+FcRHmUMUKo9RqKoTAnR/KD7QmJecu+5QdEwAw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR10MB7325.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rEjQrGk0N7tltKLLGML1KPLhHCdGmyhcqV7p9ChDXdm7iBeddGpB2oG6O6ck?=
 =?us-ascii?Q?KUCpJaE4x1FPPuXWniBeI+Dypt4JDV4S4I3ZLXIJeIyG6mwd+vvX6zad8wLS?=
 =?us-ascii?Q?1J5jBh9gf3G0ZmMU8LWcqWEseQtKafaH7gszPvPvgdwdhec4EMxAL2c5SWuy?=
 =?us-ascii?Q?i29mhWzd9nK7PMOFV3wGDMeG/TnJFz7UVwX6OYzZcZx7nCn7vx40eKJB7oJ5?=
 =?us-ascii?Q?JZgeYIs3dxIM0CaAxJrxwfjfHrmD6u3I8uzKw007upn2ghqd8IEtyATVkAFv?=
 =?us-ascii?Q?faIUvmNeSuZKQoGp6rmW08HDrVbfG7BQvOD+MU5f3+qpnHOsMJcA5uGNJ9UC?=
 =?us-ascii?Q?Ebk6qa2Krzu9G5E1S6eWf8LtaP+rBwoaLaI6QqUJId7SO3NfY/GglunK4WUi?=
 =?us-ascii?Q?2k4km7woBGReHh1VdcFgcxryNwSopst0KB0uLKHwgn5BMzChvjvZlWQESkKV?=
 =?us-ascii?Q?S9XpWFoBPadeZnl1hD/PbjAitKQ/7275NuYIf4EMEIsjREABE9dUL27llQ6P?=
 =?us-ascii?Q?wC/gyw29yiLpCoyLqHOStAaJNLpKlzWZunXt8QcxXleoBantxp6O1rNdZEC6?=
 =?us-ascii?Q?9O2O8GmY3QpPM8mdMuQ2kwr1yJv87TmdkB/Q485LgtighblcBeWpOLPVICvO?=
 =?us-ascii?Q?sOnJIb7gwcjHmVnDApE1Jdz/ec3LvEwaosEHwS1Nl1ExNJawSRlrZ4YUL9FT?=
 =?us-ascii?Q?gndMDq9n7npgxuw4EhkC3XhF/IV2brE9L6JxrYWLxj1PCsSKUDYijrwnMzT4?=
 =?us-ascii?Q?NV1g4ZpUnzlwVsIR3LmXRdgig8OArzPPjHsyeikjMDqYofdLvbpaF/i2u5C7?=
 =?us-ascii?Q?3OtdGgSLPxLG11kpovairI8xT95W6yhcpluVYVFsaDa9DeX5ErZ4TwUf5LOU?=
 =?us-ascii?Q?BlW5snAtwBIwsAtUzU1m8+MAojPrNX1738ZlFYW+/36LTYqDEiN3t3Eo9szg?=
 =?us-ascii?Q?Tpe1IMrgEUJYDHd5bfeHibUN1LMD9Z4gog5jzqQktPmH3xBoPgNZ0MIGgbtX?=
 =?us-ascii?Q?ApVp2yj9hHsngd3DJGusui1bFGE4k6YcL3JmjSIEpNv7r/SH3yz6bxuv+iWA?=
 =?us-ascii?Q?J0WEt+WiBoXfupWDDkBpksvCnKh8V6JgMzEE6YqtZCZqlQZ9lwYWLR2gEZNE?=
 =?us-ascii?Q?tzaII5CD2tpUug2fXc1JcQffbt7V/eEPEgqYXKFhEIcoxdyr1qH+UXTYXv3j?=
 =?us-ascii?Q?3jthhBeMep380jjR6pQUwMobJQmT/ZcRQOEirnbNnQlRiceKt7utFslTCfAO?=
 =?us-ascii?Q?eG0VPAUbiUFqbdj+15cs0386TPg9kI7XqS/T/2qSbUwdbNgbK3RRleOz2hQc?=
 =?us-ascii?Q?wVm//M3TRmQfueSp6Xtzwu1zMURNBl2ylOuEFwWGxyGtBeoeB6QohuV9MSed?=
 =?us-ascii?Q?qatCRn/0HBSoGeiVT+M1jmn67pzc2nZAroLhWW4vY7qhRudH6MmcoPySATMm?=
 =?us-ascii?Q?+MTXuc9oJi8tmJH5M0D1y8EUAdZwAngCCr8R5Io/vIyd0yqxTley+L4GvCr0?=
 =?us-ascii?Q?tgejixtwDPJCeR31JUaztxn5UsamJrc+Ej9Ux4axzuJFeuBsb+EvErtmzmP1?=
 =?us-ascii?Q?ux+nQ6lZXaGd3VBQ6e2dJ4QW5aXZldgvQHJKMso7UZTDP2yWSDQ1RnnUA2Sf?=
 =?us-ascii?Q?pkCPPhaOIJSauyim/JgRd/L4p6GVgOzquyTNg1s8GMKbJhm6BY5GVYSmwkl/?=
 =?us-ascii?Q?6zi5QlImGuS7IPxji5bvsRH7qdNPO6OW9bzg7zwcVH62e2kUR1TkdsqRXf5X?=
 =?us-ascii?Q?yrtjNrYIOg=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	s/r4/RWwlL8mDLKsqswIyeSf0Y0kVMyorbX3/RjLopRV8dAApnhXmNawVF5t1wF4xAKenQ8uee6QdwtDDPs2p/yC2e4ELcihE1LDjH9xV+qdCR/0X9n5nY5wt8dLKXSdx8t6HZo6Na5h0e1U66l2jEeIhcZ6HB5xuB2UIg4BUe+Ybp664WgZORlE70ysdi/Ueb+0jwUloRDdKzaDUQI3EwsBsBcheH8KbRUxgaR3eX9Ff4u8V/cl+GAKr9LPoV+g16hENUSQcRrruRdI2kWR5j8K4ckQiMvii6MWfRCfUWxFlwtXdGFQr6mORziRo4gv9KpnU5lW3Nk0Uzz+2jZKrw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EBvargLGdK/PyNaoJUBcgibGqzBDI2+lQANknfMmU6fIEs27d1Kiw4T59vvDabMFIqGppy6VmBcuRNV8L/8CHnzL/c+FFcBNYthqXNflMuUIsoJtxNENiaj7JVRXXFBIcu9pe1Q25Xef/b5vCILasWZlB6xf9VpS9w8upq7EfiwvfhTMOlSwLvXgnqOMS6WhXX4DrJ9KVJgdU1PqRWs1TYTxQQEBaLktIV6CTJYfcJK9Q/ExnseYJqb8uGO/Zq8sQ4JhlxhPnKhH+IwOuodtG4XP85IQvb3TzEEplbzQCnhfOWFw/Gt1H2cEVLLzwKZbY2fer+sPKXQqlgwcLVmtiJmt+7vxmTRup+FVvTWC7SdbFyrDv4VADntn0xjdYxZt3T6X6TQEL+YB6I4y7SQvSk5hYBi0RJyfsqzFtuN1Wf2x5/NxvM59+5zEth7gpEGF4wgPzfEyguRCnvbhsBFoBc5dpMU2J68cFJk55dtYG0Ot/zHPxqwli5bDU88r9tBVAuMz5gkND2M0cw2f2zGYBP9105HQPS/AN8cC8lSfSen/U6imzQuPwifA7lKZqNhtcOSsf5q6y41oHQu9GJud/U62ICZ0TstU8ZilPob8RG4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35251048-713c-4a9f-a653-08de99eef211
X-MS-Exchange-CrossTenant-AuthSource: IA0PR10MB7325.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 06:27:47.6648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2SnUveTijHhoVVWT/F6PalUhkxof9RAqokLxmJasIRK1exhJ5znAjfhv9DVxAv6+JZCytKCBD7fjIL04Z8+QbTd1eob9fpeAglidtZVsjJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7787
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=936 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2604070000 definitions=main-2604140058
X-Authority-Analysis: v=2.4 cv=d77FDxjE c=1 sm=1 tr=0 ts=69ddde67 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=o5oIOnhZENCTenyL_yNV:22 a=yPCof4ZbAAAA:8 a=H_nP_5F5Jeef4X9Cs0IA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA1OCBTYWx0ZWRfX1wFhdpmrK/Bk
 1/eve2D1lXCKVl6NzJvQpp8BKIuuqndWHP4DyLjKljcalAwyW/YJnAE/VTPgeLGTwOFN8/Ajrfx
 KQXU/MvvYUlhD9NguUwTTkdNmwkNpMwVISFjcAdbwBiM7VNsJEfIqe37PKSjFjwp3uqTqFaPAZM
 9pw7cN9x7AZ9MydCBSpPkE4d9ipKjGSv3fPHToQdrCAlp2PPfYRiraxUm/OaZ6swELKTRQ4ehbj
 QsNmbliAdK2EkkJ6cUTCvNAIX2kntBPGRGkuTZDuxXVG77dtEs36WOCcyVozGWFeNjsovh4PumV
 W7Um2kge0iIoPLNFvKFZzuZB8IrFBsqVPzMryrEr49qk4GOK2ZBh9a0Nvk3uHLXB7zuKI7UmDs6
 VAZ5EmtOPcY+lvtLPoaV4UCa5a2cELSH0cD8YMFPWr7C+10ihiWtm18ItQYO346HBAUeIpOUjsD
 mDJzfllYbnxZn7M0NWw==
X-Proofpoint-ORIG-GUID: M4txWRil1GZx7d6_QDQCtd4WO0Pw7NlH
X-Proofpoint-GUID: M4txWRil1GZx7d6_QDQCtd4WO0Pw7NlH

Functions that need to check type data operate on the real type rather
than a typedef or a type with modifiers.  Similarly, when a type of a
function is needed, the prototype (BTF type BTF_KIND_PROTO) is what is
really needed.

Introducing dt_btf_real_type_by_id() removed duplication of code in other
functions.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_btf.c | 43 +++++++++++++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
index d08599192..56eb96a4e 100644
--- a/libdtrace/dt_btf.c
+++ b/libdtrace/dt_btf.c
@@ -848,6 +848,26 @@ dt_btf_type_by_id(dtrace_hdl_t *dtp, const dt_btf_t *btf, int32_t id)
 	return btf->types[id - (dtp->dt_shared_btf->type_cnt - 1)];
 }
 
+static btf_type_t *
+dt_btf_real_type_by_id(dtrace_hdl_t *dtp, const dt_btf_t *btf, int32_t id)
+{
+	btf_type_t	*type = dt_btf_type_by_id(dtp, btf, id);
+
+	do {
+		switch (BTF_INFO_KIND(type->info)) {
+		case BTF_KIND_CONST:
+		case BTF_KIND_FUNC:
+		case BTF_KIND_TYPEDEF:
+		case BTF_KIND_VOLATILE:
+			type = dt_btf_type_by_id(dtp, btf, type->type);
+		default:
+			return type;
+		}
+	} while (type != NULL);
+
+	return NULL;
+}
+
 const char *
 dt_btf_get_string(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t off)
 {
@@ -978,29 +998,24 @@ dt_btf_module_fd(const dt_module_t *dmp)
 int
 dt_btf_func_argc(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
 {
-	btf_type_t	*type = dt_btf_type_by_id(dtp, btf, id);
+	btf_type_t	*type = dt_btf_real_type_by_id(dtp, btf, id);
 
-	/* For functions, move on to the function prototype. */
-	if (BTF_INFO_KIND(type->info) == BTF_KIND_FUNC)
-		type = dt_btf_type_by_id(dtp, btf, type->type);
+	if (type == NULL)
+		return -1;
 
-	if (BTF_INFO_KIND(type->info) == BTF_KIND_FUNC_PROTO)
-		return BTF_INFO_VLEN(type->info);
+	if (BTF_INFO_KIND(type->info) != BTF_KIND_FUNC_PROTO)
+		return -1;
 
-	return -1;
+	return BTF_INFO_VLEN(type->info);
 }
 
 int
 dt_btf_func_is_void(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
 {
-	btf_type_t	*type = dt_btf_type_by_id(dtp, btf, id);
-
-	/* For functions, move on to the function prototype. */
-	if (BTF_INFO_KIND(type->info) == BTF_KIND_FUNC)
-		type = dt_btf_type_by_id(dtp, btf, type->type);
+	btf_type_t	*type = dt_btf_real_type_by_id(dtp, btf, id);
 
-	if (BTF_INFO_KIND(type->info) == BTF_KIND_FUNC_PROTO &&
-	    type->type == 0)
+	if (type != NULL &&
+	    BTF_INFO_KIND(type->info) == BTF_KIND_FUNC_PROTO && type->type == 0)
 		return 1;
 
 	return 0;
-- 
2.53.0

