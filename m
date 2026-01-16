Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5D033ADAE
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 15:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768577773; cv=fail; b=mYtMWI0Z2XOA5PUnqDAsS1iA/75BlVVbqV1q8pIi8FtE8VXTBIKom3nh+QKf27o+w1P+jkMPZ7UZ3Ua5e4WprWGzPosoLYOepiaqdS3cGNWguw70aRREV7BO7BST3AoP3Cu/8++xYGyQVoKyydHQhCbVUhcMn9BzZHwxBI1y4Io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768577773; c=relaxed/simple;
	bh=3Nx9+w3REU6gtPXeJ9X39QdWrBuJstd/rmx1uJE2V5w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kGi6qWNJlamluse7w+7rqCcDWRECv2Z8VVCmFtU+rdBY7XPXLV4b9UuE6cKO/fow0j2dowcYRYmpcb94TGMvhcpYFAldIOdoYYUKe5cJlL1raZhv3PMZcgbzPG/E3bCmTZbN1tcnW8fibFfSfCB/0NxBiu59lrhypUk9DTY2210=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ksWmhREM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ShlKsoOT; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ksWmhREM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ShlKsoOT"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GDRdEc1656281
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 15:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=IIfEbCERYvY56HXvtPPGwApcswhj/N6N2tfarKPuVI8=; b=
	ksWmhREMbtLldUBibMoNxpSdeF5VZAancNte+QxdFN9aPxR9Mx+h1syh6xSVGM99
	nLFY9clEHvdzlM7nmxPa7NPkLwxmf64PiX9K7zaaibTiCMfxu48620XIhrv2g7OU
	eIu5Wi6GVlvGpafh1I1jnYuUUKgMaUP+97DR8KOPUbDlNyL7ceHarbE7/9X4RBQX
	D01Arj8DJ/5rSwg1KiIVWS1MGmS/4Y7CLnGYwi3pTD4gOD1OlIHIAVpyVCFfnF0R
	vSjPo96KYNSJmsK5D2SZDi6HrrqxPR0oRoTbZmKoXlDB9InPxqL2YeccjczSD+0U
	juGPQlV9jZeUSSZ2AlSIRQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bp5tc5e37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 15:36:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60GFV7tU004333
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 15:36:09 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012039.outbound.protection.outlook.com [52.101.48.39])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7ptvg6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 15:36:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rQYd/B9ARmmIk2ynAzJ0YEzm9IhyelB6aqkCqqXbw8s3flq5RyYDeGjwLBcaRnGlhEdnSK+wzvSPv0tDsOyPD7cQpdZ3deqcQcf5gbEGHsBSTSJ1WcDy6NwY98yizjPQXSWGkZq38LJqiKHJET6Z/2N5+EQwYcXhotGHcMJ5ATUbeZgde2bpb12lz//++ZTtr1+BaVdomo6H9SYRgJo2hHSWRcj4ju9kkxFJ+/Qw5mwg9+AYDcdyxp66jY3XGfaFzhZaF2//P+57wKM+dwjk3BocNxlCelfz3N4bC+7CoH4iYgOiJIrl1F9OBO2aOltX89bWxiON0UqBi2Nhs/nFKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIfEbCERYvY56HXvtPPGwApcswhj/N6N2tfarKPuVI8=;
 b=DTJR7MLo/8BocyjbHrE2WF6m3Ur68UG4O8aHXBMLH6U4bHw8MV4gDBDPIq3yQC89W+p8sfNarrjHZ0/OKDam4mBD5H1lh1LEa+AOp+iGuy/tElYtjKFdgm5U9AvKtUrKr+3mPV5VD2/r6+Htaf9gBE8Ip13kop5IJmGSdc5yGH6UNrTwrgvC0w20BxdMA4UICdCTiR81Ol/zvqVwUVTa4hb2DocXqTGnToWxwQf6m6TwCmocBz9NMqmTUD8yUPVdfg8NwE6VZ0H/WJr4T5bSQMem9XeiX+Ep0+F7pToAJsmmA3t95vk8DwTBtkqLH0dh5uopywcU1WG8AVBHe26wUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIfEbCERYvY56HXvtPPGwApcswhj/N6N2tfarKPuVI8=;
 b=ShlKsoOTrr98zsW02PjMPiOeWA3ASYnEvhrH2hMHGMHt5fqefoQ77G3kww2D2a7yez/7DIudxEsEjVfR8O78QTwhaO2eo39/An86sGUk3FsqGNWpCu3qTVMqyapRpklEDH87cRMFlyv9+3MpDOrItWKWQ8cliaykjvm0pQZQlKk=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 IA0PR10MB6865.namprd10.prod.outlook.com (2603:10b6:208:435::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 15:36:05 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%7]) with mapi id 15.20.9478.004; Fri, 16 Jan 2026
 15:36:05 +0000
