Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C111020DCB
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 19:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717182012; cv=fail; b=YcR2UPiwespf8frBO9Hgvr6bn26etHmQtazTjrs5o2/rbIZSy2CKx2ztmKZQOkimAfSWRzoVzHTmKajlsx19WOrOmXFSVgSuBPS8GB14Qwxf24IMpAKZZ5f9dfaPqJmrMCATK6/hQ4MBQGsDpMDtETy1L406EAK6V7cQW5duvMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717182012; c=relaxed/simple;
	bh=C1h2LSkSW9S/3DRlP9pJx0cqUzLaEcODilHRCLLjXgY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qkEgvpTeswUWIK2Q2uCqGuz2Efy87x8XPkiAFyc1RJ7MR/hfqrtkoUYISQwh1v/hrv3BZio5+L8I9PWfOJysTmQLyFGdLgds56AnzPLRLQhfXiEpDqP7AgOfOePeElH0hzqBLaxms5nj8uyWzxPHOrbHcvy3/67Q6g9WW6HVEso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44VIOfEM002667
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 19:00:07 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-transfer-encoding:content-type:date:from:in-reply-to?=
 =?UTF-8?Q?:message-id:mime-version:references:subject:to;_s=3Dcorp-2023-1?=
 =?UTF-8?Q?1-20;_bh=3Db4d3ApD4gIU0/6jMSO1cCl+tzURspOH8cnfd0fI/YfM=3D;_b=3D?=
 =?UTF-8?Q?I492WQJIdzy5yPEZBi88C/UCjYm+DaenZGswYPevxIqVaQ9AGihdtvcYJVHNstk?=
 =?UTF-8?Q?W7678_/GocxcqXN6QSyVfpp4f1tUJw/y5mWzdUuGnhP0YEbpQ7GMUAoVWJPmBSC?=
 =?UTF-8?Q?JiXpH5LmF9S_gCoSW299rjl9MWjlkAnj8rwPGUn/r2ryH3G3/fL89F1uXtqu23X?=
 =?UTF-8?Q?ATaTmr9C1Pi8lcVA1_xlZj455MU9y+dNb3TT1K3qy/tyhtlO426S5KmWoqP9yRL?=
 =?UTF-8?Q?JbhS04jJWPlIgRhH/QUYFcH_oXdyTKyL0awt6AdXeCcdJ7Keszfx0SRTdllSFvy?=
 =?UTF-8?Q?8LU+v64iF/OByxutgO1jnnbwQRfef_jQ=3D=3D_?=
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yb8hubvns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 19:00:06 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44VHVUgm006242
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 19:00:06 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3yd7c8rtp0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 19:00:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1JrxeST1zFidr+SoIKIAvn2MY/KiWUnu60mP5v3oS59OUj/qnRa0vnetWjAx9mPr1f6xcE8clSdCPdofjgKSXQ8bZxPhC3ekDTQKckQ6XTWsIUOQz4o3h+DJX3EZF2WuN4PLzancIzJWjwpGgJD2xMSBjrQP/Qf5w1G/bnmaUI9hfy7H5FaBhAeuSIEqDP7MjfQsR2DTV5Y/Lsw7M/i8BP3RHNavLkFkXM8DJSSWmHjRlWRMcRePlkV/xi6YeM/Uujaio97KmDR1ltJL6X81I96WHeUmg2CzjEL4Ibu1xT713hvE7pUbW6lXwBt2nMlXvaF+lki/29LP2PhObs09w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b4d3ApD4gIU0/6jMSO1cCl+tzURspOH8cnfd0fI/YfM=;
 b=SRfo/l1zlJ7HmAwNQY2HiY1qKKn+VTY0HbEGXNMq7u9wqBxowoeuh0zuBL75PlS2DmLzX5TbxZZwn1M9lXd4RDN62j33wAKaTRF2AJBzRsucx8znAB7eN9i8Q07oJf+tz+qDxJtkaYL7vQIj7dWdLZFA/wX8fQFUeC3/J282P6/HHAA3ho07bIpGHDkebgH3lEBWkjNFUAHHR78fFoMUIOdCGlC90HBH2vQFdvW7SsXMZlou2Fws4Hw950LRU61PWbeiyibn5c9o1h2bgJMZnKSY/y0pqCpT3PWdphmj3yuiGzjCo8EjOHw4FU65FS65mtZfezu5wdpOz242vAMVig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b4d3ApD4gIU0/6jMSO1cCl+tzURspOH8cnfd0fI/YfM=;
 b=Yby5xkfTE4DA8BuN5HPC//14tfBm+DXK0iakScyYG4p5vDRQxUQ6AIKWCnV1uZpMeKlFB9hB3OspqSaDy3c5r25reAVhCoSy3kwmV77cuqaUOhwaEgK9gWe863EaLCo+UEIHe01VIZ796FLF9he5zAb3BCC0JwiezapbcOpyRrU=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by DS0PR10MB7955.namprd10.prod.outlook.com (2603:10b6:8:1b4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Fri, 31 May
 2024 19:00:03 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 19:00:03 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 8/9] build: make dtrace and dtprobed relocatable
