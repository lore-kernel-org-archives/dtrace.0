Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE32A14EC73
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 11:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756381818; cv=fail; b=HRL8+vL6vbpETsoRjXxPoI1PrjONYuEvC/JH96yOV3lbS3djzd31pugFwXQJArzqxr3E2DOGHugAF+9YWLR6L+NYoaOFwJWPXnSnbUfGpxrTpVDBdjgSle/3BIAJlOWnt2tpn0D/qQQnwHYrt14ldBbZTBR62WVysmTEyNv7lts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756381818; c=relaxed/simple;
	bh=njjLwOAVD8gqD5L3EhLXq5MMcIBB3nnweVMHdu3xZcs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X0Pzqa+8Qmppm0oe7inFN+om5RrLzGRaF96oYrGAIpyhEZdqNwbdobxwQbuJK5Q15uTaPEAKKR0Yn9INYFuqIJEHafz0q8K8RhESmplCobwHRBQekmpaqC4Y5xVLX/djWUsFqreAWzeyOpH5wk1WnHjD3kKjfNKaDVM2Fu0hlV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LPoosGmn; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EwdCFe86; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LPoosGmn";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EwdCFe86"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S8tvkI017886
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 11:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=AOjkg/cXzo/AQeBN6v9irmNrGZWZp8NfzHzgI/hXceM=; b=
	LPoosGmnndHhsO1IYlxVdcy3+LUOEauoMKF4nLdakAUK4sDwcdF7OsWf2GqOmlL/
	/gMc8cywHprbWRseg5INE8bzFr1WsNUITw9eOuSfWYylSapuvflc1utrXKw2WC48
	xZYskUtT/153I1651OjU/RmZ0pA+d6NEZM9gOMv4Wl35F2pVsLW/qJ3gAgplXlXu
	QJ/XuWlXRtLpxVSkjbhdWGJf03PppDhUfyOac/rEf4xC89lnpSS3H3khrF9bP2lt
	A+8Yo7jgOkN+bEriyYsS//lm+ApKaLbC8Z+mTeATnL2Ef4zW0AHP9YkomkZXlR84
	j0fqk27IU4ouMv82HAACSw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q48erdtt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 11:50:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57SA0HNb014687
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 11:50:14 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48q43bsfkm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 11:50:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HcMjqa+bBl0RE2hesgk1SdFVV4n49V/q2WjOxbO4s2T1tVwN5p+be0oPc9E7/1G/PM4wF4QsvGK0Z3d96x+GsZ9iK+okzfteYxSI6BCwx4Io6k7kOU9Dju0VhMQcV9xRk3xLPPn0RaM4jcNk2PySCGFHjiHYOzcVQL7n+FACDcftTXkWepQL5aliRPUQv6IS4IdixTFNj2bSi44gg8D6qLRGSBY3mdW6/zSkFleGUXyyKAGFUIA++4U6JLGXIZDsj0+pWUWFffW0q6R/YIyjsLvvcb0V9IPTYOqHQ+ms1i1it/a/baEgtykrJOLHdyP6YtMBWhuAGZlx+8xYRBW4VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOjkg/cXzo/AQeBN6v9irmNrGZWZp8NfzHzgI/hXceM=;
 b=qVnOSPK0LT5uTcj4fEq9FcxmOmm+oHr7x+3QNCVWsJ0RsieF3cbAOT0gBuhLuoCEKdCmU413uZd3TV5hv95O9oAzJj5Qr3WZZ3ccmORnBRZwHF5BYfjMMxV741K4rvVcBT8Shz2QHxmgKKwOxOsF39lgtj8bK9lYOM/ET+i9zVs9L4jPNc3cwsJQRtdXTy+B4l/4ZmvuxcalH+Pb7hPpN/Ie6IiJp6QXCI7BxcmLQRa2O/DoQyM80I0SG/d7ykIww4tHwOhIzb3yTz13YI854O2az9D9yVm/tmPLmcDy7MFz38uLBfTTBwGCXQaEBv8aVJbWGklvnkscffRhhWhKZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOjkg/cXzo/AQeBN6v9irmNrGZWZp8NfzHzgI/hXceM=;
 b=EwdCFe866bOKIZnNQdpr8/aqm3qc41zYuxbfQCHTr+/F8RGaE1b/G30Mh7yUcBQ8CHmrwaKkggK29iVRgBiTvZvNvSmrbgmc/dTEsHK2r65KsiEcLFoKXnAoWG1nFaLtzYs/N7ZD/v/qEO3P7/1p334lQtg2Pk1H9KcP/wD9Z/w=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 IA4PR10MB8519.namprd10.prod.outlook.com (2603:10b6:208:55f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.21; Thu, 28 Aug 2025 11:50:07 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%6]) with mapi id 15.20.9031.023; Thu, 28 Aug 2025
 11:50:06 +0000
