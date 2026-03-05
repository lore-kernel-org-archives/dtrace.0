Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35D739EF3E
	for <dtrace@lists.linux.dev>; Thu,  5 Mar 2026 19:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772739910; cv=fail; b=SMf9xBsh6k665SpTRxrBey5Tqc1HxaEvSbyZuxkjtz5RWBBTvq0Iue3jpnSwbZnXatmbeR+sGCunl4HcA+BaIC3CsLkoR4/Vl6yXFNKgdnzz9DFgzwTFLSbxSwI/0Tl75y63AxjqjNSEIo3FZ55S47iaI0BZAPPv8P4nXjIqIDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772739910; c=relaxed/simple;
	bh=ky1/s7z947eba/Az6W9/+SWV4CC4bjoj4kyMisrgk7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=prEotJexxGnpAkVno/lUq6B9U+FW/Z2KqH3jcchbBFi82afqCXHnYvogG7nWw2oqlZnz0Mfu56Mg2vLUp0xFQUt7gRRlxZ8DARDcFCDHKDRJQMTFCvF45oAw0KReJwyvmuy7XKs6veZHMwZBA/hV/tfQgE2SBzwGCZjqn65/0Qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=il4SC8k8; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FcSJ1ns1 reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="il4SC8k8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FcSJ1ns1"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625JGudP953180
	for <dtrace@lists.linux.dev>; Thu, 5 Mar 2026 19:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=f8FOxtBV35zRJf/+jFFT07jE+muZBmAN/DdoGzL2LnY=; b=
	il4SC8k8l+F3osUGnYuN5mzuAc4BPwPCORtglsCvCj6teqXeC/oRIb3unkFWhR+1
	WA6eurdOfFnH7urq2qDtGQ8v2a9cxazcOKNM5BXG/FtCXt8XH1iOVBJRvyGOtDMg
	3lhPUckeRSAjkJrqVXuuga7tV2pVP5sP0W9TIw1myVX4+233tgmZU2AdKi7nbM5e
	ANoiyXrHIu5CUX1zNUy8Okzzsdk0k2d79yaAqhC5KCj+NU8gv88gRhgIfUCZGa9u
	+Rba76oHKS79sfdG+HIbAL9DbI8a4FjEKGVysnYUD85YqNiY8SPvicSrxTkrx96J
	5nlT6d2prZ5Q6RRK/ct7fg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cqfujr1ek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Mar 2026 19:45:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 625HZmtL029685
	for <dtrace@lists.linux.dev>; Thu, 5 Mar 2026 19:32:45 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011022.outbound.protection.outlook.com [52.101.52.22])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptdnevj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Mar 2026 19:32:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oORUJt3tRfJMgcsRE0Xr6ooen+QpTILI+boaz4fCtHuPD0Hhy0UGxe8t5D6/on9TUyqHU6o62Vn+3bKnD/QmCTDlEzxm179vRF4bj3A9CEHtm8P9Di/9oiAeZrT+w4xkdwXO9uD3TYYl1DrtqWCiw6Emv6Ys41irfpJNBJu9tVPEFvHpmJyuxdMYAXE+7t1SSB+flAHpty5QS4Z53YfJYvfiFr/8Gr1DQltXJIqX3nksFpPklmDWG4zdYWvcFKUKfftY2bSv3XL+pvZbNogmjKdGGW2h8kD0+FW+RFLrMv05QgIMa35koWXNXVZZtJGsvozDf/Fgcp90hgLKyuuzCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+l+jNzycbBIAoAUbBN7wrorIjHAC4iwD9iueupul74=;
 b=pN5xgC+O927A1hijdyb7ntwLbkIi5IFr96z8xgY5Iv38Dd/5CAe4osk/icl3Wz9N3yLQ+gSIf94GhHoeA3cKBbLv20J/YAIw9mdeAzzows3EDxOch/E6omqzUnkPTPEKtrT4Wk5GLtHfuBZCTE2oL3Kw5GddzjJIjSX/6H50j4Xcf4sBF59rA/zA+0CVnmQtGf9Y5xyaev4cjaHSiGtJijWjjXFPChWKWUfzQDVG0YMGCwmRb3Vrr566SR7wJvoYH/Oln8/m/xHO3n9gzQ52cRk8TsSDC8wYLXQrCd5V5NrYIZcXgo16rcq+NuECAOVul/N8IIVixvEDhikDlTNAYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+l+jNzycbBIAoAUbBN7wrorIjHAC4iwD9iueupul74=;
 b=FcSJ1ns139BswZ2tluk3q7cWLqDaWGFlBipdE+u5MToyhNwrDdcipkBBaqnEZGABloNB2xVeSZwnzyhuL09KFZG1zsxSWC+aFkrvbn6KMs27Jc+cAaXOTuqJ7aig0Ur6OGvIq9tbKYPpm/4XK4edAVhXDy7Ih9ZugJURTXWw7DA=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by CY8PR10MB7380.namprd10.prod.outlook.com (2603:10b6:930:97::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 19:32:41 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 19:32:41 +0000
Date: Thu, 5 Mar 2026 14:32:39 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] license: add overlooked license statement
 in bpf/GNUmakefile
