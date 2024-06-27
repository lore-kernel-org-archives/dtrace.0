Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD4C1C6B7
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466799; cv=fail; b=EoUZJnkA0xf+P9NRE+0bYmu2+comV6ux3VoG1UGrjk8TdxwCKBjH66SESPW433UAXupQCI5G6yES7x7N0t10IxAOV3DA8kNB78gdaIi0sqOPqfWJlgBDt4Cwv56IlwzcpzitSkUUbwVcbL8yAlyAmgE3ABCbmJpam3CLcWd0sKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466799; c=relaxed/simple;
	bh=xk05fUVgdP/1a6OriH2obaJaers6D0LNFDGoHDDIyfY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KuiZZpk4h2HhJnLRKAsXEqVzfv+/1MR03sJfjU6grKDO30FOMcNBhe8X0X2DtNr4KA7M87aZK7Cqc/oBC+sAKUEsMqXpMeXnZTGx/RUmEIeVimKN1RJRH5veY4YgV7bpQb2pU9Iht4sS9mZz3BYgRsMTk1rdwkDxXrBf+3P8ieE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GoY+K268; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=F/BZuYfX; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GoY+K268";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="F/BZuYfX"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMW5v030890
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=alnTek/Sc8+TeH
	2OoMVWsKBE/R1DfekDSM24Lbyfpq8=; b=GoY+K2683OOMD2g3gvCUjfVMqA1nVk
	THXQSnQjsD71kPjPQxwNl5YlUiZS3XQeZjIheHh0AeUa8o3rO0IEDUa4JqdZbUqE
	2RNfyQcirQLJPMdocqsqLTo4g2FVy4FteBURMegFdy55U4st2tRhSu+mQ7Jc8ovY
	zkQq444bcUEnjMX8h0l2VcFoHzu8sIcaCdUWf5zQLqDfEnHEjFAGYPAxkKt8RRjd
	W75+9HH8W9dGiD0AISUlXEapO37nF1V/W87ccHjUyOj/AC61hHtT3mlFjciPmE+N
	yAbnGTy4Dm6YO10S1y8CiOT8N7dyyE4w5vrFIOG791TeeiyTDlQwIgrw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywnhb52bw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R5DqqK001347
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:56 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2an2du-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=La6zIKfdceEy6Wktl0KnSiJzxKQ+xckMb8ChHKZ7/VRG58JFhIBFR88dFQZskRNAjRd8a0knFLJ6HoJ/PGw9vPaTKOfKL/cOR6IMVggef283pUlnmMcn8qdwrbPXhhwEKhtzFhIDKYxukCW0WVE5CCakHydVTjHoM+G9SrPEJrnLQ/+Hf16zYnyiPLLuF+4An2Y0aKkmVtrynkF0zd3Jc0o3yFdXdOVO5cvNzEjJYQarV8Xxz2MOHLctmrOPHToXiaM7QNO1JABO9wPKo4gNYuFFWUPzT1CebNLMM9KtRy3DW1Vvpp/KVmj9scgoHxhM7y97CkhIrp+B+83W00WAug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alnTek/Sc8+TeH2OoMVWsKBE/R1DfekDSM24Lbyfpq8=;
 b=PIIVPQXSxeAmcJclPfDo3tH4cMNBdE8VtcHQiJbFKm+xa2l3JFkC9n/4Ujhr36v/dtFhTvc9NKZ0ZZiSkk1CG/D6Tpo2YKsGecLXPao/xfvu8GVNDWrTMPpd8FeDjAWQGL68/W6uB8I0c4lW+dG0Rv+4SfI/YOu8smEhJ//MSicDEPbvPUJPsdmxF0n6RAUFtLWzA9BXmIsUmEdUokOVdw8BcObLeVm4aKrdOrnrJubMXVGGS/wS9B5HzpJ628V6wQqglbpQjTlDSx/nMHck/Ii2I6VEbIOOe+NGvt/hHQfkjpsgFfBnkVDBjzENP902c1J8jz+FFf2ldu4js6L/yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alnTek/Sc8+TeH2OoMVWsKBE/R1DfekDSM24Lbyfpq8=;
 b=F/BZuYfXGkBYbQFA59sqp/OlW1mNW1Fxf0uaQXsFJteLTbyCZn4mz0r/iD7U/XJqNPIgZlkBK0XhLjvLvLL7XxTYdD2IQ+HBwNsmrsP8o+LBl+py3krvxHEOOhnYKI3tbExQxD4m/XjObjXLtpp+O1ke+Ngj5o/Oi2YU8grgXEo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA3PR10MB7994.namprd10.prod.outlook.com (2603:10b6:208:50b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 05:39:53 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:39:53 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 38/38] Systemwide USDT WIP
