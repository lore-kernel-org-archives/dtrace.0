Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3601D34D39F
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 00:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762819869; cv=fail; b=uTdJIk24J+uU5Qs3cL3+CzYfRlc/f5r+51rdSMeF6Y2BnbClEUtjykFd6+uhPGTMciLRWD19sIGMyn59IUVlRl3WWky5/4YcLg36qI9gMDKf9RbY1faUB3MTravJFp3ZhsJgNWa8hVNbzJxVLGe2t6D8dtmxJAa4xdFqdOk3dJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762819869; c=relaxed/simple;
	bh=eICTUN2oBKEeHixzHC610MRiVN8z/6cf9hquJ6zErp4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LrqWaO9CV46Ioh+TF7fbREM1WN1Qod9gvAtyZw+MHTp6YKHixBGk0Gy36RB4zua8gmc05kn8WjyLxc5QzWkT2sBBB+LpWkS0VhmHaowFgrVzz5fZNKAuD0ZvW3ufUDuMlxsO/slN01FmuKqYiztXJ0v1mkd4UKlzD0i4nfusDu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SyFVl7dZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eEIh61kf; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SyFVl7dZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eEIh61kf"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AANn0SW000853
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 00:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=BwhQL0sSeybp67tjf1Rxs3MyyqYhQuqm6WsprXsDhBI=; b=
	SyFVl7dZevLFSBliXyeIy1uPa83P1ViPmOxvU7YUgFPXPOALv8rsddSn0Te0WSFo
	H3qdkY7p14VYS2bj5E5YK5TejZOV5j3+u2uVAGI7Y4UwEZlHF1Bk7uJqOjxCdiMx
	qLjPqUEZUzrQcngzuk96t7/GRxDFi3jhSe/FDFMJ6zvGcKx1lCerqZc33wodULLq
	WL4rUQck0GqE/iCFs/BUZ+NLjMt3sy6Y+YSSr6Ks+0IcZjyu9rIOqbNvl+2lhdZt
	gTpTtp4eXTfzvE5EoxXMFffkvx/efD3knZBDbZgS4w3XZYphRNGlJJi8I1vqfPz7
	BaLd5XSUC/WD20IyoTuRCw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4abqpugb9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 00:11:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AB03u4C010012
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 00:11:04 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012042.outbound.protection.outlook.com [40.107.200.42])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4a9vajm18v-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 00:11:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tTXTlu24LywXXzt5TXG5cUKjq1X6tFt3E0jXZbY6IEmAMprHv0CsCIeVVN9Ltv/t0fXsFXpWTc0b0h6AMfmv6/gZIXq4rezlCQcyQYa8kDcdfIjziZvKx9xPU192uMCXEE0kpPrDScl5P7UrWEp32YBpDkCtEKFV9UVNXZgj8ZJW3jhsr1wU4CUXH6/ddLptAO0jM+6tCUl0cZszB9y0Z89RfJt8yypcoUqIo0jrwTC2HhBHUICjaUf/bWEGnVYJIUsMEEZDj2e3RfJofYgC0PmH7hmf+jd08PBX3OzOZncSsqfd2crH78E978+bTwtdoRwKBBAmIJ6YdrVAyDywKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwhQL0sSeybp67tjf1Rxs3MyyqYhQuqm6WsprXsDhBI=;
 b=Xh9x+iMvOH3UZCj9IKFR70x+7xYVtZvA5zNJcxsE2fOEJ+n/nt0ADIjn3hf8vvC1dbdm6mxfJg/69pp3E2Nz2WmZBOjDsL463mHvRI+U7zpHiJmRUXFfXd1a501v88vNjI8ydVLX7cNEJzyl70tJPjTxlPO9XtEwqnWLVR52wEhdQBCYWBNDp5xufgFCFHcC42ee1cjy0b7gNpXSPgFYNcNzwqSvDpwkaLSPBPQ1advueNAdwfYboTVKWNWBLyEC3C0ZucPx1VaWb9UK9nwk/JM/Diy0KZrbaLQsbz0W3LUAbJyiZh2uY/IENJ5m2z2N9L25v/DpsDr/kKq8p1KlQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwhQL0sSeybp67tjf1Rxs3MyyqYhQuqm6WsprXsDhBI=;
 b=eEIh61kfI4QpYp03E4fTZVXASRM56DcTxh7uQ27OkTkE3AId7TOMqiubaYL+rcOJXky/Apz23diTR4l45dst9xkjShM+V7Io9BvPJPgyFlBSL0/merNA2xfDGU/Gw/tGdkwtcf/WOeo+gosaYVvmOtcgpuGRmwMAKT7bhP71pGE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO6PR10MB5649.namprd10.prod.outlook.com (2603:10b6:303:14c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 00:11:01 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 00:10:56 +0000
Message-ID: <2f960b99-eaa1-d3f7-11f7-4643adcab8fe@oracle.com>
Date: Mon, 10 Nov 2025 19:10:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/4] test: fix tst.depth.sh to use proper trigger
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <BY5PR10MB3987726AB973C7AE7CB6D4BDC2CEA@BY5PR10MB3987.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <BY5PR10MB3987726AB973C7AE7CB6D4BDC2CEA@BY5PR10MB3987.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR21CA0003.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::14) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO6PR10MB5649:EE_
X-MS-Office365-Filtering-Correlation-Id: e7f36e8f-b3d6-4f1b-cb3d-08de20b6c8b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RzVLVE5VWExFVU5zNjUvb3ZmQ2toaFJXT20wUklpVk8rbzRjSHZOdFpHMmNW?=
 =?utf-8?B?NGx2UmltOUVRWXRvRHdFVGNKa0hYaGwzVUxUUzVycGUwQzNPN1ozMSt1ZG81?=
 =?utf-8?B?STFpWEZjNzRoUEFSYzhmc1EzKzBCTGxzMlUxWU45d2lBTFhWNm5zcEh3WDY2?=
 =?utf-8?B?TUswRDdPSnpwOUdXVGFNdEtxS0IyUDEvM2JQYkFoeXdsNHh6bzNBZFJlMkVq?=
 =?utf-8?B?VFdlMmZ4NHhBaGg5am9tRE1ScG8wOFpxRzRNelA2eUMxOHp5V1EwTEhFSDht?=
 =?utf-8?B?eEZEYVZsVXhNbnNoYnJZaE1FRGZPd1pvcnpEai9rVkRuaS9sdllqWThOZEla?=
 =?utf-8?B?L2pjbkN4UStNVGx5STlNSS8zUzRNRm1NOWdwY2Q3dTA0OXRpN1R1d211UDVx?=
 =?utf-8?B?TGFjYXUraWtGWEFkcjgxR1NzNUdEWHRZSTVWZ2I4YjlLOUdBRVBpUUY2OCtF?=
 =?utf-8?B?NDNpcWpmeWZDVkpIOHBRREF3UHJweFl1bU40OFUvOUUyY0NzRXJ6NGcwQW01?=
 =?utf-8?B?WDNnajB5b2RDODYvWWZia3Jicmt4eW1sMWZ3UFk2RGZobUJLZklMWGhMZnMx?=
 =?utf-8?B?N1ZZVm83RzJkWmN2N0ZVWk0vbEcxUG5aaGUyUFg4SElZVm93cEMxS2NTOUk0?=
 =?utf-8?B?bnYyNTlKQnhmaWg4MjBheDBjd3ZIbDJXMi9HdXBlTVNIZFZRb3RybklJSnY3?=
 =?utf-8?B?M0o4MVV6NEszTEJXT1JJSGJmK091SkZrZm5mVHpQaWdMd3k4bU1aMThvN2k3?=
 =?utf-8?B?L1dUaVc5MFJTenNMZ1dMdHdFZC9SYUt3RWNMcFFlME9OcTVTbnc5SkNMZzBE?=
 =?utf-8?B?akpCMlA0cEFCT0M2dnhwWjVNQ0lOQzNHZmoyaGJqWFJFV3U2YUI4aXM2dExH?=
 =?utf-8?B?LzBMcDJmWkw3RXlJM3lKKzZFU1F6OXMwNkgzTDFkbVBFT1pnUTdGTStQclFZ?=
 =?utf-8?B?UEZqb1R4ci9VQWIvd3k3dDU2ZXpDL2kvcFBtdlRObEV5U3RBRDRSU2ZsaHNM?=
 =?utf-8?B?ZS9QZFM2NEZ3cm9yUjlqOExQbi9qM3N5Vkg1eTg0N3Y2bHJUVHRlNmhmU0ox?=
 =?utf-8?B?cEFqT283KzJ2WU45cTJEV0NZWjhWbjBNRmFKRStRRVVVWnl6bDdqaDc1WEhz?=
 =?utf-8?B?TEJsb1VIQ0NhNTJlMThYT0NNR3ZmZVdwZzJRZXY5cTVvTWp6Ny81MWp1QTIx?=
 =?utf-8?B?Ui9rcFl1RWZvQVhyRFhWOXZxSUVlanMzQURMYi9LSXBmdDNSVGgvS0VER29S?=
 =?utf-8?B?cE4ybjlaNm54dHRZNUMrejJ4RTVMVDV0anFQakg1a2QrbzFLMGhBU0V3RlRW?=
 =?utf-8?B?dy94S3A2N1ViR0gwUDg5Qlk2eUx3OGtEeGFFRFhBZVV0ZS9EYXlxOEVxQ1ZM?=
 =?utf-8?B?Z2lUSEkyclp2NjlONkFXUnQ4L1hWSVBPMUJvdUwxalE2M1Q0YXc1OXByM3NS?=
 =?utf-8?B?UDN6NTRSL2w4akwyQklnUmo1UmpLQ2FzRWw4bVk4ZS9ySFNpRXFIcVVCckdk?=
 =?utf-8?B?UEo5VzJ1OVY3S3lpSStZSElhYWRSdUtETlhjSTdGaDV2OElSVzlIUXVYZ1Mz?=
 =?utf-8?B?cEw0b3MwSVdGem10c1dUMEdhVGVKWWI0NEJmZjV6YWRpNlozS2hMczhKVHA0?=
 =?utf-8?B?M1NuYkY5TWtISEJJUkpFK2wrazNDd0pFYWk5elBMeDdnRFNJWmtPUlByZmRD?=
 =?utf-8?B?UkY3TU5zNndBdkwxREliNmpjOGFEQk10NVRlSTg3ZFhpZkllMnU4MWx2bDZJ?=
 =?utf-8?B?bDVwQkxJdG5vR256aVRwOGFpbWhOa0JFMlJFMHNwUEdNQ2tvSTZCWkZ1Z3By?=
 =?utf-8?B?alpiMUE3QVdTK2xNaXhscTRmS3o2V3hEeFBUdG15N0xPQnVEc1lvVWpacTdm?=
 =?utf-8?B?dzdQTStLdHFqMFJFbkZCd2V2SThPU2VPRnZZSUNleDlBalBEZEtrU3EzcWtV?=
 =?utf-8?Q?BGwz3V/IczaE+M2V10EgjPkDVHCm1Fjl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzJqWm52eGNrNnlJLzAvUXQ1M3ZZOFFoM0dSZ2hDbUZ5Z3h4cENLeGswcVY3?=
 =?utf-8?B?VnlBUXFmSlpxeDNoRW9zOTlCOU1CcEdFVzRXUlRrd2hwQ0xhZ1k0VlBkanZs?=
 =?utf-8?B?R1NzVUhmUkJTSXNoSFpNdnloWXdlM1hrVEtUMGFmMDBEb0xjWGZWdVB0aG9Q?=
 =?utf-8?B?dUF3a1BRVTVGL05lak5TRHFZODI2UU9KTVZwMHI3dDliWnd3M2lyemwyTjlv?=
 =?utf-8?B?L2NSRFVobmpaZ1Zha1JEbXFuZ3MrZjA1UkthQ0lITVpoM2VIS2RQemVVT0cv?=
 =?utf-8?B?cC9UQ1VWcDhpL1VqUVZwR0Z4N0ZzRkc4Vk1OR3ZhOHNZOHkyMXQ4andpaEkw?=
 =?utf-8?B?dzlJTEF3UkpLUGI0RzBoVUpYdWtRWFVoKy9rYWNFNmZsYkJtbXJnZStReDNO?=
 =?utf-8?B?Um9PdEtuaU9VeXAyazVDT1JDOEpYTWx1dzBsUW5VeXBxTE9rcTY5QWV5bXN4?=
 =?utf-8?B?NEwzMEppeHVGNEo3eFN1bFBXNEJjZEtPOVpITEpYSG5mR2VBYk03ZzQ3QW1w?=
 =?utf-8?B?V0lpdmNod1BxblNzb2VHa3JNR3dBZ1J0SVRoMXdDQ3FNWXlibytONmthaXd5?=
 =?utf-8?B?d1NDNDRwOHhVRVYxRjBBaHg4dFNQSUN3cDN5d2wzTi9iR3NUMmFjaFd5cW92?=
 =?utf-8?B?RnAyaTNrQWNkeFNkSFFDdG9veUx3dWlNM0EzL0R1R2NZZjhRVlZpdWNmMG53?=
 =?utf-8?B?Z2gyYlNlKzRBOVMyK29WTkFTQlB4ZjdzN2JJR2txNm1OWWk3YUFVOThFS252?=
 =?utf-8?B?ZURaTDR2SEdHU0NXNU0wQlBuazBOWW9VdzFZL3dEbzRBTmNGbjhaSDU0MFpy?=
 =?utf-8?B?VEduQXN1ZEQvYTRESnhXRzkzcVdVTVN2SmxBS0tGeWNTQTlKNUR0U3FpL0px?=
 =?utf-8?B?MHIyNGFOd01rbnp6UjU2TU5qYWpXWEplYXBVNUZ4TWgvbTR4NCt3bUcydG5L?=
 =?utf-8?B?NHFVWVV1RjFmVHZuTjVrTGlIbXNNTFNKR203VU1JNDl0MTlmWXZXQjd4UDVC?=
 =?utf-8?B?cWpOdzJDbVZSTU9SL3pqWUw2YndnVmlZMi9Wdkh0WmIrVFJkK2g4Qm0xcUt5?=
 =?utf-8?B?WmRUdldIRTZFUUhmTi92ekI2M2pXdHFaRFhzT1VPa1NVNWx1dzloK2lRMlFk?=
 =?utf-8?B?OTR2Mkt3YzBVL2dsa0svVXROc3VPb0paUktWMGtGdTg1NzZySHJGQmZ5L3RV?=
 =?utf-8?B?Q0REanAwN0hwRzJmWC9SVDcwbjJuNzByRG1NRlpjbTBvTDZhNGgrY3RPWTl2?=
 =?utf-8?B?L29aUktXKzI1UU9wcXNOU2ZVQXFNVTRTNi9KMDRQM3VpTkFEY1YrQndFQmRp?=
 =?utf-8?B?US93RnJKdnl3OWQ4aVJKM2MxNFNwcFVUOGNXNUZ1a2c0dVNRUWZDcHVZUWFu?=
 =?utf-8?B?NTNaVmVCT2Y4b2hvQ3c5dHprOW42NnhnbjQwbTFnYy85QU5DOUJOd2tMKzll?=
 =?utf-8?B?WU5ZdncwWnllTFF1d25neUhVc29RRFh3VGFYL08zYXQzdXRPMHM2YUQ3VzlY?=
 =?utf-8?B?eGRNZk4vUUNvdUpjYWd2bVJUTm8zTjREd1NhUjMwY3JRa0RnNVRKanlNTy9a?=
 =?utf-8?B?czdTam15K0trNTYzcC9sOXNCc2loSGhFSW9Qd1krbkNUM0xaS2hzbDRQcEs4?=
 =?utf-8?B?M2k1TVpLODR5L0huZWU5TGVzZnNjczhJdkJNZjNpNktPL2g0ejV4YVRhb1lP?=
 =?utf-8?B?dE95TWVyVzFXYTFuWmRhNDNtZzV1UGNjZDdDbmtNZ2RBazEraFNvWHl3c09v?=
 =?utf-8?B?TThMVi9UTjh0MnRON0tPRnVXL2NhSDRTNHBSYnU2RmFMSGdrRUxtbkV6YTc3?=
 =?utf-8?B?Q0pvYXp6bTI3WjZZQm1renVzN0ZXNTc3U0xuYXcvRDlhQU9XN243RXplTVRN?=
 =?utf-8?B?YURWazN4QS9ydDU1eVFkTUZnd05QUWlBQjFjeGJpMWtpL2EyOHlmSzBtWEhJ?=
 =?utf-8?B?cHZFN25LYXc4QmJkbjRIQWhVVmJoZERHL0lMQ2VJR2o0bTg5cjdBMmtVVi9i?=
 =?utf-8?B?Ykx6eEVNM0JRZTNjOFlDSDJzRlg0VkJSVEdMWVRib0Qra1ZlSlR3TXUycEdh?=
 =?utf-8?B?Y2hRa2pvdDVWdHRjeHlVdTR6SmQxVmNjOTlEZHh5N3lpWDd5ODBIWFRBQ0Y2?=
 =?utf-8?Q?Ns/I/72fuV51IdfFZCFUEMWYe?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/wZaKMcFGlIhRiApAsc24VlzGSmpkCRKSIJ/8F8l9yinl8vwkvnWWMBujQODKjiKdXr36aUm9BAHmiZKRtuwtBd0cqhnn3ec38x/P2rv/AsaE3hFUyM9VTmkIWKcYO5qPQG4Zex1xKENoKkDy9fSuyqtldvcRBPOjoIl+zIn+nQge+xXL6XOL6fUtf7/Uo9quyEnZT6hg0fBhiHYiiEGUv4Nq5tl2EN5w/+fL4oMqJT5scVv6muFggqF4D12/D//3lIARoUB3adpopvu5X/8+lYMKcoc+HLPmXt+PRyzspQCRH6mNXdWKcRi9WWyCAQGIzLzKahRcJhYptHVcpBliYO5clBh+ZfTVz2b0+1uMuQGgIBq7pgdDr8mcuwR+n7CoNA5cdJaMOxWupWaGOta/vlTScPW0NvdSPfbwICNaEjHxtWdhhjck3H8IrFOy272OFz2o4ebk2pHJ7oe+CZsR6Yli/1wH/LYJabTIX6BrGXjsj6ICBnuIg0L7xpel/8Ecz72DAID5d8C5VrZqYt1z7fj0JwLgT99KIaOcy+0TaevoxOeb9BPzUJ3punjx9symULqv6dFdA2qnACt+01KvOrNFhcmOsl7Pxy82cEXe4I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f36e8f-b3d6-4f1b-cb3d-08de20b6c8b8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:10:55.9213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9+7UvJwGAwjpCcXk4zAeO5KI2PtJthEjE1mpdkWV2l58uISZ7QNyYuLpoI4r8GRl7NkYr2JNtRHkm7p8P6dvoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5649
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_07,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511100202
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE3OSBTYWx0ZWRfX4Zd6/RrNa6xW
 jQHJH6CCiYOIQuh1bZUwGhTIvnXVCPUgdHFi5w1N0f7o+1/Qtzb1YLApLGfPt/SrL+hJj2aoiFy
 cL2h2lunYE6W+RWB+kWFl8gmuJ64Eeo13XZ6qpkSl2QLtkMnixIhl38lhmTNP6NFpteXUtRapTR
 iNvRCPkVtSuBG9ENoF/DbFzNsv1GY5ui/2iJozxgufnyKyx6J/F/YaoHQMcAJOkNzYvsWQuGUrX
 WTH9NrLtqc3ma/IJqMKbL1McrDULlB4Kt4CdAPH40oOzfjJcUVaGAtW5wEa/8gGr5nNjWNtrOx8
 uM5JlwP4I1MStaad42GNetOisglwY8yYI7QOLXxJrj4+/UDJrbipkq4Wctxaxd1jgYIKnzV3icK
 nLf7wv5a6B0aSugcA2ufC0FzmTuLgYBCnsnp1ZLn9kNqq0TuUGc=
