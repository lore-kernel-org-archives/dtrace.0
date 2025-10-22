Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2C82727E5
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761103511; cv=fail; b=BvU/GvdqTP/LEdxtJSaj89BhkeXd8ILDN5aLOejpsaB8OjdWuCdwMkHP+F2TYdk05HdZ7WCmCiYqO2N8K+H/4FXTruc+uNT3YcrPHE3A9RPhHjr4T5QGOUE0xwzXs5hKUw3pBT0xJ01vdXpXuLNhNpCVkl7AO+2TKtZBCMCnk1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761103511; c=relaxed/simple;
	bh=loZwkdPjHUvKNXwOGwyoS9zyb0QSw0vR/ItAsE+KTbs=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XJJvIEnEFCskimOvZPu7Gr3RVE4CfioVoSttN1VvAqD0GflYctZpIiuanl9TSwMxIRRPsiyQfIk4ohkDJtNxsxEnWlUH/pEvrZ27Fu1Klr/RtGpr7YS044m7QZ844Hk9fDHVZpDTEdpPMaE9H/NHOqBRbxVLgQ4Ve4CCkDnT0Dw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=C2+SxoPf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=J+0w75/v; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="C2+SxoPf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="J+0w75/v"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3P7G8025709
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:25:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=CZtsfqrGCPb1xGhgYHpbISznyr5ukCCiYSMCQHHR8Bc=; b=
	C2+SxoPfro2rxPRASVJElXZ6dNXUIRtMhvWKA9oCWT1Ve2T6BQRPQryLkh7l7Mcm
	R94HSoQMO229NbnshxUrq4Xht0FhoJL4gmjmmms/S9KqURZ9OBY0nuoZnf5bXgXP
	ESH3x5Z0xq5HYZPKGHq0t/HkWX30xIoPA88n6Y1eeEZrGaIXnY7NnDaGGrGUhyLs
	LNsCSPP+ejY8NVsooZmJcF6TFPF9PSh8pSr73dd/B/Z7jnF8oLso+FAxSBCr/l5l
	zgJtj6WeQypoAjSRVzYX2qYUlcgUo4Bq2jCUQvMe4QCo2hGxAol8gdXlG+rtgjif
	aPNiPXZngJ4k1kzmr4zwuw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49v3espxdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:25:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3LUx7032285
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:31 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012027.outbound.protection.outlook.com [52.101.48.27])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bdn3fp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N2KMr0F1hipcrD3eLeg85LgmOe8ax+WuYW1WLdAsLR7XpNEBZpQ5HFAL7UjtAAWvYvier9oM8ukIiVRJTS+sn/YtlsYkS36nqdj0hWRKFBW3bSHRQTV2eXhaqFtd8SnFfkIaJHl52HU61LX5SyXA64NxqZ6pRJGeP/2cGlWoOpsNkRu3vS5j2C6+x7Tb0YGQzPstQ3HaG18t3YQ9Lk2de1kfSQhJmGrSrCfrHMoayV1lqSLvg0h/0pSsfz9iI+8c6pirT/KRFmgHbDUbggGV+xJ3+24AWQ/2Ta9ZBKVPmF31dAiKvAh5svpySdIUhmo3Pu3hmpujvHcsvNTsvYfWoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZtsfqrGCPb1xGhgYHpbISznyr5ukCCiYSMCQHHR8Bc=;
 b=YVp9Nfn3aCITqnVQHonBvAuw+XPhjK2v8BJAC5WI87tr10ZZQ649VCelEzzMoRdvD59/+JnSM6HxeUpCkG0We7jaQmPyzoRe8TjP8pNh1SffV5dx8fvwfmrqr2kUusLW4qG4l8HmiyoEgSax/dt+XEyOYtQZqQGp0BFu5ClNaiPlYuLX7Jm6YhE4oznCIT/vKd+0Kv3l5UwWLIIyle2BkGcRRgkRwqVb4nSQnI/QEr+dtPlUPniVgBkSCY8MkQJvIAMhMviip3ohSvhzka041Ji0J0c+w5CxaP3a9Ol4d9Zgg4gp+vQ0m30tEXMkCMWl+yOVdw9Y16/6hbQI+EiN4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZtsfqrGCPb1xGhgYHpbISznyr5ukCCiYSMCQHHR8Bc=;
 b=J+0w75/vOjt5F6mqXclT/s69yihJayRWXRNCe1hh95k/7PyBBsGaOLYEMdRjlQ9zjI19nxdv5gkQFWh7+vKs6A/wt7emxU78unBLaAL6wzBIXd0Hn7pnbd/3OTaesP9TdyqSqZP9yM+l9Q3BQsdCZyVrRQg0vgEdK6jMmN9T4f0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Wed, 22 Oct
 2025 03:23:27 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 03:23:27 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 21/20] doc: Add blank line before section head so it is recognized