Date: Thu, 27 Jun 2024 01:39:04 -0400
Message-Id: <20240627053904.21996-19-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053904.21996-1-eugene.loh@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0044.prod.exchangelabs.com (2603:10b6:a03:94::21)
 To CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA3PR10MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d4d9f1c-0f3a-4839-3ba7-08dc966b919f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?h5os9lAExGwZSf0PDjbrRyL+kO7EliHOQ+DttTM6X8amrPHFGUX4N3YGbZxI?=
 =?us-ascii?Q?87DnGoria0s3zg6BjWDAusGKSDpmCFSiSvZ+kEalzO6XvL/JCxRNZl5a75oA?=
 =?us-ascii?Q?KSOanHXx5Kx6UiV0bHEQx6AMWb2DLcZI+1GKKczXXlZX6gdcdAX4paEHJrre?=
 =?us-ascii?Q?xlLSaEdNli3aXxHWzPOyd8xvUhA1IDHx5c9rrEUSMRDlVjM8M1QBjsfccpdJ?=
 =?us-ascii?Q?BgGzk3drAilDTC6GPXVTWLyQoBKiD45gmU2eSkQgxC1SaMsYjKKvDPjyNsjJ?=
 =?us-ascii?Q?2oOip/aAJ0v2HStYfylxOp9EM1+V5zjn+L0ZZ47gCMe/gR7q+RHjbLoW2SXL?=
 =?us-ascii?Q?hk0XS2wB5/7YT9BDd26n3pkG/NRnxa75BOLb7CIK/d7f+0uKECQKSfK9xTBb?=
 =?us-ascii?Q?8NbmJqH9eXF1zTbsdkCkbZV1ueRPb1rI6h8IH+FPKy/3Vn2Hqn5tc5V1FC6q?=
 =?us-ascii?Q?7a2LZyfb7BfaMGgQ6s9sKC4ht8wHi1TMlDRWRoXEn+/Ai6Vh2Q2wOs/rJZPJ?=
 =?us-ascii?Q?KAjPoUZiftVmzjFm9uwgBQUxqYMqUx46kXsolbrwSFJdeIfuXXpykkdqq0TQ?=
 =?us-ascii?Q?U2M6ZPFVtJXnT4jJa+52+bVef2/ugvN8CcM62JD7qk+NLVYorgOO34tTuEXD?=
 =?us-ascii?Q?DpacHghD1fhg1/X7ULVBcbWZizQOOvQSmeTVUAgn/tlcl9cJp+iq7Qfc1qE9?=
 =?us-ascii?Q?GwhONOR2O9yxmVjXZOY/iQXhKMrSx3NF0zI0aN7ZfBfHIfjJcc1Q78Gl2Ohy?=
 =?us-ascii?Q?NeznHipOxSK+RzHI3H+2a2rkaEiR4tmcrGVT8L8mH6X9/eF0dpfwRLcD1o7I?=
 =?us-ascii?Q?OMhNMinNf0eztGsMmJ1O9pjdjHAckArIoKaHlBD7/3mYqgPPDhCtQGt5HQkx?=
 =?us-ascii?Q?lvk/cBpfQu5ldf65T/yuEkpCObYk4s8hbACMSWCSjKuoyfh1qzI/kuxy5f3N?=
 =?us-ascii?Q?PcAT0kILtLmmbaKQHa21OoAlwLwzRlxaXWTWjPIZUuX3LGFEUnCZ+fX+nyQW?=
 =?us-ascii?Q?Txg4RGu1ZZI2gdMcAtTSgUxKMlwu9l3qThYa0b9+DBsFxl9jWeWfu+EHMM+D?=
 =?us-ascii?Q?Kh/n3l9iwTSTVAEPpIQ7bzvtOwEf7EHCK/wtumQeWccIhXyH7bdm50tAI4+/?=
 =?us-ascii?Q?AAbsONRxVmrNzkKMuCc/prt5NcDa27tFnaIJU6kCeV9ymff7d0zUPnOWiE0n?=
 =?us-ascii?Q?3WfZzFsluFbG0/wGPzTH2gBP9ltzeBBnohHwLRifejTOKJW2Idj0AOmgnDnR?=
 =?us-ascii?Q?hgUTVQYTZSVjZFYyCv+4UUDs5oor9W6c0kEUFFaaQb52JINrH1SwCrPz/N5r?=
 =?us-ascii?Q?RJrdDbhQ6NiJNG2A9QUY4QR6OFQiFgjvaFB940D4IQ5lBA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NMng9vcsX/tE7si5+fWq2Yr7NiGp/LUMb9D3XgZF0YK3TCOSmo/n8EoyH95D?=
 =?us-ascii?Q?s2YDZdNrNusEA7Z/vqg/ZuIs9p9ESJPV1tPF7AN3a04sMaGWlLGIQlkhQV+w?=
 =?us-ascii?Q?V1dmb2ucn9zUTbzrXxKkg8gJTBgRVM/bGoePIr3rzXImNC6OXggPIxHW6GHw?=
 =?us-ascii?Q?yrszfxAeVUJia1jqrcSx4dTup/vOixgoxG1wYjGzwFj0Dsh/zWotiv5VOCVV?=
 =?us-ascii?Q?k8dKLetuqdHSPu7vOV8+Y5DHsHlsM3Q7C6vnz1BJLSAXlYuFSkajy8X7pBb6?=
 =?us-ascii?Q?pTsvNO07FlM8F3dKmojuCKzhULf7aipIjkCOySZTiqX9OaJ79H9acgmhg3dp?=
 =?us-ascii?Q?A2Zzs/5us/FUwqJ90LlmytLMP2PN4qXyhnRsizqFtJAH5GEHgRUEg0qhio9L?=
 =?us-ascii?Q?HU/xCDiBAVBvSJi6WPU5R83gs2DVkJmnC8GOd8LemyFd1w/4Y1ldi45Yg0hg?=
 =?us-ascii?Q?HIYQdDgmSSFiiT52JLQ/EJ/+LUKj23vWKcMs5g7Pk5y+IPD9WI0CT6RAUFxV?=
 =?us-ascii?Q?8qjCpL4y5rB9JGQ90rZw631eVgL12vI66VfylMiHH6tdjq6IPng/hGEfuWNR?=
 =?us-ascii?Q?2CitEgyWoMZ6ZIs2lcHH9t15AXVKWU8k2iDNNoHZO/HddK/II0hlJlL2njx6?=
 =?us-ascii?Q?hjI/svi6kVWHBrOr75e1DPg/6lLlD9uO6aYYew702yR+Wpkvw8gMXilZyW9b?=
 =?us-ascii?Q?ZVHDLI4/+gErgCRqDqo7Onqq5NJnjdjWQmTH2Pd0tFwbwV3O0GCvGhnd3wjz?=
 =?us-ascii?Q?t6I7uK8/iaR0dIrzWFzSgq+j3aPR+nyj4vKGR8kQdTU5S6xID/sucd2VzS/E?=
 =?us-ascii?Q?+NVXXUvKxyTiODlaFBmFi3cg9gIjgrGVky5xm795GrlyfomebhYw5DDBPKUW?=
 =?us-ascii?Q?emPAJvlIkp2TbHAcD1nyKLjpV/3aDuEmcH+e4HmiRb1i9M7/QmWhXcQ/dWsJ?=
 =?us-ascii?Q?cDF5XbwyolSZk2Fp4Jc28t9v0D5aWTQspXo9oYcoU1yzrd7wqBw8R8LgUd9V?=
 =?us-ascii?Q?VFXeMl3jsUYKMlEqGQ2UNX+ZdQFcqk54MSNJGrWS8nNwawCvqxwrejrrV7OG?=
 =?us-ascii?Q?q0JvSri54xKi3zBsgF/xW14YkL4xuigKTylC4YO0rcyU97+dZHSxkm4cQfEC?=
 =?us-ascii?Q?FPAMQeFWSnAWY4AwS53TzTG1S/4KkGtHlk2aKqrgMQ3uWvmR/WiGjqbdwQym?=
 =?us-ascii?Q?5DJX++BXCPvcqijIx3pGS0xtKbynLAawTt0TFhpUa2EJF01VVsNESwmpXc9f?=
 =?us-ascii?Q?JxEo1EVm1Z8+s+edoOWXyyzgvZ8oQd6Hw/0fCA+3W7k7bvKZX21iNwOzfEUl?=
 =?us-ascii?Q?+FV/DWZ885sCzbI/mmMXrE3UExEkomxSgUebBdZhAHNur9hTVr/ttvur5buR?=
 =?us-ascii?Q?xWPaabTCNDb7+8RPmRPFJAGSYRvk1pdRHspKJaPnyjBGMpYYlMNqLeIMPv8G?=
 =?us-ascii?Q?sRJlTY2nK8327L7NbKAtW9TkSLasrjzUI56RgEJv/vc03XCGFDgRZH56SsI5?=
 =?us-ascii?Q?ODTHY/yCzA0E6ekBYk1bGvndb8IUrojE8lQquIkgMW42zCtvMcqC9Lz1+yOX?=
 =?us-ascii?Q?7VnKlDXsZdkVzNW+LcWPglQogKw6goS0JvlVe/bL?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	T+w/IbPMF0uQsK6BVPcCEeyVCNyLfMXQh3LafDoU8e504Uijkye4SnsneguJAiP81U8SvJ3lMcvBK0S3F8nv/8Rin/Q1vPwDyyeCsiUweLuWDCI140u1oA9smX2FQU40wemMLgAqZAwDWwfGHm530pM+D5B5sJ5093S1WRl3AE5ARRposTiBfM1WnwrwPWb5XFBFDB1hF5QOHNJj796sx02OhlodmDFmvO5xgRQPPV0ZEXmcWOaRxLB2VJ4DUAzj2RUOts+zJK7Lh2FHQCYMuhuOBm3sKMcatmX1aDtptEPHyOkKrhSYjumKSNku4QkH95WFDvZ3UEfDHgN56XaCZAynM5rYubQNwoMCTY8jWCZqIYCcOH8TUTJDqEPz6wVqndznVFSUCor4/pEWJipumGWxRN0QYPCbwm/OZLFONXSA1c27i6cXA+e5zZJYvaVL0AiyXrWsp8XSFAyB++ZCEJ0pIofsM0nuV2PkbhXob8v52rZ2lEBU1f6FSvdf12sNAJAfyFlkLcmIhyVar5rhQfGytb5JvRsZCuxiCHvE/v6qsCMnZurUfs0LlAXKNeE6aGOJPfSKjmI63VN4xlJkbglH+qhMgyOIOjHYoNgpBKM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4d9f1c-0f3a-4839-3ba7-08dc966b919f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:39:53.0369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pAiOF1TEJDsJHU9HE/3Aks69A87vlUC646SCIYmedTj0TIbfx8sogRVvgnGsiAN2wigjz3Fx5AckAS728QE8GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB7994
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2406270041
X-Proofpoint-GUID: fF3fzhaNWiGTfuOOTC7aOhMBD_baDWc9
X-Proofpoint-ORIG-GUID: fF3fzhaNWiGTfuOOTC7aOhMBD_baDWc9