Message-ID: <aanaV/fyspbflt37@oracle.com>
References: <DS0PR10MB7522FD4259C76530607605CDC27DA@DS0PR10MB7522.namprd10.prod.outlook.com>
 <3d9582b1-0821-7611-bd82-7a2ece8b846a@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d9582b1-0821-7611-bd82-7a2ece8b846a@oracle.com>
X-ClientProxiedBy: BLAPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:36e::28) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|CY8PR10MB7380:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a98db18-4e82-4c35-4864-08de7aedf793
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	kclxoSUYu6N5dREQFs2UaorZ9qb6+i/SVtFqbF/AQUvkuinqsPJZPYMIk5dL5vNmKjHCeVRzNg2ltVBU5mVhblIsLFjSfSHlfefHRzaS6v7s3vHOFZ6stsDWb0otfO4ep6eNybntcu6C4S8D5zV1Z3dy2rbjcq4O4eTkxzCzwGH+zXGlwoLP29lxRs3NbX2w6xSnveuM/Wfp7sggi/B/7Aqvi93czWLqeIfZB9DrKbR3Iy9AMA4XVSckD9R0DIz5dGAzS9sooAsfMGsIQL0mHlRW4Avw9sAuhV33TFgpVNo1BAWD82yJgBwJqIdzjStE89Sr9AKH+7Wazu6RcEvdrapAuJP86SNSLgZ6T00JK4/g++GIj/jrWPJUQF7dcG7jH3Sv2O2poBaQ6fABLjLms2Iyc+6JdnSvvuKpv4zkqYeHAeg0cRikNAiGLExxeoqLxwasEBqPDLlR5g+TRhUDsfFbTEe+A+B8q7sEqrLI/fcppTp/lNLjq5S9crn1TeIOOTwRf/iHZTzEjPK8l/E7pKpDfkREfuxOeVzHhRU1xkXo6kneTvM6EmlzW75CPTzYmjC6NBIRv5DGcDB9g30jhRLZcV5VRrHOJv4c8GvUjQ0TeSZoP5m8n4X7oyS5UmAJ98dZQRyj8hMcMcdsSQGytC0kGtoUvbrk/cklFOfTqoPDYl/GMgRRsIgkKz8B/hNRLJ2YQF8zAZCTofbg0eTB8yFqxlWFJmxEwmpsehg2qKY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?colfqF/IfVct1evsXeE6yLlaRdJbgcHcwpW9pfDb/AAZ53plxeyQw/S4wr?=
 =?iso-8859-1?Q?tzJOf2rAgJG1JJFMLEDlUWuGlmZ0DLyyl4m7orBrFuRHHHYwYyFERHuSae?=
 =?iso-8859-1?Q?jH/tZD6zs9m+bJQTLywkYFmigXZkzwHvOFOdIL/345Os0g4ZO9udut1Tad?=
 =?iso-8859-1?Q?lN6JVBJN97B8/ilSWrkajaOW+4Q3KkLltDNDcJncf4rL4avlleshGnwxGl?=
 =?iso-8859-1?Q?voym9wqNkSnNTk394bbk1VeYvJYj4BQtE+ps1Wf9mbTl2WhRCjcsA52XRy?=
 =?iso-8859-1?Q?t4fmsSq93ya7ipn+ifa3EjQmYAKQyed93uPlnc//iUoTmjpOCzsPIVAlFr?=
 =?iso-8859-1?Q?i8aGFNW07MWppOuMLIQcBWzFT9u75v9+MkKy5Sc/IZxZMBh3Oa+VyCATLj?=
 =?iso-8859-1?Q?8m/r9MAiXInYDBj8Z9AKZIoVGzUsGi0a0LskvJQ6wfwz9r/2Zl30yWlsYm?=
 =?iso-8859-1?Q?XmtgZ395GacBKP+QXT10rq5cAyaQESTsQz6pFt5rC23Pr/v3tsoHW0npvx?=
 =?iso-8859-1?Q?9TJFThH/acQRgJ8CuxSLxkS9oYwy4+/5bocsYkZQxUO0KD3S/A1p77RZpe?=
 =?iso-8859-1?Q?2YCTT2LAdf6gqKo5T83tnYPNkm+qsWrLOeLl6satw2eNcYkYZTZYQ1jZkd?=
 =?iso-8859-1?Q?9pqfSYr0SpRWQHCBm8+qMD+kRgqdeyifuj2D9+qQIlA3kfn6vCEJEzfRxP?=
 =?iso-8859-1?Q?lxfgsk2nejrLdkIFqfuJkmwxVs71AHci4gls6vEuRbS8uhm+xaMk44vkKR?=
 =?iso-8859-1?Q?5GjrUpiJ1iqB3LjA9kREp8X6QG7LlbD6o83wVab3fhZk0RGp3gp5fESmOk?=
 =?iso-8859-1?Q?7fGvye+z20AJWXzhTp2/4IpsGtdRGcFujngRa4InqQQTsp08J1lykmsF/g?=
 =?iso-8859-1?Q?q0ci8hjDmlAU7w9LRmQ62qsKaB2T7aAnKKvP7NJXy8bn4wVMQYWBr8dyCG?=
 =?iso-8859-1?Q?2Od+HiwQq352W41LTnipokMQNr+2Np0dm8q19mTZtZLTwLMM62N3XVz+Zo?=
 =?iso-8859-1?Q?b90rIJIjem9J7rRXtbTIWVEEDnbztFicXqEhm4qx6PXrqDvMLc9Ef3S7yK?=
 =?iso-8859-1?Q?ANLeBET94IXmKkpkpPdTaEuh6DBsoEw4666pJQxRXyvTuJoYDi1Wg1GV3s?=
 =?iso-8859-1?Q?3nXBx/nXty9nB3hGKcBRsvujXg//Il+pGzT1doeFgXe/dHo85aSdvR9xoB?=
 =?iso-8859-1?Q?LIWYnmSvVRZKm2fBbLxBGc2vInmOgzBw5I4LPdbqqQ5SfGzC5OLna0mtm4?=
 =?iso-8859-1?Q?SkzQQbABSa/DTYkOMbo9d8W7LZ4+l4UiqAghUdaUIFg2EH8GErR/xPziS7?=
 =?iso-8859-1?Q?YgwAIw0iSugpl8m2lOexeDHXYmskX2LW9KdRPqTW0eDu3b+pePcTLChVCM?=
 =?iso-8859-1?Q?GF4fG0EeYbDsuaZAImYF1u122FpzcHE6Lg42BUdF8z+JL9pKdYEMORxkTJ?=
 =?iso-8859-1?Q?wUkjM6CfprtwcZUnSxhw2dBJ25V+Bjapp3UWZ5AGUp9UpgP34fAJSjZCg5?=
 =?iso-8859-1?Q?3e3rpqTCyjYOMc5lpgf/aj4Dj6ZvImJS/E2H/S8pMMzZmqhQnKM1tx9ns9?=
 =?iso-8859-1?Q?OeSLpjVfR/4OO8MiNu2JhVSI+HCQZL8epR0gqw3OKV1K1W3WdwHIa/YXZa?=
 =?iso-8859-1?Q?wnqvNWMOPhpi25n3yTGO5rB/dJYABB/h3mlkZRJR2tkPjRMy/TFr0mNz49?=
 =?iso-8859-1?Q?iAoErAAuxfJUVVeP+md42DSwat0bXlkp2OZDP77PvtAHk8GshFpzdI1nfC?=
 =?iso-8859-1?Q?CgLeuTEqxR7+si6SLEc4/GNqugaISPZKvXbjIGSEDXYKXi18r6qYQ/SX51?=
 =?iso-8859-1?Q?4D4GH6gc2Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0nEtQTg0KMhq4ReAq8HBZHhRx9+uVDH0sPBlyNKDuxPDuqkxglU+Sn4VSZvqL9qZXj4GPKDGdA1yst0PHZlnfnpTHndWuShjVsI0VVYYNJZLqqlu4GRsSQ4JeLPsNoPXseajs3Oxg8bE+4IDF7OPNrcIUp/myQoVeReJMI6E79ULsbn6btphSXOZzsfPL3SPUJhDeeWo//0/c4C2uLYc3sjfMoK8STJO75CF+FWauGN6FXmb9nIuOgDYONcwOpdTR11iNrdkiGYZ0TkNvchMf6+1fvqiWqwnK/oipWx/vJuzWP3OGMPxQDmKdTCOY+LIR7XIoUzhLQpmU3I5CRDpKK6hmxURhrvv5sjCJ0GJZT906SY8OHU1hhWrpwfn/7Z5v7+HmXEgbZRrNqdkxgtdQP/sNdFY+5fFkD4xcuV4MmFXDauMbo+ftnOqJaHPVHIQmYo5ocfM0eGstcQbwZQEYTdcLTp5V0FRTS7Mvkq6gSQcpeB7k2RWEXmSBUgmqvmjUgqOYzrBaz1ykkzG9HNEXS+nZnPDrdkx4L3V9Kk0IW8AgAAL6cT/ddtCRQIdc1kD4drUDPHWT7S2Pj98Sm2iugyTyeFniOTdZfnuYh6KrNM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a98db18-4e82-4c35-4864-08de7aedf793
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:32:41.4025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K1ceZWg4aJK+rFW7PWFF/jNuhfU/+K+GW//xJ4utL0lOjNp+ElvTTEVBdCZf9LyEyLlOzVQB4QfSn5R/5xdrzGPDwDA0ELyNqISk82f+AmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7380
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_05,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2602130000 definitions=main-2603050162
X-Authority-Analysis: v=2.4 cv=aeNsXBot c=1 sm=1 tr=0 ts=69a9dd45 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22 a=yPCof4ZbAAAA:8
 a=2-l-KpxeOZLPW5CbRxMA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: 3EfQTRxdmub9JvEcad0tfKIhTuKDj--Q
