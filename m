Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67F61DB352
	for <dtrace@lists.linux.dev>; Mon,  7 Oct 2024 16:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728320238; cv=fail; b=eo/GbiW8c+QTfCds1O/hF9NOaIRhP3XWysd3XHva1zVnjj5H7AZwQUQMnGFh4PpLYKKj0fxkTxEYiJVKIbk+fUDGG21vU0mybwlQmHlkulwMrb378rWx1Iowm/jntCqR5F1+nB6DCIRKoyyhu6++xnpfB4R7rBybhbI1w70yG3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728320238; c=relaxed/simple;
	bh=Y729OFK5e9tStDU1BfrHaipz2iyY001fQ6oXnh6IWBQ=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o1VgsUsQAiQDOgSfLrMnqQyxMhIr6jjzudCMXOjsPLuwm91vFGmRD+ygNOGLGvf2UzS+vnQ1FGKHtoGexm6qFl7tFu3TJS6+z14+PUhwPF1zUmlXICDRu6CLGnwnsxPUOwEI4xNdE/13D1UHYpFOShziv5eEJwNAjYUkx40X3bo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ENJTQsYL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EZaQtCRI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ENJTQsYL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EZaQtCRI"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497FMfqQ016467
	for <dtrace@lists.linux.dev>; Mon, 7 Oct 2024 16:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=nzLZAxxfDL7vcRuleYVCb7+e1eC/+LDsYDr0hY52Qoo=; b=
	ENJTQsYLPCxCcw6TYIAdWB14kI0b66fbuq82uMrixeKB9nANk3y7l7nAP9KFsQ8V
	LDV4QZ79KazSek+X6+Z8J8XKVLocT87qvkswMOiSk/CUp+4ew166ABMn+V+hQLQm
	9w9odDMmvcYLkcCuIxWyVIxhI9dXPJu2x9Jelhd6jV0ANoagpAFsBSINbNKhjvDF
	CF+M+5rAgBJhi2Gz5j8S2cfV26+L12d1nrnB8LtRDYQhxpZDzzrK7Wze7x4QKXi+
	1CHQeHz8bKmhkZXPmz8THcAvIApaClp+eXt35uN8mwz4rjyoG3ObSM/byLJnMr6f
	/Dt0EzmF6MQsY8LzbkcyPg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42308dkvhn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 07 Oct 2024 16:57:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 497GW0UZ001395
	for <dtrace@lists.linux.dev>; Mon, 7 Oct 2024 16:57:15 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 422uw62sk6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 07 Oct 2024 16:57:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjtZKxgkRCaz3OFlNRV4f5R0tBDfagtXLm7HPwFpG3FRlmTt6Td4WtkXgP9CnrV6CH//PNqz2Qm/NOmZF9Vw2Xcau5Ku+F7PW41ILbJMrVln+75Obf5VzQf434D66uFH6YjHBYipBlX4K0wX/8TONfD5Tc8MI8UVpB83/aN8S+KDwXAzyQ+rpNc/f6CSg5jbU2p82X0GcAzsG60IVvT4rbcyw3I3UpXLs0oLsHha315I8f+Jf5nmH689oNjwc7MI13EKAY+YlcAQC429jmh0e9JqBRX1wmH3Vu/gCVQdA34e8y+rdVuYbYKdkHqGWoJuBKUGGt3vQvGYSP3wxn1QSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzLZAxxfDL7vcRuleYVCb7+e1eC/+LDsYDr0hY52Qoo=;
 b=ypwUmb6rlqvl81y56OnXmmJDXrfYOwLApr8NyudQ3UcFJM7e6gi6DkXGvYuveTJtonvTP0IN6bBYFMLD0l0a0BtFE2qXa1X6y0ThC/qgCyCGqo0E2FxgJLiIRgQohZKVEdv0+5Ya455WMs7igPVYe6WCHmin7mZuJYfTCnjdQrAWE6KePKIa9VZpujPsCXfLrlp8IsjqDSY0uq/usSYShBbjAOZ/RP4jxJPTmMJVLHrkNSMwETgGGOA7edrIDVeg7vbdhTKrhTTA0+TfjRkUy5EqiDmm2snDruUDvfKct+vgpLfO9s+9TadoC43qL0fiDgu+qnNvzA4DAiQpiHhKOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzLZAxxfDL7vcRuleYVCb7+e1eC/+LDsYDr0hY52Qoo=;
 b=EZaQtCRIzbiZJyaB/PTs8AeswcWLkeJImtQy3jRRXWC6AYZDwMa1LL5sOktz3R8sdchRb8gdxKS2b66rZ/FvhEJtm1zhfGJ20l918t23oqRsJ8ZrkgGJ+sDbgS/c0uUPggU+GecYKVp9XPlqDef4/pJeSaDZQeniD8Y3wZcLsY8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH0PR10MB4841.namprd10.prod.outlook.com (2603:10b6:610:c3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 16:57:11 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 16:57:11 +0000
Message-ID: <acf9e8aa-1d28-8fd5-1092-f8f6b799b821@oracle.com>
Date: Mon, 7 Oct 2024 12:57:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v4 07/19] Create the BPF usdt_prids map
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240928021525.8987-1-eugene.loh@oracle.com>
 <20240928021525.8987-2-eugene.loh@oracle.com> <Zv4lwups32GXQsr2@oracle.com>
 <5cae817c-e793-c56a-209b-1b40d320c39e@oracle.com>
 <ZwQDy3K+BJw6NYRk@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZwQDy3K+BJw6NYRk@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0025.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH0PR10MB4841:EE_