From: Eugene Loh <eugene.loh@oracle.com>

need to:
- review tests
- handle globs in dt_pid_create_probes_module()
- add process monitoring / inotify
- deal with FIXMEs

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_cc.c                             |   3 +-
 libdtrace/dt_pid.c                            | 133 +++++++++++++++---
 .../dtrace-util/tst.ListProbesNameUSDT.sh     |   1 -
 .../dtrace-util/tst.ListProbesProviderUSDT.sh |   1 -
 test/unittest/usdt/tst.forker.sh              |   1 -
 5 files changed, 119 insertions(+), 20 deletions(-)

diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index d09a9775..3f316775 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -278,7 +278,8 @@ dt_setcontext(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 	 * and tag -- we just have to longjmp() out of here.
 	 */
 	if (pdp->prv && pdp->prv[0] &&
-	    isdigit(pdp->prv[strlen(pdp->prv) - 1]) &&
+	    (isdigit(pdp->prv[strlen(pdp->prv) - 1]) ||
+	             pdp->prv[strlen(pdp->prv) - 1] == '*') &&
 	    ((pvp = dt_provider_lookup(dtp, pdp->prv)) == NULL ||
 	     pvp->pv_flags & DT_PROVIDER_PID) &&
 	    dt_pid_create_probes((dtrace_probedesc_t *)pdp, dtp, yypcb) != 0) {
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 996543b1..079377ec 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -605,6 +605,9 @@ dt_pid_fix_mod(dt_pid_probe_t *pp, dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 	return pmp;
 }
 
+/*
+ * Create pid probes for the specified process.
+ */
 static int
 dt_pid_create_pid_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 			 dt_pcb_t *pcb, dt_proc_t *dpr)
@@ -702,6 +705,7 @@ dt_pid_create_pid_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 
 	return ret;
 }
