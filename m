Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A9184A35
	for <dtrace@lists.linux.dev>; Sat, 14 Feb 2026 23:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771111472; cv=fail; b=JoP0tCfTohImaZk7pJFnuRK9r7IIDIZLwCCM45geVImLfxTsUN69HbAhe1hjEbjQ5zTRJxjLOF5QiSvKCP55Z+L5LodDSahaf31S1g8XAJsMN/bVKSKRwCgASNXJTARgOsvPKcDsDS8QVXHaW21LDOc+9FqBg45gX1gslBCOD1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771111472; c=relaxed/simple;
	bh=7Ffxamj8PRzViyfTZ72zr95yogNo34fyLU9GbL1Ku0k=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XwzC4ZZ+fzgR21dwL3p911XayXZwvpmJG6csLJatrPyzV1YA1Y3bw6gbIEtIwz+G6zafIsjf1mitAJBz2Znfy4u5FVXfmwjWjJ8XmU1kae6WOocN95I1VK0PYpQUXaSjP3HoSGcD4pB0Y6sANZGptONyAo7MpEobc1JX6C0k4f4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dSqH9XQE; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eFKD5sGE; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dSqH9XQE";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eFKD5sGE"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61EHquFq2098984
	for <dtrace@lists.linux.dev>; Sat, 14 Feb 2026 23:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=bFEYSnBDJxY5u9yNxJQbXNLJisdjHSdSo2M4PXHy6e4=; b=
	dSqH9XQER7iYpGqZEuHShI4Dsf+VNTK4xJnXI0MsFzujZvuCxrgDBD18YIbboPUg
	l13A4EuXsn4ZPyeflZpvEHEYUG02GkbNcpvIXy2fplv+bsSvUr6PiQuqqdxDOAGf
	O4UY6Xf8c+o6+J/Lu0bMWIget9F/OpR366gp2k+iG8UBGshcV98yMY0dF/TXscx/
	zJOb8bIKd4jlVushbxchN6X3o/WxngFGK/Mvv/e9IDVCKOMXZQu7PiJCwLxKGVni
	Rlo0gPyNsDhJgTw3hXA+kXrJSZwbNdoqVzQR7W5IsfIC68ilLmjo+Do6D6cjlisN
	Thu7Zmyl1UdJMC9h2zLpuQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj6m8gwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Feb 2026 23:24:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61EIonXD029597
	for <dtrace@lists.linux.dev>; Sat, 14 Feb 2026 23:24:28 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011040.outbound.protection.outlook.com [52.101.52.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4cafghc5xe-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Feb 2026 23:24:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGjYSpxGLUqCAhusFGd+CalrdnD39UqmzxyITtBUVD7lP9h8yzb6NVVAl24xSA2wi3rhvLPgh1Tbxed+RaWrQAF8uzJnDc6Lzjw+eHH5pg91MCfhSD2th5azbbbzOau3WQ8X/mc16LJ/P75B4EtczO/J/SfGJN6n5Zt1nDLGJMJfItADZnugkf/k44kqfH1paaS7tpuYsRlROfhk5ZdJqgG63nvGt4lG7sgHIhy1qlNXvEcaORFNVuCfiqQ+0lrzrFWPeWiFYgl1uHAzwKzUeRoKpXDUFueCxlMgv8QCZ1jgdADSRtvPZ4CGeubH9XxUhl8uhVu9jkq2eMjawFW/0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFEYSnBDJxY5u9yNxJQbXNLJisdjHSdSo2M4PXHy6e4=;
 b=uGhP0l731GC0GgWrR6yCz+CsMet9UFgsjbwPUkEQK6pVqCII5QOJrItLMCdNsb7c94npBZREIxasS8PGGeryGFf3Rnn5Y431zNHkInNq79gkXm8bM9Sk8J41RcpO46eO+/ndK58Gj0rJUqOpZgSRtA7/vqL/GnSwpjNxly1p8vHzUairBYRkcZQVc9QpDcjYBH9XQdwKJ2i5zKNWESaGjTFeqzCAXgLGtTnTpBdCo5n8ohYBl2PoKgrW7d9FO+VgmdebQivPPMHEmLiHiz7tZVTJExHOZpm8hMND+bEoMl2gc4aADSY+HOp1YZRCfOcKcrnd30SBFHzmALsKbLnbNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bFEYSnBDJxY5u9yNxJQbXNLJisdjHSdSo2M4PXHy6e4=;
 b=eFKD5sGEaqWnnim2pxHepD+ZGRwYkaBELtWRVNyf5E52KgJ7uFYfjyxK7t8aq04e0lSOqUx6B5DlzSX8CIzOzDNnJTU3KXeqJIBZxhx721LVHnwmjiVag+qPrMmoGzf+ykI1VLv+RVWa1JmQPHj3ZGuMRsfwgnd4+hVtI9UIkp8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA2PR10MB4524.namprd10.prod.outlook.com (2603:10b6:806:118::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Sat, 14 Feb
 2026 23:24:19 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9611.013; Sat, 14 Feb 2026
 23:24:19 +0000
Message-ID: <6f145f00-b0ad-82f3-62a7-ba9d39534b11@oracle.com>
Date: Sat, 14 Feb 2026 18:24:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] Adjust paths for common executables
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB7522EA3A65016555DA0EBC33C26EA@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB7522EA3A65016555DA0EBC33C26EA@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::27) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA2PR10MB4524:EE_
X-MS-Office365-Filtering-Correlation-Id: 079a54a5-4c18-4d1e-fbe5-08de6c202d45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXJtWkZiQVNOdXUxMXlISndQcTRtZ29wMGh1R0FlR25DSk82SUhxWUNLdGFS?=
 =?utf-8?B?SFRMbDNCMXl6TXVIUm1MM2N5YlNqRFN3aWR0U1hUVUZEd3l1eWdKb0pNNS9a?=
 =?utf-8?B?RGFYT2xtL2tncmVLdy96R0hhMlphaXk4MTZ2d1NUSkVKZ1c5bXRXckFlMkFX?=
 =?utf-8?B?a3VFNnFheGdZYnFYRWtoS3k1Sk10VmFqRmZ0WXZpOVJ2U2RNbDA1Z3hySUEx?=
 =?utf-8?B?L1NtWUhtVlJVQ1BwQmFJczArR1NUei9DOEovQ2N0QjZhaFVOU1lPalFka0hi?=
 =?utf-8?B?ZkxDWWNQOFdtNEhsQ2g1QnFLV0huU2sxOHE3RzNwYVZwMGlES1c2UWo4Z1lm?=
 =?utf-8?B?STVyVURMeDlKbmlNVjEwZk5wUVNIS25rMmR2bDFTUGlPM3A3V1g4TlN0Sjli?=
 =?utf-8?B?WnlmTnJIaG9Mbm9MbHZ0U1RCQS8rSnR0RXNZRW9pdkV2WmVZb3prNXlXeXhm?=
 =?utf-8?B?MXVTamxleUlJT3FuU1RwMng3U094ZUVQS1orNXVIV1RyaGs4eUxkMXhCcDRa?=
 =?utf-8?B?eU55T3BuUVEvRFhWWTl0azFyRHp3SDZCZVJLajcwVGh6Zzd1QVV2dnNNWlZN?=
 =?utf-8?B?RkJEaGZ1ODlBRVBVZ25URk5JNkY2QkdFVmU4NWFMZnRVb0xRcExxd0hLS2hT?=
 =?utf-8?B?bkNFUWJyLy9tanZKUDNYV0NQRmdReDdySnMvMnhuY2ozeFd2a21jdzhONnp6?=
 =?utf-8?B?VXhmNjRIMEwyQWl2SDNKbjh3QVgreksxTHo4TTMrY1hGcnExbDBuTlJyelhs?=
 =?utf-8?B?b0hJWEh6bFlNUEh5dUdQbEFFQTJLQVowdXArUDcwOWY2UXhtNDRsMVpPOW54?=
 =?utf-8?B?dDNtSHpoWW9DVkxOczFkV09seXNjeU1yaWpzU2tFRUNwZUlnTFlCM21WMHRY?=
 =?utf-8?B?bWgrdGtCaW9NUXdsQ3hOZE1wQmdocHo5UnJqWGU0S3czMk1KakZwTHVuRHFJ?=
 =?utf-8?B?QzhiVVk2SjE0QXFBWDRvallPTDZtZ1NCTFlYUTJENDNKT1Z4ZUYwSmhBZERy?=
 =?utf-8?B?RHBmNEkvS29yNldEb2k4TGJNRzI4ZzRROGlxY1hRbzZGaTlhdHp4Q0REeThB?=
 =?utf-8?B?c3QwRnprMTZaRFdyZm4rYzV6UUxVRDNJSVFNUUpnRU9LWUZldTIrd0g3cnMy?=
 =?utf-8?B?cWhwRllTUGQxQmc4N0pIN2padnRHeVZnWXgwOTl5QnNaOVF4VUg2QjA1NXVH?=
 =?utf-8?B?RXFBRHJ6eHhNMGE5R2k3aWhTWmxRdHFZU1YxUW55OEltbE90eVoxVC9XdDBN?=
 =?utf-8?B?Y3oxZ2ROTVgyNXIyeit6TWs4YVNkd2ZNVGV3andHVG40MkY2VTRHKy9BSzVi?=
 =?utf-8?B?S25hRWc3YUtUZVZGZU9QWFhBdDFKUUFWR0xOVGV3YnZyZWQxeVNvcEZSMktH?=
 =?utf-8?B?QmlCR3VlMjVoT0NWSXJoek1UQ24vcGhTczdoQndoRXAvaytKcFZqT25iZEJq?=
 =?utf-8?B?ei96aEVjSHh5RXNrNGZwLyswZjdXNzBEeDhjTm9GbTlEdkNLUHRiM2s3KytK?=
 =?utf-8?B?NFdEOFZUS1pRb1dqaUNSRTVnTUp3T0F2S2JHR1o1KzRYekN2MHVCY0RLOWox?=
 =?utf-8?B?NERSRHR2SW9rNzJDWUlBWnlvbEdtQjZ2TFB1elZpa2hWVWJoYjlVd2ErV0lG?=
 =?utf-8?B?dzd6VHUybkdjMG1kL0FUdlVxQnJrNFVJWDdVQ3BPbUsxcmNuSkIxYWppdnds?=
 =?utf-8?B?UTBpRWlPWjlnQTZyTFhTdDdBbml1S2I5SUpNb3BYNVNGV3VwMG03ZHhzTjhT?=
 =?utf-8?B?K2JqQzZSTGNpY0w1L1RZeEwyalVLaFg1YzdyaU4za2V5TFBRVWgxb0YrUllF?=
 =?utf-8?B?ZE1GcHI1UEhwMjJCNGo4K05jOGZjM2NqOEYvbllZcXAwTDBQOTk2WDd3VndN?=
 =?utf-8?B?S0Z4ZlA2c21UMmFoUXoydXVsdXhqVUhFWitPbzh5SGhaY3FieE90YjBCVklx?=
 =?utf-8?B?dkIwNjNsaS9oZEpyT3JyQk1DYVBKTEZNWkNMODlqb2Z0VGdrRytXc3RUbDkr?=
 =?utf-8?B?U0taWDEreTZKK1JURFNFOUxteGFweEpkaW9wVTZWeGlZT3psdGRmMHdYREZl?=
 =?utf-8?B?SW1uSlhCRkVMdzJyY3BqdUU3NE4rWGdMcWdkM2NmclJPK0ZoRjRibCthQnY3?=
 =?utf-8?Q?4QmgE6Inifo9GuXtOZtPt2Hua?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Um5RSEVrNHhvRTBlYWdlSGl1ZjlqSXYxT01NOU5nYzJEN0lCRmlSem1NMWpo?=
 =?utf-8?B?Q09VYlJSUkVhTkE4SlJraEJjSDZZZmhUYnZhT2pPVFhES3ZmVDN3enpCaFhN?=
 =?utf-8?B?aERnRm5iM2ZEMkRRSzBCZTJqelJvN2JXR1ZnVjF4M3BLU1h4SWxUOEdmdkt2?=
 =?utf-8?B?Nm9aUUhiaitBajR5ZCtzemptN0ZCS1d2bmtTbTd1eG5ZVFBXSDRpTCs3NU9M?=
 =?utf-8?B?NXBwRU1YK3lqZlJQUzFFZWNxclJOYks3RldYQlBKNThab2ZYWnhDMlBINmNq?=
 =?utf-8?B?Rld3RjFpZ2RqcThKYksrZlhYNEc4WlBsU2VoQW9HS1VvN2VuLzBTMTY2VHF0?=
 =?utf-8?B?YjYrOXprSUtXT1dhTmtFLzJUQnFacHdZR1N6SkpNeGxoZmpaQmV6T1JpajhM?=
 =?utf-8?B?VUtHdWFtUHdQZDQ3N3l5UkZxVGNpeVZINXF6L3lmbjMxS2Qyc0U2Z3lnTEg1?=
 =?utf-8?B?UjFQNmdFZU1acUFBN0U1SDRBaXFiWEhDWUhLWjBZT2FpRG1ZWXkyUVAza0dE?=
 =?utf-8?B?aFVHZktmZmRBYTc0Q3VSeDU4ZGRhK1dYKzZ0VFJ4ZUZxeGFHWGhEd3BhZzZS?=
 =?utf-8?B?cnVXdndvSFVNbWh6dU0wQXlFV0dWRmlZcGtYMkM5UXUrTEJSL0cxeis5Nzli?=
 =?utf-8?B?dGpPVnd5QXJDN2VLU0NuSFdDMVltTzhvYmpzaHNaOHJuYk8vc1F0Z0FYU3Ev?=
 =?utf-8?B?TDRxQU9nZXFkOENlUGRtWnUwTzRnU0JSTG56UnhGb2pVTWU2RnJ0QzFCZlR0?=
 =?utf-8?B?VDdFU1NWWWIzZW5wWDJmUk4za3BNMnFkeVNLeHRHaUxPYkRqMXBiOVI5bkV6?=
 =?utf-8?B?Z0FKR1Y4NXFZS3pDU2ZGKzkyZHhGVys5UVo1K0NhQjdPUmlJaXhMVzlVbFJU?=
 =?utf-8?B?eHV6bC9rK200NzdqUGoyWHl3anJnb0liNWtGaTFUWVZacTdwbGxCOXdBREZ4?=
 =?utf-8?B?ZWlEbVZwUngxUVAzWVFQbURKTXJPTFc3d2toblpzR2REbXdQeUtyNlZEUk0v?=
 =?utf-8?B?dFo0Slc1Q3BzSDN3NndOTUQxdXhaZDlna21FalFwNnRheVBncjNiM2svQ1dT?=
 =?utf-8?B?c3RPQ2kyK3dwdUlVVU5VVXhvZ1ZoYUxUK2Q2Sk5tdjgvM3lSckkzMzFtV3VT?=
 =?utf-8?B?Q2IyV1l2SGhhSmorNUlUV0NkVWlHS3JiQ0xHNHhjMzJZVys5anhqS2pwRU03?=
 =?utf-8?B?S0c5d2x5bnlwRVJyVXZ6Z1JiQVB4N0k5V29henlCTGJGZFJ4UXdpaTRRQWJp?=
 =?utf-8?B?MnJ0aWE2UmlyOWpReGdMOVcrZC9nYjlNQ0x3VTE5WllxWkk2d2xnN0o4QUxC?=
 =?utf-8?B?dURXWXhjbGNaTzNXQWVXTVFpN3MxczQrZWFXZVpDMmpEOEpUOTAyRXFabVpK?=
 =?utf-8?B?cWdnZnNYM1owWXoyaTYvNktpSjhXLzNpUEFKWlhiSDB3eXlQODUzL2ROUm05?=
 =?utf-8?B?RWtUYjdvWXJ0aTFrNUs3RGtoa3lzbXY2QmJaUHJlTkltWWZlem1NaWVpd1g3?=
 =?utf-8?B?RHROYVNRbXhEQjVKQ2VIYTduOVc1VkFMNHUvY2JHc09wK0oyY3RYKyszMi9q?=
 =?utf-8?B?cEVSUXlpRUg1dGhwT1VRKzhRWEt3S3BhK1Y1NVQrb2Q2Y1kwc1JtVjFvRnFJ?=
 =?utf-8?B?WnBZUm5NN282QkNuWEMxeVJLS1p0b01hcnZ5QksyRXpvSDdYVnNqVGt3VkZl?=
 =?utf-8?B?Uk9CSkV5RFg3UXR5R3haSGdYajJZWk5BYjlkSXRQWlo0VXAxbmFjZ0pjS29Q?=
 =?utf-8?B?TUFMVnFjc21CUitGd2tVK1MwRUFoNDdmUlhDNWF3ZEFqb3QzVW1xQm9nMHRj?=
 =?utf-8?B?TFRJMzlwWTF6VHNsK1hSV3g3bDhuaGhGNlpoL3FCNnpLWFMvZzRQcEp3QnZW?=
 =?utf-8?B?Uy9ZSjRsS0RXb1JEU2VUajczYTRDWjFBMDZHR2U3U1h2UytKaUk1Y3J0dDd0?=
 =?utf-8?B?RGhLUzJUMyt4RWZpVzNsc1BPR1BqQ2NhTmtjUjB5M25TeTBKRjlvMlpqeEhz?=
 =?utf-8?B?Sng1OC83djV0dU9zN1FGckFUM1M5RmpBZDBkZStMZHpCZHdudHRtaVA2a2lz?=
 =?utf-8?B?Wm5GU2hwOGtZUGtsWDNRM3pQMUZwM0p3bG1CMkwxRFZ0UjBKQ0ozaGlCZUlI?=
 =?utf-8?B?LzhhcVVsUUVZb0JmY1lnbXdXcjFBQzBSRUpSbzZranp4M1Y4UWhLdFI0Zitp?=
 =?utf-8?B?S0VVVlpWWFZDc0VvN01Cc2E2bEUxL2luOTlUdlVkb2EzNFlIckoyUkRXTnFh?=
 =?utf-8?B?TFR5bk1rcWtyWEZXSXZDdW1UQTl1MzdwekRJd2ovaDRBdjZReDdpL0pHdEI1?=
 =?utf-8?B?b1hPbTlRcVM4aEk1bEM2ZlczYUJZY2tNd1B4NkNIZVlBSUFSRDg0Zz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AYfTnsmrMQV5JNyScAdB/7rmLVyvr5UWTVWqcH8KSAhWWUN6HjPB3gYbljU81upHH8zswMa4sVZvC4j7PODyCA06Jo/6kT7zUxIqGJjSic681HKJZeQOJJj4tyvWfiVBPFAuL1G5fJEBzmbvdYnfIwtIFl36J+dX5k1P2RhdiF/cx2mmeGGOz7sx+RKi34nkwT2e8grjJZHFWYsotMwggZSatqvKYYslZf3tFbr1RqT+6WQ1IuT240UPLakAi1hu3WRUpt+cf/BbqtIiQ5oZoslajxxMnn472hg72H29JaXaX+OYQ6y/olw0q8taiXLV6aKLzYRf1GWZBLVlIMt6Aw9yUQHmInN/Cyqsx2YC657O/FhYYwiCLhKPiNqTdSUxjmc1CEMVfTV1SilaiNG41CwW3tBnzyA/kYKYY7iIYCoh709Z/cgq98Wp/KnmgUqZNUfihWh6NtPrX3wh+A2KEeQSDccAdQv2yt2kUUdsVQLyLYu6foWYGJXut3zTgGe2Wtyse7HHlENgHzQPorvSBnovR++9SLqpodUwBAy7UnQOjggnW+8LvXtbAOQGJZOSsS8eQD61dHB3tsf2wjLsCGLHhPTayuTMVUMS7hJ93Dk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 079a54a5-4c18-4d1e-fbe5-08de6c202d45
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2026 23:24:18.9273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFFvvspsAcs8iUhyhi19lib400K+6HP29MxhUgyocpE4OOeDx8nOTPSX21NRd0xdId8AEBTKd6K9l4/G+SqZaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4524
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-14_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602140196
X-Proofpoint-GUID: kSGMESsTkpmPAEjUAMyl8mneRJpegrwj
X-Proofpoint-ORIG-GUID: kSGMESsTkpmPAEjUAMyl8mneRJpegrwj
X-Authority-Analysis: v=2.4 cv=JO82csKb c=1 sm=1 tr=0 ts=6991042c b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=6yzMLePygeN2NTjnOcwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12148
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE0MDE5NiBTYWx0ZWRfX7KekI1MxhdWm
 6cyN7ukcHXUzyrXAdKPfR4aFzj1ZuqLHUQuzrtuWdSspmIO+DI+oayjSPtVsoUuahjqsWfiYcL0
 oU9DeQObjIxHpJ7GhKFcY7suTRReOcqq+e6V4RIG+Sku5L1naY3rTdGfYa/3PI3QBGHW+X5DtDA
 b/IYiPpFKn+c2UKV7NP+U0tDcF4jXOce/Ue3Qag9Sgiuh2eKNrJxV3uXur1DSc1oeSIFzPJNkU6
 epY/x52RwfXqFOTXgqt+GGb+9loaGVGdYg71jKICMM09hHi6CBhjQNdf0oOV+x+XB2QCMEtCG0z
 WskKy08TQMOevWOVog3+0laATXmhGr3Yjugr4Ug+vGXkhWhQhV5tHjLCibY2plppDye1ivMyZ+l
 NP2FEZOfPyPD5O6fnWsxKZzZgV/Jt4HlLutEwSulcA3a2T94HnNk/h9oHL1NUL1tvDTpNMDaHp2
 HgNFGcqCQr4weQ5POF92xh+b/GyXgpAYrMHJ1yIs=

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
I'm okay with this, but I don't really know the underlying issues.  Why 
for bash and sed but not for other utilities (gawk or whatever)?

