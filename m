Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425F241C89
	for <dtrace@lists.linux.dev>; Tue, 30 Apr 2024 16:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714496063; cv=fail; b=Q2M8qv55s6W62H1k2IzPklohLl2YTw7t4SS22pt9P6tKiV7Teyh6lEJchB3Tovn83EmBWJJB7gmtetP5LguoKE/UB+WHQgReg8vNlz2fWtL3SlfY9JcfbETI4Q9rJ++nEm85jpc56K28CxeVndumoEe2KPMvak10XJFWVY0IFOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714496063; c=relaxed/simple;
	bh=FazDTtFJcyXR3ByjWck6ss9WQj4CSCPkb9GPGfBI7gA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BvNj/lhlxtwR1qaErkgF6fVEON5iVG90TIIyiX7n53FYaswwQADPSRrLKkS2m6A34ujTfiJQKvCV4Kqsh8IBis2ieZqsPZljHerKdR8Na69/hczjidpMSEKyx8xkTvh8uAXxhHsZu7fiVEYTzkJ8Lz7InuGvZAsD1Bob1NRuZpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=R8MsGCIO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XqqnwZjP; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="R8MsGCIO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XqqnwZjP"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43UGT6Vh024841
	for <dtrace@lists.linux.dev>; Tue, 30 Apr 2024 16:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=fuDY9AkIMeFbMgcs9EYHwz+tunHGT4etpfUb3xu1Lik=;
 b=R8MsGCIOvKpjUxJK/57OiX7Y1OujtdlYzJQX+MrZR+nnUUqiI2pYHOso3vAHaYRluCsB
 J45J8wMspHSWTMb7xuZZwMqDnKmUollTXnBh8q6/pxR8ibXbj71gZi5HPIk6AI9ubtRe
 cD2fWMbdjeidWV42ej/wGHa1/oXqvgmB9MrK25ieGfQV4RWHZDA/MjwCnktAsFgtB5Qp
 N4iKt00OkNxMQ9T+K96h2pQLhpsN2NyVOV6RQkzO0aSDKJNym09MHVJhEzPCJBUk1Tdn
 JXIlPq9bHHV/GT1hIQUQY97Ta170wjlXVlKoEpuPMVaC1XClvTVnkEyd6PWzna0+jbIN jw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xrqsewj8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 30 Apr 2024 16:54:19 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 43UG35WX011374
	for <dtrace@lists.linux.dev>; Tue, 30 Apr 2024 16:54:18 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3xrqt8823w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 30 Apr 2024 16:54:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKLpFw+oSy0IrYSKoN/Zd5oSxDuelY48ypfX3hjuqX5h1jWoC3r4sMFJwchwh63PYZ3AhAv+m8JFsFOWTbv3Wmxg60FXlbabM6g6p1tTdbDYhQyE3YrzM7F+5b5ae4HDl3SLjna87zaE1aY7yMLUrK2QhCAqZ2hqaVUy8CCzTP0/YaEZYdPFN13xEkBpsU+5S+CyXIBQtiFkoYQAtFY/FM1FMh7zdDwS94FdzKFMokqGejopI4lIDb/zxscKYI7V4Y/WwF2A1Ms00Iakjw2UnTMWLHK42GwdRGlBgKX3PNy22mqFjncld0cxlpoSUKsbkEhIvrLuv6XChd/cBkzo0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fuDY9AkIMeFbMgcs9EYHwz+tunHGT4etpfUb3xu1Lik=;
 b=cFhX0+sNsllM4MbXi6T0rbL1VoFPF3mmglklr5rHfSPl1zDhChhjF+PbcxhK61633c5Uk7xHSaG5WplrssKe9RwYE/yReSfI5/dZWk8MOK8fUBTT4hd3p0KWX++/t3ZHOhyrnAQkJhyGPCVL4jYbsLaISWVeHqQgaKE6vBzDVAqN6aPzM7HPCo1iIeKsaDCmyUIAn51BC4FC7GTRkpIfRPdFchdT6PSsogD7qIFyCv/0VUYNBnpjwpen+mWcjTrx3CwwimISEPkQs/pU1wHzUJTYPv+w75EKnJrJXAOT+2J+jhjc0vjV+LwrUKEUmRMlZF3tylBeDvNS+TiMfLAqsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fuDY9AkIMeFbMgcs9EYHwz+tunHGT4etpfUb3xu1Lik=;
 b=XqqnwZjP29rF2ImmBqPjJTKylE6qduQLw/e4TVJ/JaMWOfq5qzD2jXU96cm4T7i+jbeKLZS5e4joN7yGIpRJ1uMIrkzL22YckfzcGlqnqRQotP1TNnxe3M7peVha15Z+nwkG2Zs+sSLqLYEYley5MPve+Iv09C4LgGDX1CPwOs8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB4645.namprd10.prod.outlook.com (2603:10b6:510:31::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 16:54:15 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::880a:3c23:a6e1:3b65]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::880a:3c23:a6e1:3b65%4]) with mapi id 15.20.7519.031; Tue, 30 Apr 2024
 16:54:15 +0000