X-Proofpoint-GUID: 3EfQTRxdmub9JvEcad0tfKIhTuKDj--Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE2NSBTYWx0ZWRfX4VVQFQJGKKGO
 f5iNFTWH7Ke9I6uaxFR0FIV4yc2yGr/kicvM7wQiE7VV2ph6LUPs4JKDRldVmbgNcZAjbEfXyEu
 22fYbg/mYqv2dxBYnqEtjT5Buc+umMlz+xLgD547FuNmFuHzfsdDP6m2mWm8SesHwhjdUZyg+Ui
 uhAD/F137enBgWjJgCtbN77I9QGqx1iB6+qF+b24F96grJo2T1DTkGGk37rY2ciBuSzUS3egeQL
 yRcqFHf7J+HKdhBjcofMZ6j29h0Yrr/nWtpOikBUlwe9p7rr+ktvHHNgRDuNWqaiSC6Nfzacwb1
 xqrGIKQhOjRCgUgWlmRKMDiMrTONeQacMu5uwFMqsi0AxFAUM03443jXUEaJ+XD88qF2s6TuGs8
 FGpPaNFAUBmR5CJ/Hf8NFEMxg4eKijIQcDg69na+K2maKei9sNVx6hr97S5XInNQWgac8w3g+gS
 XSmPh+ituVLHheEHUVQ==

On Thu, Mar 05, 2026 at 02:13:51PM -0500, Eugene Loh wrote:
> I'm confused by the end date used.  Why 2024 rather than 2020 (the last
> commit?) or 2026 (today's change)?

Unfortunate copy-and-paste error.  Will use 2020 since that was the only time
the file was touched.
> 
> On 3/5/26 14:05, Kris Van Hees via DTrace-devel wrote:
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   bpf/GNUmakefile | 5 +++++
> >   1 file changed, 5 insertions(+)
> > 
> > diff --git a/bpf/GNUmakefile b/bpf/GNUmakefile
> > index 4a27e08b8..51ed7df6e 100644
> > --- a/bpf/GNUmakefile
> > +++ b/bpf/GNUmakefile
> > @@ -1,3 +1,8 @@
> > +# Oracle Linux DTrace.
> > +# Copyright (c) 2020, 2024, Oracle and/or its affiliates. All rights reserved.
> > +# Licensed under the Universal Permissive License v 1.0 as shown at
> > +# http://oss.oracle.com/licenses/upl.
> > +
> >   %:
> >   	$(MAKE) -C .. $@