On 2/14/26 11:12, Kris Van Hees via DTrace-devel wrote:
> Favour /bin/* over /usr/bin/* for things like bash and sed.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.aarch64.x | 2 +-
>   test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.x86_64.x  | 2 +-
>   test/unittest/codegen/err.deref_0.r.p                     | 2 +-
>   test/unittest/codegen/err.deref_1.r.p                     | 2 +-
>   test/unittest/codegen/err.deref_i0.r.p                    | 2 +-
>   test/unittest/codegen/err.deref_i1.r.p                    | 2 +-
>   test/unittest/codegen/err.deref_string-assoc.r.p          | 2 +-
>   test/unittest/codegen/err.deref_string-gvar.r.p           | 2 +-
>   test/unittest/codegen/err.deref_string-lvar.r.p           | 2 +-
>   test/unittest/codegen/err.deref_string-tvar.r.p           | 2 +-
>   test/unittest/preprocessor/err.ifdefincomp.r.p            | 2 +-
>   test/unittest/preprocessor/err.incompelse.r.p             | 2 +-
>   test/utils/clean_probes.sh                                | 2 +-
>   13 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.aarch64.x b/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.aarch64.x
> index 627beb32..8d60c971 100755
> --- a/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.aarch64.x
> +++ b/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.aarch64.x
> @@ -1,4 +1,4 @@
> -#!/usr/bin/bash
> +#!/bin/bash
>   
>   [ `uname -m` = "aarch64" ] && exit 0
>   exit 2
> diff --git a/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.x86_64.x b/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.x86_64.x
> index 12759d64..975b71f6 100755
> --- a/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.x86_64.x
> +++ b/test/unittest/arrays/err.D_UNKNOWN.uregs_toobig.x86_64.x
> @@ -1,4 +1,4 @@
> -#!/usr/bin/bash
> +#!/bin/bash
>   
>   [ `uname -m` = "x86_64" ] && exit 0
>   exit 2
> diff --git a/test/unittest/codegen/err.deref_0.r.p b/test/unittest/codegen/err.deref_0.r.p
> index 68ebc99b..f7dd7d99 100755
> --- a/test/unittest/codegen/err.deref_0.r.p
> +++ b/test/unittest/codegen/err.deref_0.r.p
> @@ -1,4 +1,4 @@
> -#!/usr/bin/sed -f
> +#!/bin/sed -f
>   
>   # runtest.sh looks for "0x" to filter out pointer values.
>   # Strip the 0x so that the illegal address will not be filtered out;
> diff --git a/test/unittest/codegen/err.deref_1.r.p b/test/unittest/codegen/err.deref_1.r.p
> index 68ebc99b..f7dd7d99 100755
> --- a/test/unittest/codegen/err.deref_1.r.p
> +++ b/test/unittest/codegen/err.deref_1.r.p
> @@ -1,4 +1,4 @@
> -#!/usr/bin/sed -f
> +#!/bin/sed -f
>   
>   # runtest.sh looks for "0x" to filter out pointer values.
>   # Strip the 0x so that the illegal address will not be filtered out;
> diff --git a/test/unittest/codegen/err.deref_i0.r.p b/test/unittest/codegen/err.deref_i0.r.p
> index 68ebc99b..f7dd7d99 100755
> --- a/test/unittest/codegen/err.deref_i0.r.p
> +++ b/test/unittest/codegen/err.deref_i0.r.p
> @@ -1,4 +1,4 @@
> -#!/usr/bin/sed -f
> +#!/bin/sed -f
>   
>   # runtest.sh looks for "0x" to filter out pointer values.
>   # Strip the 0x so that the illegal address will not be filtered out;
> diff --git a/test/unittest/codegen/err.deref_i1.r.p b/test/unittest/codegen/err.deref_i1.r.p
> index 68ebc99b..f7dd7d99 100755
> --- a/test/unittest/codegen/err.deref_i1.r.p
> +++ b/test/unittest/codegen/err.deref_i1.r.p
> @@ -1,4 +1,4 @@
> -#!/usr/bin/sed -f
> +#!/bin/sed -f
>   
>   # runtest.sh looks for "0x" to filter out pointer values.
>   # Strip the 0x so that the illegal address will not be filtered out;
> diff --git a/test/unittest/codegen/err.deref_string-assoc.r.p b/test/unittest/codegen/err.deref_string-assoc.r.p
> index 68ebc99b..f7dd7d99 100755
> --- a/test/unittest/codegen/err.deref_string-assoc.r.p
> +++ b/test/unittest/codegen/err.deref_string-assoc.r.p
> @@ -1,4 +1,4 @@
> -#!/usr/bin/sed -f
> +#!/bin/sed -f
>   
>   # runtest.sh looks for "0x" to filter out pointer values.
>   # Strip the 0x so that the illegal address will not be filtered out;
> diff --git a/test/unittest/codegen/err.deref_string-gvar.r.p b/test/unittest/codegen/err.deref_string-gvar.r.p
> index 68ebc99b..f7dd7d99 100755
> --- a/test/unittest/codegen/err.deref_string-gvar.r.p
> +++ b/test/unittest/codegen/err.deref_string-gvar.r.p
> @@ -1,4 +1,4 @@
> -#!/usr/bin/sed -f
> +#!/bin/sed -f
>   
>   # runtest.sh looks for "0x" to filter out pointer values.
>   # Strip the 0x so that the illegal address will not be filtered out;
> diff --git a/test/unittest/codegen/err.deref_string-lvar.r.p b/test/unittest/codegen/err.deref_string-lvar.r.p
> index 68ebc99b..f7dd7d99 100755
> --- a/test/unittest/codegen/err.deref_string-lvar.r.p
> +++ b/test/unittest/codegen/err.deref_string-lvar.r.p
> @@ -1,4 +1,4 @@
> -#!/usr/bin/sed -f
> +#!/bin/sed -f
>   
>   # runtest.sh looks for "0x" to filter out pointer values.
>   # Strip the 0x so that the illegal address will not be filtered out;
> diff --git a/test/unittest/codegen/err.deref_string-tvar.r.p b/test/unittest/codegen/err.deref_string-tvar.r.p
> index 68ebc99b..f7dd7d99 100755
> --- a/test/unittest/codegen/err.deref_string-tvar.r.p
> +++ b/test/unittest/codegen/err.deref_string-tvar.r.p
> @@ -1,4 +1,4 @@
> -#!/usr/bin/sed -f
> +#!/bin/sed -f
>   
>   # runtest.sh looks for "0x" to filter out pointer values.
>   # Strip the 0x so that the illegal address will not be filtered out;
> diff --git a/test/unittest/preprocessor/err.ifdefincomp.r.p b/test/unittest/preprocessor/err.ifdefincomp.r.p
> index 7629ac59..68cbfdbb 100755
> --- a/test/unittest/preprocessor/err.ifdefincomp.r.p
> +++ b/test/unittest/preprocessor/err.ifdefincomp.r.p
> @@ -1,4 +1,4 @@
> -#!/usr/bin/sed -f
> +#!/bin/sed -f
>   # GCC 16 improved diagnostics formatting.  Until GCC 16 is the minimum
>   # supported, we have to sed it back again.
>   s,[‘’],",g
> diff --git a/test/unittest/preprocessor/err.incompelse.r.p b/test/unittest/preprocessor/err.incompelse.r.p
> index ae9a6833..64ecab97 100755
> --- a/test/unittest/preprocessor/err.incompelse.r.p
> +++ b/test/unittest/preprocessor/err.incompelse.r.p
> @@ -1,4 +1,4 @@
> -#!/usr/bin/sed -f
> +#!/bin/sed -f
>   # GCC 16 improved diagnostics formatting.  Until GCC 16 is the minimum
>   # supported, we have to sed it back again.
>   s,[‘’],,g
> diff --git a/test/utils/clean_probes.sh b/test/utils/clean_probes.sh
> index 16052cbc..6cc176a4 100755
> --- a/test/utils/clean_probes.sh
> +++ b/test/utils/clean_probes.sh
> @@ -1,4 +1,4 @@
> -#!/usr/bin/bash
> +#!/bin/bash
>   
>   TRACEFS=/sys/kernel/debug/tracing
>   EVENTS=${TRACEFS}/available_events
>
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