X-MS-Office365-Filtering-Correlation-Id: a1308df1-0508-4ad8-b8f2-08dce6f11635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TlRhMFRHVk1QaTJMV3BtakRuSlZWMEo0K1ArZkw0cFB2bnhweGkwenZhdFdN?=
 =?utf-8?B?UXI5Vzl1dFRGQmkrYS9OTVZVSlRWM2RJK3F6NFp3K3l2eTVNTkNSM1ZQb2Jr?=
 =?utf-8?B?NUZGdWVkQTBSOWJrTkc2K2ZzSXBoYUtBcTV5K08xeklEU2lTUXdYMFJDT1JE?=
 =?utf-8?B?cjA4eGdmVnlEdTJmNVNUWGR4WW13eGxqOGNrZmUvY3MxaFhzQmZ1d3lEVGRr?=
 =?utf-8?B?QnFIbXdDbFQ3c0twcXYxT044OHJXYUM4NmtQR3F6alBLRGR4bHNtSWhGdWlq?=
 =?utf-8?B?WFZydGVoRFVrZ3V3UlYvcEFTN0U2RW5icm5nU0Z3d2tXL0xFbGRmWTVVRVNm?=
 =?utf-8?B?TjU3TDJ5YWF2Ly80RHZKMDFTaXZQajFCSEVVR3ROMDZsVUd0WGJ3c1BQczA1?=
 =?utf-8?B?d0JQcTVYUTBuUVkyK0NzTEVWcGN3ZEVMQnZHS0NhYjFpVk55OEdoUGlLQXN4?=
 =?utf-8?B?dUcyVEJ4Mlh2ZDc5WGF4c2RpMjZsdnRTMGVIZWpkbWNSU09SZ2VJK21MVDY5?=
 =?utf-8?B?OW5YU2wwQ3NJWityUUdJWTlXMXlDMXJzUUdodGkxL1FvdVNia3J5U01oRUtH?=
 =?utf-8?B?TUZ3NlBNUjljdGNhOG5rbnlpQmhvRWtCWCtNckN2bFRBc01rZ0lsWFZMb2Ex?=
 =?utf-8?B?cGRRTXRrSy9zbnJlejZsdjhGMk1PZjd6aXpweDVYYzNPbkJKaDcxQjl5cWJu?=
 =?utf-8?B?ZW1iZHFuZ2ZrandONlpVTWhMUXNrV2pXcXRJYWg3L0hxMnE3NmpDTTFRQnBZ?=
 =?utf-8?B?Nk9oREZSNWJWemJQTDV2aHI2NTJ6dndRUjR6YkVGR3AyMGUyaUNLMlNxTnVX?=
 =?utf-8?B?aFZyNmJqUHRjcUl2R1JwenI5YTdXdFhITlVOU3pISlJoTVJyWWUyZkRsS3dw?=
 =?utf-8?B?VVJndXduM29JZExHYS9TY2xPaFhZZ1RKcFFwOGFBWkxvWUlTVUdNdkppbmxD?=
 =?utf-8?B?MUVGaThKZ05FdzNWTDZLM1BrTWlFaWI2dHorRnk1UEVURk9Qek9oSDlyU2xj?=
 =?utf-8?B?ajZ6VDZoMnBLd3BjSC9XdzFBYzZTRTFqVldBTlVtd2Z4Tk9UeEZlLzhTZVdW?=
 =?utf-8?B?ZkRKblhSaE9jMENVMEZQRm1mVnRIQnQ4SmdtKzJ5M0pXSXNDN3V3NHk5Q3ZX?=
 =?utf-8?B?SitvQUFUNS9CSUJ3NHREU2NhSTRTRDdPQzlvRWRYOGluUDBReS9YN1J0NExr?=
 =?utf-8?B?Smp0VnQ4cm42dmpzTk9LWnpYemV5VE1qVDVvMzRid1JwOFBNSFBIWTBtVThq?=
 =?utf-8?B?RFV1MlRsQ0IrbTBpWml0NWRlejg2OFpVdUVwS244V3JFdHBhQU9oRTlWVXo0?=
 =?utf-8?B?ZkxKYTR4TUNRN1VDSDl5Njl3ZDJ1MWxIQ0pBR1QraVVhT3RIRExXS1BQMng0?=
 =?utf-8?B?YjFGSDdFdmY3b3JRbWtqZjNIY1FFaUhTNFFFZ0Y0cHhkTzg2bElqZXVhM2x5?=
 =?utf-8?B?MU4yNWRZMWJINEsvNTFETGI3czVUUWlpY1grUDlydDlhQ0ZSVjBkRVBVNVhv?=
 =?utf-8?B?NXdMQ1hjbllUZ1RTdXh0QytWdjYrbkNONFVhb1VVL29Yenduc2sxYmVKSjVD?=
 =?utf-8?B?SEh6S2Jva3FWaC9QZzZrdEZFbUVTL0pTQ0NSbzYrbUtOdGpsZ1F6b0tpTVls?=
 =?utf-8?B?eU5JL2lJb01ZaGlhQWlvSkJPd1l2dW1qNUh3eTkrV25BazVMWkoxaC9EMHo3?=
 =?utf-8?B?ZVZwZ1lFUlVpbW05VWduZlVCdUllUDlEdGhoYjl5VzNEOEdEVlZVdUtBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S21oNmRZZDNpOGxaK3MzSjduQTN6NlV2VUFEZzV0REpacjA3SUZqMFBsMUZO?=
 =?utf-8?B?MWdEcTNpNTQwMEZrUkJNUmF0MHkxL2RoVW5XNTJza0tuL0ZYOG9TQlU2Z1Vr?=
 =?utf-8?B?MUtzdjhPc1ozZndkbHVaT29TNzNQNnQ3dHloS3JwNDl4enJVM1RrVGoyQkVB?=
 =?utf-8?B?Vzdhd3FlV1luUUNQaDlDYlVKeCtYRlM0cEFrcTliK0tpb1lqcEd4N2p1cFcz?=
 =?utf-8?B?Mi9nTGFmYzJ0UjN3RGkrS09wRVlTNEFvcitmTDVBUEFYSVgyTHdqVEJWZ0VT?=
 =?utf-8?B?bzc4Q2hUQUZSNGpCYXZEQmkwSlNwZnlGRnlGWmp4ZjF1NndDcS9ZeGg4cng4?=
 =?utf-8?B?SlV5OFJpYTN4UFZHWW10T1I2a1RoMmc2K25DODMrUjRrNU5VMlpXVEpFYW0z?=
 =?utf-8?B?eGFuUmlRS04xNWN6STlDQzBkUDE5Rk5WZXM3RDhNRk5sN29pRTZxWjcrdU8w?=
 =?utf-8?B?VmJMamNIaGVBUGluL3ZIM0xXT0lOMm8wMTBhVXBYeWNwdCtnT1hWWSt2YXNx?=
 =?utf-8?B?RjExaUNMb0hWSnVNTlk5WXZmMnZBYXdDcnBlL3NKVlhFdDhua1RYWE55Nkw0?=
 =?utf-8?B?MzdlV3JrUWNxYVVBcytQZ0U1amFvdW54UU5tMUJJY29WenprQVBzWVdONkgv?=
 =?utf-8?B?VHN3SHhocGNjYUYrb0VodnJjdFI5NUhoZ0RqNlRWMURiZm40dzJOUmlpZFcr?=
 =?utf-8?B?djc2SEk2d1F0RnJramxreXRETDM0T2JDOW9kbEZoK1ZCcWdpRUo0c0J4UnM3?=
 =?utf-8?B?eG5ld1g5OWJxWERsSk0zOFQ5U0Mzak5ZbzIyNjBvUGRpMTNuUlNpdiszQzA3?=
 =?utf-8?B?a09UdURvd3g1Q1lldzMwaVlmUVFyRWZjUmFqS0dFaDVXUzJIS3ZISVliYjZX?=
 =?utf-8?B?WEVjaEhYVGZWNG5aY0QyOTVjbUxvMHNCYUorajJqRkFiVVhJRVBxVkNsOU1E?=
 =?utf-8?B?VW1SM3BOVEh2L2ZnaDNvUk5wVHZzUmZtNjBNOUgxT1JGQVZZNTRIMkpPYnZz?=
 =?utf-8?B?U1dUMWhROE9IMnJ4S1hQNWdZRVY5cFlqeHJBRG84ZU4zRjZ5TnRWT1lycFZt?=
 =?utf-8?B?R3pKU1BFeVluNVNxdmtPdmdsRzM1cnBvbmsvVnR1VlFUUEZzQno0ajRMVmpR?=
 =?utf-8?B?ZUg3QlF3QjJsbUFKZEN5VWtkN1Z2RHFObXZ4a2UrNG1KQ2NhRDN6L1VCWHdE?=
 =?utf-8?B?VnNXNVZvY296RVQ1ZUpMV3huTjA1ajhkLzhtN2owUC95VXhqcnYxdG4rcS9o?=
 =?utf-8?B?dFpUWW4xYU9md0hpOTNQU29QbVVaWHFHb1ZubVB2ZW5PRFpoclBFVm9RZTA4?=
 =?utf-8?B?eVk2VW1uWk1zMUxpbXZGYTFUcXQzM0lDNmFzUUIvZ2svV0tuelM3Nk94Y0Fk?=
 =?utf-8?B?WUV3Ujk0N0tNZ2dIMHpCWmtWOFZYQ1NDbWVFRUIzbkFOUVJvVlhhenUxY1NH?=
 =?utf-8?B?bTZXbEFXa3dHZGxabE1yUnNKM3gwek5zQUJLcHdHNURXc29BcXNydHdkRGhl?=
 =?utf-8?B?V3dWVkxoV0thZmRqTzI4aGp6bW94UllNcWF0NDNud2VtTVhJNWg4T3dUeFhz?=
 =?utf-8?B?RmV6ZTNnZlBMbUQ4bjZvRjdTa050RFJLTWFsbW93Nk9RcWNlbmFSYVdNSnRz?=
 =?utf-8?B?N3JzVmhrd2tjSzBreFlRb3BYVHBHMTFCTUdzOUpCUTJTcTM1T2sxcWtOZmx0?=
 =?utf-8?B?M1I2TUtybEhBNG4vL2d5cmtiRE5hOUU2VTBCY0Z4OGZKUTdkTnpaekVTME5Z?=
 =?utf-8?B?SVZySHdPZ3hweStsK3djbkVWRWVDUFFxMEFaUzMrZWg5ZnVJSDZFV1ZmOXcy?=
 =?utf-8?B?TnU5SDlQYnc5WiszMG1KMjBhWGZCUlZLc3hsYjhnQm16MFd2TS9YbFJvdEFX?=
 =?utf-8?B?TjRRNGNMaDMrci83WkpldE1RaUMwNi9VOXRWQ1JYV1hwciszVUNqaEN4T01H?=
 =?utf-8?B?VjEzUUpzeGFYV0RZZG5MSXJiUDdOelI0TnFjcHpFWGJNeXNFTTd1ZHBuRkph?=
 =?utf-8?B?cEprcjROc2dna0ZqTVZSVVhRNjRaMStVYUxmVG43M3dCYi94Vm9YREpWMkd0?=
 =?utf-8?B?ejdHRVNUNk5TS2twL1NvMjdMcDV6dlk1N3ExTC9XRk1ETVF4aEJDQ2Rwc05x?=
 =?utf-8?Q?/bOB2yPTpFboiXf2DGyZ7EXL1?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JnkHr+D22Ri/s3kFmR6mhSovOo1AJuj2DQ/st+Treb4CQ+AkvVmzpl/QQskQ8t3U05mU/RIi5hlFt2u5L515cwzrouG+V2ZfRPoEa2r7GTl+m5tTWxFGXBZJIMo/IoYWGsI/kq4jbPSk9n2YLWofdsa8fJv0Q6mORtOLFbD7xwn7UAwxJuQTfczreEyssc1CfGhKqx1taA6DpCw+mYfvvr0UC8Idg+9BBnczzCSVz4ukceIGxHZ3+zcPrNWmNpG4e5s9y08DRPaYjrKNeOE+WCNDMjn6FbkXUo4kCLcEqvxvBOms5IKSUegcImlySVUOCNb03AcsEFfqsAdbMcVS+ivY6lwSmari/GYWHD3jPOtggxyXhR2xJ2DyW0VJeWSfDk65vjFo78VtZ7ih9GmB7I3hx3m4LPawLUxALp1MYk3gd939R+Ems6PCSBfEromlyATQZGhOgsw7Iz2qkBPMYSqPIVkHg/hjxQA1ONg2cRtpeZfSJNjIUw/NK6lnqj+8+0VmutGMdtGi1lkPPZqG4U/83uNnWDFg2kN7WUC6MVJubqsynJjS2t9nfJ+UesI5b0OQ9MKD/z19JFaEpY9e3aA82yB52R1FlgjTOAaRnlk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1308df1-0508-4ad8-b8f2-08dce6f11635
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 16:57:11.7529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlGGVi8ZS+muu3WLxd8Fxq48i1MlNkeJy06xwbwCK7Ziq6oB5d070YAO6dFLTixnBOR9NNeTJwpv5UX0sQ1Hxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4841
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-07_10,2024-10-07_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410070119
X-Proofpoint-ORIG-GUID: _p3TneFo7jdyhbGx-ikvYiQwfBraZkLJ
X-Proofpoint-GUID: _p3TneFo7jdyhbGx-ikvYiQwfBraZkLJ

On 10/7/24 11:52, Kris Van Hees wrote:

> Yes, I think that works fine.

Cool.  I'm adding a new test but will otherwise just refactor the 
changes into the patch series and repost this patch (and any other 
impacted patches) for new review.

> You probably could even just name it
> dtp->dt_nprobes (meaning the number of probes that is created statically),
> and introduce a NPROBES symbol that the relocator will fill in with the
> dtp->dt_nprobes value.  I assume you assign the dtp->dt_nprobes value when
> we start probing (e.g. when the probes BPF map is created)?

Right.