Message-ID: <0105a237-093f-45d5-9034-c747aeb16344@oracle.com>
Date: Thu, 28 Aug 2025 12:50:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cg: fix offset for > 8 bit bitfields in
 dt_cg_ctf_offsetof()
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com,
        Eugene Loh <eugene.loh@oracle.com>
References: <20250826081226.591245-1-alan.maguire@oracle.com>
 <87frdegewe.fsf@esperi.org.uk>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <87frdegewe.fsf@esperi.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0029.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::14) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|IA4PR10MB8519:EE_
X-MS-Office365-Filtering-Correlation-Id: d089d6d9-bb38-4e1b-3f02-08dde6290883
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0NreWRZVjBwQUJVc1haY0hUdkc1MkxRT3h2Q0NVMnZYUkxTbUJxbklOK3BG?=
 =?utf-8?B?cStGRG5vYzZNVHhYL1A1OVhseDZGU3pZWDVHaXpaZ1daR2VlRXdMdlpuK2ta?=
 =?utf-8?B?OFVxZkt1SWJua2pTR0JIV055RGRKZGRmOFdLNzVDU3c4Qmx1R3lndm5RSGtm?=
 =?utf-8?B?c055TmpNbUhrTzhaOEVJUDRxUWplN3JZQVBtcVQ3QkFSeGNhdVJILytGeStu?=
 =?utf-8?B?Sm0vSmtVVXRNRGswWS9xVUFPbVdmQWhQNEtjTnMwcTlxVmZyTHhaT1VKQjNS?=
 =?utf-8?B?SEpnV3c4M1VreEZia0xEV1N1M1A4Q2FKV1hHeTNSOTlyei91ZUo5QmhVZ0hY?=
 =?utf-8?B?cGowRlJwQlR2Z3BnYVN1Z2tKbm9LNkNoOEVIOTFIMFh3U3pFUnNCMm4zNlU5?=
 =?utf-8?B?WDBjbVR6SWI3aFFmcFpOUHdtUjdSdGtUYmxjazIxM2ZZemdvREVjSHlEaWtZ?=
 =?utf-8?B?Z3JYdzVFU1Vrd0hkMVdaSmN0b3UxaGV4cGpFM1hBTGhZUno1VWcxclI0ZEUw?=
 =?utf-8?B?aEdjbjU1dHlhQzRLYkVPenl3V3c4dFBkVXNwWXVtdVBoTFh5WUxZZThKakZo?=
 =?utf-8?B?SysxRG1oQ0pJV1llakxBbnBkbnQvbVQ1a1hJOU8zYmw1dE1ZSWtOZG1NeVRY?=
 =?utf-8?B?TnJ4THlnUmtWWU9ibktsQUk5S2R2K2pRUXRsWmphdk90dnZObHNqc1p1cVRr?=
 =?utf-8?B?eExGc01iSDlJNVIyUnByYmxKbEgyMTZQOWtpVTl4RDV0bEJpMEk1ZG83SmJE?=
 =?utf-8?B?cVdGTWE1bjhLMTFsUTExNmhyZ25PbjNiZUl3Z0UvVDMva1c4QVNlck83cTFN?=
 =?utf-8?B?S21zV0V0aVpMY01hT3F6UFVJaHNVNmx5dmNkUXpJZmNhdGNIYnIyVHlaeXM5?=
 =?utf-8?B?N3dEc0JXYWkxWnNqWG9ibloyYkl3NmdoTlNOcDZCcGlVczRMUVpkS2hpYmZy?=
 =?utf-8?B?STdmckRwdUhVK245Q2VXd3NqeEZURDJLZFRoVS9LYlBHbjJRcXZ3Ri9mQ1pk?=
 =?utf-8?B?QytyMnNicTcvZWgyR3U0Y0tYVzJyTmZlZUVHSHh3U2tHemRoKy90VkcyaTRO?=
 =?utf-8?B?NlU5Z2p3MHh0ejRnVnlzTm1kUE94c1Q1czBCTHJZOE51K3VjZVpPcnZVMlUz?=
 =?utf-8?B?R1UrS3hmWU9ZUHByQlRGbmNqdXFuOTFXWWo3WS9JME9STDU2TzlZeHJqNG9V?=
 =?utf-8?B?UU9xY3MxazRRRmtmNVpkUWEyZ3hPZUJSZWpKeWVzTGJPRnJPbTcweEFJSmxO?=
 =?utf-8?B?TG9nQ25MNVFob1hQalJlZDh0Smptd3QyUklRYW5VZlpvNW9MWm9YMTFyWWpx?=
 =?utf-8?B?alN4L2FxdDJoS2VWd045L1Bnc0REVUw2eVVKU2IwTUE1bXovcmJxdkZOTFZq?=
 =?utf-8?B?aCtLUWxXVjFjQlhZTHBPbXBhdmlhWFAzYmhaMjAzTy9HY1F1bUttOC9uTWtM?=
 =?utf-8?B?VVhya29TUXhBM1NYWVY1dHZJYjdXS3UraTJFMzUrcTJjWWdSMHhaU3FQTnVJ?=
 =?utf-8?B?dUFJYzNpSnpSV2xFb1Z5c3ptZDBCRDZiZGtHQ0V5TS9iQWdtejd3VHRtSFR1?=
 =?utf-8?B?Q1ZaNFh2MDh2WEQrWkh2c0RxblQ4Szc5VCtTZDloRzFRU1lqMjhLdklNYmN2?=
 =?utf-8?B?ZEl4dkxjREtHTXlQT2kvS1NCL2gydHEzWGRaUlhORHg5ZTdXZVpmcWVUdGcx?=
 =?utf-8?B?YzBNQWlkVG5hVUNsRnJUdDEreHpCNjltbEFQaWkxd25PSjRjVnBiQTloSStP?=
 =?utf-8?B?NWFTNVpXVXBVdjJwN0RZNFNKVHN6R2JseitCWHhXUW9uZ3VGSFFGbDBBU2U4?=
 =?utf-8?B?WmFxSXdRTGJkcHZTWG9lV3FTTllWVzJKS05QVmhZL1dNOG9adCtPY2N2dThN?=
 =?utf-8?B?NVJNc2U2a3cwcjZRYWk5M2hQdlNKQytxbjJ1Z0h3d0x1QzN0ZXhZVGJiZW1v?=
 =?utf-8?Q?lkKBjvNSens=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnB3b0NDYXZPQVF2bzZkUjY4UkRBc1pOc0Y2d3hONTRQRDVqblkxVnpUbG81?=
 =?utf-8?B?SW4yNzVjZHBtbWxvT1JuYTR4bE1jRkhtcXRRWDlvYjNKekZUMWIxaTJGcWE5?=
 =?utf-8?B?TTg2djh6N2hSRFoyR0tlY3ZraTRQdjZveUlOb3Y1ek1IRzROU05PMGdFZWxB?=
 =?utf-8?B?REpvZG5uNzNtRGdFVTlkck5IYlVFdE5yNnU4MUIwSFJOZjV0ZDc5d29ZSlVP?=
 =?utf-8?B?dUMxSHVTL1BNdGVJbmdMUk95RS93TGhXL3B5RTFyVXArclh5VzNRRDM0Tjll?=
 =?utf-8?B?N2d6T3JaMzNNeGNYamRsVnRuTHlLaVlpY2tnK0lsN2w2ZEsxZTFSMTVvYk16?=
 =?utf-8?B?d0NmZHFmN3ppblZ1eEpoS1hJdmM2TWZNNjNnbnpwVTl0SkF5cE9QdHdYNk85?=
 =?utf-8?B?dC9COXVhUy85TTRXTEYwbVlEMWgrV1ZuV0hJTGZRbXZZQ3JYbTFzWktLRFlw?=
 =?utf-8?B?dTFUNzUrUExwazdvU3ZLbEdHSjNGamxFeCtVNm1JQ3Z5WFFzWWx5YVFqRjZB?=
 =?utf-8?B?NDdQMHhuVXZuWmJ1WUQ3SHEwUUh1SEhNa3pUdHRycDJyRHYxeGduTFE2ZDMy?=
 =?utf-8?B?Kys3MkRGL2RxajdqT1R0cVZ4T1A0enlzMTdpZ1FkYlhUajFnSzBKQ1N1QWt3?=
 =?utf-8?B?OVhEZFZmelJWaS9XZ21SK1BlUHpaM01QTEZEbnV3TUJmNFhraHo3TW16VmdO?=
 =?utf-8?B?OVo3a0FiMFN3S2hQdW9WdEJ0Um0weTNpelpsakdCamN4S2RFZ0JvdmVjbXcz?=
 =?utf-8?B?aGZOOUlQNTRYYlBWNEhGWjBWNkdNMysraENBWC9wbVk0VVY0R3FTRUFsTkpH?=
 =?utf-8?B?M1k0b01MQUxxS3VhcjgrS2N1cGxVQzlBZW9Fc3hKMi9qNVY0Z0w2UDNod29y?=
 =?utf-8?B?bWZXcWVYaDYxMWdNSit6eGJLZWlwbngyaHlkK3c4dHJkcVdYVWQrTWRvN0ZG?=
 =?utf-8?B?UTY0NmxFdEI0WTM3dHpJNGdhRHlYSWZQdTdUNmRYZ3hXakU0YzJ3b2FrMXBo?=
 =?utf-8?B?MTFPOVBPMGxScDJ4OEY0VDBIaUI3Q1NjU1ZaSDZzc01OYWRrRGx0RUlZSDNS?=
 =?utf-8?B?aFhnSGdqMktMUkc3NGd2QnNzUmhxRG1sdTBDWTVqd1BpWXFGdDRaZXlkOG96?=
 =?utf-8?B?VHpyQ3J4d3VXTDZSdDRiMkxvcjRWRlB5QzRJU2FPdVczZTExZHJGMFRsV0l0?=
 =?utf-8?B?alNBMFZWQjVZZFZuTnFnekpaSlhJRHNkMHpGNk9zOTFKdjVuZkxPd2xVSnl5?=
 =?utf-8?B?RjhVbDlxN2VIVXQrbVRJWGpDNmhjcHRFR1lQQ3pTOVc2WGxhaDlWZXZuM2hY?=
 =?utf-8?B?ekJCeTlxV2ozaXd0bm9zTEdpblZtK29xaEUxMkJXNmNQV2VYWWJxRFNZSklZ?=
 =?utf-8?B?THhqbHQva1BrQllhYnNBM2Z6MXhHclZtcTJXYU9QL2NQcWN4NDBrcno3NGlP?=
 =?utf-8?B?ZHFPU2RBSitrdTZaT293cXQvcU9UWXBkOFlWTzV5Ulgxb2ZDNnEvV3RCR0hq?=
 =?utf-8?B?V1FhY2tNTkYyaFFyUXMvVFVQN3FQQ2IyNXZONU9qU04wUGhCK1hJR3prY25p?=
 =?utf-8?B?UTUvYlhONytCbXM5ajdhUG1DYU1tMXpLVWNRN29jeUFhQ05ZVWFTS1dxdU9N?=
 =?utf-8?B?dlJBYWN6eWFsUkUxb2tkNXVReWUzNDZ4RVc3T1JtMTJBYWovZGtDRUxxSE93?=
 =?utf-8?B?VzNDQ25lYXdTeHB1NVRsTFhBcllmMHc4QTdXWmNlOXcvbnQ0TmEwVmc4bkV6?=
 =?utf-8?B?QTY1ek8yYTl4ZExSSFVXMzJ0NFlVWXdWR2pPWWVWMTU0MW9ZS1dJMHhLU3hx?=
 =?utf-8?B?YS85ZW1hNlZudE9NdTM2RlVPUkJPeGMzYnZ3Q2tGZHMzbW5NV04rOHNGTURT?=
 =?utf-8?B?YkVvWmQ5Wi9rRmZDTXNFVGRtZ1hUMDVXWEFrVkhOUENic3BuOGxhZW8zNUFn?=
 =?utf-8?B?TUROeVBQb25DK2lLOENrQ3RmZ21COVZWTEwrWGYzSi95bnI5V2EzMGMxcm5I?=
 =?utf-8?B?bEZaU0NVZXFmNFlkcXBNalFtdU1VK3dzeURqOGwrNDhXd2V5ajNzTWtxU0Q2?=
 =?utf-8?B?Q3JTaituMVQwMVlIL1k5M1ZLbzU1Z25VNUtxUWZXbHZDeDF0ZEljZTd6WGVM?=
 =?utf-8?B?ZU5JS2s4Y3NhME5VOEI0UlU0VlFqdTZHb1FONGtQK1RKWllGYTZmQTcrUkdx?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	I7M04rxX2nTX0JueoN9YElFHr3/hL5C49eAtLg5eY/D5dOSj8y0i3sm5CSrDxI5DtkgFjZP202QNKtY+AOxsdxZ7SXzSI+Dn1rSISJ2qjOwUPHFpTXMaP2ZIw/wM+GtNXLNfHfz99C68fhX70yP9imG+SHmoOHSDHzPe08jL1d8Qaa8/DNC/sHqOyWEgvk+1n3+1KbSLrlWBotJACjLXm/3oyShlFbfgsE+bjvHPiD2gia2MbYFAo2wITD9ydk+AIgbMWCA94WhqzHFZ3QxGTmaJNxCr7vZEwfnqonHptlyxJY3KnASHwpBQwxM82IWMKhhgmvC8NIn3kIajndnSolxaFmOf7vFwWEsWx6243w0oiOkYWlSSnRH005VOcnCVyA3Pts0Mcb9V0ccNorS8a4RTDWGAM/ICKp8PCustZgkd96aoFZ1a1skiEprddhuYmPFNWC75gwEKuXLfRhdNW+YNG+5JAERqe5d2cW7u5cqo4tQkj7jMS8icdvQSc43Tu5VBwO/X1QqklHVLI1zPiHh4t0X5MkX33lfDvVu0HwWAThWRji07it4OzJkvADim1sEqa3RpXzK/71nozdz6rji3PznpfP+pH2LEMYqMKkY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d089d6d9-bb38-4e1b-3f02-08dde6290883
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 11:50:06.8701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FiWsLLutmxuoAI0QlYyd7Gn5b/e7Eq17o9a/myZQ4fgyDdrwusf5LPLU9KgL7ah79zbzwHIi618lVCAipP/6Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8519
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508280098
X-Proofpoint-GUID: 4QduWNIVXg_myTNFpDBP-z6DMBWQ_fbh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAxNCBTYWx0ZWRfX+Xn/MLKSNCIu
 xjXpERf0kYS4FtC2fdcPzSz8dJ6NLrUy2uG2+zHlnzXzswkpJ5Xm+ephiLMMSCG9AQVommq7Eng
 Zn6bu/s9HZ6wiWXhSfUfqI8Fygs9Ch1/hFadXfzSFBE/AbnvWe1lS/LLR3RDjgv00tm063t7xf3
 SFB1A//96Kei9tFCNwiWCt7B7lcAyvT7aoVip6D7mU3lXCc8zhWkcsEe8kEEFE+U3ivabM1EAo1
 dOcyHGTVxPd9taib+4zGL6m9HayCXqT1fv3ClIHCBoRwdNAJBp6ZDoA+SA2TuMrrkPW4bXsKSYU
 WUDIc+4aPwmosg2wHU4t1xoqmJabTDAJ4F9IP6no+J3t9eOjH91vqpbJsomM95dzMlYqCL5Yr6G
 2kVbP2JOgqtJJwjRXfOr/YGJfwvCgA==
