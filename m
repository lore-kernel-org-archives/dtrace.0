Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DDF23EA9B
	for <dtrace@lists.linux.dev>; Tue, 21 Oct 2025 20:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761077872; cv=fail; b=ll/1aRlOh4OFRjdCAUSMLaS7TcRQ7OPPjAEsD5KwWQ1V4VpbAht6qADxcPa6vCpUBaFv9v+SV5zJ2n8KLw7NvJSA7CfFYjBiZVEPtzer7Gg97sUQhX+ma2euSOvIuxhle5TB8KufDXrRJWwUlH6rV90tvWlgCh8kHmGhONOABzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761077872; c=relaxed/simple;
	bh=pUzYMgBoY2IEY001KTxazeoOKJUPUrDXfVsX/j1EBKc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qOZZ44+GLQIBK9hxmQ1kIIfwL98Ys/N2mkExcqi3jdT0V8LTKPJzb5bCNe82micWZBpGMPgEbOv+Fi9OHwCkMEYTYOACHB7nBxl1DVmlSRcYSERhUpjJXWCJ2TEEOAIGa0VY17PXo5BnxSCNRNCTfPZlKmt6iFCob/BqcmANTq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YoQ+NGGh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xOgt+tmk; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YoQ+NGGh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xOgt+tmk"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LHQMj7018728
	for <dtrace@lists.linux.dev>; Tue, 21 Oct 2025 20:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=ZCy/raC6u/St5I+f
	+dU+NLatl8+Afb/PjDE9F+nqSWw=; b=YoQ+NGGhYQWRPeRoalO/vyWCL5ibNiDL
	gspelKQcptCcn7NKqx5ZvY2uoKFBJxpkRGB5kGaaUSVqKFVdgRfcSOmFXKfrJ1IW
	1KxOtFWbibelxKEGRU9GI9+cWqibd018opyS5xuJDRj9m08XHNJYaDwfk7rWpDut
	KnI0d0XBLS+bvIxW7DecPRHHAUkMARMncqwAG4ZADzGLRP+FcEOqAn4bDirrScLQ
	zBQH5SQNTyjv10h48Ux5yH20BIeUjjjdnXuNoESBgAnUe2S/9XtrEjWIsPGGFGa8
	a2djYE3JNB0iAsloX27gaJ3fvp254XwZxdTIxqVgpcLulDmYLYD8mg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49w1vdnf61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 21 Oct 2025 20:17:48 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59LJSRma009516
	for <dtrace@lists.linux.dev>; Tue, 21 Oct 2025 20:17:47 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010018.outbound.protection.outlook.com [40.93.198.18])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bdj7r7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 21 Oct 2025 20:17:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u5IjbWh/XszHiQDcNOexu8F6lr0OGKkz2y1ZMiJAe1XkUYyQfGL2anKXTuok2B+huTmprVvAvPAGlvrpusl0sKoJlWiXM7ZP+RMf44Hkgj8GCqL/bwUw7vw4rGyxAzSGK/JS3VlwDZfLJE9M8OcaV9iORB4w3UvEmY1o3/255VNRIsEzuLq43SL5+Q/eekBGc9ulIVzK27uIX1lqcITtMMVoaj28sfKexp7sG8CxkHx9zCo/4yBqhC2qBcejhz5sPxerk0GeCjkm/3j2slLR5Zunrm/XX0qfPDh3JWPeLNPD1i0ymKfMzcCAIVTuLfMWf54aj5qMfOBW3VBXXDwjjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCy/raC6u/St5I+f+dU+NLatl8+Afb/PjDE9F+nqSWw=;
 b=bMdgl6FW5sii3KjhKMscQxI5eaamp8+oZgKmqvXQLUeXObjen3IqXKznA4XMTvFl6UCk0+fRMDvxXNRQXE76tla2qak79V0GIH61jrsKm+LUSx8dyktRts/jFpMydTW8JqJ7V+oD+uchj7rByzuPcM/7KFkqbOZxuQAOdTbP58i5MRyrwLY1rcIHcSDBN5FREGgwPgq9f07ppLE7gNWZJjJ6qD+SukB43y+ENFkGnr4eaEvatf0o0EWyTsZ3h7SSkO6QGKC5W5kktQcDIYILFsXLKfNJcCuvg3P3GsatpWpTUCvufykH56Vlux27BgAyxp9zB6NKeYxukbwrqxmtgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCy/raC6u/St5I+f+dU+NLatl8+Afb/PjDE9F+nqSWw=;
 b=xOgt+tmkAdktKwb3O24gGH9YewHwaq8mYJftC/IvsCcGIsMjPkojUYYzG+WB0YR6s9s+j63OFlUuWKfVG0zU51iT1eevcoP6S6T7SbZs3BsV8w/Qd68HZkkYeuUhmcQjlBB56PZ9K8rmoEc2tiKcvphdzoYVCD2xwZR7hNKV3VI=
