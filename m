Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D63215193
	for <dtrace@lists.linux.dev>; Thu,  1 May 2025 18:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746123789; cv=fail; b=E52fw5+belgU7KpbHkjvJolT6hOUzCBHug7QNwDqXXbd69+Ny/3X2TJvjYFvN3+5A/RbemsZo61BsYJekbtVeG0JLTbp+TrChVnElSM6/woYOVEMg5g94OPl1ErkDj2YHZa0TIKahKO2OoASt5zXerrl+dAxGZUpfnikm3KP1Yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746123789; c=relaxed/simple;
	bh=V5Wh+vkpIc7L7m628CUUPCULtLfbSSC6bKLSU1WbCh8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eZqijdhLU+81vZBGSQJPFEZTRMsFaQgx6jMOtRmjKGZINzYf93sCweL37tkv6gxn1hWpHDpAUL4l+jH/SFAG+EIcgwtSDdCvwkVNtnr7IwOuo4esd3h2MhyA6WmXnTY6NeVlw8B47Ta2pcshH6A38VujJei2+Puoz+I2A3FSndI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XIl2kttK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Yopmcqs6; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XIl2kttK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Yopmcqs6"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541Hu07i017333
	for <dtrace@lists.linux.dev>; Thu, 1 May 2025 18:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=xpv+MT2ofXDgMG1xzv
	tKZcgkbOsjj63eS6mcCYdEcN4=; b=XIl2kttKgl7jNAsfHFcPHYk7x/mad3gcpg
	6GEkM6UGE9EQpxZYVAtx1q2vFsNRJWTYeQKezg0vUyCTkORD2EJv8ODr6qbesn4R
	FuOL4q8+dFfljSxE5GO7yrxWGQUhOYbryMFkdyuyaP0m76M8gh3TNIVcNdj1CBeR
	CCGJXZMnpxLvR/hwaYZQxCaFVNqiEjAMIDKybE+7vCApJ8BKd9yqHEF+F2rv9wWf
	vND6MoasBnv7PcZfD2xkfTRJIhOgST/tRnaY5YE64A554FkRQ+I9F+ZetxWG8ElT
	zlmv7/UdKBMMUHWwMN4zRLx1iQUyFKbHc2NisRCNQPOr2TDGBcqw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6uqkn6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 May 2025 18:23:06 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 541H89F2013769
	for <dtrace@lists.linux.dev>; Thu, 1 May 2025 18:23:06 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazlp17011024.outbound.protection.outlook.com [40.93.13.24])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 468nxcuwtf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 May 2025 18:23:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K/I7hWncICekB0CgapifOv6rJDwjiXhJfgi7UOOSBb7VgF8vl+zWZOSi4iOBLjrweyNcGX2Xn+gFTW3scxMJfUmBHIK1cCEQCg9eklLECTr6qOWzJnZcZ7U6R+d5hQ6Jg8NthOmpNjCoAREkIu+Qpd2IrLoh3nkp1E+EB/mqD4kqutg08HAJ7kXs4yJswF5aT/q6nQs8setuUWRTw5eBw/AMVLTbB+2HkogN2S/L9P9xHWnKDUNJO2WcQ66j+FGywpH/GCZLcqkf7KTociGSiRmJL0J+0QKjsi1vcEXI4qsE7APpw3Nob6R7JFxkU7tcx95oPGOFlkeHoA/TQxMEiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpv+MT2ofXDgMG1xzvtKZcgkbOsjj63eS6mcCYdEcN4=;
 b=Q7btDQVpwGp5oI52KNvIoBa3qaMxViZUGqy2HAlFF3KGUxyeofU/aKAGXhy7jgFHEZf1GMyHFgHKA7u7amygpAdZbk8pRt3wDfFsrb7MeSg9cd/FEIMhcbAev78ctdZRxps9x0dcZzPWInWABLpjE+6gflLkG/eLhc1wK1NH4G2DETkm48jX7pjYujbutel8CxNBpC4sni8GUxlRO8V1Dp83zftEVFkRjRZVtP33mNhU61rKgPMeYuQ49G+OlzGpe5P1BJZH+T27fvIUR0Z6zIjNgZzmDDeeafYV92nfurBheuhB6vjNPJKHe8oP4UMD28PZzc7AIDSc7QYms6+ICg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpv+MT2ofXDgMG1xzvtKZcgkbOsjj63eS6mcCYdEcN4=;
 b=Yopmcqs6y+ww8/4Tga7k9ZpwOPq1CqlOoUaOe7inLDCzpzO3ybsGLcCQ1sRxhfhVxE2YegpkmRnEJ45vElumz0enRqyfMzxMST/K5BxH5rd4pWLmQknue2T+JxjwFSwg1RFSaGue6w6I6zHBGivdWIfmCl83MCPPeqhaYdmY99U=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA3PR10MB8321.namprd10.prod.outlook.com (2603:10b6:208:575::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Thu, 1 May
 2025 18:23:02 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8678.028; Thu, 1 May 2025
 18:23:02 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/3] test: Mimic dtrace arithmetic more closely for avg/stddev