Date: Fri, 31 May 2024 19:59:27 +0100
Message-ID: <20240531185928.363245-9-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.45.1.275.g567cb0950c
In-Reply-To: <20240531185928.363245-1-nick.alcock@oracle.com>
References: <20240531185928.363245-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0093.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::33) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|DS0PR10MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: 09d196c6-eb06-4977-9871-08dc81a3e0d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?idXn86ekP50fiZtaQvLp7noFS1eHZproJN046rl9iHkrDjJcHtHelm0x3j2+?=
 =?us-ascii?Q?PIPDCCxyIlQ7a9hkSaGgPcZLxcTZgBwduhIk4+k+giU3hCKzPqClCAM0CWdz?=
 =?us-ascii?Q?/oTyErghh0SI2XSTskOhBlNlrL95ZAf6TYdK8BwjIEXAoslviAhhcqUjHOXs?=
 =?us-ascii?Q?gZNlkRJnhXtUn85NWGr78JiL6cSGdIRTfDYJC38JMI1Q4lvi/wKvrwcjveIl?=
 =?us-ascii?Q?1o9iP+39wjnx3M3bpyHXxK4opW6QS1+BZaLSLX/0L6PgVp37ehH4i+SfkjaK?=
 =?us-ascii?Q?ygKMVYYl1Al9bP/3KKZfTb2LJUCryW02Z/PQh862o/xE9GNeygyuMssLNrdo?=
 =?us-ascii?Q?PcOwiMrbkibHAkMk2ishkXZCU2LF7B9HGbDNLcrAumA11QfkZFhH+HSyN6KT?=
 =?us-ascii?Q?Fn8UGVFTH4pC4yrhT5JQc4zona6jmgyYxCFC2oMFZVFdQhXM9CPtHEsHKg1F?=
 =?us-ascii?Q?JSks4mPyT7jTDYzWZ5b7+ZKd+kGsYfDLskn4OjXX8tzpNSyYWWwOQ57aLtaa?=
 =?us-ascii?Q?FjICyCksh/TpjxbjFUYnE4yJLgD9BAOFmZEakLGDg4H3rU0JwvIjsPQI7P8o?=
 =?us-ascii?Q?KCB/bHAgtdBgR+Jf6W2Wre7S8f7ElBTS/b0XpKhAuYaOTip2Gs66MRnsjxxl?=
 =?us-ascii?Q?Io2dnQLQ5jBvUt6yqMsTmfr8dmdiBwRG4idbaQB5AZXoyD0j/TzzVkemdF8j?=
 =?us-ascii?Q?+mGYfz28cV81NpKSx3FpHiht8v2EfbVHLqAQjqUyb/yNML7axqmwHE8yzBvY?=
 =?us-ascii?Q?gvnJ6Rs4h/7q0nEgJjtMPcFUeD91iSo3CA5hn5b9yyrXQrDvr6ypEHfiw6KP?=
 =?us-ascii?Q?Do1wz7dA24RH83ldpshaJu30BR0x+nWTkAJpEJUsPYZ7g3oNfufh6OMV9tHh?=
 =?us-ascii?Q?bEGqJmAyD3Jez1baGPZ+8aF86x8xS/QVllM4SSVt3Bxhv/YkYRQ5LB+keVdE?=
 =?us-ascii?Q?EXz8KxXtVIi6f4oMsLJnb2yAn0uqTuQSXM5ukIw4C/fHryLEv0YupiRl1dFv?=
 =?us-ascii?Q?JuLvFNUD7m4CfRH5FoyQ/fryed2ZBPqHY5HHqfSQh+J7agWZKckBbYkSdd9p?=
 =?us-ascii?Q?xVKOw1mGs+IdzyNvsiYx1W3q15ddS7YmoaM643QP/YzaHePjVyBCWsU6pJIB?=
 =?us-ascii?Q?i1RFLFOddkeKiwKePTeosH+Vu5+imexiwXkhZeaRKe8SIULW5+R5jdJsYY0x?=
 =?us-ascii?Q?TYFDAyyqTGB4GiTWET/xRq6hT/JZ1CQHCp3onw1j7h2N5meek5PAaoTAWZo?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RLcD4GI45N54/LzpbJOzCxiSlyCiXoWuz9GdHLjeZX2heBnZAzd7dvyQfvtm?=
 =?us-ascii?Q?tXvE7J+sqOwqnj3ozC0/5ZF0NyZTRKjexwXMFQDkew8NqlyhirXaPuczB2YE?=
 =?us-ascii?Q?k+sSkf3j84/cCAEMgCG7BgABL5EuwHOeE5qXwiQ593HSPDKs9ajblfV8oW+R?=
 =?us-ascii?Q?muNwYwFIiQWsvL/BfyFOs+nnN1Q9Iwm5toekySuEsrY8sTZZSFvwip8FH3pg?=
 =?us-ascii?Q?7ea9sGm523Hzo/OY4+cxM9faALYSJMaqEbNlZ6q81EvFrGkvWA0QmlBWCvju?=
 =?us-ascii?Q?dV44uLaNj8gg2AP5U9YX6BLHzlfTpiiYWM3gmz7ZTSSV4XcAnYO4ZF0f2j3p?=
 =?us-ascii?Q?LvezEFK/g58AFhOAApViTR5A/cs/4B4q31B6e9X0aehGHGUiejr3gLKPvnRe?=
 =?us-ascii?Q?vBHCujM4OPflM7lvQ8GJehX+cADNo0BYPinf1fhkgizieLZJrRDZob9X8faS?=
 =?us-ascii?Q?XNojTZlDPsIfWPsGgtd/jKLXfSb8KukiLQ1VLX3RP5iloi7TYVgyHLm0r7Qo?=
 =?us-ascii?Q?pJ1zgLuhJlYk0U+SuZ1xaqtVCUYrGegaeW/2rEr8kENmkdQUd2yQoHTfL5EH?=
 =?us-ascii?Q?PZhWZEJ1125DZOZDPHgqVDF2qDAXG6p80w0vLt2qbR5L2mRKd6Zg5eCMK2yL?=
 =?us-ascii?Q?rfrKBOcHIA6EpFh1NbwbSHDxnkFXQDudJ5BpiQ0MgOr12iBiMdXy/lMrk5Vq?=
 =?us-ascii?Q?7ki2R5aF21X8msIUmhS43sib0SZ3BFiMK48xQer/b1TOnooNOGV+Ll91bBEz?=
 =?us-ascii?Q?Iimmq3WMvOJH5qBU+8vmC8hjhH2jAzgiaaKyXvpNDphqj7dYMCsFd/9+tlxf?=
 =?us-ascii?Q?fPCVuLx2hLI5I1yjV+0Jo0I7V5gB5X0av1Vb4HXLr0NqlU+pIHIHYJhU3jSu?=
 =?us-ascii?Q?fJC5AzzMp3g5jKWqFw2TmVhf8MTgaVUcn+6ue6t0q2FbsQOKrnrgrfjAIH98?=
 =?us-ascii?Q?0bPFUEOr7Bk+tSq8gy150XNJ6uCF20e4ymaZ7L6QbqncGMm+MTk62sC4Yaph?=
 =?us-ascii?Q?/KEoqJ1WaWT7KGagwckkgjYC4RErDRzI+StP2VRPMXoYIx4hzxfsUhmK8sQX?=
 =?us-ascii?Q?VmMX9vEJMPpwSoTAuSkk5Gk+K5/5vBJdIrS3PLTe9FK2f8CRzWOD7o4aRMFk?=
 =?us-ascii?Q?IbwL6ARKaZ9RcBQO9ZByL7NFlBQ/cB6GSzHVCTEAFTkSv3p23IVypHG3oy0h?=
 =?us-ascii?Q?aWPzfus4L7oNCMKO1JSREyJLLkQXBc2N3tOpXfj1YH/QzTh6I8zUe+L+T3xt?=
 =?us-ascii?Q?w6XRCRLGvsHVjq0BQBNStXhIMUp4/tW0jSnxuALrWyXT/XenWVL1uGGMXQqO?=
 =?us-ascii?Q?fDf63mzkWyjFg0gf96QDcO7c3Ta9tvm9TR3F778Yyu0+mrRvAmk59F3Q+SMW?=
 =?us-ascii?Q?i6j19CTVkobRy76B5t/B2XLLTI5OHbd3LZwKZAh2m6ya7vbSObZi2A4lBn+2?=
 =?us-ascii?Q?/PAwFqJPflcSea05n2KfHht09HajUFDAuA0xpm4O1Tlg/D2UFYdxDjw0QVK8?=
 =?us-ascii?Q?ADtRktd13OXNyWrwYqK/jIRDXaprX9j64z0Xl/o3M9rP+ltcPjOSjs9Ezd4b?=
 =?us-ascii?Q?c0SaWBa1tSRN1TrPaPEk0JdkCuYfPGLtSawRO4WjUU5DciWD5iJH7ztV0BWg?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	/nCWjzMuqn737NvFPC+BT26zKRtXhA/e56Luojg9o6eRViaTusrIMRmTyuHMRhMpKB1zU+xTwNKLCcVN8IafAL9D8C25xBDlu6fm2BTlbOrf7Fa66kY9Vf2JsSV+34WL8B5VJIUy3ZiAgdYYiNSUeSzrILjQC4HTEMI7pbzo8sJ4tyQIlOx+m9MFNVl9bMv2JTy+L4+hC73ogiUXtlSmhESTv2t+7XPsAKyWpF0vmd1CEvyXL+7P8ZyNMOMUi8RO8nbz+ZxEO7kwenqidgCuCjyDPD+0gL4T+ZHtVjCUrQ49MOV9O9OJZfkwrxZ2Rj6dctcLpVkrsHuYKHPZ38lqiRwZ0ysCTT/KBpLVgm37lEveg6/Yql1W7WIUUuWLXkDqDqCpjyzqC+jJbobAlhX2joozbyZnh66OcIw2mCzJLoghim42gBQnNK1hBVO2xqW9pceqRySFT8rp6VB3cN6ddsuQBbdseDn/E1N56sEOooJIdC/bKgmXPupYNen7KiQiSXmiwmAvsMr4ikOd47s+h1MNtVwJcWI5NcHx21GK8IJCRo8hqQudB9M4fE8wi95X3H+tijij7suv1w8k7rKlKVBNa+cRRtqXWwojQQDz0Tc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d196c6-eb06-4977-9871-08dc81a3e0d1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 19:00:03.2081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CwxFAGtS6JIYy/CnRbrNCLwPQTULgR5UkVJ0nGMnl3XqV1v55/zp6/fcluaBbgjV9ShHlQh9th8YGqz7E+3OnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7955
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405310145
X-Proofpoint-ORIG-GUID: 3WVvztShyRVEQO91mixFtHBdNp84GT67
X-Proofpoint-GUID: 3WVvztShyRVEQO91mixFtHBdNp84GT67