Received: from IA3PR10MB8513.namprd10.prod.outlook.com (2603:10b6:208:576::12)
 by IA4PR10MB8732.namprd10.prod.outlook.com (2603:10b6:208:565::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 20:17:41 +0000
Received: from IA3PR10MB8513.namprd10.prod.outlook.com
 ([fe80::dd32:577c:40ed:9823]) by IA3PR10MB8513.namprd10.prod.outlook.com
 ([fe80::dd32:577c:40ed:9823%5]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 20:17:41 +0000
From: Bruce McCulloch <bruce.mcculloch@oracle.com>
To: dtrace@lists.linux.dev
Cc: Bruce McCulloch <bruce.mcculloch@oracle.com>
Subject: [PATCHv2] Update llms-txt and add README
Date: Tue, 21 Oct 2025 13:16:38 -0700
Message-ID: <20251021201638.1318745-2-bruce.mcculloch@oracle.com>
X-Mailer: git-send-email 2.47.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR02CA0007.namprd02.prod.outlook.com
 (2603:10b6:303:16d::33) To IA3PR10MB8513.namprd10.prod.outlook.com
 (2603:10b6:208:576::12)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR10MB8513:EE_|IA4PR10MB8732:EE_
X-MS-Office365-Filtering-Correlation-Id: cf0b3dfe-532f-49a5-8fbe-08de10dee354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dEU5d3BtRGF0Y3FManJHU0tYaXIwd2hhWndNUFEySFFMMThzT0JTQnpCQUQr?=
 =?utf-8?B?TFBoVWRMUjFpbzRYNTlhRTJJUzVEYlAwcGJwWDB6SEFOQkFHVGlmeHEwN1BD?=
 =?utf-8?B?cEhLUWYxSGNObFVUOWRXWmdUK0RiYlFvZlNDSFRKL0d0V3N0UEh5clFNT2lY?=
 =?utf-8?B?dzROUW44YXVzMWg1amJwajNyUkJFM3laYXNYMXpZYnJROW5ITEpiQmdIUzIz?=
 =?utf-8?B?OUhFSmpaYnJxc0Fwd2VEV2xzaXRpYklrNm9vOFdUV1lPTks4cm9kVzVoWHJW?=
 =?utf-8?B?V3hyRWliNzZhdkc1ZW5QZTkzQVlEdkVTWlJiVHY4TkFQK0w2am9saU9KL0ps?=
 =?utf-8?B?a21MdHJEcTBUSWV0WHBJV2U0eEJyT1JiUndlcmtZVXJxc1JnRVh2b0FwMzNq?=
 =?utf-8?B?dEJiWUdyaGlQYUxFWmJ0WTg1ekhUa0RyYjE5TjlETVFoV09zUXNweWp2em51?=
 =?utf-8?B?blpIcXZxTXNpWnRGbHJxMWhhaGZOdWNjaGt2U1hPS3NLRklBWm9aQTlFUkRG?=
 =?utf-8?B?Tml1N09jZGNNVDNZTEhSWDc3R1FXWitVQ2VreUxabzgrckVWeDROSEZEOXVz?=
 =?utf-8?B?bXFKMHpqdFhkUloyK0xXSmtYL0lMaWUyckpHZTBRcGlHeGFPWFpGaXppZE9K?=
 =?utf-8?B?NnVUUkpySks1WlFtVlhKRTIwT082WEtWSlNSb2duM1loR0FVTXN2ZEhJQWVx?=
 =?utf-8?B?c0ZTc3ZBc0NiVTU3bG80MWxyT2hrNGtNZmRqTGRxeEJNZCt1Wk1wck5DOUYy?=
 =?utf-8?B?WnpEV0VmSHRNcTloM2dSV3hxVGdqRWNZeE9JZHRNOThpMUVFajFOaEZBYjVD?=
 =?utf-8?B?RnNjV3FWQTlhdnhacWFtU3lyNnhhL0RZaVArdkdqL3dYekNaSWxrUkdrYlZD?=
 =?utf-8?B?TGdYak8vSUNiZHJRdGRQWEF3K1I4NGduNVU5VnIveTR3NndXVjR6UVZrNUt0?=
 =?utf-8?B?ZG1pWlg2RmdWdzZwUDBaWExCNU9qL0pTMEFOL0FVUFhNYjdrdDd3QW1aS2to?=
 =?utf-8?B?OTErZVE0YmVscXZuYUk0TXB0UU9YamxpM0NqZ3B5RHIxMlNQK0R0M3BOd1U4?=
 =?utf-8?B?WHhtbjR5ZEdJaXdBbDQ5Qm5Qc0UwbnlURFF4SEJZaUp6QlUvOWR5STg1ZUVh?=
 =?utf-8?B?TlFpdlJybHlEMzZjTzIyYUw0S2VCNWdUeWxVc0grNkFScjluV0VVaVYzRkEx?=
 =?utf-8?B?bjlKSEI5cm10Y2VqZmtrOGJWSzYwRnRwYTJSdXBLVnljWVd3eng3dzhGdjJJ?=
 =?utf-8?B?eTA0NXNsa1A0T0l5TWZNZmROWW9EaFpuR2pLQ3lXVkVES1BGdkZwcmg2VVZ6?=
 =?utf-8?B?S1gycmtSQ09PTWQ4WXYxSllVNDA5VVFna0FvQi9YODFzbStrS0xTeENUN08z?=
 =?utf-8?B?NWRYc2pXS1UwL0FieHlQVUJyamF2UE1QMTFmNFNxZmJyQWxkRTNrYnlLdjhu?=
 =?utf-8?B?b3hOOEJRc0hUUWhpLzUrbXp1b0RydzEvM0hvRi9FTEJxWGtVRDNWV25uS2dZ?=
 =?utf-8?B?RWgwa29MaFJoMWxPcTUzdnI2eWdmZkZvU29FMTdNbkJTckxZUmROV281aTNQ?=
 =?utf-8?B?dmRNRzRtTXFhU3M0M1pzRHJFQmlQcHVOK09aK1diU1E1blhrV09raDRXeFZr?=
 =?utf-8?B?TjFkbHhlekRQOU5QWXlTQkNZUFE4cVltUGZ5b1pMdjI4UGd2bzk2akRQcThK?=
 =?utf-8?B?MkI1VEdVemVpV3dWSFFiL0VRd1l3MkhpNFVQWW5mbjNNRUhRYlVsazZQbGdP?=
 =?utf-8?B?cGF6MEpNeDBvenY5VVpmelUzRVpyZ000OHUyeld5K0paUjFaNzlXVk9nRStm?=
 =?utf-8?B?QVpHWnl5SHdyL0tEV1h4Qy9DSDRwMWgzZXJKeVI5UW5vVnpSKzUwWnA1dXdw?=
 =?utf-8?B?czJCWng4R3grYkovU2ZQY3h3MTdvY1g4ZFRzRGNJT3JqQnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR10MB8513.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWxRR2R0czdDMUJNcktOUmZxY0FpWGRjL2J6SElZU2lyR2VxNTh1Nng1N005?=
 =?utf-8?B?NFBmYzhlVHZjYmthZG9pN3FmWHZlQnNieG5QWUdvSnJFVWpCUC80czVkU0RM?=
 =?utf-8?B?QWY4eFlwVHZBNmlNKzdzOVlHRkRvK2ZxSWo0dGgyQ1AxSUF3VzltWkREZjRJ?=
 =?utf-8?B?V0lkZDZ0YmlFdUNoOW9sMkQrbFhSNVVWTUVoWE1rN3dwWEIrUi9obGMrd3pu?=
 =?utf-8?B?T3RjeHJRV2Y3SkFMaHNyNXBHUHFSN2RkaUNvQzRHNjhXRldnMXQ2VzlkMGRQ?=
 =?utf-8?B?T0djL1dOTnBqdDl1aWlOR1pHZ05WZnNiZ1VhdVFxaXU3WDdrSGhYSUNoZThV?=
 =?utf-8?B?OUxxajZuNW1TTFpkOC8vT2k3QVB0V1ZQWTVSYzlURnJHa2JJeWw0NVh5bDNC?=
 =?utf-8?B?bEdRR1FhZzl3NHNiRmNRMjRPU0dVZCt2YklRdllSMzIrOVc1d3dVRnRRKzNk?=
 =?utf-8?B?eS9xUFRYQlErZGh0eDNBQ296cE44REt6bE5rZlpadHFnWlpxRWZuRFZFdmh3?=
 =?utf-8?B?OGFXVTllVlRXVXc1OTBWNXVnVFdNOE9vWWFBd0pwVjl5RFd4RlFHNnBueUVD?=
 =?utf-8?B?a28vbnB6NmhEZjVDeEw0a0JvYnZzYldXK1AvYUVzNVlVNjdjT0ZwTHVOaU9x?=
 =?utf-8?B?c0JPZEE3K2l3N2tiWU8yak84aUVNazBHVVE3ZUQrNElQL3R6YkdpNTNkSnpP?=
 =?utf-8?B?Umt0TUNxSnpncUR5TGsvT1ZNcUh5TGErN3NyN3I3SmtIZVhVM0lXZER4Wm1s?=
 =?utf-8?B?ZThscmRPRmR0anFaU3ZXZURxMCs1UlM4NDJDNldob2I5SDFwL0FDbGpjbXhC?=
 =?utf-8?B?WXJYdHZyajlZVFlJRjY3WkUwNmFhSnEyRzhBT0FxZFdqMkY2c0NnRm90dDlm?=
 =?utf-8?B?L1Q0am0vaTBWYWFBWTFPemwyWmVjbTZ2VjloTmJCVjRGQk96V1JlV3VZZlZK?=
 =?utf-8?B?REk2ZjUvbWp0bjNqcEFaa1QxOXJ1c1BaNmFmaStxbG81Y3BucXBpVGxlRkRh?=
 =?utf-8?B?dGNOVXErT3lkY3pua0h5S1RXaVFBTlBEVXpUOUEwOSs2T0pRZ3Z2enU1UWdl?=
 =?utf-8?B?aUdUZkkvcUxRVzk3RXplSU9qWmJ0RmswL0Q5VEQwd2gzaHluVklldnZLcThp?=
 =?utf-8?B?TURITGtvRVdqemFteWRKWlRZZk55Tk1YU29wL2VSNkNydnBQZVd4Ykh1RG1Z?=
 =?utf-8?B?UDFTQTdrdC9kdGdoelgzdFdRMXFIWXFHRGZoYU1PWmVBQXNjcmY5anppOGs4?=
 =?utf-8?B?YkNMQ2JoOGVzTlJDV3dLRlF1QUViV1ZMVlhxVlM1YUhRMmxjRDFOK1dnL1dM?=
 =?utf-8?B?RkVFVEVXdVNWNHdFckdCYmNlL2s0QlZDaE0rMmF4Zjg0dUR5cksxT3VUQVY4?=
 =?utf-8?B?RVVPQURxdDRqWG10QVhQb3VESSs1c0h2cnhTOEhlTHIvNzkyRHR5N3c5TEox?=
 =?utf-8?B?OFJnYjJVOVozOHhSUWxwUnJlUkd6TEFHOHhmclZZSGk4QmVVTzhGU2tQeW1G?=
 =?utf-8?B?UDhRbjJZSFpCTnpSaHBBNmErdHFVL3ZiNUNFK05FQVhBZFlabFJBTzA3SDJa?=
 =?utf-8?B?Sms0amZOd0lEWjFxaGFhVmZrMUNmaE42cWpKYUdhVzBMRUIyaFVBTEpiVFpx?=
 =?utf-8?B?SzRSUm15NVlTZldGOHNMeklkWS95T3d5YmFiWFI0U29OOU0yb3VRMm5zclg0?=
 =?utf-8?B?WDVQNUxKZnZUbHhsQ004MHV5WlBxRVdSNStsNXMwS2t4ZU5GZWhsN3FSS1Jl?=
 =?utf-8?B?UldYelJydUJ4V3VFdk1pcThVUGpQVWhwcDdWVDltd3R5ZCtsWW5oSzlKYXpi?=
 =?utf-8?B?VjNOSmlmZ2RpdVgvbUVmSUVpcmpCNFhEbnFwSDJES2Rkc0ZjN3NIdGkwc0pK?=
 =?utf-8?B?WS91ZzlDbzQveEU5VE1VbExMWkxyUWtpOExsSG0va3VQZ3VHRmsvNlY2SGJW?=
 =?utf-8?B?bnpHdS9sYlpRd24zTVEwVXpkZ2VxRHo5QTJ6NGZKTmRaMjBvVWVpMThnRkRN?=
 =?utf-8?B?YUVoVXRoUlZNbFByblB3Z0E2MEpUU05MckpVejQ1RktidlgyOEF4OXBhRUlW?=
 =?utf-8?B?SDFJQUNVa3J0ZXBZdzg4UTlEdkE1WWxOM3NFanZSUFN0dUNMMzgwWjhWd2VY?=
 =?utf-8?B?QzUwalN3bUx4TnZLU0Zpc3dSSVJOZStYeExWRXpYRU9nOWlZczFNTVZqUXl5?=
 =?utf-8?Q?57Im8XRxCQYKHMbtTAYyyPw=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Wb3MVtFkvtlu2suxwoDsGpLdUNBt+26agaj9DVHebNWQkjuqjn9iMXBuj4tDue5rrX8TV2vX+I5S1cI9PFiDaye7tMuUdLmrsON/J4EaNvpA2XM70qeFT0jE5dTGzhrJAFLQRo8AXh0R/GbFaFdH6YAZWN0Cmbt9Jy2k5tIBviXlWFeg51DSazAdlrzMtJvULHiNNg1KT0mt8t19C8Yiq+RjqVZ/TNeaGs90180LvfFuQU87ZQmjRknrMBvP1rChDLwguA55t0MS8VzTJL8ZUWbJ2jH8CDFznUdsAN/ej+FOvrxk2UnrRvuhi52n3Jl+TNLNACffRmM8nwJeEYe2tCCROuobQKs/ifpjN5TygHLILZ/jHm1sb8eqJ0dTemVfKT0cqdJiDWmidQEqUihu1oassyLgY7krwhkIRnb7L2VGgugFzc8CZsTAA5mzRO2mZ/4U2W5cu4LTiH04IMxwTz3h+X0YRC+/neBnDV6NfyxeSYyYUvWzxzUq7FzqXcT5CST19Z0gYxCQ5R5lkFO9K3pbhyx0jen/iVzR/xA2/CKkmYCBP4qrKv/XaufHyvquWw+wGNK5Fl6dbPcrUhzXlmAYaGwBWHMJ7rfXH0x3eOk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf0b3dfe-532f-49a5-8fbe-08de10dee354
X-MS-Exchange-CrossTenant-AuthSource: IA3PR10MB8513.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 20:17:41.8003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OVnwK6JW7DS7pghOy3185OiA9z7a14fTYUVj/HA/Xz7viqGDqUW6KXFVrmdrT+IgpwXoSVdqMU2jXz8sj4BENysf2q2H12QZL/sh1kIIZ/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8732
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510210163
X-Proofpoint-GUID: R2nnLqNrFQpXcbSvqs5PGWH4L3FUg6Lp
X-Proofpoint-ORIG-GUID: R2nnLqNrFQpXcbSvqs5PGWH4L3FUg6Lp
X-Authority-Analysis: v=2.4 cv=WaEBqkhX c=1 sm=1 tr=0 ts=68f7ea6c b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=-bMhQ6iiAAAA:8 a=yPCof4ZbAAAA:8 a=klkSN6Ws-NQmv7NoFyEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=aViEl8YYgB_fEZN5ws7z:22 cc=ntf
 awl=host:12092
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDEwNSBTYWx0ZWRfX9LouyAc8Ewr6
 sfO1Kajny3IlL7/PgJlIjgkovtqPDv+0DaZisL7y+kVX7DG9HZ2M2zFa7xcmBqNGWJ1zEDXvzH0
 dLNSx+HQYtq/mdh6807wop43EXeO8+IJu74ImdHTslvnF2nXx+RvovGa3JSk2ky74YtTP+ApE76
 uPyA17pm7yp3gkU9ciRZsRTD6GwM8oRtQm6rRqwSBjd4R4PaxJZCKExGJywccuiGbnYO9NCcg1S
 S8iRD7mcyfhl1z49RmlXSQkL1ODVedlakoHiudgCpqsJU7UrMMXUfyYCuHp5n8kyU+rVPMJCJhm
 8jr+jFvGT3f5K5EYfzP1JIZAnYP7ZcfLP7cjtnQRpPHgcYcNo9ygBzeYpo/OM10FjUBtllY9tmy
 Yur7kQ5ArdN9c6ScbxwzEG3U9LriBUCTAPgc6m3TL2qo6Nn9yDA=

Hello,
I have removed the reference to the blog-git html file, and edited the
links at the bottom to include a link to the actual (public facing)
blog.

Bruce
---

Signed-off-by: Bruce McCulloch <bruce.mcculloch@oracle.com>
---
 llm/README.md                | 130 ++++++++
 llm/llms-dtrace-complete.txt |   2 +
 llm/llms-dtrace-short.txt    | 611 +++++++++++++++++++++++++++++++++++
 3 files changed, 743 insertions(+)
 create mode 100644 llm/README.md
 create mode 100644 llm/llms-dtrace-short.txt

diff --git a/llm/README.md b/llm/README.md
new file mode 100644
index 00000000..7324a636
--- /dev/null
+++ b/llm/README.md
@@ -0,0 +1,130 @@
+# DTrace LLM Context Files
+
+## Overview
+These files provide structured **context packs** (`llms-txt` format) for use with large language models (LLMs) such as GPT-4 or Claude.  
+They teach the model how to write **correct, safe, and complete DTrace programs** for Oracle Linux.
+
+The goal is to let engineers and administrators generate working D scripts in natural language — without having to memorize the entire D language syntax.
+
+> The context files describe probe syntax, predicates, statements, variables, built-ins, functions, and safe tracing idioms for core providers (`syscall`, `proc`, `sched`, `profile`, `io`, `pid`, `usdt`, etc.).
+
+---
+
+## Files
+| File | Description |
+|------|--------------|
+| `llms-dtrace-short.txt` | Compact reference used to bootstrap LLMs for DTrace knowledge. |
+| `llms-dtrace-complete.txt` | Full expanded reference (available from the [DTrace-utils repo](https://github.com/oracle/dtrace-utils/tree/devel/llm)). |
+
+---
+
+## How to Use
+
+1. **Install DTrace**
+
+   ```bash
+   sudo dnf install dtrace
+
+```
+
+Make sure you are using the DTrace binary from the `dtrace-utils` package, _not_ the SystemTap compatibility binary:
+
+```bash
+which dtrace
+sudo /usr/sbin/dtrace -V
+
+```
+
+2.  **Load the context file into your LLM session**
+    
+    -   In ChatGPT, Claude, or another interface that supports file context, click the “+” icon and upload `llms-dtrace-short.txt`.
+        
+    -   The model will automatically ingest the reference and understand how to write runnable DTrace programs for Oracle Linux.
+        
+3.  **Start asking questions in natural language**
+    
+    You can now prompt the model to produce valid D scripts:
+    
+    ```
+    write a dtrace script that shows all read() syscalls made while the script is running
+    
+    ```
+    
+    or
+    
+    ```
+    count how many processes start on the system within 5 seconds
+    
+    ```
+    
+4.  **Run the generated script**
+    
+    Save the model’s output (e.g. `trace.d`), then execute:
+    
+    ```bash
+    sudo dtrace -s trace.d
+    
+    ```
+    
+
+----------
+
+## Example Prompts
+
+Here are a few good starting points:
+
+>“Write a DTrace script that prints the PID of every process that accesses memory.”
+
+Teaches process-level tracing and probe filters.
+
+>“Provide a DTrace script to count how many processes are started over 5 seconds.”
+
+Demonstrates use of timed aggregations.
+
+>“Show all `read()` syscalls and count how many occur per process.”
+
+Basic syscall entry/return tracing.
+
+>“Track which executables call `open()` and print errors.”
+
+Uses speculation and error guards.
+
+----------
+
+## Safety and Trust
+
+DTrace runs in **nondestructive mode by default**.  
+Even if an LLM suggests unsafe actions, the runtime will prevent writes, signals, or other destructive operations unless explicitly enabled with `-w`.
+
+This makes LLM-generated scripts safe to test and explore on production or staging systems — they can observe but not modify the kernel state.
+
+----------
+
+## Notes and Troubleshooting
+
+-   If you see:
+    
+    ```
+    dtrace: could not enable tracing: Destructive actions not allowed
+    
+    ```
+    
+    either remove `system()` calls or rerun with `sudo dtrace -w -s script.d`.
+    
+-   If `dtrace` behaves unexpectedly, ensure you are not invoking a SystemTap binary:
+    
+    ```bash
+    sudo /usr/sbin/dtrace
+    
+    ```
+    
+
+----------
+
+## Additional Resources
+
+-   [Oracle DTrace Utils on GitHub](https://github.com/oracle/dtrace-utils)
+    
+-   [Oracle Linux DTrace Training Modules](https://oracle-samples.github.io/oltrain/tracks/ol/dtrace/)
+    
+-   [Oracle Linux Blog: Natural Language System Tracing with Dtrace and LLMs](https://blogs.oracle.com/linux/post/dtrace-and-llms)
diff --git a/llm/llms-dtrace-complete.txt b/llm/llms-dtrace-complete.txt
index 2264fc40..8a4a535c 100644
--- a/llm/llms-dtrace-complete.txt
+++ b/llm/llms-dtrace-complete.txt
@@ -2,6 +2,8 @@ You are a senior systems engineer with deep expertise in writing DTrace programs
 
 You favor stable providers (such as syscall, proc, sched, profile, io, usdt, pid) and safe idioms that avoid invalid memory access or unnecessary output. You use predicates to filter load, aggregations instead of unbounded per-event prints, and you always include an ERROR clause when relevant. Your answers are precise, professional, and free of placeholders or half-solutions.
 
+DO NOT RECOMMEND DANGEROUS OPERATIONS UNLESS THERE IS AN ALTERNATIVE. Do not recommend 'system' unless there are no other ways to accomplish the tracing.
+
 Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Oracle Linux.
 
 After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Oracle Linux.
diff --git a/llm/llms-dtrace-short.txt b/llm/llms-dtrace-short.txt
new file mode 100644
index 00000000..a514abbf
--- /dev/null
+++ b/llm/llms-dtrace-short.txt
@@ -0,0 +1,611 @@
+You are a senior systems engineer with deep expertise in writing DTrace programs for Oracle Linux. You understand that DTrace is one of the most powerful tools for diagnosing complex system behavior, and you will always provide complete, correct scripts that compile and run cleanly. Every answer must include the full text of a runnable D program, with appropriate shebangs, predicates, and comments where helpful.
+
+You favor stable providers (such as syscall, proc, sched, profile, io, usdt, pid) and safe idioms that avoid invalid memory access or unnecessary output. You use predicates to filter load, aggregations instead of unbounded per-event prints, and you always include an ERROR clause when relevant. Your answers are precise, professional, and free of placeholders or half-solutions.
+
+DO NOT RECOMMEND DANGEROUS OPERATIONS UNLESS THERE IS AN ALTERNATIVE. Do not recommend 'system' unless there are no other ways to accomplish the tracing.
+
+Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Oracle Linux.
+
+After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Oracle Linux.
+
+DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
+PART 1: PROGRAM STRUCTURE, PROBE DESCRIPTIONS, PREDICATES, STATEMENTS
+
+## GOAL
+Provide a compact, machine-optimized reference so an LLM can generate correct DTrace D programs for Oracle Linux.
+
+## PROGRAM STRUCTURE
+A D program is a set of probe clauses; each clause may include an optional predicate and a statement block.
+Syntax skeleton:
+```
+probe descriptions
+/ optional predicate /
+{
+    statements
+}
+```
+- Multiple clauses allowed; run in program order.
+- Empty `{}` triggers the default action (trace EPID).
+- Scripts may be invoked via `dtrace` (shebang/interpreter line).
+- Scripts can include pragma options.
+
+## PROBE DESCRIPTIONS
+Canonical form: `provider:module:function:name`
+Fields:
+- provider — DTrace provider name
+- module — kernel object / library / program, if location-specific
+- function — program function, if location-specific
+- name — semantic probe name (e.g., BEGIN, END)
+
+Shorthand precedence when fields are omitted:
+- name
+- function:name
+- module:function:name
+
+Avoid numeric probe IDs (unstable).  
+Wildcards & patterns supported (shell-style globbing). Empty fields match any value.
+
+### Pattern tokens
+- `*` — any string (incl. empty)
+- `?` — any single character
+- `[set]` — any one in set; `[a-z]` range; `[!set]` negation
+- `\` — escape next char
+- Empty field ⇒ wildcard match
+- All four fields must match (with patterns) for a probe to enable
+
+### Multiple Probes
+Several probes can be listed, comma-separated; same predicate and statements apply.
+
+### Examples
+- All syscall entries: `syscall:::entry`
+- BEGIN without module/function: `dtrace:::BEGIN`
+- List available probes: `dtrace -l`
+
+## PREDICATES
+- Optional boolean expression between slashes: `/ expr /`
+- Evaluated at probe fire to decide whether to execute statements
+- Any D expression of integer/pointer type; nonzero ⇒ true
+- Can reference variables, built-ins, and operators
+
+Examples:
+- Match only "date" process: `/execname == "date"/`
+- Targeted PID: `/pid == $target/`
+
+## STATEMENTS (CLAUSES)
+- Semicolon-separated expressions/functions inside `{ ... }`
+- Default action when `{}` empty: report probe activation (EPID)
+- Clauses can use aggregations, variables, built-ins, and functions
+
+### Minimal idioms
+Count events by function:
+```
+syscall:::entry
+{
+    @counts[probefunc] = count();
+}
+```
+
+Predicate filter by execname:
+```
+syscall:::entry
+/execname == "date"/
+{
+    @reads[probefunc] = count();
+}
+```
+
+## NOTES & STABILITY
+- Probe IDs are not stable; prefer full descriptions
+- Providers, modules, functions, names may have differing stability attributes
+DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
+PART 2: TYPES, OPERATORS, EXPRESSIONS
+
+## IDENTIFIERS & KEYWORDS
+- Identifiers: letters, digits, underscore; must start with letter/_
+- Reserved keywords (subset relevant to D):  
+  auto, break, case, const, continue, counter, default, do, else, enum, extern, float, for, goto, if, import, inline, int, long, probe, provider, register, restrict, return, self, short, signed, sizeof, static, string, stringof, struct, switch, this, translator, typedef, union, unsigned, void, volatile, while, xlate
+- Avoid names starting with `_` (reserved for system)
+
+## DATA TYPES
+### Integer Types
+- char (1 byte), short (2), int (4), long (8), long long (8)
+- signed by default; add `unsigned` qualifier for unsigned
+
+### Integer Aliases
+- int8_t, int16_t, int32_t, int64_t
+- uint8_t, uint16_t, uint32_t, uint64_t
+- intptr_t, uintptr_t
+
+### Floating Point
+- float (4 bytes), double (8), long double (16)
+- Floating-point arithmetic not permitted; can trace/printf values
+
+### Strings
+- `string` type represents ASCII strings
+- Special handling for tracing, comparison, functions
+
+### Pointers
+- Declared as `type *`
+- Example: `int *p;`
+- Safe: invalid deref ⇒ BADADDR fault, ERROR probe fires
+
+### Structs & Unions
+- ANSI C-like definition
+- Access via `.` and `->`
+
+### Arrays
+- Scalar arrays: fixed-length `[n]`
+- Associative arrays: `name[key]`
+- Multidimensional arrays supported
+
+### Enumerations
+- `enum colors { RED, GREEN, BLUE }`
+- Values assigned sequentially unless overridden
+
+### Typedef
+- `typedef existing-type alias;`
+
+### Inlines
+- Named constants: `inline type name = expression;`
+
+### Namespaces
+- Backtick (`) to access kernel/module types: `struct vmlinux\`task_struct`
+
+## CONSTANTS
+- Integer: decimal (123), octal (012), hex (0x123)
+- Floating: decimal with dot or exponent
+- Character: `'a'`, escape sequences (`\n`, `\t`, etc.)
+- String: `"hello"`, stored as null-terminated
+
+## OPERATORS
+
+### Arithmetic
+- `+` add, `-` sub, `*` mul, `/` div, `%` mod
+- Integer and pointer arithmetic only
+- Division by zero ⇒ ERROR probe
+
+### Relational
+- `<`, `<=`, `>`, `>=`, `==`, `!=`
+- Applied to int, ptr, string
+- Strings compare lexically
+
+### Logical
+- `&&` AND, `||` OR, `^^` XOR, `!` NOT
+- Short-circuit for `&&` and `||`
+
+### Bitwise
+- `~` NOT, `&` AND, `|` OR, `^` XOR, `<<` shift left, `>>` shift right
+
+### Assignment
+- `=`, `+=`, `-=`, `*=`, `/=`, `%=`, `&=`, `|=`, `^=`, `<<=`, `>>=`
+
+### Increment / Decrement
+- `++`, `--` (prefix/postfix)
+- Works on int and ptr types
+
+### Conditional
+- Ternary `?:` operator
+- Example: `x = i == 0 ? "zero" : "nonzero";`
+
+### Type Conversion
+- Implicit: usual arithmetic conversions (C-like)
+- Explicit cast: `(int)x`
+
+## OPERATOR PRECEDENCE (highest → lowest)
+- `() [] -> .`
+- Unary: `! ~ ++ -- + - * & (type) sizeof stringof offsetof xlate`
+- `* / %`
+- `+ -`
+- `<< >>`
+- `< <= > >=`
+- `== !=`
+- `&`
+- `^`
+- `|`
+- `&&`
+- `^^`
+- `||`
+- `?:`
+- Assignments: `= += -= *= /= %= &= ^= <<= >>=`
+- `,` (evaluate left→right, return rightmost)
+
+### Misc Operators
+- `sizeof(expr)` — size in bytes
+- `offsetof(type, member)` — offset of struct member
+- `stringof(expr)` — convert to string
+- `xlate(expr)` — translate type
+- Unary `&` — address of object
+- Unary `*` — dereference pointer
+
+DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
+PART 3: VARIABLES
+
+## VARIABLE CLASSES
+- Scalar variables: single data objects (int, ptr, string, struct, etc.)
+- Associative arrays: dynamic, keyed collections
+- Scalar arrays: fixed-length, indexed by int
+- Multidimensional arrays: ANSI C-compatible, rarely used
+- Variables created implicitly on first assignment
+
+## VARIABLE SCOPE
+- Global: `varname`  
+- Thread-local: `self->varname`  
+- Clause-local: `this->varname`  
+- External (kernel symbols): `` `symbol ``
+
+### Table: Scope summary
+- Global: shared by all threads, not MP-safe
+- Thread-local: per-thread storage, MP-safe
+- Clause-local: per-probe-firing storage, MP-safe
+- External: access kernel variables, read-only
+
+## GLOBAL VARIABLES
+- Declared implicitly on assignment or explicitly outside clauses
+- Examples:
+```
+x = 123;            /* int */
+s = "hello";        /* string */
+a[123, 'a'] = 456;  /* associative array */
+```
+- Explicit declaration (no init value allowed):
+```
+int x;
+int arr[unsigned long long, char];
+```
+
+Initialization can be done in `BEGIN` clause.
+
+## THREAD-LOCAL VARIABLES
+- Scoped to each OS thread
+- Syntax: `self->name`
+- Examples:
+```
+syscall::read:entry
+{
+    self->read = 1;
+}
+```
+- Created implicitly; type = RHS of first assignment
+- Can also declare explicitly: `self int x;`
+
+## CLAUSE-LOCAL VARIABLES
+- Scoped to single probe firing, persist across clauses for same probe
+- Syntax: `this->name`
+- Example:
+```
+BEGIN
+{
+    this->secs = timestamp / 1000000000;
+}
+```
+- Explicit declaration: `this int x;`
+- Faster than associative arrays, use for temporary calculations
+
+## EXTERNAL VARIABLES
+- Access OS/kernel variables and symbols
+- Syntax: `` module`symbol ``
+- Examples:
+``
+trace(`max_pfn);
+trace(&`max_pfn);
+``
+- Names kept in separate namespace from D identifiers
+- Read-only for safety
+
+## ARRAYS
+### Associative Arrays
+- Dynamic, unlimited elements
+- Syntax: `name[key] = value;`
+- Key can be any type (int, string, tuple)
+- Delete element: assign 0 → `arr[key] = 0;`
+
+### Scalar Arrays
+- Fixed length, declared with `[n]`
+- Example: `int arr[5];`
+- Bounds checked at compile-time
+
+### Multidimensional Scalar Arrays
+- ANSI C-compatible: `int m[12][34];`
+- Access: `m[0][1]`
+
+Note: `arr[0][1]` (multidimensional) ≠ `arr[0,1]` (associative tuple key)
+
+DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
+PART 4: BUILT-IN VARIABLES AND MACRO VARIABLES
+
+## BUILT-IN VARIABLES
+Automatically available within all D programs.
+
+### Process & Thread
+- `pid` — process ID
+- `ppid` — parent process ID
+- `tid` — thread ID
+- `execname` — current process name
+
+### Probe Metadata
+- `probeprov` — provider
+- `probemod` — module
+- `probefunc` — function
+- `probename` — name
+
+### Time
+- `timestamp` — nanosecond, monotonic
+- `vtimestamp` — per-thread virtualized timestamp
+
+### Call Stack & Location
+- `caller` — kernel PC of calling function
+- `ucaller` — user-level PC of calling function
+
+### Syscall & Error
+- `errno` — last thread error number
+
+### Arguments
+- `arg0` … `arg9` — probe arguments (64-bit)
+- `args[]` — typed argument array
+
+## MACRO VARIABLES
+Expanded at compile time, not runtime.
+
+### Process & User Info
+- `$pid`, `$ppid` — current / parent process ID
+- `$uid`, `$gid` — user / group ID
+- `$target` — target process specified via `-p` option
+- `$1`, `$2`, … — script arguments
+
+### Notes
+- Macro variables allow parameterization of scripts
+- Expansion occurs at compile-time, before execution
+
+DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
+PART 5: FUNCTIONS
+
+## DATA RECORDING FUNCTIONS
+- `trace(expr)` — store expr in trace buffer
+- `printf(fmt, ...)` — formatted print
+- `printa(fmt, @aggr)` — print aggregation(s)
+- `exit(code)` — terminate tracing, run END
+
+## AGGREGATION FUNCTIONS
+- `count()` — number of probe firings
+- `sum(x)` — sum of values
+- `avg(x)` — average of values
+- `min(x)` — minimum
+- `max(x)` — maximum
+- `stddev(x)` — standard deviation
+- `quantize(x)` — power-of-two histogram
+- `lquantize(x, from, to, step)` — linear histogram
+- `llquantize(x, factor, low, high)` — log-linear histogram
+
+## SPECULATION FUNCTIONS
+- `speculation()` — allocate speculative buffer, return ID
+- `speculate(ID)` — record subsequent actions to speculation buffer
+- `commit(ID)` — commit speculative buffer to main trace
+- `discard(ID)` — discard speculative buffer
+
+## MEMORY COPYING FUNCTIONS
+- `copyin(addr, size)` — copy from user space
+- `copyinstr(addr[, size])` — copy NUL-terminated string from user
+- `copyinto(addr, size, dest)` — copy into DTrace memory
+- `copyout(src, addr, size)` — write to user space (destructive)
+- `copyoutstr(str, addr, size)` — write string to user (destructive)
+
+## STRING FUNCTIONS
+- `strlen(s)` — string length
+- `strjoin(a, b)` — concatenate
+- `substr(s, i[, len])` — substring
+- `index(str, sub[, start])` — first occurrence of sub
+- `rindex(str, sub[, start])` — last occurrence of sub
+- `strchr(str, c)` — first char occurrence
+- `strrchr(str, c)` — last char occurrence
+- `strstr(str, sub)` — substring search
+- `strtok(str, delim)` — tokenize
+
+## STACK & EXECUTION FUNCTIONS
+- `stack([nframes])` — kernel stack trace
+- `ustack([nframes, strsize])` — user stack trace
+- `system(cmd)` — execute shell command (destructive)
+- `raise(sig)` — send signal to process (destructive)
+
+DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
+PART 6: PROVIDERS & COMMON PROBES
+
+## PROVIDERS OVERVIEW
+Providers group related probes. Each probe is identified by `provider:module:function:name`.
+
+### Core Providers
+- `dtrace`  
+  - BEGIN — fires at start of tracing
+  - END — fires at end of tracing
+  - ERROR — fires on D program error
+
+- `syscall`  
+  - Entry/return of all system calls
+  - Examples: `syscall::open:entry`, `syscall::write:return`
+
+- `proc`  
+  - Process lifecycle events
+  - create, exec, exit, signal
+
+- `sched`  
+  - Scheduler events
+  - on-cpu, off-cpu, enqueue, dequeue, wakeup
+
+- `io`  
+  - Device I/O events
+  - start, done
+
+- `profile`  
+  - Time-based sampling
+  - `profile-N` — kernel stack sample every N Hz
+  - `tick-N` — fires every N seconds
+
+- `lockstat`  
+  - Kernel lock contention statistics
+  - spin, adaptive, rw lock events
+
+- `fbt` (function boundary tracing)  
+  - Kernel function entry/return probes
+  - Powerful but potentially unsafe (debug/dev only)
+
+- `pid`  
+  - User-level function boundary tracing for a process
+
+- `usdt` (user-level statically defined tracing)  
+  - Static tracepoints in user programs
+
+- `cpc`  
+  - CPU performance counter probes
+
+## EXAMPLE USES
+
+### System Calls
+```
+syscall:::entry
+{
+    @calls[execname] = count();
+}
+```
+
+### Process Creation
+```
+proc:::exec-success
+{
+    printf("%s exec %s", execname, copyinstr(arg0));
+}
+```
+
+### Scheduler Events
+```
+sched:::on-cpu
+{
+    @oncpu[execname] = count();
+}
+```
+
+### Profile Sampling
+```
+profile-1000
+{
+    @[ustack()] = count();
+}
+```
+
+### I/O Operations
+```
+io:::start
+{
+    @io[execname] = count();
+}
+```
+
+DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
+PART 7: COMMON PATTERNS
+
+## COUNT SYSCALLS BY PROCESS
+```
+syscall:::entry
+/execname != ""/
+{
+    @syscalls[execname] = count();
+}
+END
+{
+    printa(@syscalls);
+}
+```
+
+## TIME A SPECIFIC SYSCALL
+```
+syscall::write:entry
+{
+    self->ts = timestamp;
+}
+syscall::write:return
+/self->ts/
+{
+    @delta[execname] = quantize(timestamp - self->ts);
+    self->ts = 0;
+}
+```
+
+## TRACE OPEN CALLS WITH ERRORS (SPECULATION)
+```
+syscall::open:entry
+{
+    self->spec = speculation();
+    speculate(self->spec);
+    printf("open: %s", copyinstr(arg0));
+}
+syscall::open:return/self->spec/
+{
+    speculate(self->spec);
+    trace(errno);
+}
+syscall::open:return/self->spec && errno != 0/
+{
+    commit(self->spec);
+    self->spec = 0;
+}
+syscall::open:return/self->spec && errno == 0/
+{
+    discard(self->spec);
+    self->spec = 0;
+}
+```
+
+## PROFILE USER STACKS (SAMPLING)
+```
+profile-1000
+{
+    @[ustack()] = count();
+}
+```
+
+## TRACK PROCESS EXECUTIONS
+```
+proc:::exec-success
+{
+    printf("%s -> %s", execname, copyinstr(arg0));
+}
+```
+
+## COUNT SCHEDULER ON-CPU EVENTS
+```
+sched:::on-cpu
+{
+    @oncpu[execname] = count();
+}
+```
+
+## I/O ACTIVITY BY PROCESS
+```
+io:::start
+{
+    @io[execname] = count();
+}
+```
+
+## TRACK ERRORS
+```
+ERROR
+{
+    printf("DTrace error: %s", probename);
+}
+```
+
+## TRACE ARGUMENTS OF FUNCTION
+```
+syscall::open:entry
+{
+    printf("open(%s)", copyinstr(arg0));
+}
+```
+
+## LIMIT TRACE TO TARGET PID
+```
+syscall:::entry
+/pid == $target/
+{
+    @syscalls[probefunc] = count();
+}
+```
-- 
2.47.3