Date: Thu,  1 May 2025 14:22:52 -0400
Message-Id: <20250501182252.27772-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250501182252.27772-1-eugene.loh@oracle.com>
References: <20250501182252.27772-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0170.namprd03.prod.outlook.com
 (2603:10b6:208:32f::17) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA3PR10MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: bb819191-1d43-40b7-35de-08dd88dd3599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yYNXGkOMsaPslpI21OLMpfvHF0XoWe+sObhXovCsBwlMH+E9F7AAbyMT6IOU?=
 =?us-ascii?Q?pXQFF7XdGeQ+etwZNDj021+W/um7wq273GMdsSicVu6R6qVTsku+nnROB+Ct?=
 =?us-ascii?Q?FDFHA+sIRTtlFwtKkMIsxNpoYYRWgochKNSgWzorthAVqKDDVsuj4/aSTBGc?=
 =?us-ascii?Q?FO/OTnKHvcLmrqR0DFj1TwZdhr1FNXoVOAWslBZ08g/6/1SMsO1rCINWZstk?=
 =?us-ascii?Q?hpobJ78gNvSPPz5SYGtBXyxs/jzVNn39JA5H+yBzw/tochp/WWhgluazizdF?=
 =?us-ascii?Q?fbBJz8uBJgFMGIULJfL2gKx6D+xi1Ngnei82MA2qp69AxGRoJFMA1QUZzpFm?=
 =?us-ascii?Q?1Qjzs5hhSu2YVwej5pOifCnCxPGpkmqD7867r/8jtUk24/tD14/j/0NKHlnn?=
 =?us-ascii?Q?xX3cHuxVIcaWWrXD8A6lHPXrGTOdfGz48oI1EdIp+WF0QwyMtooWKQIRsOER?=
 =?us-ascii?Q?Fk7S1PVoP/97TYpJWbtTU4CTTLJY3TcQ+8qvlBBy5fSDjqOMLf+KwqlEUvl2?=
 =?us-ascii?Q?XEwouBN0b6qg/S3UT5Ly58X+XyrVLDGSrpcURyYXsWfxr/6Dv66LMegxEXkg?=
 =?us-ascii?Q?BEscgLQIXSY6Z5xz70hXxmmta55XreLQwv/af6Xc2RR1+e5IB/730Nqq1A8M?=
 =?us-ascii?Q?vyX4tDlOF2abE4l+x3LnztjqqzcHr6AoStWFTEyRMH3jCzitMS31XfuwyXHJ?=
 =?us-ascii?Q?m/1yxrMi26gYpV+WZ4d9I4rFYPylnXFqqruLi0iRoRS92RcZeUv4qpYCCRkl?=
 =?us-ascii?Q?ceKfJQM7Rx9741pR5dNID+1y1/5AXmS4dKrdhYd1mFkGcxVA7MCyDDQtTYLw?=
 =?us-ascii?Q?q/vGtOPyl1eqOjwaxXTpAfayr2zBirKyF990+mEf6yTL7A+HMgYM57Q05e/H?=
 =?us-ascii?Q?4lvu6bntSYC5IYRi44xG1C4R+CEqBWRBQ5CNT2vJsO+NOQF2FpisMJGXHiAs?=
 =?us-ascii?Q?j7BtP8VBmj9UKu537oQNTmrUCcJ2qC/OBZLLvitHjMtOSJO2ULB2pp84EtvR?=
 =?us-ascii?Q?HZPRCxBC2RGDX7YcnLV3LrxV9vpnH5Y1YwE710Txm7JafIKiXrPPCf0u+vsg?=
 =?us-ascii?Q?JLIcsjDkVpCndY0yCph9ytz189ryicU+LgMDS6rvBk7rk3KKyQSo5ucVyIZI?=
 =?us-ascii?Q?Rn2wU0fvI7SJbSYGKTHqkdkwwEiYI2reuDVtwgzyZ7ohnV7aJ3qQ3+VN04RW?=
 =?us-ascii?Q?WjruvM2+rCLLWQ+g9qLlPIzOWlUCgnt5SLtasoKHzwnP/0XSpOLOUeD2QEDT?=
 =?us-ascii?Q?gA8cvp+ghqCI87lyQxEo2SnLSCXWwj/ADnEM3ZQcxTEuHjrfcejedorFq1+k?=
 =?us-ascii?Q?Ni+CuJ/397UtKprS94NhH0A+fMJ+63tVEeofWt6Wlo6WDy/rtmXp6uZHybFa?=
 =?us-ascii?Q?WUlgAKhQfLNnSADwAxFbbEzi6jF8dbjXc+6ZZCA+EXx9F1GCzszJaS5909ls?=
 =?us-ascii?Q?KY+fX326A3o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JJ96eTmydVmNyOgeCnUbZGc0d6UEYZEV/rpWEosGlnKqrQhjRJ3Ah2XbDW+u?=
 =?us-ascii?Q?xLvoDnwtpDH0PilX0xslBqX2xajpOj6svY87DwLP8aPusJG+Qxe5AZYSjjxV?=
 =?us-ascii?Q?exjGmDh56cphbyR88MqsiCIz9mXg5drqiP5dWQWMV+Gqr1KscLwXdDJl3O0V?=
 =?us-ascii?Q?EFyaTEzvu0qfIUo+DVgYPHaWN563Oc8eZzJ9m377tFpzaIm0TPnJKTbLETri?=
 =?us-ascii?Q?mAa+GxHXwNAUDFaHWrBj1qGj2rOw1aQaS5X2hslws9G5dTWUOy9qvcHVFu1r?=
 =?us-ascii?Q?1CFQmstatLpn7k5Up1NQxJiC9sWKCgjy5ARS5kKxRGrxtB3G+8/z7NqHYNs2?=
 =?us-ascii?Q?OIlRkF/Aey4TEFvozTx91pNC1tpzjmUPulKfEDm0ML3+hj6HEm2YuSAoShgI?=
 =?us-ascii?Q?zm2kLfCaKCsoKjYi9QMp4izUjsNnvpTyDut0ZAnsR33/BSj1e+CTWxHW44+Z?=
 =?us-ascii?Q?5+jTMxP469FzmtPqEqKBfduBBzmz8PhAgSAdK8eSMhZ1zupa7MKHJ3UO/SiK?=
 =?us-ascii?Q?gHI2wk7ByxNvYPHT22M1GfdvnNuE7/SV3nsJ3DZGXdu0y+zfYScP1JuoFUdu?=
 =?us-ascii?Q?i8E5PRa4wgDtOzMDYlYYdZhGznuCvozD2xM+8DgEd0dHfCihwh5W2aRbSqj4?=
 =?us-ascii?Q?PcKhtDMlPjT31ci6kGO2eKX+QnOwwDpNbraPbW+zP+KgDl0wTaoDtRv7EUwc?=
 =?us-ascii?Q?bj9lfAvejMZ5Ja1ttXwWGgoIjwIQI8xOOP1wLVxZg0wT0GYeU6LFEI//Hh2l?=
 =?us-ascii?Q?GZC1b1zyilD4vFRLKB9cd8SpHp+PdCQzx/UGZtp1wQvcFnne6uk9jCok4NjF?=
 =?us-ascii?Q?KJkdFRUeSFYzfH/6YGDaniz3mCby+oOsy1C0BFN5hYfFfq7BH05rIyWCZfZH?=
 =?us-ascii?Q?ebRHT/mnbfPfPTCjnjjHO5ASBtAfoLvcshfU3iR0NGMu4Z4lAQYhUZa2T4V+?=
 =?us-ascii?Q?KJhWEjiWSyyjZB0LxYPaLQFvf/EpV1c+5pMQh4KT65Tb5utFouRDr5HpEH/S?=
 =?us-ascii?Q?WtJmFr1Vsm0maniwC08l+IznsK2y7gcP0scj9kkM6QXsBzLEOZwGBJpLneUM?=
 =?us-ascii?Q?K8Aij3So7phbSyPX858G5b6hz01mOHOftxXd+yqxBMVP3aYqEEaEbdaiPDKo?=
 =?us-ascii?Q?O0arAE6VnMGLmIvcVkUehOoI/ckbArQarAD5lwOcJsmqPgodRn0oKMT6/wBr?=
 =?us-ascii?Q?8hYsehappNtfogpAl2JCiubXFg44Ruhd70lCV4k8P3lkgs+FVw42EibThlz+?=
 =?us-ascii?Q?pVv9aXsQy9oueUFVQsCBr505YThPDukR+tvuv8YvocQwZSrOWiuWLYlw3bdZ?=
 =?us-ascii?Q?qKc9Yh0H3XNhQ+tfWaSuRvzGU/6AzU3TDM6zzXKKIVV8yofWB+1oKYOc/Pgl?=
 =?us-ascii?Q?1UV64diOP6dYSu+To8XSb+uSdmxAyW0ePx4rJGcDbgTlB2flDNTioS0yXP13?=
 =?us-ascii?Q?9bRth3UxrDnO9bkKiaxEi1/K8eDcB5QZy2dPQqTriQ2gfw6JuzzoFFauFAi0?=
 =?us-ascii?Q?A0gnXN42V5eHcIXSa5eJ8JwHRaVLjbNq3AUH6nLrC3gKax/bVtY1WZLNMmgI?=
 =?us-ascii?Q?hMnuq0TU96/eWn2hQIWkjy8nRdyyCdEWuyX2RaRg?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZAoyS7fQOILJDCJciK3MHbQAeyVQQf4nH8A17EUs+FPH3CgV9UnDGcUrs3j38yplIlFLf/K56kOYys6orJvJ8PqyNf7/wAT13+rwy3LCEKgoOigueUQzy9pg7in3g5FStWwhuL7wWr4P2fn8fygqtYmYU5iMrYDHdumDEgmYSVXpxKZz0p89KMDxbbKreExhlo0akugp7EGZF3RwcEL7rkcAQMhtYCUBjllvxGvrEm5/EiCvOQstCaB2AjZzRoNehylz4rdB++uHIZyAY3EDTWpyVLJhBCxympyEFTdnNKXi9y7sZUo6BZKCnUYPjg0wi2qLbgcGf4b6N5GmfSJM4fGX0pvioXxJjCP635/gTs1L1oND71lRpdFf+YkrnAYVZzWgEydRWtHw7qQ/2e38Y1qiJG2/lZA4tQElUqiuP4p7zV743LbOEuU4s8GXATVvl1OXjnoFzBow46dBdK0/f89kT/WT3MLT1lDXBMYFiSbRAUP58uxQvGZF3pKtb+4l7QCBO9XHe0H+U4+Q9tiylt4U0iIhhSJkSdRt3+HJrKSRFeXxhWPB7ARs1LIYWjXjqm6tdfeKdvSbwDenZZQQ83nA+GjJh4mznfswMjKiB4M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb819191-1d43-40b7-35de-08dd88dd3599
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 18:23:02.6452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7qVkLsBmf4Xeu+dxCZ8cv7qtNxHxAWXZUonbzNK0ScnQJDX4iFqiXAfOWg41q1bg49dpcf2mEXNIwDKXD+l0mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8321
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505010139
X-Proofpoint-ORIG-GUID: UautkgKVtlMaITFRjrA1XDk82XAHKrlI
X-Authority-Analysis: v=2.4 cv=Vq8jA/2n c=1 sm=1 tr=0 ts=6813bc0a b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=SQagu7kjkfL4hs3FWLQA:9
X-Proofpoint-GUID: UautkgKVtlMaITFRjrA1XDk82XAHKrlI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE0MCBTYWx0ZWRfX5JXenLae9Z3p gyeg9O6fDvbNEm4tF+k2H128TnReLdjwAMhWWz17b4HwC7c+QVZgYi7h1Sy9hFzDqwaUU9fX7pk 2k2dSiLVjpKC9fS0o4f2wcA2vB7tFJBImnauYDswS9oLl1DAOBu+RkC5WcvAgfqteY9ArVKlx93
 bHanXpEUx1HJ9Int7uJaAiKjaVk6qoGOasl0xSOQLjwOAPKpcah11ugxLT2XTidYDXAv6bbkn3Q BTDgTpBtHjEnorVgD4cCMHUEv3aOQNq+uSTRCU17Q0IgZZVvnx+DZVXhZfnZyPKSHc5OY5Luycj TskmyWDCJ1RQkXBLdjc2q1CrraDM3oDZ92+ovRXtnT5DNymHSEsFAktiiq8D+/k4Uo81yC59fbk
 P1sYBeAmZDXupynqy8HsCjplHfo1oVsPR3QQ7I9WWDHKv3UTGj6VSepRRzbdp/QPGwbEyVTm