The majority of the complexity here involves figuring out what to
do about the systemd service file.  We presume that if the user
is installing such that the service file lands inone of the two fixed
locations systemd knows how to find persistent service files in, or
if the user has explicitly passed --systemd-unit-dir to configure,
it makes sense to install the systemd service file (because systemd
will find it): otherwise, we avoid installing it and print a
warning that the user must do so if dtprobed is to be properly
started.

Provide a new installation target, install-dtprobed-autostart, to do
so.

(Regardless, the service file is changed to substitute in the real
installed path of dtprobed.)

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 Maketargets                                   |  3 ++
 cmd/Build                                     |  4 +--
 dtprobed/Build                                | 36 ++++++++++++++-----
 .../{dtprobed.service => dtprobed.service.in} |  2 +-
 4 files changed, 34 insertions(+), 11 deletions(-)
 rename dtprobed/{dtprobed.service => dtprobed.service.in} (95%)

diff --git a/Maketargets b/Maketargets
index 11ad9fed4dcf0..5b4906a86d26e 100644
--- a/Maketargets
+++ b/Maketargets
@@ -14,6 +14,9 @@ help::
 	@printf "dlibs                          Build translator files\n" >&2
 	@printf "install                        Install (DESTDIR supported)\n" >&2
 	@printf "install-test                   Install testsuite (DESTDIR supported)\n" >&2
