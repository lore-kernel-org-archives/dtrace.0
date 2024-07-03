Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A137B18E25
	for <dtrace@lists.linux.dev>; Wed,  3 Jul 2024 13:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720011676; cv=fail; b=kAGOwwWbJYTOhLUGSX9sEed1/7DdIIN10bf/XTiZhwL+qjeQD3dW4JTK7anSwelQ1x2kl/cXqirAK7eYMBO4pXnNekHBQhx9Sjd8VMg+C57wvPsfQkhGfPY+oxJvzMkNN6tzOgqDCsR92X6Y05YWxP89UD4wUJUYRCO4+dMTEOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720011676; c=relaxed/simple;
	bh=B/OGGIaV3QHq6CQo/laeFZeQ+vLDPFKrX5L8IncsfFg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=K2/ghPthqwCinpT1UYGLHNHxjqoTj/MtgnBQmNJs8LCuQjEQ77mf1+TUbrAFpqN0a1USafYyWrG/q3BUHKUVvineLYLZkNVTqQnDgyvP53bcQsdLX2Db1O7SEZDSm8mTsh7jj+tTHNmnsTYf8pM9z3G+J9bBhNSQvg4tImJoacc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cdSMIrKg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NmTEoPXE; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cdSMIrKg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NmTEoPXE"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4638OBbN012538
	for <dtrace@lists.linux.dev>; Wed, 3 Jul 2024 13:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=nzPNgbna1qBZAsTbAkooWgSZwhnlRE6xvHkOtPftArE=; b=
	cdSMIrKgF4UlwhiNUskl34GJxI+gUp6Izm8GgT4ZYPtTLlKhdnKzrUyUOo5qKw3r
	3wsHGgFztGtgVCOowyXZLrYf4NuFCS/CeHmx9zwhciyCkAxirbg185/w4IWha7EY
	8iLlB/QQ13UpYRHDzhALHJ/hoYOsVI7r4bxpD7ruLyElU9zLouIDSBGHeR4s+Gev
	F6eRh5q0nSg6eiGpC+Iple3G0UPPyUg9dxWM0FHGkJbnBVicLzbiCWQToIHCyeO2
	ixPpGWRfXkebImPItUcCAltvuHqO1D8ixuB1swCu0uwPIkHsfswG1MfVjvPEbS3i
	3s8TbwUrlIfF0KBUYbUTvw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40292302xq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 03 Jul 2024 13:01:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 463Au6sq023603
	for <dtrace@lists.linux.dev>; Wed, 3 Jul 2024 13:01:12 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 404n103g5j-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 03 Jul 2024 13:01:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oC244wmMvCVqy1J3UyjuCRA9h3XcmClpbv0p708YKS5UAyQcJU55PekdzQp3BgulnqUrLhrTkp3TYbjukELKtjXcPJ2p6kX6CsN/CJ84fQ5HwASbeHlkHjtJxyzota3ZIfmWcNfgxLvZhd7Vo7jNs/zhgPw91nZQHuecqYAD9ooqQmPPP3jdc8wjvOonKoRUXHguv24AD+TUqaKji3oDLnjusvRTK0YFbczreKo5osQpBPYqNFuNNyGsWGRNga9dlrIOSPyW2erbhPRevfJQAg1OiJYZMGU1/vrj8GA2SwNzJsNphMx2J30aYgnSxmQdh2g8Nims59la54DwRN6k9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzPNgbna1qBZAsTbAkooWgSZwhnlRE6xvHkOtPftArE=;
 b=krMTvCA6wT2g0USiYECDUH5MqVauvhGzx3WmDJsP9EogYcdMdko762y82wATon/iNHWRaAZ5L1ptUDXawOeQExcOYRolgdcXzqxeFhNrdSv39CncOBtIcpdCQML6iB0GN54Cw2EszUIfB0hnWUcg/+RF3aLAOzJFNxXemcMJw98lgGZKQ+PPxHLArTne+2pAWjsAtPtoHuV3EjUd2IEk+GIbACo3zfLcfuLn6gjRkVm69Z4aocE9x9f5jH0H9N0zG+UDwZQXc65spI7oOneSnzOGoMeNPsRKz/Iyk3REQzXYxXOLMkFfS9zvCyajbJ0g6YyUgxEkuEg4Mov2L/ylNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzPNgbna1qBZAsTbAkooWgSZwhnlRE6xvHkOtPftArE=;
 b=NmTEoPXE8/WHbaYGay0xEcJw6VMg0TdEggXWO01jh0UHmoMpMdJdvjtvBZYCk6EkcudKLGXqYB/JeZ7RmYlagOUDqdCUrYUIO42C6Xaa52smqSpHFS2QWrFJ2X/Cq/TGxOMnX51K6UHVbVtqXlQgvscTjeSM3zFs2NoD/YjmNwc=