From: Eugene Loh <eugene.loh@oracle.com>

The multicpus test checks that data from multiple CPUs is aggregated
properly.  Operations like avg() and stddev() require division.
DTrace uses integer division, while awk does not.

Change the awk check to truncate intermediate results after division.

In practice, intermediate results are typically integer values anyhow.
So the test has generally passed.  Non-integer values could arise if,
for example, CPUs are not numbered consecutively.  More typically,
there may be a problem that the profile probe is not firing on every
expected CPU.  So a test failure probably was a sign of a problem,
but that's a different problem, one beyond the scope of this test.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/aggs/tst.multicpus.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/test/unittest/aggs/tst.multicpus.sh b/test/unittest/aggs/tst.multicpus.sh
index 50eeaae44..46c668867 100755
--- a/test/unittest/aggs/tst.multicpus.sh
+++ b/test/unittest/aggs/tst.multicpus.sh
@@ -79,10 +79,10 @@ gawk '
         # first we finish computing our estimates for avg and stddev
         # (the other results require no further action)
 
-        xavg /= xcnt;
+        xavg /= xcnt;            xavg = int(xavg);
 
-        xstm /= xcnt;
-        xstd /= xcnt;
+        xstm /= xcnt;            xstm = int(xstm);
+        xstd /= xcnt;            xstd = int(xstd);
         xstd -= xstm * xstm;
         xstd = int(sqrt(xstd));
 
-- 
2.43.5