+
 /*
  * Read a file into a buffer and return it.
  */
@@ -780,8 +784,8 @@ validate_dof_record(const char *path, const dof_parsed_t *parsed,
 /*
  * Create underlying probes relating to the probespec passed on input.
  *
- * If dpr is set, just set up probes relating to mappings found in that one
- * process.  (dpr must in this case be locked.)
+ * dpr must be set and locked.  Just set up probes relating to mappings found
+ * in this one process.
  *
  * Return 0 on success or -1 on error.  (Failure to create specific underlying
  * probes is not an error.)
@@ -795,9 +799,6 @@ dt_pid_create_usdt_probes(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t
 	char *probepath = NULL;
 	glob_t probeglob = {0};
 
-	/*
-	 * Systemwide probing: not yet implemented.
-	 */
 	assert(dpr != NULL && dpr->dpr_proc);
 	assert(MUTEX_HELD(&dpr->dpr_lock));
 
@@ -1094,22 +1095,99 @@ dt_pid_get_pid(const dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb,
 	return pid;
 }
 
+static const char *
+convert_pidglob(const char *s)
+{
+	/*
+	 * Convert a glob for "pid[1-9][0-9]*" into one for just the numerical
+	 * portion.  It will always be a subset of the input string.  A NULL
+	 * pointer is returned if there is no such string -- e.g., if the input
+	 * string is "foo1234".
+	 *
+	 * There is no need to check the entire string for legality.  E.g., if
+	 * the input string is "pid*q*", we can simply return "*q*".  Then, this
+	 * string will not match any "[1-9][0-9]*";  we do not need to intervene.
+	 */
+	const char	*p;
+	int		nchars = 0;	/* number of chars of "pid" we have seen so far */
+
+	for (p = s; ; p++) {
+		switch (*p) {
+		case 'p':
+			if (nchars > 0)
+				return NULL;
+			nchars = 1;
+			break;
+		case 'i':
+			if (nchars > 1)
+				return NULL;
+			if (nchars < 1 && p[-1] != '*')
+				return NULL;
+			nchars = 2;
+			break;
+		case 'd':
+			if (nchars > 2)
+				return NULL;
+			if (nchars < 2 && p[-1] != '*')
+				return NULL;
+			nchars = 3;
+			break;
+		case '*':
+			break;
+		case '\0':
+			if (p == s)
+				return NULL;
+			if (p[-1] != '*')
+				return p;
+			return p - 1;
+		default:
+			if (*p < '0' || *p > '9')
+				return NULL;
+			if (p == s)
+				return NULL;
+			if (p[-1] != '*')
+				return p;
+			return p - 1;
+		}
+	}
+}
+
 int
 dt_pid_create_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
 {
-	char provname[DTRACE_PROVNAMELEN];
 	dt_proc_t *dpr;
 	pid_t pid;
-	int err = 0;
+	int err = 0, i, nmatches = 0;
+	glob_t globbuf;
+	char *globpat;
 
 	assert(pcb != NULL);
 
-	if ((pid = dt_pid_get_pid(pdp, dtp, pcb, NULL)) == -1)
+	/* Exclude pid0 from being specifically requested. */
+	if (strcmp(pdp->prv, "pid0") == 0) {
+		dt_pid_error(dtp, pcb, NULL, D_PROC_BADPID,
+			     "pid0 does not contain a valid pid");
 		return -1;
+	}
+
+	/*
+	 * Try pid probes.
+	 */
+	asprintf(&globpat, "/proc/%s/map_files", convert_pidglob(pdp->prv));
+	nmatches = glob(globpat, 0, NULL, &globbuf) ? 0 : globbuf.gl_pathc;
+	for (i = 0; i < nmatches; i++) {
+		if (strncmp(globbuf.gl_pathv[i], "/proc/self", 10) == 0)
+			continue;
+
+		pid = strtol(globbuf.gl_pathv[i] + strlen("/proc/"), NULL, 10);
 
-	snprintf(provname, sizeof(provname), "pid%d", (int)pid);
+#if 1
+		// FIXME: omit this check once we have confidence in convert_pidglob()
+		char provname[DTRACE_PROVNAMELEN];
+		snprintf(provname, sizeof(provname), "pid%d", (int)pid);
+		assert(gmatch(provname, pdp->prv) != 0);
+#endif
 
-	if (gmatch(provname, pdp->prv) != 0) {
 		if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING) < 0) {
 			dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
 			    "failed to grab process %d", (int)pid);
@@ -1119,14 +1197,36 @@ dt_pid_create_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
 		dpr = dt_proc_lookup(dtp, pid);
 		assert(dpr != NULL);
 
+		// FIXME How should err be handled?
 		err = dt_pid_create_pid_probes(pdp, dtp, pcb, dpr);
 		dt_proc_release_unlock(dtp, pid);
 	}
+	free(globpat);
+	globfree(&globbuf);
 
 	/*
-	 * If it's not strictly a pid provider, we might match a USDT provider.
+	 * Try USDT probes.
 	 */
-	if (strcmp(provname, pdp->prv) != 0) {
+	asprintf(&globpat, "%s/probes/*/%s", dtp->dt_dofstash_path, pdp->prv);
+	nmatches = glob(globpat, 0, NULL, &globbuf) ? 0 : globbuf.gl_pathc;
+	for (i = 0; i < nmatches; i++) {
+		char *s = globbuf.gl_pathv[i]
+			  + strlen(dtp->dt_dofstash_path)
+			  + strlen("/probes/");
+		dtrace_probedesc_t pdptmp;
+
+		pdptmp.prv = strchr(s, '/');
+		pdptmp.mod = pdp->mod[0] == '\0' ? "*" : pdp->mod;
+		pdptmp.fun = pdp->fun[0] == '\0' ? "*" : pdp->fun;
+		pdptmp.prb = pdp->prb[0] == '\0' ? "*" : pdp->prb;
+
+		pid = atoll(s);
+
+		// Check, since dtprobed takes a while to clean up dead processes.
+		if (!Pexists(pid))
+			continue;
+// FIXME should also check dof_version, though that doesn't do much yet
+
 		if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING |
 				      DTRACE_PROC_SHORTLIVED) < 0) {
 			dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
@@ -1137,17 +1237,18 @@ dt_pid_create_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
 		dpr = dt_proc_lookup(dtp, pid);
 		assert(dpr != NULL);
 
-		err = dt_pid_create_usdt_probes(dtp, dpr, pdp, pcb);
+		// FIXME: How should err be handled?
+		err = dt_pid_create_usdt_probes(dtp, dpr, &pdptmp, pcb);
 
 		/*
 		 * Put the module name in its canonical form.
 		 */
-		dt_pid_fix_mod(NULL, pdp, dtp, dpr->dpr_pid);
+		dt_pid_fix_mod(NULL, &pdptmp, dtp, dpr->dpr_pid);
 
 		dt_proc_release_unlock(dtp, pid);
 	}
-
-	/* (USDT systemwide probing goes here.)  */
+	free(globpat);
+	globfree(&globbuf);
 
 	return err ? -1 : 0;
 }
diff --git a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
index c5dfc72b..9d8f06e9 100755
--- a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
@@ -5,7 +5,6 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# @@xfail: dtv2
 
 ##
 #
diff --git a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
index 644da2ac..6eae82ed 100755
--- a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
@@ -5,7 +5,6 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# @@xfail: dtv2
 
 ##
 #
diff --git a/test/unittest/usdt/tst.forker.sh b/test/unittest/usdt/tst.forker.sh
index 7cfa9eb5..92513eb5 100755
--- a/test/unittest/usdt/tst.forker.sh
+++ b/test/unittest/usdt/tst.forker.sh
@@ -7,7 +7,6 @@
 #
 #
 # @@timeout: 120
-# @@xfail: dtv2 USDT wildcard
 
 if [ $# != 1 ]; then
 	echo expected one argument: '<'dtrace-path'>'
-- 
2.18.4