Date: Tue, 21 Oct 2025 23:22:51 -0400
Message-Id: <20251022032251.2010-16-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20251022032251.2010-1-eugene.loh@oracle.com>
References: <20251022032251.2010-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0241.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ed45190-73f7-426d-4e72-08de111a5d87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SDZnczZ0bFpEcHMzN0srandkd25naFN3SG9YaEE2b2FKZXRibzB0N1NiWGU4?=
 =?utf-8?B?NWxLVlNPbGlGUVk2blMwTjNXK0VWRUVpQmtURW9oR1J6TytETmwzQjAzQ0VS?=
 =?utf-8?B?dEluYkF2U3lTRkpNYUNzcE93M3RucTZ4dDdJTG0xd0txeFNTN3podWtySlhJ?=
 =?utf-8?B?bGQzNUd5M2MzK2RLRDRuQWx6KzhWbElDZTlSOU1DS2RGeDMrZkNNOWlpd3dl?=
 =?utf-8?B?TkFqaGpsRkxOZm5MU2laRXZXdGh2eVpJRExOS3hHU1VJbTZPcVpjT1VrMCtX?=
 =?utf-8?B?NU5TTWtGTS9DNUVyMmNhR2hPZXB4ZmNVd0R3WHI2amp6SnB1SFk2V0Z5M3Zm?=
 =?utf-8?B?ZFBqYVlNanU2RHFTL1pYd3NUTUFUNnhISzZzY3drQWRRcTVVQ21DSXFTRUJN?=
 =?utf-8?B?bkdZL0hjUkJWWXI5b1BKOGZtTVhCNjhiNUtORXNhdUVVb1daYlRadTRPTHJv?=
 =?utf-8?B?c2VmcFNmWWtyMHdKb3lLS1hIbGhYdlEwdU14dGNBKzhVNGFyRms0c2t0NWR3?=
 =?utf-8?B?UFlNNjgxS3VRcXVabnl6M2dHclpmY01KalFZUXY0c05RbGRQMTdDNU0yVER3?=
 =?utf-8?B?L0NGbEcwaWJ4RmF3TUJwNGxRaEg5QXlrZDJHSWdEUGhHdDFER0pPR3k4NUJ5?=
 =?utf-8?B?NVVKN09LSk5od0p0Z1RvVU81eG9hVlNhVWZYdG41K0hhZmQ0UmJZQ0F1OUJ4?=
 =?utf-8?B?UWFNTzBIVlU5dkpJNHlXRmFRR1dUK0ZhNFhjS1ZyRmV2TWlHc2RXdFVmY1lC?=
 =?utf-8?B?SUFjcEhmY0VRQUpPYkUwRVg3MWZDQTFuMGc4UHJ1U1c1ZDE4VTdMQVBqdXRD?=
 =?utf-8?B?OVF2OU56Y0hDeTI4bjcwUkVJc1NsMWpqWS8vQ2hRQ3AwRmhoV09ITXExakpJ?=
 =?utf-8?B?WXhuUmJjM3FFSjl1d1lpb0dDd3dLS3NNYWx5T0pIZHVrd0FSQm9DbHNTTUha?=
 =?utf-8?B?SjA5M0xIVk8zWDIxSjRGK1UxbHdEZ3RmRXZ6MkwwRk8yRDVXK09CbFl5S2pz?=
 =?utf-8?B?cG82anJ0T1FsbEhLa2puZ1RnUmpKSW1zdmROZ1dnU3hFSldoTUNTRkxKM2E0?=
 =?utf-8?B?ZGpuekEvM3FURTVNV3hrbzd1VG9aeXI5ZVJzL28vMEpMUyswTDRsRWpzMVU5?=
 =?utf-8?B?S3M1MjhaMFdiUHBSZlN2ZDlhWFZma2xtc2FTd2dSeGN4RW9IZVJkWEdYM1Ja?=
 =?utf-8?B?dzRyU2RwSFFjUU9BMC80U0xmRElIV0h5TUdSdVJER0MwTyt3TmF0Y3pQa1g1?=
 =?utf-8?B?UGU5Q2tRdVdKbHJsU0tNZkRpSHlNV2hwZ2ZVMytDZStsVGthK1RlM1czMm40?=
 =?utf-8?B?V2U0ZFVoMHBtWngzTWp1VlVaT1ExdWNqZDMxWTZhd2MxVkcxaHJqZUhnczVr?=
 =?utf-8?B?SmJnNEFVc1JiQmRxWjNhdEhURXZ2YXVKekMzZFV4Sy9saHFiSGQ2d0gwRGRU?=
 =?utf-8?B?QUJKZkIrUHVWZnNWNUlrS29lMlZ0cWloQjQ5REx1MmZPWHl1d3lHR3BJYzdV?=
 =?utf-8?B?aWZvRFZCRWRPNUhhKzg4bFFrb0tMaVkxUzRyUE01RFZSOXBnbWJYbE9xZzd4?=
 =?utf-8?B?ZENncEs2Q2Q5QjJucnl4VnpoODJxa0pZOThITkdSeGN2eEVnSSttQUhrdW1a?=
 =?utf-8?B?Z2NSSm52U2dhYUFpQ2IyRmREK1JyenpjZVZBaXhyZUlJM29wNnFBbEVHWHh2?=
 =?utf-8?B?K1pYNTNvbVJEbHJER2xPVmVsbm45RGZHZCtLZ0kycnBuRUVaa0tocVdwYlQy?=
 =?utf-8?B?eWNNWHVMZnZnUkRFNmgvb2hTQitiRm5ENDF5TmNWdUFvU08waVZ0b1JJMjJh?=
 =?utf-8?B?MUI4L0tvb24rODNhNmdhZTVlVTVwakw0Wk9RUmNiaFNtRDlRY3V4OTd0TWVF?=
 =?utf-8?B?bnhrdk04eDV3UHhITXkxakIzYm16VXVXSVdzSzdRVSt4RzRudW1mQlUxd2Vx?=
 =?utf-8?Q?JvLfCwM+U0WWlUNvekA2+06FdxNH1B5I?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K01UUW9Ddnh4V3BGSnJJQlRmalBpRE9WcHluakNEL2VxR1FTV3FqL1pSSmdw?=
 =?utf-8?B?NVBkb2VFb2RCYWhWRW9JVHJ6NlV2R0dRT0xyNjIyR3pEc0V5YUZIMkhMZVJw?=
 =?utf-8?B?bUl4T0V5TmdKcXgvZjB2Ym5lMnNHMFFrVnR2WVVoYjZIcEk0WFlDWVVzYi9z?=
 =?utf-8?B?MFdCdWZKUURqdUNncGc5Q2RxYnlMVGdlMjd0VG1UN3FNdmtWVWNleUZrb2Jh?=
 =?utf-8?B?Z3dpZUF0aE9TdW1vRDJnQ0ovYkx3aSs2TUhCd29PckNxT2Z6alQxNmFiajBJ?=
 =?utf-8?B?WHd3VUtMejVVeVFrVjR5ZndPZWQ3LzhJRGI2eWVhL3R3bHdhME1nYWVmMFFp?=
 =?utf-8?B?T3cxbVNMNUxCa2JNWU0yTWtzVkVYaisyY3lEc2NVaHcyVEY0dDNESDZlVUtX?=
 =?utf-8?B?aTlUMmJERysvdGRkakJtdUZmQXlwS1h6TldzdUlZZ2YxVU9LL21mbStZVFBi?=
 =?utf-8?B?SHk5a1JtWlNlcFRELzY1bVRranZVYmczQ1lrZnFlSy9vMUFnS2p2M0tUR3NV?=
 =?utf-8?B?bnhJMFZUdC8yM3FvL1lMTTlGSWVGNS83SFBaTnozVlFxT3BpMW1jL3NldWdD?=
 =?utf-8?B?b1FTOUU3bEI3K1AwUnlpN05qN0dzUlE0YUc5Z0VpclpZYmJZQnFPdEtBREVX?=
 =?utf-8?B?MlZlQ0VEaFRoZHMxT0xTWSsrcHk4N2xPTXVGYlVNNDZzWXE4dTNkUGhqeFpF?=
 =?utf-8?B?elZzc3kvbGRCVmNwQXJoSUZUR2RMbHROcW54S2dqb3JUQ3NzOUF4R1ZwU2NP?=
 =?utf-8?B?dTBvZVNMZXdJczI2NVRHTG1NblJ3cEw2bm5WYmVEcURaK0wySzc0UGV6SUFL?=
 =?utf-8?B?VGpTOXI0ZUFOQ3FqdHBNSFBPbWJJK3hjYm92SnIzd0NUa084c0tlQnI4TDd0?=
 =?utf-8?B?MTNhK004cXdLUC9hQ09EOFIwWDBMRHhFRUtadkgzd0xaTzFuUThJK3FRK00v?=
 =?utf-8?B?c1BSNXptSkZWbFo3RlNLT3pqWWVCeWx2NTZhRHpPS1RiNS9qRC84SUU2WE1S?=
 =?utf-8?B?eTJDVDYzdmdZWHRFUUR3WFluSEo0bkNqSTZyd1ZKcjhqa0JOZnBVNGpQMW9k?=
 =?utf-8?B?TUJuYzZHZHY2NlRZZGN3SkcwK2ZsbjlhVlJ3Mk9IOEQ4SmFydHFaaU12Y05h?=
 =?utf-8?B?Wkh5NVVLRkJOL01Ca2xUTGJDc3M2VTRZSzNDeFM5LzFPclZnN0J0d0ZZekxZ?=
 =?utf-8?B?eVNjYkZScm1HN09kWnJyeEh6SVR3M01kNlk3OFpiSFZjMHBSQ0o2WnZFS3Z4?=
 =?utf-8?B?dzdCdXNrb3FiOWxwV25wMHV0UWlqSURLdkhLSXNCd3Fub3J5K0FEcTRzNGN2?=
 =?utf-8?B?TXF2cDYvem9XM1o2WkN2ckhhSHhXc3I1ckRRb0JKODRRU3dLbThsL096ODNG?=
 =?utf-8?B?K2Y4a3VtV2t6REl3UTZlaTZjSUdlN0NwTDlqMnBxcUF0ODJwL0VET3AyY2Ft?=
 =?utf-8?B?U0VVcXM5S3I2TE5Lamc3VHJuWVpJclFPbDBnYlJtQTlPRGpZMEhjblg0WWlR?=
 =?utf-8?B?bkg5WUxOQzFrb3VjYzZ0blg1ems3YWJQWjBVaU9EMDBIMDlOY0diaXlLRFk4?=
 =?utf-8?B?dkVEVytZbk5ZRCsvdDN1ZWcvaFQxZ3BpejVRb0NlRGVKeWR4STJkQUluTUZr?=
 =?utf-8?B?UmFpVmdFZDJHSjlHS2JMR1AvNUNQTjQ5b25kNll1MXB5dUhkbmV3dnlKQ1lP?=
 =?utf-8?B?cVBrOFU4YmxjaGt1ZGRldExpTktOWVVxZGNjb1RvVENibjNxc3lEVmttbjhR?=
 =?utf-8?B?Y2ZjY212OGVWRmJnKzl0QWFkYmZsVGNUa3QwMWV3OEZQK2l0LzZ1Vnh0VFgx?=
 =?utf-8?B?a00rTmVtYWhVaU5RZDFRQzR3VjdxMVNzNkFQQ0MzRkJUUTJENEtTdnlTeG91?=
 =?utf-8?B?TmtZb3Bzclc3V1NRSk1CL3lxYjJRbG83RjdHelluYmMvRmx5THFtWXFBQ0g3?=
 =?utf-8?B?ZElIV0VrSXROWGR2NXQvVy90OGthMmFZRk1EMzhvbDVoZ1VDenlvMGg2ODJX?=
 =?utf-8?B?NjdYUEV1Ym5MYjhLNVloWkRuazlUV2hCVHRuNUJUMHd1Zk16Y3VqVXZnM2xF?=
 =?utf-8?B?bzZBNGNJTmZHU0NSV2pvd091VjhSbDFTV29zWUp3Q0k2T1dYNVpZZjV0RkNP?=
 =?utf-8?Q?TeAhBbzwINUOZUjePiuj54Bvi?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	W28JoKbcWAm5e7gWaT+i5oDNbHfv7dGeVwrVlpxdacHOH1VK34QAK0mRqA1D2+utQjhgdtz3X5t20oUlJv/w2IEWN6Zv11UniZaOaDCc+tWy4I9nIgbyrZgZmORL8t+zLc04V5NAbmk1oOJL66gQW2qTElhNOQWfAJOJxteoUq90dau3QX5zwfHF/RJqJjXgry1Z5YlcLbQZchq6lIfyhXvBGPdTuM+FYiyt92Ep337LZpIW4t7BTveiBuCLZ4P4UZA4M/mQCf87mW/E3X/NrtZXIsGoqoWqsztf/O/eIWeRF11TW9wtrp5pzYCAWuU74ejFJKgTfB9GfoMVN547dG23BeAMabE0dDlYWQuwxbBgxFBoEHKjnilCmk6ucY+edQ4bLCYflEUndNLyb6KMrrrExbcEJSJ0v/zcufpuXOrhS5XPTEwDgeWT/1fdCofeVh7qDNKauMHX10GnjetIl/AsZRaCv0EIJDITR4eCiYEJTSfkCw2AgBoSUGPSsh55XvBFCiIW05rW1UEqvPe3rkax2TnV7hn9eA8moamxsNBFrOEtgq5qwxjbIoU2/9WDlFrj/4VCnQ09FcFqahGN2cv1J+pRaobiVcRnMdJYyFg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed45190-73f7-426d-4e72-08de111a5d87
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 03:23:27.2903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dxbdNWlr8/O1EtNnvjyvbl9DRcANlWcobuFtddIqxT/Gc+DxNEt8xoeoo84Z97KT19likjOTGiPmgd+cy9a7DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6974
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510220025
X-Authority-Analysis: v=2.4 cv=N8Mk1m9B c=1 sm=1 tr=0 ts=68f84e93 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=sR9IvTD9F0RZPtnS3R4A:9 a=p3RiT9KDJzbrBh1i:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13624
X-Proofpoint-ORIG-GUID: GYurtTbBhu7zgjFU5utW-SMW3Vkb_-6k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNSBTYWx0ZWRfXzMVfvknJPGfZ
 jaLXxiRkjqljLPuhVTOGPAdjOM6CegOsHFG3EaIFfrwPk5qyHHlc9yKbJuXFGl9cztQdu0JVbpu
 +yUq7VA8NCBZw+b/nsrUnJcT3jsP+LHwdWs0HNJnRPvL1ULJUsKwLM2pNR/YtUVLUdpaLfeHiK9
 oUtXK22PVlInzeJseE1U3Va4E2B5DFiZ0einKbv35mCr5C9C+fRTvGpSxq8sToVgCXxpTEClr8p
 QwB/RLmHmaUIa9mJocwO/e9xPGZ/s08AG6A2cUQLGNgDrBX/aqg3UH1pm629nRuy9K5qGObBBRv
 SROvI1wkYI9RqRV44yh/AvTmj80wh17oCCZ1nx/VG6vhIPBaIzsslovb2201sJ+knYsxghAW6v5
 YON9QYEnEcL813sh/vAJHyFU3gmKLn6kQgTWUxkNb2NpefBMeJY=
