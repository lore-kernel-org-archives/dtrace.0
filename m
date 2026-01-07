Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0319E303A3B
	for <dtrace@lists.linux.dev>; Wed,  7 Jan 2026 21:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767821471; cv=fail; b=djUXMFk0/Ba6KFilgXEnx/cWZrpakPslRRjqp5b0UCksxSIUkaG83kBXb9SMKb2Qlv4kTn+gpZMmzYcnk0Hvfk14RRsbSsTkKh6DQxiyTeqfMo/EUo3w8NPpi+X75UCt7zLkM2cCbNpKC4JlvW88rMSINjuszBuFKSO3tINdC4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767821471; c=relaxed/simple;
	bh=PPG14matcJQjR+YJXzgMspB2x4No17R91Y4LHYLS+ac=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I4bIB6Pq6+SRXYb8GzVEESCicr9VTIldIxag9uU9kx0Vjm+K+VRDSAegkF9oKsxuEkdyWrE0cc+2Iljqvf184s6OdsHGpxktUo9d4T6mdpH6v2+7ABYGofaKeit9maGzfqlRofSmbLGhfN97wLEpoofdFrAvIWLzGKZy9rmFUYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KA6G+6hj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GGSL4WCC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KA6G+6hj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GGSL4WCC"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607IphFk2330454
	for <dtrace@lists.linux.dev>; Wed, 7 Jan 2026 21:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=35QYAw6CtP5KqXAwaKKJ5xj1z7BvoVuyVuQMrn36X6s=; b=
	KA6G+6hjm3Fw7FtKQ2yROH9gRbtFBkoitvpJXk2rxNq78OpwBT59OWR02YhLZZJT
	kRYlAo+cvWe8gjXmnxbcN2/LE8piFjfu6CV+Uy0Xz5/N+pa/Cp7RSmzK52bqAMeo
	yKDhXjlGDCZACA0xR5nXDA/pGMEUXsJzIotMjUZqO+JBrmkZ70Gn8ma+0RnOvbGG
	+AzJB6k/TW5ijIM1IAxfQAL7uSuf+VqXqHT+wRFoDdBksOSPi4/30QouhvewVlN7
	7+Mo7gHXQoGXiVLg6IXFem4kQ9BOzCz1RoPwK3c5jdvZarm5x2RPiEj51AgiZ+ry
	P1NMnuC8jjArmMstoG2ivQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bhw4r87vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 07 Jan 2026 21:31:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 607KGkST034124
	for <dtrace@lists.linux.dev>; Wed, 7 Jan 2026 21:31:03 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013043.outbound.protection.outlook.com [40.93.196.43])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4besjab42b-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 07 Jan 2026 21:31:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bs+BlvAnTSqcyd+2qTCFXh7Gj/xGmeoe0039ImgQFGdmWRpnOsmoW07okTsZS3RIBy1FUeassol4Lfj90/gOHQhvzBJaUC4bIL2nE9Wc6PRw+tTnx4go9V9bJqI0ljvjkR1BhgFx8WFRLm8l2dQwqEaXBWKygo3cppCTj08CuvERZSHFZmuKUDdqZemch9VQ3+r/LOoG3HnUAmm7fy1+DGgb3lskxKhz6noWmQpikgdiQrYRJ7kfL/qfyBz3L1oH1Yr3nfr42AVoL1DQHnbCNSW1sBDXi7F3iMzBef/q8g7cccTvnR/mlCyw6TqfXx5OCMVmA2cB12+6jna+NQilrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35QYAw6CtP5KqXAwaKKJ5xj1z7BvoVuyVuQMrn36X6s=;
 b=RBpl+ZNKG1OQc62Q5BPWXxV+83dgX4x6jfm9J8K0qe0+SVAn/sCk1tOxDMtcZ85C0FrPR8HAwKhWT538eJg2fPl3Q9cyqq21x4FKn1SxzPr+ZLo0N/QpCiTrkHHJULiS34ojbblffGqar5dbX4o18UfcTI99RmeK1C9df3/I+/fWuexst/AhfqA39ItgcdwvmCnVHpeQVeJFzJ4S384aP001Omqs55/d+IaRPQ7+U8Br914SCQDihKLsUxM+zioGaWUQzPqxcf+LatjTb41GrGMzjPMPMAVkxYGQdeK1keKaEtIhkPkdPXmcQNJ91vzTH9PtapCIN+xAsZ6jcV5jOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35QYAw6CtP5KqXAwaKKJ5xj1z7BvoVuyVuQMrn36X6s=;
 b=GGSL4WCCufjbEVLeD6awEVHyvJURf2WfZYv9rfny8ErkolFNolpubhbq8dRos3ryarV4LZ+3/pI3a1BOwroMhgLqQGhrSLYnbSrGVEHsyg0XNEllSEsQ8+vDTmrGdlrFXNjqCFGGnpGTNHTV7TIQWnN7WZNO/GoSKsLoFLgdYZo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB8216.namprd10.prod.outlook.com (2603:10b6:610:1f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 21:30:59 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 21:30:59 +0000
Message-ID: <ec40b0e6-c7d2-acaa-c8a1-f2385aac1452@oracle.com>
Date: Wed, 7 Jan 2026 16:30:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v3 2/4] test: correct file permissions
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB752234D6A8CA009C7E01E158C284A@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB752234D6A8CA009C7E01E158C284A@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ2PR07CA0018.namprd07.prod.outlook.com
 (2603:10b6:a03:505::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB8216:EE_
X-MS-Office365-Filtering-Correlation-Id: 20182809-990e-48a4-6741-08de4e340c8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWVMRmFOUVQ2MFVpTk5yWnJlTmExWGNDUnlPSmo5RkZwZlFGRGc3UHhSN1Zi?=
 =?utf-8?B?NHk4VWVJeGVrYTY5dU5OdDVxamIvY2xqbk12MjM4SXJVMG9pUy9HRzRqczhz?=
 =?utf-8?B?OFBnc0ZLVWp6U2xHZ255R0l6a0lENElvSlU2T1g3UGpEYjlwYnhFbmovR1F4?=
 =?utf-8?B?VThDb1dld2VkczV0U2Zhb3V4elpyY1UzUFo2OE92dGsveGhGRnI3dlpPOCsx?=
 =?utf-8?B?eWdPRi96Z1NrOTR0QUh0VldvelZDcGtIaFVoMTd6Ui9hazQ4aXZsZkIxalA5?=
 =?utf-8?B?dzNJWS91UFlqY3VjZFNpQnJpbFBPa2o3Uk44MFJ6OWhLZERxRjkyWWthcEFp?=
 =?utf-8?B?SUlnMml3ZnZWSXJiRHA2dGlVMXVKdWZDcFJKb3FsQmxZZWpRSmJBZnVqalVm?=
 =?utf-8?B?VGRNQU05M3d5d3Bsem1vTVJSeU9YTHprSjJWWThwT1ZVYXAyUzQ3S0QrcnBW?=
 =?utf-8?B?R2UzUTJNU1NEbCthbktQTjQ4NHhSTVNyZEMzR09oTUJFZmhEREVTbGlvRG54?=
 =?utf-8?B?NXJ1YkJLQVJhUnBwNlVzYmcvcDlXRm9WMWgwTHlSUHU0dTBQbzdEa0RrRUZ3?=
 =?utf-8?B?OWZDd2dSN1pOUS96QVcvbjZjYUpWT2JTa1dVQUxoenVydzl5b1pLMkxORFl4?=
 =?utf-8?B?LzlQYTlLdzFUUnpJWk5wamNXdEhUUldaeGNGaHNWQUxsM05zVkg0elpxdXo4?=
 =?utf-8?B?M203bDB2ZmpoL1YwUUNxQXp6cW9vYzV0Znc5cVg5VGZ4a2w5bGgvZjlwb2Z6?=
 =?utf-8?B?OFpBVll2RG8xeFNPYUF6cGpJWWtwT01kTHhCa3dFbUpUWUZXOTlEeTRVUGww?=
 =?utf-8?B?NG51S3FxL3ZoT2x4eXRSRnhCaUZVOTdpVlhIaENRcEhSZWVQQ09KS04vL0pz?=
 =?utf-8?B?c3kwVWt1a0tsakxqZE9GeGVFQVkyL3VDMkwzblQ1YWpJUUZsU2VHRU9mbUZm?=
 =?utf-8?B?VjQrN2ZpUTJVRlZZbzJJYmFNSUtEYks4Q09iU0RjRUNpS09QdUlxNnFVdmtz?=
 =?utf-8?B?T3JBODh5alRTSHFGTkVRZ1NHQ3lybW5aZkFEc0t0WXlWRDVQMVR0SGdHVzN1?=
 =?utf-8?B?RWc5RTB1RHc3NDhoZzRudkRXeUpQQkprT0U0Z2VRLzVvZHcvU2t3YzJNWlRv?=
 =?utf-8?B?OWJ1d3U1Vk1YZjFubHgyRG9SMThjaFkvVkIyY3A4TkZMNEM4WHF0M2tMNXhH?=
 =?utf-8?B?RkQxTXAvR0dQcGFVUHZ1bmluMHBRSGVJRVFicWhJaWVXUno4dU9RbmtOeUYv?=
 =?utf-8?B?bS8xdUxYT3JoZHNuSlhrb0pFdDVxN2tHaHkwbzIvT1BWT1pjKzg4cWZNOEk4?=
 =?utf-8?B?b1NFYTQ1UWEvNktGZ2pNRjU5RHo0UXNXQ0tjZ1Y4T2lDN28vWEFhLzd5NEpP?=
 =?utf-8?B?S21zS3VtZnlSRFR6aXhvRjV1SWtPSTNrUnRzeXhwd0FGcTd3d2daRldZUlB1?=
 =?utf-8?B?ZmVaakFSQXRwVlNEa0hKTFptaDVhUEIrM0s0UWNDNFBHTElmL2x3eVFvVnJw?=
 =?utf-8?B?eHZjZXpYMGNnemE3WklmRGgvNGpwR3JOU2JqNTZBT25TWWsrMWY0UHNScHli?=
 =?utf-8?B?UDNuNjltaUljTXFBRmU3OHRsMm5jTGVYYnNUV3Z3dG1WZWx5SHp1eHdDWjRo?=
 =?utf-8?B?Yyt0Q0U1RlB4QUFOZW1XZHRFU3YwUzBTdk9za1RQcnNLK1RHNWhJNTl4aUVW?=
 =?utf-8?B?NkRTMldlNGVxZ0NQUWVKOTNkOEI0bGE4b1gwaCtxNWFFN0FoNXh4WmZxcnRW?=
 =?utf-8?B?KzBaWGh6L1l4ZnN2Nk5ZVDJINWdqMU51SHUwalFUa2xHL2t4WEpRQ3c5MUEx?=
 =?utf-8?B?SzJucWV0d3ZXcjI1ZnYwUVRvbTNqY3pYYlIzREZ1RHRsZ3QvYll1bjNwbHpH?=
 =?utf-8?B?S2ZuMUFUNW9lL0cvZE1wRnlHbFVteXo1bHdIY01yU211NG4wVGhGY0h0S2pz?=
 =?utf-8?B?NzlXbjFLTERVZVQ0NVgrcTRWWng4NDFTcWQvdWZxaS9EcG5vYldVa05ZQThw?=
 =?utf-8?B?Vzl5bklMdEx3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2VjQlhsSk9sMHo5dTdkdmEyTDBnVDNrcW9tSEJLQXpnUWlvTlc2MmN6MTVI?=
 =?utf-8?B?K0JrQU5EVWdmR1BaK1VtU3NNOGM4MVdmend2dFY4aEcrVDg0cXdZZjhIMTZt?=
 =?utf-8?B?eTF0UlBmOTNQQm84OTNBdnZnV0ZicExVemxIdFlSZnJBM0xHU2F1L3pGNFd4?=
 =?utf-8?B?VG1nSDA0eWloamZYWHRFSlRlQjUzUFVheEFoYzN6eEpYWnpMMDV4UEdIUitF?=
 =?utf-8?B?azM5WnVERlBLa045U2NtOERqbitvdXVYQW9WNmhnbmV3R2FkMXB2cTRkS0RS?=
 =?utf-8?B?WlV2eWZhajNXS1VsckRDaGthckNKd0tqRE5VQVJ0TEZSb3F2L0QvSjVSdDB3?=
 =?utf-8?B?UGJqcWtJd1JnVXRsTnZoV043ZzBtVW8zakhNNTVtMXhmVktvZWg2ck12MHl6?=
 =?utf-8?B?L1pSTE9PekcwMHlNcHl4alhBMEZHMjZkbmp4aHdJMzlkRXdRMTB1bHYzeWRZ?=
 =?utf-8?B?SWVkcUFsMFZVU1E2TnB2Wm95Zkdzb1hWNE0wcURJaXQxZFpMN3ZveCtTUDJ1?=
 =?utf-8?B?eWtodk1VVEVqSVFTemgyak44UDhOSmxwWDZrQnIvUjZUVEpCb0FnRGZVcTRa?=
 =?utf-8?B?Skd5L2NGSFE4REJyZ25PMmw3NFVmMEpiYm9HR1RlV29MaEc3MjFaSkVNNDIx?=
 =?utf-8?B?RTJmbXFrU0Z4NUQ2NE9DSTlDbDFRMXhFNVZWUkNpQzZueURZczdYSjdjUXlw?=
 =?utf-8?B?ZlZOL1c4V3JjcFlXb0ZMVHh5VjZvTTFmVS9kWWZOaUgxM2Y3REV2aDhjVEgr?=
 =?utf-8?B?cDBhRFpGOXZZVHRiV1RwYkxqQWlqcnIzcklWV2wrMkl4cGN4dmkwcUU4YXZp?=
 =?utf-8?B?ODN6aDRKSVhtSU5oL1ZjNTl5UXkvQ0ZaYzZiZFVWKzYvQWs1WFhHSDRMRXlQ?=
 =?utf-8?B?V1FRa0VYSEZhSzhqckg1NDFxcWhDK01yOXo1d0IrRmtBYmZlZlo1L1lpWGRF?=
 =?utf-8?B?emVKb2J0Z2daOWdtZFQwaFVyVWpPWGZlZytXSGpZZHE5UkVTNi9IVU5wbGtE?=
 =?utf-8?B?OUZycWs2ZXRkRTk5YzVramYwOEgrU0RVNHF2UVJiNjd1Y3FZV0ExLzVRamRo?=
 =?utf-8?B?Rm0zQWhIK0MzNnkrRXUwWG4xUUp3TFd5cEduWGZocFZLc24zZWZVenVpNTZv?=
 =?utf-8?B?eE9JN1JPaVowTm5vZ21OTGdCRnVSbitkcWNEUmlPK3RBZCsvNEV0VDVuSHQz?=
 =?utf-8?B?dDJtbjBaRkdFNk9SQUJabXF4aUd0cGcxUUZRWGk4b0xDQkZwaTNsTHFXK3pq?=
 =?utf-8?B?WXVaaFluOEplaUY3bVhBSjlOaVl4ZVVWa1E0UndmYjBSeG5QUlo2aUZTOUg3?=
 =?utf-8?B?Z1pndjlaa0RaaFVrSGFSWGlMSlpjT2F2SVdnQmU3eUFFRHd4SGpvQzl6RDhW?=
 =?utf-8?B?OGJVNVUyTDgyeFhXR3dwM1F1SWdoS2wxaGczK2dFMkpRZE44Z0x1Q0x0V3Fi?=
 =?utf-8?B?YmNPbCtqUmVic2hqU3VDQlQ4b3RWVEdWV2NIb3A2NkIvYnlVaW1pM01VdVNO?=
 =?utf-8?B?YU5DUWhPNllLMVd0ZWVScmM2Vyt0YTdYWTN5TUxjbXJpc3ZSVUFFWDRaeHlV?=
 =?utf-8?B?N3ExZHUvc1pSQ1gwTWR6b0l4eFNuTEEvL096blRzSFRsbWFtUGNKTDE0WGxy?=
 =?utf-8?B?WDhVVE53WUtzRkhiTUlVemNjSVk4cDJTZlFjQlNxVnB4OVU3VDdFU2xoRGFI?=
 =?utf-8?B?VG5mSmdmVVdEUFJ0S0FXaHg5OU43a3E2WnIxV2VoeHJNa2lZYkNqUmdOdTJX?=
 =?utf-8?B?aFoxNGU2aURwR2d5dTRYUWpyUzhlcnE2ODQ2VndXMmZUYjVPSWJuaFBucWFZ?=
 =?utf-8?B?SytUYUhyWU5DU0pUOGs0cDhCQjQ1WC9OZ2xlbnlUem5yYWwwRWIwV1hPMXdU?=
 =?utf-8?B?OHJtZXFkOFJ0ajhiY2ZzTUhLWlNjazd2YU1jMHlkZVRXQWFFVTFUNm5WNDQw?=
 =?utf-8?B?QkF1Mkh4QWJBQjVkWDg3bXQ1YnJkeEgyZHZSWkxTanpSeWRZaStIVldsOXQ4?=
 =?utf-8?B?K1lWM3piRE1zU2kzcVZzbzg5TG5SMVc5c1JIaElveEJRcm5yY0RRNlpsbzFR?=
 =?utf-8?B?czdKUnZFOVQ1Tm1wVWF5eWkwem5hbnh6VThIaEdhYUkwb3hMSlR4WG95b0pF?=
 =?utf-8?B?TEE4SkhlVm54WnJNZDNyNzdRMWtWVXIxeFRIRCtlSzZxeU43c2VZVWx0WlpE?=
 =?utf-8?B?akx5RGowdko2K3Z0d3JORWZFN2V3elpCS0hoUVNJK3JKWCtOUS9CZitlcFZE?=
 =?utf-8?B?VnJ2Z3VxRWg0NTMvN3Q3QXVhMnE1MXRXdGdUcEk2clVwNVVaTTZnZ3VRS2RG?=
 =?utf-8?B?ZUtsRVZhaTRUWHoyclZGRml6cUtteFJGTGNZNlkybFdNNW5lVWpJdz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/tx2kOMjwap3M+55XDXofp/wb6EQOQXR2moaUb2f3WQcrpG56alxt0tyhCXui3sTIlMj+SIUGdN8a3Y3lEphfqDZBG3CN0wXMJ/5yOU4BddUdjrWe9J8QH0c0fBxjEYJBqNoq2xjtv/9/rPbbRiSfW643LH1QtAZK8E+1XgVwIH/smnI/FRDEC7nF23+e3ysdi2X9aLvqPM7DxXhSepYyAvlanjrtml6acKJkLC+tUnC7XC6IHz23OkoiFYgrfUlqMum2h8/OltuqScfv3irD8y8guIK6nRH0CYqcSwYLurNBGxN3iN4YKSEcWEiGJXLH+nSkVTUPp3eOlo3QAwiGJn+nuXg46PzJR0bMLKcFQXZ4y673HqlAj0zBb0JI35bPT2zK2PDEcrUPJjgUdkN2c+e9V3pKf3KTbX5cFm24rxm0C44ix7+5nRMYLYU3mH+xQUG4cORWuo4DU3iUNFuz1SRk9OJjU/TKgUGYUBESV7hSFfq0mXRsm1Yv9SDK3LyDWtMbFwp7KbDONnZve5sqQiyJUGsvHDzh4LBDQ9WGt7ABERrvM1lr7lMt8wNt5EdcT+BSUXqeApzZNnOZTIJuGSBYEkAMdSACPwnet1H5pQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20182809-990e-48a4-6741-08de4e340c8f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 21:30:59.0722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LErOMDXcOBkkZWWK+ZvN6AzLOTkuT0IrEqgfrXoepIY37xJ8hQe8VfMIBkPSuTtZZosfs7nPZdPz3z7nIZ5TNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB8216
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601070170
X-Proofpoint-GUID: kYl9et_WcAzGrSNDLo2tHmm66HINYV7b
X-Proofpoint-ORIG-GUID: kYl9et_WcAzGrSNDLo2tHmm66HINYV7b
X-Authority-Analysis: v=2.4 cv=GuFPO01C c=1 sm=1 tr=0 ts=695ed097 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=z4u_AdVbS8A3qRl8n2IA:9 a=XaXBPwxfFXEC9MZq:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE3MSBTYWx0ZWRfX2Chr9sT6qKy2
 dUM16HlKARWSFh0deHknUDfvP6QpV+SD5+VykxVrp4pcB117MkGRJO7Um5TAtjOCyqr1jcsp8KV
 kaALPxDZ0nYopMC93yfgnjsHw/HwPPvWmHwhKVscUcdoWDp1O4Ho7OPZErVpnRFi44k2soXkebw
 dk8HSwCOv9ClJ4knClpJWiQOWtkpe/4ZMk1YkDwB2iisBX7UUBpFXi6BIqkHwau/tYmdNZIjQT7
 5dUcOFZFBQOGJ0nz0kdZlH1AtzFbD567N59PMZvU0zGK4jiyadiIkJeJ45SXlX7X2Suvjuu2ct7
 VDdKhNI6Tjrz7wWljXuz0FY2XO+eADS16mXrLoE8fJYiqgjLvedQk2wrh1oRWnXcW/MvbMotUXT
 bMBhvoQ2Dd1XmqxqQLW5S7SAN/fdzsSLw4ecGK+g/+l1s+Aw7SnAKjVPJ0Ocqwx81GTLzeFYguP
 t08CgcrIdsmaPXujPnw==

absoolute typo in commit msg

How are the tests running?  Didn't assign, pid, and pgid need the -q 
removed?

On 1/7/26 11:28, Kris Van Hees via DTrace-devel wrote:
> Various tests had a #!-invocation while still being expected to be used
> as scripts fed to dtrace.  Removed the #!-lines and marked the files
> non-executable.
>
> Various tests that were meant to be invoked as standaline scripts had an
> absoolute path to dtrace in the #!-invocation which was not recognized.
> runtest.sh expects standalone D scripts to use '#!dtrace' so that the
> correct path to the dtrace executable being tested can be inserted.
> Corrected the tests, and ensured they are executable.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   test/demo/script/interp.d                                   | 4 ++--
>   test/demo/script/tracewrite.d                               | 6 +++---
>   test/demo/spec/specopen.d                                   | 6 +++---
>   test/stress/fbtsafety/tst.vahole.d                          | 4 ++--
>   test/unittest/lockstat/tst.lockstat-summary.d               | 0
>   test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d     | 4 ++--
>   test/unittest/scripting/err.D_OP_LVAL.rdonly.d              | 4 ++--
>   test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d        | 4 ++--
>   test/unittest/scripting/err.D_SYNTAX.concat.d               | 4 ++--
>   test/unittest/scripting/err.D_SYNTAX.desc.d                 | 4 ++--
>   test/unittest/scripting/err.D_SYNTAX.inval.d                | 4 ++--
>   test/unittest/scripting/err.D_SYNTAX.pid.d                  | 4 ++--
>   test/unittest/scripting/tst.arg0.d                          | 4 ++--
>   test/unittest/scripting/tst.assign.d                        | 4 ++--
>   test/unittest/scripting/tst.basic.d                         | 4 ++--
>   test/unittest/scripting/tst.pgid.d                          | 4 ++--
>   test/unittest/scripting/tst.pid.d                           | 4 ++--
>   test/unittest/scripting/tst.quiet.d                         | 0
>   test/unittest/scripting/tst.sid.d                           | 4 ++--
>   test/unittest/scripting/tst.trace.d                         | 4 ++--
>   .../speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d    | 5 ++---
>   .../speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r    | 2 +-
>   .../speculation/err.D_ACT_SPEC.SpeculateWithChill.d         | 5 ++---
>   .../speculation/err.D_ACT_SPEC.SpeculateWithChill.r         | 2 +-
>   .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d       | 5 ++---
>   .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r       | 2 +-
>   .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d    | 5 ++---
>   .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r    | 2 +-
>   .../speculation/err.D_ACT_SPEC.SpeculateWithPanic.d         | 5 ++---
>   .../speculation/err.D_ACT_SPEC.SpeculateWithPanic.r         | 2 +-
>   .../speculation/err.D_ACT_SPEC.SpeculateWithRaise.d         | 5 ++---
>   .../speculation/err.D_ACT_SPEC.SpeculateWithRaise.r         | 2 +-
>   .../unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d | 5 ++---
>   .../unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r | 2 +-
>   34 files changed, 59 insertions(+), 66 deletions(-)
>   mode change 100644 => 100755 test/demo/script/interp.d
>   mode change 100644 => 100755 test/demo/script/tracewrite.d
>   mode change 100644 => 100755 test/stress/fbtsafety/tst.vahole.d
>   mode change 100755 => 100644 test/unittest/lockstat/tst.lockstat-summary.d
>   mode change 100644 => 100755 test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
>   mode change 100644 => 100755 test/unittest/scripting/err.D_OP_LVAL.rdonly.d
>   mode change 100644 => 100755 test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
>   mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.concat.d
>   mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.desc.d
>   mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.inval.d
>   mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.pid.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.arg0.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.assign.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.basic.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.pgid.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.pid.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.quiet.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.sid.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.trace.d
>
> diff --git a/test/demo/script/interp.d b/test/demo/script/interp.d
> old mode 100644
> new mode 100755
> index be690b56..fba39e41
> --- a/test/demo/script/interp.d
> +++ b/test/demo/script/interp.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -s
> +#!dtrace -s
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2005, 2021, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2005, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/demo/script/tracewrite.d b/test/demo/script/tracewrite.d
> old mode 100644
> new mode 100755
> index 0c139ead..f888ecd8
> --- a/test/demo/script/tracewrite.d
> +++ b/test/demo/script/tracewrite.d
> @@ -1,13 +1,13 @@
> -#!/usr/sbin/dtrace -s
> +#!dtrace -s
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2005, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2005, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
>   
> -/* @@trigger: readwholedir */
> +/* @@runtest-opts: -c test/triggers/readwholedir */
>   
>   syscall::write:entry
>   /pid == $target/
> diff --git a/test/demo/spec/specopen.d b/test/demo/spec/specopen.d
> index e7dbc3b2..b3769789 100644
> --- a/test/demo/spec/specopen.d
> +++ b/test/demo/spec/specopen.d
> @@ -1,12 +1,12 @@
> -#!/usr/sbin/dtrace -Fs
> -
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2005, 2024, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2005, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
>   
> +#pragma D option flowindent
> +
>   syscall::openat:entry
>   {
>   	/*
> diff --git a/test/stress/fbtsafety/tst.vahole.d b/test/stress/fbtsafety/tst.vahole.d
> old mode 100644
> new mode 100755
> index b918e663..732ae3ca
> --- a/test/stress/fbtsafety/tst.vahole.d
> +++ b/test/stress/fbtsafety/tst.vahole.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -Cs
> +#!dtrace -Cs
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/lockstat/tst.lockstat-summary.d b/test/unittest/lockstat/tst.lockstat-summary.d
> old mode 100755
> new mode 100644
> diff --git a/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d b/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
> old mode 100644
> new mode 100755
> index 45c37efe..6fcb4d54
> --- a/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
> +++ b/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/scripting/err.D_OP_LVAL.rdonly.d b/test/unittest/scripting/err.D_OP_LVAL.rdonly.d
> old mode 100644
> new mode 100755
> index b51e1160..866a7f32
> --- a/test/unittest/scripting/err.D_OP_LVAL.rdonly.d
> +++ b/test/unittest/scripting/err.D_OP_LVAL.rdonly.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d b/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
> old mode 100644
> new mode 100755
> index a4880cca..9a9d1566
> --- a/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
> +++ b/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/scripting/err.D_SYNTAX.concat.d b/test/unittest/scripting/err.D_SYNTAX.concat.d
> old mode 100644
> new mode 100755
> index 8f7b210f..8d6e5f64
> --- a/test/unittest/scripting/err.D_SYNTAX.concat.d
> +++ b/test/unittest/scripting/err.D_SYNTAX.concat.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/scripting/err.D_SYNTAX.desc.d b/test/unittest/scripting/err.D_SYNTAX.desc.d
> old mode 100644
> new mode 100755
> index 34ae864c..e8ec7851
> --- a/test/unittest/scripting/err.D_SYNTAX.desc.d
> +++ b/test/unittest/scripting/err.D_SYNTAX.desc.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/scripting/err.D_SYNTAX.inval.d b/test/unittest/scripting/err.D_SYNTAX.inval.d
> old mode 100644
> new mode 100755
> index d3338cfd..d2ae68a6
> --- a/test/unittest/scripting/err.D_SYNTAX.inval.d
> +++ b/test/unittest/scripting/err.D_SYNTAX.inval.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/scripting/err.D_SYNTAX.pid.d b/test/unittest/scripting/err.D_SYNTAX.pid.d
> old mode 100644
> new mode 100755
> index 01044d6e..1f383dd7
> --- a/test/unittest/scripting/err.D_SYNTAX.pid.d
> +++ b/test/unittest/scripting/err.D_SYNTAX.pid.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/scripting/tst.arg0.d b/test/unittest/scripting/tst.arg0.d
> old mode 100644
> new mode 100755
> index 905fefb6..d2aa4345
> --- a/test/unittest/scripting/tst.arg0.d
> +++ b/test/unittest/scripting/tst.arg0.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -s
> +#!dtrace -s
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/scripting/tst.assign.d b/test/unittest/scripting/tst.assign.d
> old mode 100644
> new mode 100755
> index 9bbd8e49..cde5d64c
> --- a/test/unittest/scripting/tst.assign.d
> +++ b/test/unittest/scripting/tst.assign.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/scripting/tst.basic.d b/test/unittest/scripting/tst.basic.d
> old mode 100644
> new mode 100755
> index cd7b716a..792d6f06
> --- a/test/unittest/scripting/tst.basic.d
> +++ b/test/unittest/scripting/tst.basic.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -s
> +#!dtrace -s
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/scripting/tst.pgid.d b/test/unittest/scripting/tst.pgid.d
> old mode 100644
> new mode 100755
> index 8d82f2bd..44ce7515
> --- a/test/unittest/scripting/tst.pgid.d
> +++ b/test/unittest/scripting/tst.pgid.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/scripting/tst.pid.d b/test/unittest/scripting/tst.pid.d
> old mode 100644
> new mode 100755
> index 2d0499d7..70197c86
> --- a/test/unittest/scripting/tst.pid.d
> +++ b/test/unittest/scripting/tst.pid.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/scripting/tst.quiet.d b/test/unittest/scripting/tst.quiet.d
> old mode 100644
> new mode 100755
> diff --git a/test/unittest/scripting/tst.sid.d b/test/unittest/scripting/tst.sid.d
> old mode 100644
> new mode 100755
> index e4f1395c..670761d8
> --- a/test/unittest/scripting/tst.sid.d
> +++ b/test/unittest/scripting/tst.sid.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -s
> +#!dtrace -s
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/scripting/tst.trace.d b/test/unittest/scripting/tst.trace.d
> old mode 100644
> new mode 100755
> index 148e5c60..f52b14ef
> --- a/test/unittest/scripting/tst.trace.d
> +++ b/test/unittest/scripting/tst.trace.d
> @@ -1,8 +1,8 @@
> -#!/usr/sbin/dtrace -s
> +#!dtrace -s
>   
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
> index 50bbf177..044b5a95 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
> @@ -1,7 +1,6 @@
> -#!/usr/sbin/dtrace -ws
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -10,8 +9,8 @@
>    * ASSERTION: Destructive actions may never be speculative.
>    *
>    * SECTION: Speculative Tracing/Using a Speculation
> - * SECTION: dtrace(1M) Utility/ -w option
>    */
> +#pragma D option destructive
>   #pragma D option quiet
>   
>   BEGIN
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r
> index 1590807c..206641c0 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r
> @@ -1,2 +1,2 @@
>   -- @@stderr --
> -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
> +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
> index 47e248d2..e02577d2 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
> @@ -1,7 +1,6 @@
> -#!/usr/sbin/dtrace -ws
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -10,8 +9,8 @@
>    * ASSERTION: Destructive actions may never be speculative.
>    *
>    * SECTION: Speculative Tracing/Using a Speculation
> - * SECTION: dtrace (1M) Utility/ -w option
>    */
> +#pragma D option destructive
>   #pragma D option quiet
>   
>   BEGIN
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r
> index d01ab558..ab7c6ed9 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r
> @@ -1,2 +1,2 @@
>   -- @@stderr --
> -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
> +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
> index 14cc1d5c..dbb8f294 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
> @@ -1,7 +1,6 @@
> -#!/usr/sbin/dtrace -ws
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -10,8 +9,8 @@
>    * ASSERTION: Destructive actions may never be speculative.
>    *
>    * SECTION: Speculative Tracing/Using a Speculation
> - * SECTION: dtrace(1M) Utility/ -w option
>    */
> +#pragma D option destructive
>   #pragma D option quiet
>   
>   char a[2];
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r
> index 89592786..f57aba47 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r
> @@ -1,2 +1,2 @@
>   -- @@stderr --
> -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d: [D_ACT_SPEC] line 34: destructive actions may not follow speculate( )
> +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d: [D_ACT_SPEC] line 33: destructive actions may not follow speculate( )
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
> index 43a41440..00f56e1d 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
> @@ -1,7 +1,6 @@
> -#!/usr/sbin/dtrace -ws
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -10,8 +9,8 @@
>    * ASSERTION: Destructive actions may never be speculative.
>    *
>    * SECTION: Speculative Tracing/Using a Speculation
> - * SECTION: dtrace(1M) Utility/ -w option
>    */
> +#pragma D option destructive
>   #pragma D option quiet
>   
>   string str;
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r
> index 3bc21b18..da4038aa 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r
> @@ -1,2 +1,2 @@
>   -- @@stderr --
> -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d: [D_ACT_SPEC] line 34: destructive actions may not follow speculate( )
> +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d: [D_ACT_SPEC] line 33: destructive actions may not follow speculate( )
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
> index 80a3204d..9fb6a1e3 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
> @@ -1,7 +1,6 @@
> -#!/usr/sbin/dtrace -ws
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -10,8 +9,8 @@
>    * ASSERTION: Destructive actions may never be speculative.
>    *
>    * SECTION: Speculative Tracing/Using a Speculation
> - * SECTION: dtrace(1M) Utility/ -w option
>    */
> +#pragma D option destructive
>   #pragma D option quiet
>   
>   BEGIN
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r
> index 3c120a03..7c15314d 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r
> @@ -1,2 +1,2 @@
>   -- @@stderr --
> -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
> +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
> index a8c1c4d4..c239bc7a 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
> @@ -1,7 +1,6 @@
> -#!/usr/sbin/dtrace -ws
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -10,8 +9,8 @@
>    * ASSERTION: Destructive actions may never be speculative.
>    *
>    * SECTION: Speculative Tracing/Using a Speculation
> - * SECTION: dtrace(1M) Utility/ -w option
>    */
> +#pragma D option destructive
>   #pragma D option quiet
>   
>   BEGIN
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r
> index 136f5cde..6e85370a 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r
> @@ -1,2 +1,2 @@
>   -- @@stderr --
> -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
> +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
> index a0bca73d..dd20eac4 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
> @@ -1,7 +1,6 @@
> -#!/usr/sbin/dtrace -ws
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -10,8 +9,8 @@
>    * ASSERTION: Destructive actions may never be speculative.
>    *
>    * SECTION: Speculative Tracing/Using a Speculation
> - * SECTION: dtrace(1M) Utility/ -w option
>    */
> +#pragma D option destructive
>   #pragma D option quiet
>   
>   BEGIN
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r
> index 8cdc6ba1..98725509 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r
> @@ -1,2 +1,2 @@
>   -- @@stderr --
> -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
> +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