Message-ID: <a82a70e5-d74a-4148-88dd-05983e59ef5c@oracle.com>
Date: Fri, 16 Jan 2026 15:36:01 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] stapsdt provider: simple system-wide probing
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20260113165132.2454591-1-alan.maguire@oracle.com>
 <aWpPxsFlQgZ9M49f@kvh-deb-bpf.us.oracle.com>
 <b1973c8b-09bb-4528-9339-28110b48976f@oracle.com>
 <aWpaLckFtfY9uUPK@kvh-deb-bpf.us.oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <aWpaLckFtfY9uUPK@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0276.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::25) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|IA0PR10MB6865:EE_
X-MS-Office365-Filtering-Correlation-Id: f6414b29-42d3-4174-0ef7-08de5514f612
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ymx6RWMwZzdOb25WNithOGpobEdLVk16eEpTblJjaHdqNEl5cUxRaElPM2hI?=
 =?utf-8?B?QUd5bGx1SnRtTjRnaHgrZVhSckV1aGtybWlnUlV6L3dXVnlETmZSdkJjamd3?=
 =?utf-8?B?ZjJubWEwZHc5QmFTVXdnWmpRU2NXcHpVQys2amVNeldqVnhpazFZbWtCd3Y1?=
 =?utf-8?B?UkNObDVpRnEwdW5jVUQwUWpVVEFWajNVb0loSXVQRytrVWJWZkd2NDNjYXpH?=
 =?utf-8?B?OXBGNTh1bzhHLzloRU00T3JIRUVpZTBKYmJTQm0vYjlKSzZTK3YvU2dwRXF3?=
 =?utf-8?B?ajQvZnR1WkJzanVFU25TL1BQRUJ0UzhRdnNQcXhlNmFrQWdYdzRDS2pBMmVZ?=
 =?utf-8?B?UTQ5aEtlSjVPdHIyK29Qa3AwTVNvNUtWejU2cWhxbDdwcFRocmhVell3UzVi?=
 =?utf-8?B?NWV4dlVLK1lsSm9xVXA0dmg3dDdBSzhpYXRBUTVlaWRjQmQyNUZZSDRYcmFx?=
 =?utf-8?B?Z1ZheUJkVWpNMG1vSUh0UlgwVUZERTN3R2pONTZCWWpmMU1Pd3ZrR0pTWVlE?=
 =?utf-8?B?aFNFM3pCRURuamUrU21nYzQrbkdKN2RmZVRGRWtlYVc0dFlFallMUlBwTEha?=
 =?utf-8?B?eDhCUXFadWRtVlJoNTJ0blFlbVlRUnlYMzRDbVR2SnVHK3ZYSXhUeDNhMHJF?=
 =?utf-8?B?R2s4V1llWWdML3d4Z1kwSVFzMXZWUlBWaHBjUkF1Mkp3N1dZUUpZREpiTVVv?=
 =?utf-8?B?NTZpeERiUy9aQlIxa1dtcjNBU2d3dFNtaDM5STFiRENUb05WU0dVQzhNUElh?=
 =?utf-8?B?S0JrMmVFUWJudTdrWjdyTUZKMDVuTGtIY2lRMDJyYzNod3pRY3BuV1FqTTRx?=
 =?utf-8?B?eitycjlUbldrT2VVNjdZVnZlU3NZbGpaUm5wTWZZNzFENUJXZG8wYmIvQXR0?=
 =?utf-8?B?WU9NaEM3eTkxREF3UGE5emFVOTJMU2ZycWthMmIrMzFyUXhJMjBua05jcTNK?=
 =?utf-8?B?ZFNNSkhLTUNyTkhDOUZKSE93cjBKU2R5VGE4d0dQR3Q4OGZjOWFnbWEzdU9M?=
 =?utf-8?B?WmIyN21nWkVRSkxNazh3UGFYOGpkb01KRVh0WjlOaHJYbFZuZHI3WThCK0FI?=
 =?utf-8?B?TzBOd1BkQy9aYllscFNjT2drSXR0cVM5blZkZFFTN3RvNzJZZGsrMTUyb2dW?=
 =?utf-8?B?QU9uNzVpWXA5djVyMmlhb2dJSEl0cmpZTzYvY2xBRXZhU2lWZkU2SEVrZlhQ?=
 =?utf-8?B?NHpRd1RNZlFySzB0TzkwSFhKT0VqWnQrcjgzNHJLa1NlemVKcVBMekZNVk03?=
 =?utf-8?B?aUE1TjJrMFFiTitRVVVaekNpZVJiOURMWnBVbXg0SjlmNUkrYmlMS1RtN2dU?=
 =?utf-8?B?MXVheWlYcjNBdkVROXBkSzdZM0xRbFp2dVI2QjFRL0lEZUNMZUJQY2dzbEJw?=
 =?utf-8?B?MXhDeWhXcFlwNy8xbW1rVE91U1dKQ2tmV0ZJV2xDYnFyWWZmQVAzajNkdDg3?=
 =?utf-8?B?ZExHUmZoMDEvYnllL2YwMDBHTWZkQkxTeEthanpSRHlxVExIZGRzcERKaWxX?=
 =?utf-8?B?SzNXNjVrLzlYbzNVSk1YTjdzNGttdVhCUTRuNit5OUlPWkxjNFd0MXVTRlJp?=
 =?utf-8?B?UVZJS25HLzFyK1BYa2JBdFc3a3pRY1F2aUxUZ1Qxc0h6UFF2UDVEWUVVSE5U?=
 =?utf-8?B?blNmd1BPUFpXb2R4K0VXNzFxSU9XT1JhUkpFVTQ1emNyTnFKV210cTdjYXU3?=
 =?utf-8?B?R1JtZkNDTmREZmpTZThvUzFVVExTeFYvam4yWU1FUHZzYUlNc05ZMnNvVmFS?=
 =?utf-8?B?TGxVRk9YOEU2NzBjRjEycyt5OHlYVUdKK3lQQ1g5YXkrUThoajRZeGZVcUJx?=
 =?utf-8?B?L2hzWjhCMDlxeEdFckN3ZHpldklNMlJrNjJBUnkzUmRTSEQ3cy9WNDRaSU1H?=
 =?utf-8?B?NVJPVEdnN3hEM1FCREtOQWRJUm5KdHZNekg5QWVCYTkzb0RQU3E1REg2OW8z?=
 =?utf-8?B?Y29mclBjblZJNTZSNmdOU1p3Y244WGkyWml1NnBsVzNhMlVFT0twdG5TVVN4?=
 =?utf-8?B?Rm5JUHdUS3V1NWRqQ1ZjQmhYb1oyd21aVVM2ZGFLRGh4NUJud1FMZXRYWWRH?=
 =?utf-8?B?dExpVUtoQ1Y5NHhrdGMyenkyQzB1aW5lMEZiRlBtSXFLRUpXa3JhRXRxTDBV?=
 =?utf-8?Q?APTw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0xjTEhuTUxQNXJNeXpqM3FHbEVvcHAxbE03RDFqbVdvRHJDTStEc080YzdD?=
 =?utf-8?B?a3pLRkhMUTRWN21SUnpUMUJwSEp5bnRwSnk3ZWRMay93SUo3QWFzaWZuN1BV?=
 =?utf-8?B?T1k1UG0rQXlHSCtWNUR6azJwSWFkdnpjbXM4UGZYWkk1bkVxMUVLempOVmFu?=
 =?utf-8?B?YnBHclNhNG1XNUYwNURkL1BkU1M0dGdiRTI5dFRDVHFtYTVvbTRuUDhKVWFZ?=
 =?utf-8?B?MVRKSXFEUVhKOHQ3Z0xWaDlvYzVqVVJwSU5yQXhENVAvd04veVBRWE9udWZP?=
 =?utf-8?B?VjlxbUtKemdrZmpuc0pnQ0JRL3dUdGhIejdRR2ZaY2paWXN6Y3JjTWN0VnZm?=
 =?utf-8?B?REJHcXE4VWF3QXZmODY3WngvcmVFU2V4bVkrbnhmZXFmdTBkdWdFZHhtS0Rq?=
 =?utf-8?B?U2IrMVRxVkFwc1Fzeks3UHpNdkh3Rml1Q3IzRnJCaGR0Wk1qK1NOR1krL3pT?=
 =?utf-8?B?YWZlbWxiVmFsNzJLMHNCMTNUV1BwYkFlcWo3anZQZ2NrRVd5SXZzTmJxOU5H?=
 =?utf-8?B?TVpxbkN3V3FFTGxhN0h6K1ZoR0VWZ1VDN04zem9FMlNHSEVEdG1UUmdRS04v?=
 =?utf-8?B?MHowQit2cDZIWHg2NlREZW9NNVFNMXRCeTNNVHFPUkRSM01oRDliL211cDYx?=
 =?utf-8?B?dnNVVzcyV0pVMjNCWm5VRmtZZy9UL1ZqMkZXWUZmbm9TeXdJKzkyQ1R6enRn?=
 =?utf-8?B?TUxBd1dESU9zN2ZFaVEwRWNoenBiUTBoaTVpdzB2NGhLUlBGS05jODVJRDVH?=
 =?utf-8?B?QjhpN2RISzFXaVBkTDJsOUErWnhJUUVadFpCVFpFRkViZVN2cFE2RytrMVl4?=
 =?utf-8?B?N1RtTjJ6Z3dkQS84NGVuU0tQRzNhcDA1NVFwWEZkNHF6djZkbFppRzdObThZ?=
 =?utf-8?B?SEtvVHM0cDIvN2EzY3A5QVl5NmlYd0cwUkxxczUrOFNJT1I5Yko0ekxwUVlC?=
 =?utf-8?B?WGxyWjQrQVIvSVh0Ykd3ekJWWkZlbUVBVWlxdGV6cjBGTE5mYmkvYU15REpE?=
 =?utf-8?B?MEh4UURadmxMVWZDRjUxYkZjTXZFOXEyR2ZnNnhxVFBEWFBBRUMyeXJ2Y1d3?=
 =?utf-8?B?SktrcndONkdDS2krZFhTa3hCOUVobFBQclNPT2p4RGl0TWdjZUUrbW9qVVUr?=
 =?utf-8?B?Lzd0UlBRM3RVMTQxaW9yUGhVbUh5elN5Y1JBcjRCTC9xRXRvdVpJTWUrbjQ2?=
 =?utf-8?B?dC9nSG1pREtndDQ0aU9lTjZ0QWhTS2VSRFZsR0xsUlpzUkRwQldvN2hmRTIz?=
 =?utf-8?B?TDh2K1Jtd2Rld3Jzd01RSUU5Q2hWUzk3aXVjQ2tWbzFUSVNRNG5XeHc0QTht?=
 =?utf-8?B?KzE1ZVE2NlNOckp3bFFtaW44U2NlOTQyQjNueDNQTTE4YzRFTVorTDlKUkpD?=
 =?utf-8?B?K0c2azhKQWtRckhjQTVPWjNKSlJXbXpxS2xxWWV5VHVPN0JkS0Jnc0I2eGZ0?=
 =?utf-8?B?S1pkNGtsNkxFUjJKbllMTHkwU1dPWkVvMU5md0FtYmE0OEdONHdSUlJzbzdI?=
 =?utf-8?B?M3JWUTB2V1BGNVFIQXVGeGtvdWRTV0tQNDl2VFRxNmNZZzJOTnBMUGFtOHF6?=
 =?utf-8?B?bFBTMXQwMU1hR3dvVDZXdGRuUEp5NnJJd3FpVElMMWxmQXdhWU5XMXJqK3Bn?=
 =?utf-8?B?R056Vk82UXBRQ1doeGgvOWhEQU40ZkUycXBHMnVrRTVhcVE2Q3lvVk5ESk5z?=
 =?utf-8?B?akIrN010RWxTT0dFZTRWWFE1ajlSQU4rbnI4bENHVjROYmR6TFB1SFRYVjh2?=
 =?utf-8?B?RkVCN0hvZTJSRHZMRlo1TXpmS0liZ3o3b2p3Smx5UFNUSXZMZDBJN2xMQ0wz?=
 =?utf-8?B?eHJNekg0UWd3OGdEU0JjWDBmd3U2b2IxUDVZSUhGV3J1ZjF0c1VmbE5KcjhL?=
 =?utf-8?B?ZjZlZGtER2lubjdHUVoyUFV2R3MxbU9IaWk5Rjlha2E2U3FjNDFyTlR5MGwr?=
 =?utf-8?B?QmFIUGVnR0d0dUx3ZUhjcVNTNk9XVWlIKzh5aTB5RVJ5VDhsbThHeFdSN21t?=
 =?utf-8?B?RXBmVFRQcmkzcFd5YmVMMHJxd0lScVRPT0toTTFWZjNaWDQrdW9FUTBKYXlF?=
 =?utf-8?B?ajBZTVUxcUxDNmdKYVZaTXhjRE9RaTJMUDgzMHZJRzNyRGw1SHdBZThjRS93?=
 =?utf-8?B?b01SaWpSdHZaaXAwK0xpbE1NYVROMzYrZys5ZDQyOXJJYUh6Q1REZ3BmNytB?=
 =?utf-8?B?bWRHMDZiazdZRm5GNkUwMTFnc2pqOUdrSGZNamtLWXhmeDMxbEEvUEhDSVVM?=
 =?utf-8?B?WmxuZ21NbitKNG1tMDlBcjdwa0c0RnpDUE82UEZOYU94MzhWOWppd1dsaHFv?=
 =?utf-8?B?ZUdLTS94ZXZSYmFpR1YweTZIVCtmTG5TYlpCd0VYNHhCcWZ2T3Vhdz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HYoXJ8rg2wh6Siz9taghve4N/PfyPwdID5qK9TSNnlHtDbvP/lBqDMFjS3BtFZ5TpcKljzU+Kbj+zLrOdt3RrX3KVFo4qq+e4lQbZw7oPgnggE0fcOF9rWQpM8iaZUUKFw55Kopr4jzYCJo17KK6OeZjQbxndnDkcxeX/W+Kz1ktT+huhlb4my7AJ/NS7klyTy3W9HQkQDi464ykTIxtbnhS/A+6lnX2dP/U06I4PaNkgj3Z1BORq1wnGqQjwjDqjPR7yBbwjVnxR0w9EMIzG22PqQQPXVBkTVufFPFsr1hmt4mmQTXqbN+4/jWeuRYFDVXQNY/BhmjzWDZ4ES390p9Y6nxZh4x5o9TglJS0kCblWU3hUk13sP+2EEskWyKZ7maPYCjoQw8uvy4h5Ic9TVu/ey7qcyejzJCDxIaICHhDyEL4BWJv9IeR4ku85V5pf638QYngJ6PJevWa39bnmueOFLmB3XQfC35hbiSr7eFA0xUlOCCyHLv1Kk9Q/6r60BBxUF92g3BBea52AaxgejkBO/52L1eTbNf3pX0PMYApf/+BKod0kuhBr6Id0T/wPxaiJ2uTUbFljGYDGlrYkT613fesuBkgDc5S+SP+5Hg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6414b29-42d3-4174-0ef7-08de5514f612
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 15:36:05.0368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mV3rIDnXQJ5GV31E+u0yb5NE+capSWfqLLTl7o0WzN3ORW8EbFo6qFLVZqi1rcGQNWkdha8yc0MyweBn/4jZVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6865
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601160111
X-Authority-Analysis: v=2.4 cv=XP09iAhE c=1 sm=1 tr=0 ts=696a5aea b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=w0-NzOAuqYQ1A0JFEpwA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12110
X-Proofpoint-GUID: 2w6v8BGRndHoWJJhMcEdSmKNzumfqUF7
X-Proofpoint-ORIG-GUID: 2w6v8BGRndHoWJJhMcEdSmKNzumfqUF7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDExMiBTYWx0ZWRfXw8Q/FmvAzJGa
 mCKt8GgckVgNLrcas3GMam8yjJLjwLA1dGwGI08HYsWIR+7mtl1cWjdEPmdciM2AUR2UjqU4Yww
 roecfD2sWS8y5rC6wxhaWJApAufaF+XDPabMVk+BfATcSET+/c5EUybm/0ImQ3J8ksewG4BAJv5
 XHUbOXfMdfPyhy6N6XJeACUHAYbbVuQSbSSEXi1K4uIZ/+8wnGym3D9B2ADhPPmnQuSSgX6K8IS
 xh1AO8SInp5OobYA2iviD+RArb6u5szaLX+NABcRddD8tb/jGZSRTwpOCXYtRrPlzXPv1gSyxcA
 1eG7m3b8foDKJbhh1n1HDrbLODIwd54XRAVVrg8D6XBAtGWCvOr5/eEMyz8Lkpl+9HQZAuR/aNz
 N2Uw+dzXpFwq9gLtrAfdMQLHNqM9Gi+tuq/b9pk9abZCqUqsofFhUZb5y9MV5ZtzTKTML/XUyV6
 sVcGfY4dbUpu92lbiN6bUPbj2dPgbV24hZPE3Hgc=