X-Proofpoint-GUID: GYurtTbBhu7zgjFU5utW-SMW3Vkb_-6k

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 .../reference/dtrace-ref-TypesOperatorsandExpressions.md        | 1 +
 doc/userguide/reference/dtrace-ref-speculation.md               | 1 +
 doc/userguide/reference/dtrace_providers_proc.md                | 2 ++
 doc/userguide/reference/dtrace_providers_sched.md               | 2 ++
 doc/userguide/reference/dtrace_stability_reference.md           | 1 +
 5 files changed, 7 insertions(+)

diff --git a/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md b/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
index bb1c49949..ef0910b90 100644
--- a/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
+++ b/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
@@ -1151,6 +1151,7 @@ Dereferences a pointer to an object.
 Accesses a member of a structure or union type.
 
 </td></tr><tbody></table>
+
 ## Type and Constant Definitions <a id="dt_typcondef_dlang">
 
 This section describes how to declare type aliases and named constants in D. It also discusses D type and namespace management for program and OS types and identifiers.
diff --git a/doc/userguide/reference/dtrace-ref-speculation.md b/doc/userguide/reference/dtrace-ref-speculation.md
index 30c5e6eaa..f93053275 100644
--- a/doc/userguide/reference/dtrace-ref-speculation.md
+++ b/doc/userguide/reference/dtrace-ref-speculation.md
@@ -74,6 +74,7 @@ ID
 Discards the speculative buffer that's associated with ID.
 
 </td></tr><tbody></table>