+	@printf "install-dtprobed-autostart     Install udev / systemd rules to start dtprobed" >&2
+	@printf "                               (done by make install unless prefix or sbindir" >&2
+	@printf "                                are changed)" >&2
 	@printf "clean / realclean              Clean up build tree\n" >&2
 	@printf "TAGS / tags / gtags            Make tags files\n" >&2
 	@printf "\n" >&2
diff --git a/cmd/Build b/cmd/Build
index 55c622c19dc0a..68800fbeb5fcb 100644
--- a/cmd/Build
+++ b/cmd/Build
@@ -1,5 +1,5 @@
 # Oracle Linux DTrace.
-# Copyright (c) 2011, 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2011, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -36,7 +36,7 @@ if [[ -z \$$_DTRACE_CHECK_INSTALLED ]]; then\n\
     export LD_LIBRARY_PATH=$(objdir)\n\
     dtrace_cmd=$(objdir)/dtrace\n\
 else\n\
-    dtrace_cmd=/usr/sbin/dtrace\n\
+    dtrace_cmd=$(SBINDIR)/dtrace\n\
 fi\n\
 \n\
 if [[ -n \$$DTRACE_GDB ]]; then\n\
diff --git a/dtprobed/Build b/dtprobed/Build
index 0f5d1c08aee86..cc65c3452981f 100644
--- a/dtprobed/Build
+++ b/dtprobed/Build
@@ -42,17 +42,13 @@ dtprobed.c_CFLAGS := -Wno-pedantic
 seccomp-assistance.c_CFLAGS := -fno-lto
 endif
 