X-Authority-Analysis: v=2.4 cv=H5rWAuYi c=1 sm=1 tr=0 ts=69127f19 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=Lw6eILgkda20WnR7nTAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:12100
X-Proofpoint-ORIG-GUID: 4lJIbFpacew_BGRYqO2BQeSXpRnJYMsD
X-Proofpoint-GUID: 4lJIbFpacew_BGRYqO2BQeSXpRnJYMsD

I'm against this patch.

The picky stuff is:
- the Copyright year should be updated
- the timeout probe could replace
         tick-1sec /n++ == 10/
   with simply
         tick-10sec
- the "delay" env var be set for delaydie???
- the ustacks for delaydie are perhaps not very interesting

A little more serious is that all this patch does is swap one failure 
mode for another.  What for?  It's XFAIL anyhow, and we do not check 
that we're getting a particular, expected failure.

The real problem, meanwhile, is that this patch leads to lots of test 
failures, at least for me.  Not every VM, but many.  Oh, and I do not 
mean on this test, because this test remains XFAIL anyhow.

Consider a subset of the VMs I run on.  I get these failures on the 
test/unittest/ustack/tst.*.d tests.  Why on these?  Because they run 
after tst.depth.sh.

         +------------------  arm OL8  UEK7
         | +----------------  x86 OL9  UEK7
         | | +--------------  arm OL9  UEK7
         | | | +------------  x86 OL9  UEK8
         | | | | +----------  arm OL9  UEK8
         | | | | | +--------  arm OL10 UEK8
         | | | | | |
         v v v v v v

         x x x x x x   tst.kthread.d                 FAIL: timed out.
         x   x   x x   tst.uaddr.d                   FAIL: timed out.
         x   x   x x   tst.uaddr-pid0.d              FAIL: timed out.
                 x x   tst.ufunc.d                   FAIL: timed out.
             x   x x   tst.ufunc-pid0.d              FAIL: timed out.
                 x x   tst.umod.d                    FAIL: timed out.
                 x x   tst.ustack25_max95_profile.d  FAIL: timed out.
                 x x   tst.ustack25_pid.d            FAIL: timed out.
                 x x   tst.ustack25_profile.d        FAIL: timed out.
                 x x   tst.ustack95_max25_profile.d  FAIL: timed out.
                 x x   tst.ustack95_profile.d        FAIL: timed out.
                 x x   tst.ustack_max25_profile.d    FAIL: timed out.
                 x x   tst.ustack_profile.d          FAIL: timed out.
                 x     tst.usym.d                    FAIL: timed out.
                 x     tst.usym-pid0.d               FAIL: timed out.