+
 ## How to use speculation
 
 The following example illustrates how to use speculation. All speculation functions must be used together for speculation to work correctly.
diff --git a/doc/userguide/reference/dtrace_providers_proc.md b/doc/userguide/reference/dtrace_providers_proc.md
index cf64bc28f..d799efd72 100644
--- a/doc/userguide/reference/dtrace_providers_proc.md
+++ b/doc/userguide/reference/dtrace_providers_proc.md
@@ -357,6 +357,7 @@ Probe
 —
 
 </td></tr><tbody></table>
+
 ### lwpsinfo\_t <a id="dt_ref_lwpsinfoproc_prov">
 
 Several `proc` probes have arguments of type `lwpsinfo_t`. Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/procfs.d`. Some structure members, while still recognized for historical reasons, aren't implemented. The definition of the `lwpsinfo_t` structure is as follows:
@@ -475,6 +476,7 @@ The thread is a zombie.
  The equivalent Linux task state is `EXIT_ZOMBIE`, `EXIT_DEAD`, or `TASK_DEAD`.
 
 </td></tr><tbody></table>
+
 ### psinfo\_t <a id="dt_ref_procpsinfo_prov">
 
 Several `proc` probes have an argument of type `psinfo_t`. Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/procfs.d`. The definition of the `psinfo_t` structure, is as follows:
diff --git a/doc/userguide/reference/dtrace_providers_sched.md b/doc/userguide/reference/dtrace_providers_sched.md
index 42f318e77..652f2917c 100644
--- a/doc/userguide/reference/dtrace_providers_sched.md
+++ b/doc/userguide/reference/dtrace_providers_sched.md
@@ -76,6 +76,7 @@ Fires as a part of clock tick-based accounting. In clock tick-based accounting,
 Fires immediately before the current thread wakes a thread sleeping on a synchronization object. Here, `args[0]` and `args[1]` refer to the sleeping thread, as an `lwpsinfo_t *` and `psinfo_t *`, respectively. The type and address of the synchronization object are contained in the `pr_stype` and `pr_wchan` members of the `lwpsinfo_t` of the sleeping thread. The meaning of this address is a private implementation detail, but the address value might be treated as a token unique to the synchronization object.
 
 </td></tr><tbody></table>
+
 ## sched Probe Arguments <a id="dt_ref_schedargs_prov">
 
 Many of these probes refer to a particular thread. For these probes, the thread's `lwpsinfo_t` is pointed to by `args[0]` and the `psinfo_t` of the process containing the thread by `args[1]`. A few probes refer to a particular CPU. Its `cpuinfo_t` is pointed to by `args[2]`. Only `enqueue` has an `args[3]`, and that argument is a Boolean, as described. The `argN` values are implementation specific. Instead, use `args[]` to access the probe arguments.