On 16/01/2026 15:33, Kris Van Hees wrote:
> On Fri, Jan 16, 2026 at 03:10:52PM +0000, Alan Maguire wrote:
>> On 16/01/2026 14:48, Kris Van Hees wrote:
>>> I think I am missing something...  IS it your intent that this patch provides
>>> for full system-wide tracing with wildcard support, i.e. where you can use a
>>> probe specification with wildcards that is not satisfied yet by any probes in
>>> userspace processes, and as processes are started, dtrace would attach to the
>>> probes and start tracing them?
>>>
>>
>> Yep; this works, along with tracing of existing processes for the traced
>> object. See the documentation patch for an example of doing
>> this with python. The example will trace python probes in python processes
>> that were started either before or after tracing has begun.
>>  
>>> I do not see how this patch series accomplishes that.  If anything, the tests
>>> are all using direct invocation of a single program being traced, so the probes
>>> are guaranteed to be available (discoverable) at the time of D script
>>> compilation.  I do not see any test that ensures that a 2nd process with probes
>>> that matches the probe specification would also be traced correctly.  There is
>>> also no test that demonstrates that starting dtrace with -Z (allowing probe
>>> specifications that cannot be satisfied yet) and then starting a process with
>>> matching stap probes in it results in being able to trace those probes.
>>>
>>
>> That's more an issue with the tests than the functionality itself. I can
>> expand the tests to more fully demonstrate this. It's just easier in
>> practice to invoke the associated command with 'dtrace -c'.
> 
> OK, but without tests that actually exercise the functionality, there is no
> good way to verify that the implementation does the right thing, and that it
> will keep doing that (i.e. detect any regressions).  Without tests that
> exercise the functionality, we cannot review and merge the patch series.
> 
>>> So, I do think I am misunderstanding what this patch series is aiming to
>>> accomplish, which is probably the reason I am having a heard time reviewing it.
>>>
>>> ALl the tests in this series, as far as I can see, do not need wildcards at all
>>> because you can simply write prov$target:... and it will trace the correct
>>> process.
>>>
>>> Can you elaborate on what this is intended to provide?  Or if it is meant to
>>> provide system-wide tracing with wildcard support, can you add tests that do
>>> exercise that functionality and show it works?
>>>
>>
>> The tests demonstrate the case where we start system-wide tracing
>> before starting the program we want to trace. In that case 
>> systemwide tracing adds the value that we don't need to trace
>> a specific process in advance; any process that has the probes
>> will trigger firing.  For example, a user wants that functionality to
>> trace probes in future QEMU processes regardless of pid, so that's 
>> definitely something folks want.
> 
> Actually, that is not true.  Since the tests in the series all use dtrace -c,
> the process is started prior to resolving the probe specifications as part of
> the D script compilation.  So, they do not exercise the case of starting
> tracing prior to starting the program at all.
> 
>> The documentation patch demonstrates the case where we want to trace
>> an already running program/library; in that case I started tracing
>> python3 probes and captured (already running) tuned-related events.
>>
>> Both are valuable I think, and the combination of both is too; i.e.
>> regardless of when a process started (whether prior to starting
>> tracing or afterwards) I want to see events.
> 
> Oh, I certainly agree that this is the functionality we want.  I am just saying
> that the tests in the series do not in any way exercise that functionality, so
> there is no testsuite verification that any of this actually works and that if
> a regression were to occur, that there would be tests that show that.
> 
> So, we definitely need tests in this series that show:
> 
> 1. show it works for executables and libraries with -c (you already have those)
> 2. show it works for executables and libraries with a program that was started
>    before dtrace
> 3. show it works for executables and libraries with a program that was started
>    before dtrace AND for a second program that was started after dtrace
> 4. show it works for executables and libraries with two or more programs that
>    get started after dtrace
> 
> (I think those are all the cases one would expect to work)
>

yep, that sounds right. I'll work to add tests to cover these cases explicitly.
What do you want to do about the absolute path support - will I remove it?