Message-ID: <42d1f8c0-16d5-491d-d0de-e2475f89cb11@oracle.com>
Date: Tue, 30 Apr 2024 12:54:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] bpf: work around BPF verifier issues with AND and 2-reg
 branch conditions
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <SN7PR10MB6287EBF86002CF6FAD756D1AC21A2@SN7PR10MB6287.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SN7PR10MB6287EBF86002CF6FAD756D1AC21A2@SN7PR10MB6287.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR20CA0039.namprd20.prod.outlook.com
 (2603:10b6:208:235::8) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB4645:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a6a95c7-2411-4921-0ed6-08dc69362b28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZjRmOFE0Y040YkZPQnFMenI2dXhia25Pcm84eC96NE95RUJNNXRNVXQ3MVF5?=
 =?utf-8?B?cWRTc1R4SjRoSkgvUjlpUTc1bWVKcFZMS2MvUTdXUjhkbjlFVVAzWEVoVXNy?=
 =?utf-8?B?Mmx0b1YrSTU2NDZCcDR6WG5Ycm5mb01vcWlIRWRkVDgrR2tiMGM4NFdBZmN1?=
 =?utf-8?B?VDJnL2FsdWRoUFJxTGo5MVJidVFhRWpCdXR1V1hQSzRDOFV3M0FHMld6N2NQ?=
 =?utf-8?B?aGw0eVJnUDNaTGw2eFUrL0lKdzBvVWVZSU5Bd0NneHVLbElrOHNONDdGVS8z?=
 =?utf-8?B?RnFMQUE2aEdYMy92WmhmV1B6MytEczVNSlVBaHpzZytOZkxiQTRINU5jZmFY?=
 =?utf-8?B?N3pZMWUydEFYd2hlN0lpc2k4dHZCMkhScHZVYTU0ejRpTlhrSXJkTGZheS8x?=
 =?utf-8?B?dUxTRmZOYmFYY1NFYnZnZjZTeXJ3ZVFZM3lPQkVVRmpBS0ltaU9vSlBPYlpo?=
 =?utf-8?B?R09zejdCR29BSWxKNlBHNHI3YUtKR1ZDdTdJRlNneWVzQkxtTUdmN010TGxX?=
 =?utf-8?B?SGE1QzNzVU55Q20zNVJ6c3h1UHdqeXhjYzVhTWZpNU9VemtaaGlKcDdNekJS?=
 =?utf-8?B?Z1FiZkwrQWI0Szd6ZWlWN1pYRnZqT3ZCVEVYZy9sMVROVkt5cm0zcnVvVitC?=
 =?utf-8?B?OFFoV3cyOHFVaTJ6T25CMWV1WTVXRGlvOEw3L0pqc1czUGhoeFJzNFFRb1Y5?=
 =?utf-8?B?Sm1VSmhMN1N5a1dNUGZuREJBTGQ3MjJoczYxU0hsZU9XT1h1MWhiVDFJaXhn?=
 =?utf-8?B?clY1S1BjckR2REExTmNqQk1uZXlTeXUzNHR5WXN1clorS3RqUi9ZQnFrWEd3?=
 =?utf-8?B?UFpaMG1RNTlsSTEveDVvT3Y4QzlZWXJlZ29DZ1RMaUZyZWZqUzhvemlQaXBK?=
 =?utf-8?B?VmR0bXFhczZtY3AwNGNldDJ1QlNUNnU0QSs4OGZ0bElqTWV4MG01bnpjNDda?=
 =?utf-8?B?Y2VpSXN1WmxlQU83RTZMZVpyTWlLN3VadTJDQ0pMNmVTYWRDQ2VzQW9ZTjRv?=
 =?utf-8?B?RHZzaDF1RUlMN1lsTE1xOFJqeEVSbTRNT1cwdU9Vd2lManJ1RGdpMzFrQ1Zj?=
 =?utf-8?B?WGV4MmkxQnJidXVEeDBGT0FUQlVRYXlUU2dyRzQyZjJ4ZzlyQjJ0aWJRd25a?=
 =?utf-8?B?dXAyMmdqZERMYjlPNHBWbkZLckhleEcxOHFjejZNUjRJR2dOWnhkalU5Zzda?=
 =?utf-8?B?WVNnS2ZvMDR6ZjZGUVVpbk1Ubk5sVG4wWjZ1UWc0dWN4SEJnQ2dydnZOOTQ1?=
 =?utf-8?B?RTMzMnJoQ0RIbk1TUVhvcWE4cmd6REdjYUNUZDRPUkxDODVHWEF0ZlBOMDN5?=
 =?utf-8?B?SnlhdktqYnNEZVlHb3ljcGV6bElkamRRSzRQNnVEbmhZd21PVWlTalU0UnRO?=
 =?utf-8?B?MEZuaDRXdTVmbXJmR1pUVnJwaytTZkM1OVpXZGNpSXRRMUdudHNKSjhQa3Jk?=
 =?utf-8?B?c2I2QStrZ1R2NGdpYlFBQWdJTzVBenJyM0JQbml0U1UwaHN4S0s5KzdmcXpx?=
 =?utf-8?B?N0tFYktNcE5nd0p4Z1NWWkpxclVYQVRhNWV6akluaDJyWFltbGN6bW4ySmxO?=
 =?utf-8?B?RFIwci9NRFZsMzFndG1zVUhxMFpUN1NHalB3VDAxYlVaZGZRUXNJZlpPOGpV?=
 =?utf-8?B?N3Y3YnFpR29mb2lQZEdPSGErRFpybDllWXpBRGxOdDFwVis3RmIxRmN0dnNQ?=
 =?utf-8?B?T2N2WDZsUDFwV0lnY2pkMVgyaGRsdkp4NnJZR001MUdzMlhNWDJSZUN3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UzljM1FGTHRoaDdXUndRbElEdkNSVnloM0FsaUdITWN5T3hISFM2MTJqc2dS?=
 =?utf-8?B?bjFMYWliNXJiVTVsNVRTUDMvazJuQlZ3S0EyOC9uNkJMS0tKN0RGMVlXOGdr?=
 =?utf-8?B?K20vSHBFYTZVTERjMEVKTmljcXNiRmFmaFpZL2VuZDQ0U01uSVJ6dENTSG40?=
 =?utf-8?B?akN6dDVpWDYzbmVSc2JNblhKNXptNTdOU3JyQVdMQ3I4a2ZQL3ViM09XRzYw?=
 =?utf-8?B?T2JRcTJyK2ZYbFdHUW5VZXFyRENvdHZtQjR4SHVvdFFKSzlna1FSeW5pQVdq?=
 =?utf-8?B?K0N5d1VSamErYjJyVHFKc1hNOGx5VERkT3Jra0YzYmdDSWpDdWxPcGJJTVJM?=
 =?utf-8?B?T240NDY5czNaT3h3ZkxoMkt2SklmcWN6S2R5VFBmS2lYVEl1NUdzNFpZaTE3?=
 =?utf-8?B?VVJjZVJNeWI3bGlFR0FQcmk4TE9VZmFrdlk4eDIxdU02MmdzakQza0RkbEJ6?=
 =?utf-8?B?YTZ2THJhR09nc25sM2k0bmZab1FYY1FIS1pQdUl4NHVjUmJORi9pVGgwWDRF?=
 =?utf-8?B?Umh0d00rWTQ0a2JjZUMvSGl4WlNKNjVmRTBkZW9VbHhscmFvSzNBcjI1RkV2?=
 =?utf-8?B?d0JhTXlJK0FDendwb001TGVERi9nLzFpSWZvTDVxdDVya0dWN0pvc2lUQ1U4?=
 =?utf-8?B?QTVNZENvRVJCYnpQZFR3WXpBbENhd1BZRDAyL3lpUWJBVXRDTXZxZVBUSkJK?=
 =?utf-8?B?bWRhVXFwNkRNdSt1ckpRNkw5eWEwTTJuQmRHNkFYYjl6SEdUdUc3Q1V2b2E1?=
 =?utf-8?B?VldxZFU0bFI4eERHSytkemYycHpXV3F6YWFsTGQxaERHN29jcFZ3ZEVROWtG?=
 =?utf-8?B?bjNMR0thN0VRa3owTGowNFNVS2w0TGJYdHpPSU5ySUE3QXhicE9FcllIcnBs?=
 =?utf-8?B?eWZRUHhndXpCM2o5TFpGT3BhUWtjUHo5WWY4dTh0MHF6Z0hESVZjNWhaOWV2?=
 =?utf-8?B?WFl5bEZKNzM1YTNlU3RxZGN4VWRwZEw4RGx1K3RQSHV5NjVEYkNVc1k4dSts?=
 =?utf-8?B?Sk83b1pYME56dWF3d3l2d1hRWFJZR1NQZWpGaGYrUGs5eml1OExxNVVsRFln?=
 =?utf-8?B?TnRrUEc0Y1JUK0tUMjJ3RTZkRkJtbHhlYlJ1RFczVUw5OTUxcDlwdElkVDlW?=
 =?utf-8?B?SkdkUHZQaTJJaXZrK2FCaUNPV29JZTl3Si80Qk5mMnhlNDBlMWhYV3VydWFD?=
 =?utf-8?B?SUpObDdLeUFxV1VnQzRvWHJqMkh3cnRQS29zdEpuMGFEbW1BNHdCdDBOQ0Ev?=
 =?utf-8?B?eGE1WWxEWEVqRURwbzVLYnlDbnlFbTlGSU1LMHZZQk52eGNBSmNpcDFkR3g4?=
 =?utf-8?B?OUR3UUlPZDBOR0hYWkZzdGF1YW8zdy84MGZxWlp1VGdVRmxJckRFMmVNVmZy?=
 =?utf-8?B?bXl5RWk2VkZwOXNpMnhKNVZrY2cvcmlBZXVTbDlaSlNRM0U3YzhEZHIyRUFn?=
 =?utf-8?B?TGQ1VGlaVGNSdFQvQVBwbS9HTW5iRUpXUjk1TkpnQmprak01TFdsSjdTTjZP?=
 =?utf-8?B?WjBFbjdPQUVJY2FtZHhLaUU4ZWJkTEt2SjRZNEVyVER3Q2tTZktselpEMUNr?=
 =?utf-8?B?TTYwVGxTcSt6eHBoOXJZekNwMzRGM3BST0JxWmtxTDhKd090NDdkbTVZOUoy?=
 =?utf-8?B?NmRZaFlsRWdRZU12L05UZ3VzakJvNzdXTzZmOVFueGtwNE1STGhjakFCVW9Z?=
 =?utf-8?B?N3FPS09PelBpejdCdzkrY0lRQTB2SkU3Rms0VUZMTWVIY291VnJXOGU1UDdN?=
 =?utf-8?B?WmhBOW04RWtvNEpzMzVXRzl6R3A2WFdZRldDeWl1Zm0wMzJLNEFWblErbE1m?=
 =?utf-8?B?RFp4SVJSQTZYZXdjdUVJTVRaaThhWGtldUgzSVg2cVREcGllU21YN3ZjaGMv?=
 =?utf-8?B?RXRzYlUrT056T0l2SjVzZkpQbkxyYWNVcCtOWFhibEpidHdRcEhnRVp4a1dI?=
 =?utf-8?B?bEl4aWhLNVpSQWR6ZjRKTXZPSzFaeEs2UzhQcTB4Vm01WEpBUG04M0hnK1hn?=
 =?utf-8?B?OEpHMEZXalQvc0tCelVlc0xucWhTbjd3WjRWTS9XbmVJclhNVXU0OHU5bHpu?=
 =?utf-8?B?WkRYOHZaQlh6RDJkeDBRbUF1dTJtRVZOOGVQNWdTd0ZEcVNpOGEvamVkNDJQ?=
 =?utf-8?Q?gPDg/AmbyTHuMNxNXqAupYFjC?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Cds7Xyy9MMgrxrMFQSJTjRlGZpE+S/58IN2/kW1bohMsUGd95j51VXmqUrXBLFwhjcyRFjHAz8JXBpEm6F53TLpJwOorT7crUEhPFFm0qs7hSEn3Cyk21SRPPUid5T8YFa6IlH0K4anCZ9eVu/BxTdNhNFWjjRqBY0KpIv1AEmGI7Im5NI2OpdsaLmFca2nJHEa+jztazlLKQec5TawVEW24WojuvzUkBBjCKr6QRB6Nr9e6c8oVXur1Uwx/DEUjj1zRqUjq4Ewt5mSBsRScIoV8U2IQeobEbU7RsG1r2fO4etIL+kgfzSHDH9am3GXXehj37lBFSzO5hctwZgxNXSEuQhAMbIvDxq5ej2dWcnl5omwBCmCDM+Ggb1EUhHEkN9OJW5gtdV7HFiCrpTabz+L+hlvAObraXqVmsbDTdfu6I9jT+TPtywKyXP/xlZ42W2yxVvp5NXrce2JUBDlr6t9V+TgX2Gn/UPEe7/DawmGESegXSvuP87+1DS4vm2+6p8SmQ3sCpkQ9CpCR8luptzg3b+ssZB7S9iopgBH+rno83R75UtDHEglHXUVwar3VPBE/kEe4gVuuysfpB7eJ4MEdEg3MLXH8LNQOIVXM8uc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a6a95c7-2411-4921-0ed6-08dc69362b28
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 16:54:15.4457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tG7ttOwDy31XOr7k2G/CkRZNfbWskdDsa7xs9M6ViGy/ecaEr7s4PK9unXXnhibAPvbjcSPjsPCdc4JXqnmy1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4645
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_10,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 adultscore=0 mlxscore=0 suspectscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404300121
X-Proofpoint-ORIG-GUID: EbvjYEzdIZEcQnQQ1cukOGAaDSeAQSmk
X-Proofpoint-GUID: EbvjYEzdIZEcQnQQ1cukOGAaDSeAQSmk

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
two nits...