Received: from BLAPR10MB5267.namprd10.prod.outlook.com (2603:10b6:208:30e::22)
 by MN2PR10MB4159.namprd10.prod.outlook.com (2603:10b6:208:1d7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Wed, 3 Jul
 2024 13:01:03 +0000
Received: from BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f]) by BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f%7]) with mapi id 15.20.7741.025; Wed, 3 Jul 2024
 13:01:03 +0000
Message-ID: <50a94872-118d-416d-ad47-3e5c5f437870@oracle.com>
Date: Wed, 3 Jul 2024 14:00:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] print() action: identify ctf object used for print
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240426133327.578092-1-alan.maguire@oracle.com>
 <Zn8xVd+r8SzmLGH9@oracle.com>
 <9fd33071-54a9-497e-ae90-4daa63eafad0@oracle.com>
 <ZoLeWRMOnCoecHmx@oracle.com>
 <2b83e5e2-adf1-4a5b-abf8-a83fbaf65abe@oracle.com>
 <ZoLrt+Q/DWf6K9q4@oracle.com>
 <2630cd6e-0f7d-4a05-a711-85d251045b13@oracle.com>
 <ZoROKlfr5tnaBRVO@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <ZoROKlfr5tnaBRVO@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P251CA0021.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::26) To BLAPR10MB5267.namprd10.prod.outlook.com
 (2603:10b6:208:30e::22)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5267:EE_|MN2PR10MB4159:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c205736-23db-490d-063e-08dc9b603181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZU1mNjNVdVJzc2ptS0s4LytQRXFKUW41VFlMZlZRUGNNUExKOXFjTVZEcThH?=
 =?utf-8?B?WFAxWmMxeUtpd1pkUVhCWjQ3UGlwODdQYVgzd2cwczRpVjhseENQMTF1REc4?=
 =?utf-8?B?QWpkbEdYdk5iRnBjV2pFY2VhQ2R2cDUrbCtGTUNSbjRobXZuSTZJQ1pGcnVR?=
 =?utf-8?B?MmFGZUMzZnppMEg2UnYzRXVBOWdpZkJRL2MrOWVCZWl2Tko5bGN2SUQ1VFRz?=
 =?utf-8?B?MkN3SExZMUZobzZ4VTlJWXNxenNMNDRjUmtBdE5mamtQTCszeUNlU1R3b1pz?=
 =?utf-8?B?VHAyNStnUFNJZXorcHFqR0R0YThUV0dINGNGeDBieWEwVDdXQ1lxMEhXSWUv?=
 =?utf-8?B?TFJyWG42YVVGUGNnSFJYYnl4ZmNmTmxUaXBwVE9TSU9iVzZRTXR6TjJyME1q?=
 =?utf-8?B?ampaRFVaYXRDYmo0K2dmb2E5SlJRVThEUUgvWGo3SEpNMWpqNiszRWJ6alRM?=
 =?utf-8?B?SlJLeFp5ajBISm5nTzRRVzlEaGJiNDZnOEZUQnN0dXpNbnQ0V3Jtb1hNaVhV?=
 =?utf-8?B?WDNsNVlFTkM2UEFTM2prYVVGZUkxWnRCZWcrT2hGT0g3UWJmSHYvYWEyc1Uy?=
 =?utf-8?B?UklIbytZMUFOOU5rbit1YUFwbVRFZTh5MlgwNTM4VU93RXRXejlzVG4veVRw?=
 =?utf-8?B?VkFnNDB1ZXhZMEJEMk9wZUFKWUJYYTR2TFNGc25UbDdVNGJUVGVFK0JyWDha?=
 =?utf-8?B?Wks2QVpYbk9kSmowWUtBeTN3Yno2MXdHUGJPUnVaUFFWcmlrWDVjTHJlR1Br?=
 =?utf-8?B?SnVwcUhFWnlpV3IyOXZUaUpKcEdKMkV2Mk1KNVcxUVQzVVMyMXd1NlNXazFW?=
 =?utf-8?B?STYxbEV4Q2FueUdma2dVY0puRDhObHE0Y042WmwwL0ZDSDY3bDlHcFh6K3k2?=
 =?utf-8?B?SGw0OU12YVNPNnNXZUE3RDltd0t4QjlPY043eTV5eFEvR21hajBWc1ZLNnZp?=
 =?utf-8?B?Q3RZMEtrWDc5RFVoWEgrelFwUmVjSWs3Z0E1QVZGclUxNkhSV2g5aFhzUjd2?=
 =?utf-8?B?NHU1S0NwNHlxUlJISmt6SzhxQjc0Rlk4cFFrd3lGS3gvWE1yV1c1MGRDS1Zk?=
 =?utf-8?B?S3dXSXJyLzMxaTBvYmxOUzRSeExRV3hYazIwTHB1U0JFRSswVDFLbkdObTVh?=
 =?utf-8?B?bU1PbkhXZWZIMXMveGxDWEFPTzlKdjNPR2lnTjhkcGUzUkthek1ha1pqUCty?=
 =?utf-8?B?azJmdk4vWjAzQVpHdkwxWWRjRUtkeU1Cb1ZEM2FyS1d5Qkg2YVFKR3E3RHJn?=
 =?utf-8?B?bEpmSWdzbjBOaUZOUUpZWnR4S24zcVJaNWpoUkRtRXlWbExyR08zN290U0da?=
 =?utf-8?B?OVJnTVkyOEE5bjh3MXhmNnc0Mlo0c20wYnhUeHNsRHFFRG9mYm5va2M0TVJs?=
 =?utf-8?B?d2tPNGF5WkMwdENUV1QxTWROTWU2cXhVR2xhc2VBdm42Mzh4emNGL1FKZW5D?=
 =?utf-8?B?SEtNRkZscjhlUEIrRmJPandhQ21velIrWDI5c2dHbWdCVVdvWG5YWVBFOE90?=
 =?utf-8?B?YVBuWElXSlY2VGFSdzM0SEJqQytkSnQyUEJVa2s0c2M3NUxkQU5QbDkwM3hN?=
 =?utf-8?B?dklPeHRMa054ODFPSVBIdWVNOGJtT1UzVG5pUXR1QUhnRDAvNEFkQUhqa3ZP?=
 =?utf-8?B?UC9vRi9yYTVibmtSbWwvZnprYlI5T2UrVE4vWlcvaW5oTHc0bjFHdHFsQ3dR?=
 =?utf-8?B?VnZ6VUxDVXJjb3pmeEhCS0FUdThoWUlQcWdoQW05WUtFenFCYjN5RUswOVI4?=
 =?utf-8?B?Y1o2dFV2OC9rUVB3djBqdkNYeVdCOU0zdVVGaVk5aWpoUVVmNjFjUGRVcng1?=
 =?utf-8?B?U051NWg0QjVEK0Y1a2Jwdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5267.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eHFjcjlJak5zUkE2NU9IeDF5RFpmWjArdVVqRmhqdmd3UlVyN0pRNkZRMXIw?=
 =?utf-8?B?UVE2Z1VKaVZVTG9yVUYySzI4eDlBY3Nrb2hPZWhubGwrTGtHUWErNDVSL1cr?=
 =?utf-8?B?RWNFa1BOWnhGU3JvMURqeFNabkhSbGxvbTZiUituZ2RiZktqMXh5dW5mZlhs?=
 =?utf-8?B?ZlRILzVocExrMm5QNmZ6YkVRaXE5WmtWZlM2eE1CT1BDWEdSYkpMYk5WaDEw?=
 =?utf-8?B?eGNMZ0FKRmRhUDJ0WTJFbThjYUZuditOL1h0SlNWWXk3M3Mxb0MrbHhCa1Mz?=
 =?utf-8?B?amVPLzB0UVpXblBBTjN2YVlMRExzMjFIbW5wZzdiQ01qMjFNZjBmcjVzdkRu?=
 =?utf-8?B?WjA1bFpJTncxRXBVck1LZDRFSnZ2RTdPeE5TM21MUWVMT1ZaQUtrR1NOZjBN?=
 =?utf-8?B?REJCbkJweHVCa05KUUhWcTVDZHpRTDJQSkJDT0EvMC9ER1lmcXNLc040dEFJ?=
 =?utf-8?B?aXhCeUp4eU1sWTlURkVEVWFrelAyekE4S1Z3TytHU3REYjRqVEMzVU1hdHJI?=
 =?utf-8?B?ZHl5T0xYMDFsZWxhRHpTMUt0T2ZsOC9qa1REVXJDTWpwNUk5S3BMd2hYZzVZ?=
 =?utf-8?B?K0pzcVpHNEtlNDNCbVcyMVR1WVFwVDR3ajQ2d0xFNXZaT3kwTndzbFNtSUVQ?=
 =?utf-8?B?TW9waXZDY1lrTUtyYTNlU0JvajQzSmZ5WkMyOXp0dTh3ZG4zZmJuanBHNEJj?=
 =?utf-8?B?amx0TnE0M29aOU83a0psTG1qdmpqOXozTlkzbzkybXUwMmFXczVYQWFodVlB?=
 =?utf-8?B?UzFGaUw3akxhMTBwM0hqWlUrdVJoTm9nRERtdi9LaFY5SmhUUGRyQzkyOGlU?=
 =?utf-8?B?d0dLSzVnU2JSNVhLTlU1MWpJc1NLeEdaTjVGZ0hraTZMbHRySDRpVGNwTHhs?=
 =?utf-8?B?alloYUcyUTBOL1FYbGs5V1VlcjlUbTBTQlpRbnZRdjY2WnNKWWFzM1JxaHkw?=
 =?utf-8?B?bXYxclBPZCtPTXM4MUhJWTVHSG9xc3NKR0R6aTc0V1ptSSs1aUh1cTNLcWk5?=
 =?utf-8?B?MVZpcEd6aWlWYWVtdTVrVVJwUFF2L0JvRUxLTnI5Y081bElJd0lpYXVBb1Q1?=
 =?utf-8?B?QUdaS1ZvS2JCK3p4OHVMT1BzOHUrL1VURTJ1SVlkbmNRR2lkbmE2MXVtdXZq?=
 =?utf-8?B?MFUxOEJ0UExXMDNxTmJaU3lWVUFYTXE1Mm5ZV3ExZTl6c3RCODlrUTFGeU5P?=
 =?utf-8?B?bWhVZUd3V0RYTVh5OVBjaXdyanpEeHJnNTRSc2Y3MWRzL2JmbGZOdU5hbzRR?=
 =?utf-8?B?WDlJNUc3Z1RnbTBiNlEyeUY2RS9ZQjY1OFVDSjFieFQ1YWFtV0F2SXRZRnQ2?=
 =?utf-8?B?NW9yWEZiSmN4R3VkMmN0bFF2aFFERW93QTVPSGFWcHJqK1QxNHlsMW1jR24r?=
 =?utf-8?B?M0RvOG94VW9KV2RERDR0MHNFZWJmVU0zTmVmNG91UHR6bWp3NG1MWGFaQUt2?=
 =?utf-8?B?aEFWUU5wQ0o0Y1dqQm1KVzhleUZqRzZYdHIrc0RzNFVna1dzNGI4RTlNdTNo?=
 =?utf-8?B?bEw1Yy80eXFVTE4yMkNPQlZLNWxQVjI2VEVyZjUzSkFWQnBiNE9kZFptM21D?=
 =?utf-8?B?UkJVYWNMRkV5UjFIN01PS0lTMmc4UkFCOElUOG55a2FkVTdHNnllbnY4MzZS?=
 =?utf-8?B?TnZteVQ4bXZ4UVdab2l5dkxhY1h3SWo0VkdoellOVktEU2k2NmYzSGZFQVVl?=
 =?utf-8?B?cFJ5dE9RbkM5TFBFMWsrZ1hXZExuczRVQ1dJMXFPNGozZnowTGt1MlpRZlNu?=
 =?utf-8?B?bGQ0ejFQVUMyYm1HeFF6NXdGK0VyeU1DTm96UnEzN1B6TXR4ZlVWbjNnQlJR?=
 =?utf-8?B?QVh5SXU2dkpMdmV4VXI4cC9QV243aHFDMkRKak5odHk2NTlZN081YUVNWWNM?=
 =?utf-8?B?cXNJdHhMN1ZIMDdJNkxXZ1VpTXZ1andwU25qaWxpbVdodXU0djN6ekNsRWpp?=
 =?utf-8?B?OVhxVDFBelpuVFpkdExHTmVVVjhtQ0hkUi9NZDRiN0Vaa0NpNis0d0kwVUJV?=
 =?utf-8?B?WkFVU25hSVJteXM2d2k5bkhhenlnL0FNOVJrZ0l2OWh6NVE4c0VkRmRydnhT?=
 =?utf-8?B?UmtlMm9MNmhRUG82dFVMeHVLaUZiT24xd1BmZzhwKytqYUNUd2JyT3lzRlFv?=
 =?utf-8?B?akxsOUZONUgzUWs5ZXptYTBtbmlENk1kV1dtVHpRUU1TTTRpN1N5UzRObXhM?=
 =?utf-8?Q?5yufKLNk66jS7RJDfgCERuc=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	seXDF1DgvW+qO/F1IHQAP45vAjJOIvaCdpUmP3pw8hKzhz2JXnQalJ0ROFSyIf6KE7J+hINJqT6KVgTycrFXKIpV5TO0kRPaZ9EqJmQQyVGx5xihbesH95NgY9TNoO5LHmt7uh9kDh8muzzIaUifFfSuG7LTQ4+Cl7IJK6+QUM4GvxGDskvrhNv34Hw2tmVM5sd8IZuabZ4b0g5l5lHMDPv+RwxYoqwv3sQxKz9/R7ej/cY4jBX8i05YmvSgQnTJIll4QvxGQmB/EtQnJq8+V6uWVNIFWzqCIru7kTk96wIiIECMvsDLMDQJDgPVmPth+0oSkcf7NKQNv7Pm1oguk/9Jgo+0IViss3h6DA5zN57MssetdT1ynuP/Dz3gvxGP1Ub4pwCVgEKYOmHXfir6b9C7eO8KMHkv1V1xfD7lz0KV+XDD1+4AZKRJlLV2h4e+vebquoCHOBfeqdZ1zMPT0J2Z5qnq/G+SWFr4W1gisiFcCef9mrJW7bKVrK0shg95pNl6JLqtcGZMbHPNXlmArbNdOWmvBH0jCFmW/y045KWNgfNx3FtCsU7B2jrUB8cFEIOgT8JyDqYCBwm0h873hY5rLSosoUnQhGF88bwXvq8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c205736-23db-490d-063e-08dc9b603181
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5267.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 13:01:03.1275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MX6WQ63hq/lMgnAbQmbvA9IzBpzu3Y60Kf9TaAOmqgtOi/2Qf7lOkalcQDyHvvxpAPCQw079BQPpHtantOWBpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4159
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_08,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407030095
X-Proofpoint-GUID: 7LLqQkTBwgjyp-HoafkOdGoq1i0076aN
X-Proofpoint-ORIG-GUID: 7LLqQkTBwgjyp-HoafkOdGoq1i0076aN