@@ -243,6 +244,7 @@ Probe
 —
 
 </td></tr><tbody></table>
+
 ### lwpsinfo\_t and psinfo\_t <a id="dt_ref_lwpsinfo_t_psinfo_t_sched_prov">
 
 The `lwpsinfo_t` and `psinfo_t` structures are described in [Proc Provider](dtrace_providers_proc.md).
diff --git a/doc/userguide/reference/dtrace_stability_reference.md b/doc/userguide/reference/dtrace_stability_reference.md
index f90b91de3..fb3238ec4 100644
--- a/doc/userguide/reference/dtrace_stability_reference.md
+++ b/doc/userguide/reference/dtrace_stability_reference.md
@@ -146,6 +146,7 @@ Standard
 The interface complies with an industry standard. The corresponding documentation for the interface describes the standard to which the interface conforms. Standards are typically controlled by a standards development organization. Changes can be made to the interface in accordance with approved changes to the standard. This stability level can also apply to interfaces that have been adopted \(without a formal standard\) by an industry convention. Availability is provided for only the specified versions of a standard; availability in later versions isn't guaranteed.
 
 </td></tr><tbody></table>
+
 ## Dependency Classes
 
 Dependency classes are used to describe architectural dependencies for interfaces in DTrace.
-- 
2.47.3