On 4/30/24 10:27, Kris Van Hees wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   bpf/strchr.S | 22 ++++++++++++----------
>   1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/bpf/strchr.S b/bpf/strchr.S
> index 8365d9ce..42c6430f 100644
> --- a/bpf/strchr.S
> +++ b/bpf/strchr.S
> @@ -26,8 +26,10 @@
>    *
>    *     // xor the char with every byte;  a match results in NULL byte
>    *     r4 = roundup(r6, 8);
> - *     for (r3 = 0; r3 < r4; r3 += 8)
> - *         ((uint64_t *)dst)[r3] ^= c;
> + *     do {
> + *         r4 -= 8;
> + *         ((uint64_t *)dst)[r4] ^= c;
> + *     } while (r4 > 8);

I think that is wrong, but in any case out of step with the actual 
code.  How about either s/8/7/ or (imho better but then needs change in 
corresponding code) s/>/>=/.

>    *
>    *     // put a safeguard in place, then look for that NULL byte
>    *     dst[r6] = '\0';
> @@ -72,24 +74,24 @@ dt_strchr :
>   	call	BPF_FUNC_probe_read_str	/* r6 = bpf_probe_read_str(dst, STRSZ, src) */
>   	mov	%r6, %r0
>   
> -	jsle	%r6, 0, .Lerror
> +	jsle	%r6, 1, .Lerror
>   
>   	sub	%r6, 1			/* r6-- */
>   
>   	mov	%r4, %r6		/* r4 = roundup(r6, 8) */
>   	add	%r4, 7
> -	and	%r4, -8
> +	rsh	%r4, 3
> +	lsh	%r4, 3

How about a comment on the << >> 3 thing so that some future maintainer 
more easily understands why this looks so funny.

>   	ldxdw	%r1, [%fp+-16]
> -	mov	%r3, 0
> -.Lloop:					/* for (r3 = 0; r3 < r4; r3 += 8) */
> +.Lloop:					/* do { */
> +	sub	%r4, 8			/*	r4 -= 8; */
>   	ldxdw	%r5, [%fp+-24]
> -	add	%r5, %r3
> +	add	%r5, %r4
>   	ldxdw	%r0, [%r5+0]
> -	xor	%r0, %r1		/* 	((uint64_t *)dst)[r3] ^= c; */
> +	xor	%r0, %r1		/* 	((uint64_t *)dst)[r4] ^= c; */
>   	stxdw	[%r5+0], %r0
> -	add	%r3, 8
> -	jlt	%r3, %r4, .Lloop
> +	jgt	%r4, 7, .Lloop		/* } while (r4 > 7); */
>   
>   	ldxdw	%r2, [%fp+-24]
>   	add	%r2, %r6