I think the problem is that tst.depth.sh -- with this patch, in any case 
-- turns on a huge number of probes.  That causes problems for this 
test, but not in the sense of it FAILing since it is marked XFAIL 
anyhow.  (All this patch does is change the FAIL from one problem to 
another, but we still do not specify what failure we expect to see nor 
check that that is what we get.)

So, the problem is not with this test, but that the system is left in 
some whacked state due to having attempted so many probes.  As a result, 
the process "dtrace -o $file -c delaydie" is still around well after the 
depth test has finished, the load average remains high, the pid0 process 
does not run, and many tests time out.  How long (how many seconds or 
how many tests) does this effect last?  It depends, as one can see above.

This raises all sorts of other questions as well, such as whether tests 
in our test suite should be allowed to depend on running on a somewhat 
idle system, whether we (dtrace or the test suite) are cleaning up well 
enough, etc.

On 11/10/25 10:27, Kris Van Hees wrote:
> The test used 'date' as its trigger but that caused the test to XFAIL
> for the wrong reason: date does not have symbols and therefore dtrace
> failed to enable probes for it.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   test/unittest/ustack/tst.depth.sh | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/test/unittest/ustack/tst.depth.sh b/test/unittest/ustack/tst.depth.sh
> index dec16a3a..977d1b42 100755
> --- a/test/unittest/ustack/tst.depth.sh
> +++ b/test/unittest/ustack/tst.depth.sh
> @@ -16,7 +16,7 @@ dtrace=$1
>   
>   rm -f $file
>   
> -$dtrace $dt_flags -o $file -c date -s /dev/stdin <<EOF
> +$dtrace $dt_flags -o $file -c test/triggers/delaydie -s /dev/stdin <<EOF
>   
>   	#pragma D option quiet
>   	#pragma D option bufsize=1M
> @@ -45,7 +45,7 @@ $dtrace $dt_flags -o $file -c date -s /dev/stdin <<EOF
>   EOF
>   
>   status=$?
> -if [ "$status" -ne 0 ]; then
> +if [ $status -ne 0 ]; then
>   	echo $tst: dtrace failed
>   	rm -f $file
>   	exit $status
> @@ -78,8 +78,8 @@ EOF
>   
>   status=$?
>   
> -count=`wc -l $file | cut -f1 -do`
> -if [ "$count" -lt 1000 ]; then
> +count=`wc -l $file | cut -f1 -d' '`
> +if [ $count -lt 1000 ]; then
>   	echo $tst: output was too short
>   	status=1
>   fi