-install::
-	mkdir -p $(INSTSBINDIR)
-	$(call describe-install-target,$(INSTSBINDIR),dtprobed)
-	install -m 755 $(objdir)/dtprobed $(INSTSBINDIR)
-	mkdir -p $(INSTUDEVDIR)
-	$(call describe-install-target,$(INSTUDEVDIR),60-dtprobed.rules)
-	install -m 644 $(dtprobed_DIR)60-dtprobed.rules $(INSTUDEVDIR)
+install-dtprobed-autostart::
 ifdef HAVE_LIBSYSTEMD
 	mkdir -p $(INSTSYSTEMDUNITDIR) $(INSTSYSTEMDPRESETDIR)
 	$(call describe-install-target,$(INSTSYSTEMDUNITDIR),dtprobed.service)
-	install -m 644 $(dtprobed_DIR)dtprobed.service $(INSTSYSTEMDUNITDIR)
+	sed 's,@SBINDIR@,$(SBINDIR),' < $(dtprobed_DIR)dtprobed.service.in > $(INSTSYSTEMDUNITDIR)/dtprobed.service
+        chown root:root $(INSTSYSTEMDUNITDIR)/dtprobed.service
+	chmod 0644 $(INSTSYSTEMDUNITDIR)/dtprobed.service
 	$(call describe-install-target,$(INSTSYSTEMDUNITDIR),dtrace-usdt.target)
 	install -m 644 $(dtprobed_DIR)dtrace-usdt.target $(INSTSYSTEMDUNITDIR)
 	$(call describe-install-target,$(INSTSYSTEMDPRESETDIR),50-dtprobed.preset)