On 02/07/2024 19:59, Kris Van Hees wrote:
> On Tue, Jul 02, 2024 at 01:30:11PM +0100, Alan Maguire wrote:
>> On 01/07/2024 18:47, Kris Van Hees wrote:
>>> On Mon, Jul 01, 2024 at 06:21:19PM +0100, Alan Maguire wrote:
>>>> On 01/07/2024 17:50, Kris Van Hees wrote:
>>>>> On Mon, Jul 01, 2024 at 09:06:32AM +0100, Alan Maguire wrote:
>>>>>> On 28/06/2024 22:55, Kris Van Hees wrote:
>>>>>>> Looking at this again, I am wondering why we don't just add type info to the
>>>>>>> data record?  Since we know the type of the data items being added to trace
>>>>>>> records (and type is expressed as ctfp and type id), we might as well store
>>>>>>> that in the record.  And that would make this entire situation pretty much a
>>>>>>> non-issue because the record would already comtain all that we need to know
>>>>>>> to consume it and print it.  No need to pass a module id.
>>>>>>>  in 
>>>>>>> If the issue is that modules could get unloaded and thereby some pointers
>>>>>>> might become invalid, then perhaps the solution would be to always copy the
>>>>>>
>>>>>> Yeah, I think (as well as modules going away) the other worry is record
>>>>>> corruption, so dealing in direct pointers is too risky I think.
>>>>>>
>>>>>>> type to the D dict (I think that is the right one - I always mix C and D).
>>>>>>> And since that one is always around, there would be no need to associate an
>>>>>>> id with the module and pass that.
>>>>>>>
>>>>>>> Perhaps doing such a copy is the best action here?  And we may need to look
>>>>>>> at other cases where typed data from modules might be stored, and if there are
>>>>>>> any others, they may also be subject to possible issues when modules are
>>>>>>> unloaded and in that case would require a similar type copying action?
>>>>>>>
>>>>>>
>>>>>> I looked to see if there any CTF APIs to simplify recursive type
>>>>>> copying, and  I couldn't find any and that's my worry - this sort of
>>>>>> copying could get complicated fast. The other issue is size - a lot of
>>>>>> the kernel types will pull in a massive number of dependenent types
>>>>>> (print()ing a skb will pull in sockets, task_structs etc). Duplicating
>>>>>> all of that in the D dict would be expensive I suspect. The other danger
>>>>>> is introducing multiple types of the same name into the D dict might
>>>>>> complicate things for other consumers of it.
>>>>>
>>>>> I mistakenly thought that we already included code in DTrace that performs
>>>>> type copying, but I cannot find it so perhaps I was mistaken (or it is more
>>>>> obscure).
>>>>>
>>>>> But then something else occured to me...
>>>>>
>>>>> This is all compile-type-known data.  In other words, none of this is passed
>>>>> in the actual trace buffer.  That means that we have a lot less worries about
>>>>> how to store this information.  So, look below at your patch and some comments
>>>>> that I think make it even easier.
>>>>>
>>>>
>>>> Thanks; more below..
>>>>
>>>>>> The worst case scenario in the current patch series - that the module
>>>>>> goes away - means we can't print the type info, but that's not the end
>>>>>> of the world really. Certainly in the kernel case most modules tend to
>>>>>> stay loaded.
>>>>>>
>>>>>>> On Fri, Apr 26, 2024 at 02:33:26PM +0100, Alan Maguire wrote:
>>>>>>>> when generating code for print() action we need to identify source
>>>>>>>> of CTF; is it shared CTF, cdefs or ddefs or another module?
>>>>>>>> Introduce a module id scheme where the module id can be stored
>>>>>>>> at cg time for later retrieval at print time; this allows us
>>>>>>>> to later look up the module and its associated CTF without relying
>>>>>>>> on possibly freed pointers.
>>>>>>>>
>>>>>>>> Under the hood, the id scheme uses a monotonic counter coupled
>>>>>>>> with the hash of the modules name; the latter allows us to quickly
>>>>>>>> look up the right bucket via dt_htab_find_hval().
>>>>>>>>
>>>>>>>> This fixes an issue encountered when using a shared kernel type
>>>>>>>> with alloca()ed memory; DTrace assumed the type was in ddefs
>>>>>>>> and it wasn't so it wasn't displayed.  This change fixes that and
>>>>>>>> all tests continue to pass.  Also tested that it works with
>>>>>>>> kernel module-defined types now:
>>>>>>>>
>>>>>>>> dtrace: description 'fbt::ieee80211_rx_napi:entry ' matched 1 probe
>>>>>>>> CPU     ID                    FUNCTION:NAME
>>>>>>>>   7 123161          ieee80211_rx_napi:entry 0xffff9f8980fa08e0 = *
>>>>>>>>                                             (struct ieee80211_hw) {
>>>>>>>>                                              .conf = (struct ieee80211_conf) {
>>>>>>>>                                               .listen_interval = (u16)10,
>>>>>>>>                                               .long_frame_max_tx_count = (u8)4,
>>>>>>>>                                               .short_frame_max_tx_count = (u8)7,
>>>>>>>>                                              },
>>>>>>>>
>>>>>>>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
>>>>>>>> ---
>>>>>>>>  libdtrace/dt_cg.c      |  7 ++++++-
>>>>>>>>  libdtrace/dt_consume.c |  7 +++++--
>>>>>>>>  libdtrace/dt_htab.c    | 17 +++++++++++++++++
>>>>>>>>  libdtrace/dt_htab.h    |  2 ++
>>>>>>>>  libdtrace/dt_impl.h    |  1 +
>>>>>>>>  libdtrace/dt_module.c  | 30 ++++++++++++++++++++++++++++++
>>>>>>>>  libdtrace/dt_module.h  |  1 +
>>>>>>>>  libdtrace/dt_printf.c  | 12 +++++++++---
>>>>>>>>  libdtrace/dt_printf.h  |  2 +-
>>>>>>>>  9 files changed, 72 insertions(+), 7 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
>>>>>>>> index 27246a40..30cccdaf 100644
>>>>>>>> --- a/libdtrace/dt_cg.c
>>>>>>>> +++ b/libdtrace/dt_cg.c
>>>>>>>> @@ -20,6 +20,7 @@
>>>>>>>>  #include <dt_dctx.h>
>>>>>>>>  #include <dt_cg.h>
>>>>>>>>  #include <dt_grammar.h>
>>>>>>>> +#include <dt_module.h>
>>>>>>>>  #include <dt_parser.h>
>>>>>>>>  #include <dt_printf.h>
>>>>>>>>  #include <dt_provider.h>
>>>>>>>> @@ -2832,7 +2833,9 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
>>>>>>>>  	ctf_id_t	type = addr->dn_type;
>>>>>>>>  	char		n[DT_TYPE_NAMELEN];
>>>>>>>>  	size_t		size;
>>>>>>>> +	dt_module_t	*dmp;
>>>>>>>>  
>>>>>>>> +	dmp = dt_module_lookup_by_ctf(dtp, fp);
>>>>>>>>  	type = ctf_type_reference(fp, type);
>>>>>>>>  	if (type == CTF_ERR)
>>>>>>>>  		longjmp(yypcb->pcb_jmpbuf, EDT_CTF);
>>>>>>>> @@ -2842,9 +2845,11 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
>>>>>>>>  			"print( ) argument #1 reference has type '%s' with size 0; cannot print( ) it.\n",
>>>>>>>>  			ctf_type_name(fp, type, n, sizeof(n)));
>>>>>>>>  
>>>>>>>> -	/* reserve space for addr/type, data/size */
>>>>>>>> +	/* reserve space for addr/type, module identification, data/size */
>>>>>>>>  	addr_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
>>>>>>>>  			      sizeof(uint64_t), 8, NULL, type);
>>>>>>>> +	dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
>>>>>>>> +		   sizeof(uint64_t), 8, NULL, (uint64_t)dmp->dm_id);
>>>>>>>>  	data_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
>>>>>>>>  			      size, 8, NULL, size);
>>>>>
>>>>> Here you add a data item in the trace buffer that will actually not store
>>>>> anything at all.  That got me thinking...  And then you store the data size
>>>>> both as the specified size of the data item *and* as extra argument.  That use
>>>>> of the extra argument is unnecessary since the size is already being added
>>>>> to the record as dtrd_size (which gets its value from the 4th arg to
>>>>> dt_rec_add().  That means we can use the dtrd_arg for something else.
>>>>>
>>>>> So...  how about you do the following:
>>>>>
>>>>> 	/* reserve space for addr and data (modname and type as extra arg) */
>>>>> 	addr_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
>>>>> 			      sizeof(uint64_t), 8, NULL, (uint64_t)dmp->dm_name);
>>>>
>>>> Maybe I'm misunderstanding here but isn't there a concern if dmp goes
>>>> away before we collect trace data this string will no longer be valid? I
>>>> _think_ if we were to store the module name we'd need to store the
>>>> string itself in the trace record. The module id approach was an attempt
>>>> to remove the need to store and retrieve full strings while not exposing
>>>> us to the potential risk of invalid pointer dereference. Sounds like the
>>>> trace record storage implementation was inefficient but that was the
>>>> intent at least.
>>>
>>> Easy... replace
>>> 	(uint64_t)dmp->dm_name
>>> above with
>>> 	(uint64_t)strdup(dmp->dm_name)
>>>
>>
>> Right but then I've got to
>>
>> - allocate a string per print() action
>> - free them later (presumably on DTrace cleanup?)
> 
> These do not really pose an issue.  Unless there are going to be a very large
> amount of print actions, but then again, we have similar situations elsewhere.
> 
>> - when consuming the record, I've got to compute the hash on the name
>> string to do the module lookup by name, rather than by id where it is
>> pre-computed at cg time. This adds overhead to each consume action.
> 
> I did a comparitive test between your v3 patch and a modified one that stores
> a copy of the module name as dtrd_arg to the data record.  I honestly did not
> notice a difference between the two approaches in terms of performance.  While
> the use of a string causes a hash value to be calculated, using an id also
> incurs additional cost in its processing.  From the looks of it, it is a bit
> of a trade-off where we incur a higher cost.
> 
> My preference would be for using the name primarily because it does seem to
> provide the same level of performance, but without adding additional support
> in htab to make dm_id work, and also without adding the dm_id management code.
> 

Okay, sounds good. One thing I'm unclear about still is where to free
the module name string. I _think_ the right answer is to associate it
with the pcb, strdup()ing to a pcb->pcb_modname string which can then be
passed via the arg and later freed via dt_pcb_pop(). Is that the right
approach or should it be freed in a different way? Thanks!

Alan