X-Authority-Analysis: v=2.4 cv=FtgF/3rq c=1 sm=1 tr=0 ts=68b04277 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=hAtTCHCPo-S9YcDDm94A:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13602
X-Proofpoint-ORIG-GUID: 4QduWNIVXg_myTNFpDBP-z6DMBWQ_fbh

On 26/08/2025 18:40, Nick Alcock wrote:
> On 26 Aug 2025, Alan Maguire verbalised:
> 
>> The tcp provider uses dt_cg_tramp_get_member() to retrieve the
>> offset of the sk_protocol field in struct sock.  However it
>> returns the wrong value on UEK6 since it is an 8-bit bitfield.
>> From pahole we see:
>>
>> 	unsigned int               __sk_flags_offset[0]; /*   560     0 */
>> 	unsigned int               sk_padding:1;         /*   560: 0  4 */
>> 	unsigned int               sk_kern_sock:1;       /*   560: 1  4 */
>> 	unsigned int               sk_no_check_tx:1;     /*   560: 2  4 */
>> 	unsigned int               sk_no_check_rx:1;     /*   560: 3  4 */
>> 	unsigned int               sk_userlocks:4;       /*   560: 4  4 */
>> 	unsigned int               sk_protocol:8;        /*   560: 8  4 */
>>
>> In other words it is really at offset 561 but because we just
>> lookup the member offset and not the member type offset we get the
>> wrong value for the sk_protoocol.
> 
> Excellent description! It's annoying as hell that BTF still has this
> redundant representation :( DTrace literally always got this wrong,
> right back to the year dot.
> 
>> The fix is to look up the member _type_ offset and add it to the
>> bit offset we get for the member itself.  With this in place the
>> state-change probes fire, but the local tcp tests still fail due
>> to separate issues with the tcp:::accept-established probe.
> 
> This is certainly necessary (and your code looks good), but we also need
> to ensure that the load is suitably shifted and masked, particularly for
> bitfields that cross machine words. DTrace never used to do this
> either... e.g. the size returned by dt_cg_ldsize() assumes that the
> entire bitfield can be read in one load op, which depending on its
> offset may not be true.
> 
> It looks like dt_cg_field_get might get this *mostly* right (once you
> delete the #if 0'ed stuff -- but I'd be suspicious until I'd tested it
> on a big-endian platform), but even that assumes it only needs to do one
> load. As soon as a bitfield crosses machine words, I suspect we'll only
> get the first half of it :( we might need to do a second load to fetch
> the second half of the bitfield, then a shift and | to combine the two,
> and DTrace has never had any code for that.


thanks for taking a look! To be honest I punted on bitfield handling as
currently we don't have any cases where we are looking up bitfield
values that require shifting. The problem is we have the machinery for
offsetof calculation in dt_cg_ctf_offsetof() and it just returns byte
offset and load size, then after we do the probe_read_kernel(). We'd
need to repeat some of the operations done for the offsetof cacluation
to determine if/how we bitshift, or alternatively have
dt_cg_ctf_offsetof() return more info to consumers.

Perhaps the better option would be to rework dt_cg_ctf_offsetof() to be
a wrapper to a function that gives us this additional info; that would
require less changes overall to consumers of that function that don't
need to handle bitfields. I'm thinking something like this:

int
dt_cg_ctf_bit_offsetof(const char *structname, const char *membername,
		       size_t *ldsizep, uint_t *ldopp, size_t *bitszp,
		       int relaxed)


where the returned offset, *bitsizep are in bits (*ldsizep would still
be in bytes). This would allow us to figure out what shifting is
required in dt_cg_tramp_get_member().

Either that or I can just add a comment that we don't need bitshifts yet!

Thanks!

Alan