@@ -61,3 +57,27 @@ ifdef HAVE_LIBSYSTEMD
 		systemctl enable dtprobed.service dtrace-usdt.target; \
 	fi
 endif
+
+install::
+	mkdir -p $(INSTSBINDIR)
+	$(call describe-install-target,$(INSTSBINDIR),dtprobed)
+	install -m 755 $(objdir)/dtprobed $(INSTSBINDIR)
+	mkdir -p $(INSTUDEVDIR)
+	$(call describe-install-target,$(INSTUDEVDIR),60-dtprobed.rules)
+	install -m 644 $(dtprobed_DIR)60-dtprobed.rules $(INSTUDEVDIR)
+	if [[ "$(SYSTEMDUNITDIR)" = /usr/lib/systemd/system ]] || \
+           [[ "$(SYSTEMDUNITDIR)" = /usr/local/lib/systemd/system ]] || \
+           [[ -n "$(filter SYSTEMDUNITDIR,$(CONFIGURED_VARS))" ]] ; then \
+		$(MAKE) install-dtprobed-autostart; \
+	else \
+		echo " === WARNING WARNING WARNING === " >&2; \
+		echo "systemd service files for dtprobed not installed." >&2; \
+		echo "USDT probes (and the testsuite) will not work unless this is" >&2; \
+		echo "done.  Try make install-dtprobed-autostart, but this may not" >&2; \
+		echo "be enough: you may need to manually move the systemd service" >&2; \
+		echo "files somewhere udev and systemd will find them." >&2; \
+		echo "If there is already a running dtprobed, it may or may not work" >&2; \
+		echo "in conjunction with this DTrace." >&2; \
+		echo "Configure with --systemd-unit-dir to override this decision." >&2; \
+		echo " === WARNING WARNING WARNING === " >&2; \
+	fi
diff --git a/dtprobed/dtprobed.service b/dtprobed/dtprobed.service.in
similarity index 95%
rename from dtprobed/dtprobed.service
rename to dtprobed/dtprobed.service.in
index 8e491fe28ad13..2e590701d03e7 100644
--- a/dtprobed/dtprobed.service
+++ b/dtprobed/dtprobed.service.in
@@ -12,7 +12,7 @@ Before=basic.target
 
 [Service]
 Type=notify
-ExecStart=/usr/sbin/dtprobed -F
+ExecStart=@SBINDIR@/dtprobed -F
 Restart=on-failure
 RestartPreventExitStatus=1
 ProtectSystem=strict
-- 
2.45.1.275.g567cb0950c

