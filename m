Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7765820E
	for <dtrace@lists.linux.dev>; Thu, 20 Jun 2024 20:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718916204; cv=fail; b=tpoaaDUJ2TtuhCA8qXB7fLhEsNAjjaduGMVVDhW5tcp8V9yT3crpKvQ837JNwnOMnC4wi5xxodh6g7YuajqA2Mp/lUaFJu2VeGxA1v52SMDNTqEx4vtbCvw9FVOJWhBMMq5l6ikNon/W3gsL72vLGtNYXIFexC4D8iXZbbemgI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718916204; c=relaxed/simple;
	bh=zXAkpDRURIf5FaZVHW3lY56QMupaOzYwZybGh13cKUI=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IwWRIN4jzw0xoHoMtstFu1KmqYL9zDc7yzW2XRADzP35qr7JmarycUruienc4tdDZ8AKGDYLrF3tRgfXhoKNDFXjIRR0QUX3/2+Ja6fk3MwePlLLDJfPDOQISjiXpeK4viqRb69YssCW4LF7eJ+JiRPwy8SL4jZHl0hAGMzMpKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OPziCb1K; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rFk74+Sc; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OPziCb1K";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rFk74+Sc"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45KHBETf009932
	for <dtrace@lists.linux.dev>; Thu, 20 Jun 2024 20:43:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=1rj0yTTVnfjZC/K95LcXNbFkTbWGC/pU+QlaNhQpbCU=; b=
	OPziCb1KpWssWMPBmuxpqYE4Ab49xFQ4wL3lnrSOvrdQx5EbqVf0KEYYeHLDmzla
	xFY4sXPneimBo2JpUs4+Ew53O6v3ezCFbEEcgfk+Y3fcPXFsOoGHzvLALsR79z2q
	r8WaI+pPg0vLxx8Sk0GtElLPtDc2sgZJdPMAKKGXB/cKOZRsq+RkMNevKWHwFlJ/
	jK3Vy4dMi7oyhXWtEo/OgCl9HLCT9qfBMUeKvySHOdUs5dzMELp4u+e3vRegCclW
	yWNpG3xiY98waHDn2wkFvNYjIwI+dSuCV3XaBD2gVPcFL9Itv9L0YcOI5b/jYQih
	i5AwJL/8TT6RhoYbTC/tFg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yvrkj0d55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 20 Jun 2024 20:43:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45KKec1C012854
	for <dtrace@lists.linux.dev>; Thu, 20 Jun 2024 20:43:18 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2044.outbound.protection.outlook.com [104.47.70.44])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3yvrn3qya6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 20 Jun 2024 20:43:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n05DQ/oXxQ8f27MldP4r1he1iIsJG1fPPmZ1vOiN1sKTlHefwy1+djzCNq84cYKhUDrh9HDFEOGm9OVoQApoz6K4jXYjXT7JFD2rRKZPVlX1We2eeMW5U20pv1aC/sAbZQ1iEiwTivulgLFvw6aZZ/c1/c/V3k+KS36RHqSYXoUo+tAwMJpocs7DJfSJfkyqORQCbLO4UwoyGNmY9SrYGP576g5NDL5VTeAGKtPZFeDCuB4o2VUO4Ak7ewZX+BHWI5wWieAZN4tOeMBNjonW5IhIa/+QfZkGORfYXgjOvHn/Riv96U/DhxpfE60EW5xEGCUdtGzsZMut924dvUl9jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rj0yTTVnfjZC/K95LcXNbFkTbWGC/pU+QlaNhQpbCU=;
 b=nw9cfNfuIk/1OTe4lcKrgTKnnx8/60OY7O8+SV3oNNie7EQDQr1jG7m47nU2g3zEG9V9qmhg6vP0LlAiC0THmVFbHVc4Dpg7uNsvGl9WxG1rsT6uM5hesqZFyNdRK9sQMpOFvKahqnVObGwj9EoRKNjqPKtq4wDvSs6+furBheWAy72yWB4bCnE7Gs5MKjmht6cvFkgxcxJH6Y7VqYIzI2IP66j3jOOHql1YFwf3WXXXii4Yb+QoH2AiN67Q4GEWoeS8SvxxflTO46okn72PdFHx/7Be2Sh7f51zQmF4qTWwgYqEyk2xSIM1zhO6teWhvRM4mmrcPLd0OkktohMDxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1rj0yTTVnfjZC/K95LcXNbFkTbWGC/pU+QlaNhQpbCU=;
 b=rFk74+Scx+Dy1wfTtQVd2xP6ddAd1z8/hEhBqGyTPnPRM4Ttuu57QSeQVViKGKnmzl4kzUMLPi8AxjXaDGxsO1aaatIHK+xxcOSgWaWFAo6LHNhJXDTaW28D9rNb/khBCiHzTvkr2gKgzTu2yvkr/4QZE23uUP6oo+m/ECOe0FM=
Received: from PH0PR10MB7028.namprd10.prod.outlook.com (2603:10b6:510:281::9)
 by PH7PR10MB5815.namprd10.prod.outlook.com (2603:10b6:510:126::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Thu, 20 Jun
 2024 20:43:14 +0000
Received: from PH0PR10MB7028.namprd10.prod.outlook.com
 ([fe80::657:da26:8778:ad24]) by PH0PR10MB7028.namprd10.prod.outlook.com
 ([fe80::657:da26:8778:ad24%4]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 20:43:13 +0000
Message-ID: <979c34e9-97a6-433d-8e0d-8df0c0513358@oracle.com>
Date: Thu, 20 Jun 2024 14:43:11 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dlibs: move x86_64 dlib directories to x.y names to match
 aarch64
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SN7PR10MB628753BEAEB05A7B65F25569C2C82@SN7PR10MB6287.namprd10.prod.outlook.com>
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <SN7PR10MB628753BEAEB05A7B65F25569C2C82@SN7PR10MB6287.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:208:fc::17) To PH0PR10MB7028.namprd10.prod.outlook.com
 (2603:10b6:510:281::9)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB7028:EE_|PH7PR10MB5815:EE_
X-MS-Office365-Filtering-Correlation-Id: eaf562eb-0dba-478e-070b-08dc91699ae6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ck4rcm1rcTRDUzhiNDhxQ1pxcUZHbUI0RU0rNitBT1R1VUdCL1R5bGZCd0Qx?=
 =?utf-8?B?amNlQzkrK1JHZWFqVlBnaE5ZNnFoYXVndUg1UmUxQ3BXUmsxMEFlUzFwOVFT?=
 =?utf-8?B?SjRMMXhMSDB1cVVrdkcrcHhrVVk0b2ZKdmNtZmk1L1FmN0ZEK1Z1Ty9jWExk?=
 =?utf-8?B?VHUwYzhMSjU5WjhzYzFPZTAzT3FuVmVBNU1KTndtbHlaMzREZWRlK1FOdVR4?=
 =?utf-8?B?WkVpSmNlOW9EcklaK2RaN09ZUTZWRFhlWHZnU1RCUEdKczkxUExETzQvNWxt?=
 =?utf-8?B?T3RQMVo2VERuMmExQlF0NUpBUGhYd1ZON0ZZdEZnQ0RnQkNuc3YrSUxHQTdI?=
 =?utf-8?B?YnZRN3E3elRVSWhtYVBFWEhtUTBLRmMrVjZ1YTlmN0ZJYloyS3hGTTZPZ0Rh?=
 =?utf-8?B?K2hhbFVOSG1PN0hWaWUvWXNZT1RnUS9UOGtTU0JRNlpvRWN2NUVCa3BkWm0x?=
 =?utf-8?B?aEtqb2pFRkVQN0NTZVAwbTZEcmxNOVhGK3hqbTZ5MUtsSm9JUVNXR1Rzbmw1?=
 =?utf-8?B?R3QxWHkwcTZ3YlNKZmloUStwaHZsclo4WjI0a04vY2cvck0zdmtOZWl5UUFq?=
 =?utf-8?B?WCtEbTFEamowL1FFNlJ6M3pUaFUzNytqeVVndmc1MDkza2g1MktzSDd2K0xW?=
 =?utf-8?B?bVFFVmpIODF0d3RWSmttdGdNVHg5enlBeEVuaXpUUTNaQy8yQ3FneTRDRkJ3?=
 =?utf-8?B?SkxIVEllRnpOQjhvbFpibUVkblBQbWhiMDN4MzF4RnF6RlJrV29GUjd6QTE5?=
 =?utf-8?B?dGdsTmNzemlIWGJwZGpSK0NsL3JyOVVWYW9VWUVGanlONXdndUJzTFNnL1FG?=
 =?utf-8?B?a2t4RExYMTduTm5Vbk5SVDNDMGJiRGJjR0VaenQzMEZCNG5jT3lGS29jcWtH?=
 =?utf-8?B?NVVybUE3NFdaS2JkQk1oaGZuNFcvWGRGNWxrblpuK2JEZ3FkKzcxbVRHWnlK?=
 =?utf-8?B?K2RLVmxjZUF3cVBTVCt3MnFtSVhqMis0UW1iVUFqR09sb1AyWE9aM3VFdmtr?=
 =?utf-8?B?UzAyWHlrZ21GZHFDQWYzVTA4SWZKaGJOQU5WdFZWeFpkT1lWVFl3Tk42dmJO?=
 =?utf-8?B?N2ZyU3lMd20rd0QwY2lTUEFtOVJaQVIxSFhsM0NFMmxNQllXa2FQVlVYK293?=
 =?utf-8?B?Y1g2ZnU5bGpiWXBKQm1iYUdWTVVySkRyMnY3KzVxQlk1RGFPNXNtVmFmckhq?=
 =?utf-8?B?NjBsS1QyWm1SSStkRnJOUWRxQm1XVWs3M2dIQVJZdEdKN1Q2RGU3L01sVU90?=
 =?utf-8?B?eU14b3YvLzZROTZDd0pUMUpuQnFRMFZkUng5cUR3NEV5ZUFxa0NKa05IWkti?=
 =?utf-8?B?d1U2YzFrNlp0NVY2Y1NLNTZ1YVRLUWhTYnhBWHJhTGJONEVnRzR2UEMyZ1FZ?=
 =?utf-8?B?dDJYNUgyNXhKRDEvVzNSMjBTbjdFUjVML2oxaHo4cFpHRTJmNEdqdHhrZjFm?=
 =?utf-8?B?UEo3ZFN2UWt6cjBML0JWdG92K1RlcWtadlkxM3UwQ3hWdjIrY244cVErY051?=
 =?utf-8?B?bGp1ZDVBcWxleHRNdTUxL2pvanluQmtFeFRLZUxCb3VQcWFDbzdCM0FkYU1n?=
 =?utf-8?B?cEVQSmFLeDd4aXBjVWE0ZlR6UXp2dzVXZ0lqdjFYc1ViRThzWDRnTjVDbXJC?=
 =?utf-8?B?MVZsRVhNUXRyTTJ3UjRLd1ZBSWp0U2wzWEFxaGRFQ0oydFoxVzJlbWFKVFF3?=
 =?utf-8?B?aUJTS3hkQlFtZmdMbGdpMzJTK01jb0c5VjEwdXJldy9IRFErSkQ1UC9Rc2JK?=
 =?utf-8?Q?F4EU4GSjuvfGC+9jQzPJdariQ8chz1kgjpZ6Lf6?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB7028.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cmxsUEZuUzdDQng2eGdIRDQvYk1pNjRScU11OTA0b3QvMFZyKzZCa1c3SmZX?=
 =?utf-8?B?MGpwa2lqdWdTQkN6c3h0YXFrYnVsU1ExT25ranh0UE5BUEFNZkROZTFIU3FW?=
 =?utf-8?B?dm9yMHNSNWtzU1RpZVM1Z292TEszcEV4Z01vQUorcGhCUTRJbnNqaGFBLzdV?=
 =?utf-8?B?WDQwRk1uRkMzSnFzMU5oZlVpcUo2cWpNb280MHhaN2hvZ25mSDd4ZmRFaFc0?=
 =?utf-8?B?UFFBWUtuUkIrOXhKTlRSa3Vhc3dhNXVPV0JQVDVYMkkyVFJKaG1KN3daRE1i?=
 =?utf-8?B?Q0JYUjd1QmF4QTdpR2VxdmFKQlB3QnVYY3orbk1Cbmd0dGNRZ0hKUVlVZHhL?=
 =?utf-8?B?bE9zUDN2NDhFVXdtZ2lOQTg2UTZjZXV4VU1ycXJkNVNndTJ3ME80SjFVNmJk?=
 =?utf-8?B?RU1rdTFGcFhvMGUzelh4bnV4SXFaRFM0RlZvTXpGZzM5eVpaSWFMRWQraVhK?=
 =?utf-8?B?Nk1Gd3BhWlBCMDNwSDdRcVRaNDd3eldxT3ovUzFXWlpBQ283ZTVsM05KYzYv?=
 =?utf-8?B?eTIyT3hORkFPSi83OGpKVHVOVVIvUENoVkV4ODBzbDBEOS93OWZ3TDh0SUNv?=
 =?utf-8?B?VlA4TmdvTkphSnZoYWpGY3phalUrb25rSk8rZG5aNFIyR3B5TmRXZUtMbktL?=
 =?utf-8?B?bGdIb0JjNzBZaU1Va3dFU0UwYmxqSnVnLzJzUHQwc1BWRDdXWXRicWo1dkVG?=
 =?utf-8?B?b0RnNzhHUkJsdXo4eFUzaThaWFptcU9ZUnRMQnJIc1BlaFZWZjVmSkxGdGs3?=
 =?utf-8?B?QkwvbGh4NGN1UUtVRTZ2VEc0MDJvVEc0M3FFRTNzdGdoOGdINlUxY20zRE5E?=
 =?utf-8?B?QkJ2RVlTdm9VOUFhTTA3clRSb2hmMmFPdWZJeDhkWE9LVm5RYkdHY0xVYkJj?=
 =?utf-8?B?ZTBWcnZEenZHeG8rNFNudU1hTk15bURReERuL05OcUlRdmR6L2h6aFdEYkdK?=
 =?utf-8?B?RkhLc1d6bFpaL2h4bVEzS25iZ0d3LzhQVnhLRjNMMFlzdm9NU1VIZGZINUk4?=
 =?utf-8?B?NDVRS3hTTTdpSmpwdmdWdnFrdUtINzRBUkRRMFM1eGF2YnloaVhxRlFZUG9Y?=
 =?utf-8?B?MnJhMEhyWWNjc2pHczZ1d2Q0V3dNbC84MU1PZUtScnJ6TkExWHVJeTExbmpK?=
 =?utf-8?B?QjhTa2Q2Q0xUS0hZUzJyRFNzV2djTnhqUWVQWGRaV3E2ekRiL3ZGcmVTVVZj?=
 =?utf-8?B?bG5Ebm94RlZaSGJkZUU1dlhYL0dOUDlxaXZBdWRjQldvblZ5TzBZUEExdFMz?=
 =?utf-8?B?Q1pHTiszMlI4UzZKTTRkRmQxbGNZRy9FeEFqdDMwY0lETjdobUErU0hiZzNF?=
 =?utf-8?B?MDdFNVFaaThBMW1BUStGRGZ5QnRTYS82cjFZNUkxMTBJUXZMMDFCYmRiM2tm?=
 =?utf-8?B?Sk84QVR5aEl1di9ENVFkemZObExiY2dSSEZ5ZWVtamh2SXZxSlpYU1EyeWVj?=
 =?utf-8?B?eTB6cjRpNXZxZUNDcGx1MlNIeXZBWEhxMHNYallqQi9JbFRZaXpVeXh3RUQ4?=
 =?utf-8?B?bHF4REhqM0R5eFBpSXo2ZlRyNWc5bGY2VUdXdWJhS3NxTy94WXUxaks0V3BS?=
 =?utf-8?B?U1IwQVd5K0EwWkdITXFVUGlML0RLcldidWVoaUkyb25pdW8vMGlqU0xTOTFu?=
 =?utf-8?B?V2NQWXl6cGRCL1cweldxN2Y3eUpXNWFmSG1ldDFKb0V0NFdBalhYdGhZMzhi?=
 =?utf-8?B?TFROYkNsM0hQVzhpbmxEMFJCSHBDTFk2aTJzZmMrL1pBekdUMW1GSy9ZS3Rv?=
 =?utf-8?B?NG1GOTFGVmorUGdiOXBxd25jT01PSjFndGdwNzd1WHRJU0g2L29TUDNHMTBs?=
 =?utf-8?B?T1hveTlxWnk2N09QaGxoNEdvak1kN25DYWYxMlM1eXZmMjhMNUtBd3ZOeUxQ?=
 =?utf-8?B?dHZ0KzBzK0ZuUkxPSHJ6ZTZnUzdqeW10VmV0VWl3ZXEycGZPTWVqSDA3OWRw?=
 =?utf-8?B?a05EalhaVWNLejZ3K1FNaFN4MFNUSGEvYUcxU09FVWJERC9jeUN3cWFQell3?=
 =?utf-8?B?bDJtRHI4K0VYMkZESi9JUnRYMXZ3QU1IR2ZYYXZLbm1CMnYrUzlUY2dER0x0?=
 =?utf-8?B?MGc4bkVGcmQvbHFpQTZwOVYrK3dtSmRHU053RzBDZWM1QWVIZGdQQkZDUW5r?=
 =?utf-8?B?SXlxVVl2TU5mWVJ2aHo1YXk5NmdsRG5YNU5QY0VhdWZGQVZ6a0NOZDBJeWxH?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	biat2sg3HBT2UsazXnSl12JDU6X7dy+nmIIpS8LAl0xdFRBAqDhS3bFgft4VDln24DKYzXAgYgbbVOSuC+vao9uUZ6nCYbWuiN1fL/SxnrSizgQoeVUvsSwt8i/2avx0CmMsjafNVvTXzd1Ngf4at3izdkdouAWv39pMKX3OPWiJ8UmkH//gm3LYam5MOwrcsGkoEDyjuaofN670FUuHAuPtDCO0Jy5CEZFXAGZHMVC6vrgXtG3MRTQOgoyc7Zm4xn578oBlXHFunsUxm/GflWgPIAMYf9VIkE1LpUVbtScCvc1Ncd4zSCSctMW32yJ6DPQAiZR7AVIYLB/adAGDFGbkRL0ukaZZnzKe7TdID1/SNDfda/bz5YNcs32BprqnLgcXQL3lQ5n+5Eia7zh2ezVEtcdT/s6qxKPK5F9j0PDuGWUlEXvQluTB3iCUU2PwiMEbh3pAiRNVl2LdkJwL0va+UkKP145uSeiO0qmD0yNm9tA7HrTecw25DXPi3kUFD0z6XaAJdiRpJrXdyjOtngEQcR+bjWQrV2bkZfm09YhnGNpzjY27VscZAFkG+oehGDWpaio2V6635VbM9jtMr+ECKu7APAN1ItV+FEjex4k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf562eb-0dba-478e-070b-08dc91699ae6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB7028.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 20:43:13.7752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zs/u/AiFDjCCGXsyAHC5O+mhSckIJcudx0tvB8v8oE3geNhNHftM+vYDfSquew8fGhzUDMDk4g6nFG3G0z2KpiBD+GeY7/m1h8tUHJu8uh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5815
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_09,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2406200151
X-Proofpoint-GUID: P7DUBGFaZGLRIE4eI_thByMIQ7pBGgTc
X-Proofpoint-ORIG-GUID: P7DUBGFaZGLRIE4eI_thByMIQ7pBGgTc


Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


On 6/20/24 12:28, Kris Van Hees wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  dlibs/x86_64/{5.11.0 => 5.11}/errno.d    | 0
>  dlibs/x86_64/{5.11.0 => 5.11}/io.d       | 0
>  dlibs/x86_64/{5.11.0 => 5.11}/ip.d       | 0
>  dlibs/x86_64/{5.11.0 => 5.11}/lockstat.d | 0
>  dlibs/x86_64/{5.11.0 => 5.11}/net.d      | 0
>  dlibs/x86_64/{5.11.0 => 5.11}/pcap.d     | 0
>  dlibs/x86_64/{5.11.0 => 5.11}/procfs.d   | 0
>  dlibs/x86_64/{5.11.0 => 5.11}/regs.d     | 0
>  dlibs/x86_64/{5.11.0 => 5.11}/sched.d    | 0
>  dlibs/x86_64/{5.11.0 => 5.11}/signal.d   | 0
>  dlibs/x86_64/{5.11.0 => 5.11}/tcp.d      | 0
>  dlibs/x86_64/{5.11.0 => 5.11}/udp.d      | 0
>  dlibs/x86_64/{5.11.0 => 5.11}/unistd.d   | 0
>  dlibs/x86_64/{5.12.0 => 5.12}/errno.d    | 0
>  dlibs/x86_64/{5.12.0 => 5.12}/io.d       | 0
>  dlibs/x86_64/{5.12.0 => 5.12}/ip.d       | 0
>  dlibs/x86_64/{5.12.0 => 5.12}/lockstat.d | 0
>  dlibs/x86_64/{5.12.0 => 5.12}/net.d      | 0
>  dlibs/x86_64/{5.12.0 => 5.12}/pcap.d     | 0
>  dlibs/x86_64/{5.12.0 => 5.12}/procfs.d   | 0
>  dlibs/x86_64/{5.12.0 => 5.12}/regs.d     | 0
>  dlibs/x86_64/{5.12.0 => 5.12}/sched.d    | 0
>  dlibs/x86_64/{5.12.0 => 5.12}/signal.d   | 0
>  dlibs/x86_64/{5.12.0 => 5.12}/tcp.d      | 0
>  dlibs/x86_64/{5.12.0 => 5.12}/udp.d      | 0
>  dlibs/x86_64/{5.12.0 => 5.12}/unistd.d   | 0
>  dlibs/x86_64/{5.14.0 => 5.14}/errno.d    | 0
>  dlibs/x86_64/{5.14.0 => 5.14}/io.d       | 0
>  dlibs/x86_64/{5.14.0 => 5.14}/ip.d       | 0
>  dlibs/x86_64/{5.14.0 => 5.14}/lockstat.d | 0
>  dlibs/x86_64/{5.14.0 => 5.14}/net.d      | 0
>  dlibs/x86_64/{5.14.0 => 5.14}/pcap.d     | 0
>  dlibs/x86_64/{5.14.0 => 5.14}/procfs.d   | 0
>  dlibs/x86_64/{5.14.0 => 5.14}/regs.d     | 0
>  dlibs/x86_64/{5.14.0 => 5.14}/sched.d    | 0
>  dlibs/x86_64/{5.14.0 => 5.14}/signal.d   | 0
>  dlibs/x86_64/{5.14.0 => 5.14}/tcp.d      | 0
>  dlibs/x86_64/{5.14.0 => 5.14}/udp.d      | 0
>  dlibs/x86_64/{5.14.0 => 5.14}/unistd.d   | 0
>  dlibs/x86_64/{5.16.0 => 5.16}/errno.d    | 0
>  dlibs/x86_64/{5.16.0 => 5.16}/io.d       | 0
>  dlibs/x86_64/{5.16.0 => 5.16}/ip.d       | 0
>  dlibs/x86_64/{5.16.0 => 5.16}/lockstat.d | 0
>  dlibs/x86_64/{5.16.0 => 5.16}/net.d      | 0
>  dlibs/x86_64/{5.16.0 => 5.16}/pcap.d     | 0
>  dlibs/x86_64/{5.16.0 => 5.16}/procfs.d   | 0
>  dlibs/x86_64/{5.16.0 => 5.16}/regs.d     | 0
>  dlibs/x86_64/{5.16.0 => 5.16}/sched.d    | 0
>  dlibs/x86_64/{5.16.0 => 5.16}/signal.d   | 0
>  dlibs/x86_64/{5.16.0 => 5.16}/tcp.d      | 0
>  dlibs/x86_64/{5.16.0 => 5.16}/udp.d      | 0
>  dlibs/x86_64/{5.16.0 => 5.16}/unistd.d   | 0
>  dlibs/x86_64/{5.2.0 => 5.2}/errno.d      | 0
>  dlibs/x86_64/{5.2.0 => 5.2}/io.d         | 0
>  dlibs/x86_64/{5.2.0 => 5.2}/ip.d         | 0
>  dlibs/x86_64/{5.2.0 => 5.2}/lockstat.d   | 0
>  dlibs/x86_64/{5.2.0 => 5.2}/net.d        | 0
>  dlibs/x86_64/{5.2.0 => 5.2}/pcap.d       | 0
>  dlibs/x86_64/{5.2.0 => 5.2}/procfs.d     | 0
>  dlibs/x86_64/{5.2.0 => 5.2}/regs.d       | 0
>  dlibs/x86_64/{5.2.0 => 5.2}/sched.d      | 0
>  dlibs/x86_64/{5.2.0 => 5.2}/signal.d     | 0
>  dlibs/x86_64/{5.2.0 => 5.2}/tcp.d        | 0
>  dlibs/x86_64/{5.2.0 => 5.2}/udp.d        | 0
>  dlibs/x86_64/{5.2.0 => 5.2}/unistd.d     | 0
>  dlibs/x86_64/{5.6.0 => 5.6}/errno.d      | 0
>  dlibs/x86_64/{5.6.0 => 5.6}/io.d         | 0
>  dlibs/x86_64/{5.6.0 => 5.6}/ip.d         | 0
>  dlibs/x86_64/{5.6.0 => 5.6}/lockstat.d   | 0
>  dlibs/x86_64/{5.6.0 => 5.6}/net.d        | 0
>  dlibs/x86_64/{5.6.0 => 5.6}/pcap.d       | 0
>  dlibs/x86_64/{5.6.0 => 5.6}/procfs.d     | 0
>  dlibs/x86_64/{5.6.0 => 5.6}/regs.d       | 0
>  dlibs/x86_64/{5.6.0 => 5.6}/sched.d      | 0
>  dlibs/x86_64/{5.6.0 => 5.6}/signal.d     | 0
>  dlibs/x86_64/{5.6.0 => 5.6}/tcp.d        | 0
>  dlibs/x86_64/{5.6.0 => 5.6}/udp.d        | 0
>  dlibs/x86_64/{5.6.0 => 5.6}/unistd.d     | 0
>  dlibs/x86_64/{6.1.0 => 6.1}/errno.d      | 0
>  dlibs/x86_64/{6.1.0 => 6.1}/io.d         | 0
>  dlibs/x86_64/{6.1.0 => 6.1}/ip.d         | 0
>  dlibs/x86_64/{6.1.0 => 6.1}/lockstat.d   | 0
>  dlibs/x86_64/{6.1.0 => 6.1}/net.d        | 0
>  dlibs/x86_64/{6.1.0 => 6.1}/pcap.d       | 0
>  dlibs/x86_64/{6.1.0 => 6.1}/procfs.d     | 0
>  dlibs/x86_64/{6.1.0 => 6.1}/regs.d       | 0
>  dlibs/x86_64/{6.1.0 => 6.1}/sched.d      | 0
>  dlibs/x86_64/{6.1.0 => 6.1}/signal.d     | 0
>  dlibs/x86_64/{6.1.0 => 6.1}/tcp.d        | 0
>  dlibs/x86_64/{6.1.0 => 6.1}/udp.d        | 0
>  dlibs/x86_64/{6.1.0 => 6.1}/unistd.d     | 0
>  dlibs/x86_64/{6.10.0 => 6.10}/errno.d    | 0
>  dlibs/x86_64/{6.10.0 => 6.10}/io.d       | 0
>  dlibs/x86_64/{6.10.0 => 6.10}/ip.d       | 0
>  dlibs/x86_64/{6.10.0 => 6.10}/lockstat.d | 0
>  dlibs/x86_64/{6.10.0 => 6.10}/net.d      | 0
>  dlibs/x86_64/{6.10.0 => 6.10}/pcap.d     | 0
>  dlibs/x86_64/{6.10.0 => 6.10}/procfs.d   | 0
>  dlibs/x86_64/{6.10.0 => 6.10}/regs.d     | 0
>  dlibs/x86_64/{6.10.0 => 6.10}/sched.d    | 0
>  dlibs/x86_64/{6.10.0 => 6.10}/signal.d   | 0
>  dlibs/x86_64/{6.10.0 => 6.10}/tcp.d      | 0
>  dlibs/x86_64/{6.10.0 => 6.10}/udp.d      | 0
>  dlibs/x86_64/{6.10.0 => 6.10}/unistd.d   | 0
>  104 files changed, 0 insertions(+), 0 deletions(-)
>  rename dlibs/x86_64/{5.11.0 => 5.11}/errno.d (100%)
>  rename dlibs/x86_64/{5.11.0 => 5.11}/io.d (100%)
>  rename dlibs/x86_64/{5.11.0 => 5.11}/ip.d (100%)
>  rename dlibs/x86_64/{5.11.0 => 5.11}/lockstat.d (100%)
>  rename dlibs/x86_64/{5.11.0 => 5.11}/net.d (100%)
>  rename dlibs/x86_64/{5.11.0 => 5.11}/pcap.d (100%)
>  rename dlibs/x86_64/{5.11.0 => 5.11}/procfs.d (100%)
>  rename dlibs/x86_64/{5.11.0 => 5.11}/regs.d (100%)
>  rename dlibs/x86_64/{5.11.0 => 5.11}/sched.d (100%)
>  rename dlibs/x86_64/{5.11.0 => 5.11}/signal.d (100%)
>  rename dlibs/x86_64/{5.11.0 => 5.11}/tcp.d (100%)
>  rename dlibs/x86_64/{5.11.0 => 5.11}/udp.d (100%)
>  rename dlibs/x86_64/{5.11.0 => 5.11}/unistd.d (100%)
>  rename dlibs/x86_64/{5.12.0 => 5.12}/errno.d (100%)
>  rename dlibs/x86_64/{5.12.0 => 5.12}/io.d (100%)
>  rename dlibs/x86_64/{5.12.0 => 5.12}/ip.d (100%)
>  rename dlibs/x86_64/{5.12.0 => 5.12}/lockstat.d (100%)
>  rename dlibs/x86_64/{5.12.0 => 5.12}/net.d (100%)
>  rename dlibs/x86_64/{5.12.0 => 5.12}/pcap.d (100%)
>  rename dlibs/x86_64/{5.12.0 => 5.12}/procfs.d (100%)
>  rename dlibs/x86_64/{5.12.0 => 5.12}/regs.d (100%)
>  rename dlibs/x86_64/{5.12.0 => 5.12}/sched.d (100%)
>  rename dlibs/x86_64/{5.12.0 => 5.12}/signal.d (100%)
>  rename dlibs/x86_64/{5.12.0 => 5.12}/tcp.d (100%)
>  rename dlibs/x86_64/{5.12.0 => 5.12}/udp.d (100%)
>  rename dlibs/x86_64/{5.12.0 => 5.12}/unistd.d (100%)
>  rename dlibs/x86_64/{5.14.0 => 5.14}/errno.d (100%)
>  rename dlibs/x86_64/{5.14.0 => 5.14}/io.d (100%)
>  rename dlibs/x86_64/{5.14.0 => 5.14}/ip.d (100%)
>  rename dlibs/x86_64/{5.14.0 => 5.14}/lockstat.d (100%)
>  rename dlibs/x86_64/{5.14.0 => 5.14}/net.d (100%)
>  rename dlibs/x86_64/{5.14.0 => 5.14}/pcap.d (100%)
>  rename dlibs/x86_64/{5.14.0 => 5.14}/procfs.d (100%)
>  rename dlibs/x86_64/{5.14.0 => 5.14}/regs.d (100%)
>  rename dlibs/x86_64/{5.14.0 => 5.14}/sched.d (100%)
>  rename dlibs/x86_64/{5.14.0 => 5.14}/signal.d (100%)
>  rename dlibs/x86_64/{5.14.0 => 5.14}/tcp.d (100%)
>  rename dlibs/x86_64/{5.14.0 => 5.14}/udp.d (100%)
>  rename dlibs/x86_64/{5.14.0 => 5.14}/unistd.d (100%)
>  rename dlibs/x86_64/{5.16.0 => 5.16}/errno.d (100%)
>  rename dlibs/x86_64/{5.16.0 => 5.16}/io.d (100%)
>  rename dlibs/x86_64/{5.16.0 => 5.16}/ip.d (100%)
>  rename dlibs/x86_64/{5.16.0 => 5.16}/lockstat.d (100%)
>  rename dlibs/x86_64/{5.16.0 => 5.16}/net.d (100%)
>  rename dlibs/x86_64/{5.16.0 => 5.16}/pcap.d (100%)
>  rename dlibs/x86_64/{5.16.0 => 5.16}/procfs.d (100%)
>  rename dlibs/x86_64/{5.16.0 => 5.16}/regs.d (100%)
>  rename dlibs/x86_64/{5.16.0 => 5.16}/sched.d (100%)
>  rename dlibs/x86_64/{5.16.0 => 5.16}/signal.d (100%)
>  rename dlibs/x86_64/{5.16.0 => 5.16}/tcp.d (100%)
>  rename dlibs/x86_64/{5.16.0 => 5.16}/udp.d (100%)
>  rename dlibs/x86_64/{5.16.0 => 5.16}/unistd.d (100%)
>  rename dlibs/x86_64/{5.2.0 => 5.2}/errno.d (100%)
>  rename dlibs/x86_64/{5.2.0 => 5.2}/io.d (100%)
>  rename dlibs/x86_64/{5.2.0 => 5.2}/ip.d (100%)
>  rename dlibs/x86_64/{5.2.0 => 5.2}/lockstat.d (100%)
>  rename dlibs/x86_64/{5.2.0 => 5.2}/net.d (100%)
>  rename dlibs/x86_64/{5.2.0 => 5.2}/pcap.d (100%)
>  rename dlibs/x86_64/{5.2.0 => 5.2}/procfs.d (100%)
>  rename dlibs/x86_64/{5.2.0 => 5.2}/regs.d (100%)
>  rename dlibs/x86_64/{5.2.0 => 5.2}/sched.d (100%)
>  rename dlibs/x86_64/{5.2.0 => 5.2}/signal.d (100%)
>  rename dlibs/x86_64/{5.2.0 => 5.2}/tcp.d (100%)
>  rename dlibs/x86_64/{5.2.0 => 5.2}/udp.d (100%)
>  rename dlibs/x86_64/{5.2.0 => 5.2}/unistd.d (100%)
>  rename dlibs/x86_64/{5.6.0 => 5.6}/errno.d (100%)
>  rename dlibs/x86_64/{5.6.0 => 5.6}/io.d (100%)
>  rename dlibs/x86_64/{5.6.0 => 5.6}/ip.d (100%)
>  rename dlibs/x86_64/{5.6.0 => 5.6}/lockstat.d (100%)
>  rename dlibs/x86_64/{5.6.0 => 5.6}/net.d (100%)
>  rename dlibs/x86_64/{5.6.0 => 5.6}/pcap.d (100%)
>  rename dlibs/x86_64/{5.6.0 => 5.6}/procfs.d (100%)
>  rename dlibs/x86_64/{5.6.0 => 5.6}/regs.d (100%)
>  rename dlibs/x86_64/{5.6.0 => 5.6}/sched.d (100%)
>  rename dlibs/x86_64/{5.6.0 => 5.6}/signal.d (100%)
>  rename dlibs/x86_64/{5.6.0 => 5.6}/tcp.d (100%)
>  rename dlibs/x86_64/{5.6.0 => 5.6}/udp.d (100%)
>  rename dlibs/x86_64/{5.6.0 => 5.6}/unistd.d (100%)
>  rename dlibs/x86_64/{6.1.0 => 6.1}/errno.d (100%)
>  rename dlibs/x86_64/{6.1.0 => 6.1}/io.d (100%)
>  rename dlibs/x86_64/{6.1.0 => 6.1}/ip.d (100%)
>  rename dlibs/x86_64/{6.1.0 => 6.1}/lockstat.d (100%)
>  rename dlibs/x86_64/{6.1.0 => 6.1}/net.d (100%)
>  rename dlibs/x86_64/{6.1.0 => 6.1}/pcap.d (100%)
>  rename dlibs/x86_64/{6.1.0 => 6.1}/procfs.d (100%)
>  rename dlibs/x86_64/{6.1.0 => 6.1}/regs.d (100%)
>  rename dlibs/x86_64/{6.1.0 => 6.1}/sched.d (100%)
>  rename dlibs/x86_64/{6.1.0 => 6.1}/signal.d (100%)
>  rename dlibs/x86_64/{6.1.0 => 6.1}/tcp.d (100%)
>  rename dlibs/x86_64/{6.1.0 => 6.1}/udp.d (100%)
>  rename dlibs/x86_64/{6.1.0 => 6.1}/unistd.d (100%)
>  rename dlibs/x86_64/{6.10.0 => 6.10}/errno.d (100%)
>  rename dlibs/x86_64/{6.10.0 => 6.10}/io.d (100%)
>  rename dlibs/x86_64/{6.10.0 => 6.10}/ip.d (100%)
>  rename dlibs/x86_64/{6.10.0 => 6.10}/lockstat.d (100%)
>  rename dlibs/x86_64/{6.10.0 => 6.10}/net.d (100%)
>  rename dlibs/x86_64/{6.10.0 => 6.10}/pcap.d (100%)
>  rename dlibs/x86_64/{6.10.0 => 6.10}/procfs.d (100%)
>  rename dlibs/x86_64/{6.10.0 => 6.10}/regs.d (100%)
>  rename dlibs/x86_64/{6.10.0 => 6.10}/sched.d (100%)
>  rename dlibs/x86_64/{6.10.0 => 6.10}/signal.d (100%)
>  rename dlibs/x86_64/{6.10.0 => 6.10}/tcp.d (100%)
>  rename dlibs/x86_64/{6.10.0 => 6.10}/udp.d (100%)
>  rename dlibs/x86_64/{6.10.0 => 6.10}/unistd.d (100%)
> 
> diff --git a/dlibs/x86_64/5.11.0/errno.d b/dlibs/x86_64/5.11/errno.d
> similarity index 100%
> rename from dlibs/x86_64/5.11.0/errno.d
> rename to dlibs/x86_64/5.11/errno.d
> diff --git a/dlibs/x86_64/5.11.0/io.d b/dlibs/x86_64/5.11/io.d
> similarity index 100%
> rename from dlibs/x86_64/5.11.0/io.d
> rename to dlibs/x86_64/5.11/io.d
> diff --git a/dlibs/x86_64/5.11.0/ip.d b/dlibs/x86_64/5.11/ip.d
> similarity index 100%
> rename from dlibs/x86_64/5.11.0/ip.d
> rename to dlibs/x86_64/5.11/ip.d
> diff --git a/dlibs/x86_64/5.11.0/lockstat.d b/dlibs/x86_64/5.11/lockstat.d
> similarity index 100%
> rename from dlibs/x86_64/5.11.0/lockstat.d
> rename to dlibs/x86_64/5.11/lockstat.d
> diff --git a/dlibs/x86_64/5.11.0/net.d b/dlibs/x86_64/5.11/net.d
> similarity index 100%
> rename from dlibs/x86_64/5.11.0/net.d
> rename to dlibs/x86_64/5.11/net.d
> diff --git a/dlibs/x86_64/5.11.0/pcap.d b/dlibs/x86_64/5.11/pcap.d
> similarity index 100%
> rename from dlibs/x86_64/5.11.0/pcap.d
> rename to dlibs/x86_64/5.11/pcap.d
> diff --git a/dlibs/x86_64/5.11.0/procfs.d b/dlibs/x86_64/5.11/procfs.d
> similarity index 100%
> rename from dlibs/x86_64/5.11.0/procfs.d
> rename to dlibs/x86_64/5.11/procfs.d
> diff --git a/dlibs/x86_64/5.11.0/regs.d b/dlibs/x86_64/5.11/regs.d
> similarity index 100%
> rename from dlibs/x86_64/5.11.0/regs.d
> rename to dlibs/x86_64/5.11/regs.d
> diff --git a/dlibs/x86_64/5.11.0/sched.d b/dlibs/x86_64/5.11/sched.d
> similarity index 100%
> rename from dlibs/x86_64/5.11.0/sched.d
> rename to dlibs/x86_64/5.11/sched.d
> diff --git a/dlibs/x86_64/5.11.0/signal.d b/dlibs/x86_64/5.11/signal.d
> similarity index 100%
> rename from dlibs/x86_64/5.11.0/signal.d
> rename to dlibs/x86_64/5.11/signal.d
> diff --git a/dlibs/x86_64/5.11.0/tcp.d b/dlibs/x86_64/5.11/tcp.d
> similarity index 100%
> rename from dlibs/x86_64/5.11.0/tcp.d
> rename to dlibs/x86_64/5.11/tcp.d
> diff --git a/dlibs/x86_64/5.11.0/udp.d b/dlibs/x86_64/5.11/udp.d
> similarity index 100%
> rename from dlibs/x86_64/5.11.0/udp.d
> rename to dlibs/x86_64/5.11/udp.d
> diff --git a/dlibs/x86_64/5.11.0/unistd.d b/dlibs/x86_64/5.11/unistd.d
> similarity index 100%
> rename from dlibs/x86_64/5.11.0/unistd.d
> rename to dlibs/x86_64/5.11/unistd.d
> diff --git a/dlibs/x86_64/5.12.0/errno.d b/dlibs/x86_64/5.12/errno.d
> similarity index 100%
> rename from dlibs/x86_64/5.12.0/errno.d
> rename to dlibs/x86_64/5.12/errno.d
> diff --git a/dlibs/x86_64/5.12.0/io.d b/dlibs/x86_64/5.12/io.d
> similarity index 100%
> rename from dlibs/x86_64/5.12.0/io.d
> rename to dlibs/x86_64/5.12/io.d
> diff --git a/dlibs/x86_64/5.12.0/ip.d b/dlibs/x86_64/5.12/ip.d
> similarity index 100%
> rename from dlibs/x86_64/5.12.0/ip.d
> rename to dlibs/x86_64/5.12/ip.d
> diff --git a/dlibs/x86_64/5.12.0/lockstat.d b/dlibs/x86_64/5.12/lockstat.d
> similarity index 100%
> rename from dlibs/x86_64/5.12.0/lockstat.d
> rename to dlibs/x86_64/5.12/lockstat.d
> diff --git a/dlibs/x86_64/5.12.0/net.d b/dlibs/x86_64/5.12/net.d
> similarity index 100%
> rename from dlibs/x86_64/5.12.0/net.d
> rename to dlibs/x86_64/5.12/net.d
> diff --git a/dlibs/x86_64/5.12.0/pcap.d b/dlibs/x86_64/5.12/pcap.d
> similarity index 100%
> rename from dlibs/x86_64/5.12.0/pcap.d
> rename to dlibs/x86_64/5.12/pcap.d
> diff --git a/dlibs/x86_64/5.12.0/procfs.d b/dlibs/x86_64/5.12/procfs.d
> similarity index 100%
> rename from dlibs/x86_64/5.12.0/procfs.d
> rename to dlibs/x86_64/5.12/procfs.d
> diff --git a/dlibs/x86_64/5.12.0/regs.d b/dlibs/x86_64/5.12/regs.d
> similarity index 100%
> rename from dlibs/x86_64/5.12.0/regs.d
> rename to dlibs/x86_64/5.12/regs.d
> diff --git a/dlibs/x86_64/5.12.0/sched.d b/dlibs/x86_64/5.12/sched.d
> similarity index 100%
> rename from dlibs/x86_64/5.12.0/sched.d
> rename to dlibs/x86_64/5.12/sched.d
> diff --git a/dlibs/x86_64/5.12.0/signal.d b/dlibs/x86_64/5.12/signal.d
> similarity index 100%
> rename from dlibs/x86_64/5.12.0/signal.d
> rename to dlibs/x86_64/5.12/signal.d
> diff --git a/dlibs/x86_64/5.12.0/tcp.d b/dlibs/x86_64/5.12/tcp.d
> similarity index 100%
> rename from dlibs/x86_64/5.12.0/tcp.d
> rename to dlibs/x86_64/5.12/tcp.d
> diff --git a/dlibs/x86_64/5.12.0/udp.d b/dlibs/x86_64/5.12/udp.d
> similarity index 100%
> rename from dlibs/x86_64/5.12.0/udp.d
> rename to dlibs/x86_64/5.12/udp.d
> diff --git a/dlibs/x86_64/5.12.0/unistd.d b/dlibs/x86_64/5.12/unistd.d
> similarity index 100%
> rename from dlibs/x86_64/5.12.0/unistd.d
> rename to dlibs/x86_64/5.12/unistd.d
> diff --git a/dlibs/x86_64/5.14.0/errno.d b/dlibs/x86_64/5.14/errno.d
> similarity index 100%
> rename from dlibs/x86_64/5.14.0/errno.d
> rename to dlibs/x86_64/5.14/errno.d
> diff --git a/dlibs/x86_64/5.14.0/io.d b/dlibs/x86_64/5.14/io.d
> similarity index 100%
> rename from dlibs/x86_64/5.14.0/io.d
> rename to dlibs/x86_64/5.14/io.d
> diff --git a/dlibs/x86_64/5.14.0/ip.d b/dlibs/x86_64/5.14/ip.d
> similarity index 100%
> rename from dlibs/x86_64/5.14.0/ip.d
> rename to dlibs/x86_64/5.14/ip.d
> diff --git a/dlibs/x86_64/5.14.0/lockstat.d b/dlibs/x86_64/5.14/lockstat.d
> similarity index 100%
> rename from dlibs/x86_64/5.14.0/lockstat.d
> rename to dlibs/x86_64/5.14/lockstat.d
> diff --git a/dlibs/x86_64/5.14.0/net.d b/dlibs/x86_64/5.14/net.d
> similarity index 100%
> rename from dlibs/x86_64/5.14.0/net.d
> rename to dlibs/x86_64/5.14/net.d
> diff --git a/dlibs/x86_64/5.14.0/pcap.d b/dlibs/x86_64/5.14/pcap.d
> similarity index 100%
> rename from dlibs/x86_64/5.14.0/pcap.d
> rename to dlibs/x86_64/5.14/pcap.d
> diff --git a/dlibs/x86_64/5.14.0/procfs.d b/dlibs/x86_64/5.14/procfs.d
> similarity index 100%
> rename from dlibs/x86_64/5.14.0/procfs.d
> rename to dlibs/x86_64/5.14/procfs.d
> diff --git a/dlibs/x86_64/5.14.0/regs.d b/dlibs/x86_64/5.14/regs.d
> similarity index 100%
> rename from dlibs/x86_64/5.14.0/regs.d
> rename to dlibs/x86_64/5.14/regs.d
> diff --git a/dlibs/x86_64/5.14.0/sched.d b/dlibs/x86_64/5.14/sched.d
> similarity index 100%
> rename from dlibs/x86_64/5.14.0/sched.d
> rename to dlibs/x86_64/5.14/sched.d
> diff --git a/dlibs/x86_64/5.14.0/signal.d b/dlibs/x86_64/5.14/signal.d
> similarity index 100%
> rename from dlibs/x86_64/5.14.0/signal.d
> rename to dlibs/x86_64/5.14/signal.d
> diff --git a/dlibs/x86_64/5.14.0/tcp.d b/dlibs/x86_64/5.14/tcp.d
> similarity index 100%
> rename from dlibs/x86_64/5.14.0/tcp.d
> rename to dlibs/x86_64/5.14/tcp.d
> diff --git a/dlibs/x86_64/5.14.0/udp.d b/dlibs/x86_64/5.14/udp.d
> similarity index 100%
> rename from dlibs/x86_64/5.14.0/udp.d
> rename to dlibs/x86_64/5.14/udp.d
> diff --git a/dlibs/x86_64/5.14.0/unistd.d b/dlibs/x86_64/5.14/unistd.d
> similarity index 100%
> rename from dlibs/x86_64/5.14.0/unistd.d
> rename to dlibs/x86_64/5.14/unistd.d
> diff --git a/dlibs/x86_64/5.16.0/errno.d b/dlibs/x86_64/5.16/errno.d
> similarity index 100%
> rename from dlibs/x86_64/5.16.0/errno.d
> rename to dlibs/x86_64/5.16/errno.d
> diff --git a/dlibs/x86_64/5.16.0/io.d b/dlibs/x86_64/5.16/io.d
> similarity index 100%
> rename from dlibs/x86_64/5.16.0/io.d
> rename to dlibs/x86_64/5.16/io.d
> diff --git a/dlibs/x86_64/5.16.0/ip.d b/dlibs/x86_64/5.16/ip.d
> similarity index 100%
> rename from dlibs/x86_64/5.16.0/ip.d
> rename to dlibs/x86_64/5.16/ip.d
> diff --git a/dlibs/x86_64/5.16.0/lockstat.d b/dlibs/x86_64/5.16/lockstat.d
> similarity index 100%
> rename from dlibs/x86_64/5.16.0/lockstat.d
> rename to dlibs/x86_64/5.16/lockstat.d
> diff --git a/dlibs/x86_64/5.16.0/net.d b/dlibs/x86_64/5.16/net.d
> similarity index 100%
> rename from dlibs/x86_64/5.16.0/net.d
> rename to dlibs/x86_64/5.16/net.d
> diff --git a/dlibs/x86_64/5.16.0/pcap.d b/dlibs/x86_64/5.16/pcap.d
> similarity index 100%
> rename from dlibs/x86_64/5.16.0/pcap.d
> rename to dlibs/x86_64/5.16/pcap.d
> diff --git a/dlibs/x86_64/5.16.0/procfs.d b/dlibs/x86_64/5.16/procfs.d
> similarity index 100%
> rename from dlibs/x86_64/5.16.0/procfs.d
> rename to dlibs/x86_64/5.16/procfs.d
> diff --git a/dlibs/x86_64/5.16.0/regs.d b/dlibs/x86_64/5.16/regs.d
> similarity index 100%
> rename from dlibs/x86_64/5.16.0/regs.d
> rename to dlibs/x86_64/5.16/regs.d
> diff --git a/dlibs/x86_64/5.16.0/sched.d b/dlibs/x86_64/5.16/sched.d
> similarity index 100%
> rename from dlibs/x86_64/5.16.0/sched.d
> rename to dlibs/x86_64/5.16/sched.d
> diff --git a/dlibs/x86_64/5.16.0/signal.d b/dlibs/x86_64/5.16/signal.d
> similarity index 100%
> rename from dlibs/x86_64/5.16.0/signal.d
> rename to dlibs/x86_64/5.16/signal.d
> diff --git a/dlibs/x86_64/5.16.0/tcp.d b/dlibs/x86_64/5.16/tcp.d
> similarity index 100%
> rename from dlibs/x86_64/5.16.0/tcp.d
> rename to dlibs/x86_64/5.16/tcp.d
> diff --git a/dlibs/x86_64/5.16.0/udp.d b/dlibs/x86_64/5.16/udp.d
> similarity index 100%
> rename from dlibs/x86_64/5.16.0/udp.d
> rename to dlibs/x86_64/5.16/udp.d
> diff --git a/dlibs/x86_64/5.16.0/unistd.d b/dlibs/x86_64/5.16/unistd.d
> similarity index 100%
> rename from dlibs/x86_64/5.16.0/unistd.d
> rename to dlibs/x86_64/5.16/unistd.d
> diff --git a/dlibs/x86_64/5.2.0/errno.d b/dlibs/x86_64/5.2/errno.d
> similarity index 100%
> rename from dlibs/x86_64/5.2.0/errno.d
> rename to dlibs/x86_64/5.2/errno.d
> diff --git a/dlibs/x86_64/5.2.0/io.d b/dlibs/x86_64/5.2/io.d
> similarity index 100%
> rename from dlibs/x86_64/5.2.0/io.d
> rename to dlibs/x86_64/5.2/io.d
> diff --git a/dlibs/x86_64/5.2.0/ip.d b/dlibs/x86_64/5.2/ip.d
> similarity index 100%
> rename from dlibs/x86_64/5.2.0/ip.d
> rename to dlibs/x86_64/5.2/ip.d
> diff --git a/dlibs/x86_64/5.2.0/lockstat.d b/dlibs/x86_64/5.2/lockstat.d
> similarity index 100%
> rename from dlibs/x86_64/5.2.0/lockstat.d
> rename to dlibs/x86_64/5.2/lockstat.d
> diff --git a/dlibs/x86_64/5.2.0/net.d b/dlibs/x86_64/5.2/net.d
> similarity index 100%
> rename from dlibs/x86_64/5.2.0/net.d
> rename to dlibs/x86_64/5.2/net.d
> diff --git a/dlibs/x86_64/5.2.0/pcap.d b/dlibs/x86_64/5.2/pcap.d
> similarity index 100%
> rename from dlibs/x86_64/5.2.0/pcap.d
> rename to dlibs/x86_64/5.2/pcap.d
> diff --git a/dlibs/x86_64/5.2.0/procfs.d b/dlibs/x86_64/5.2/procfs.d
> similarity index 100%
> rename from dlibs/x86_64/5.2.0/procfs.d
> rename to dlibs/x86_64/5.2/procfs.d
> diff --git a/dlibs/x86_64/5.2.0/regs.d b/dlibs/x86_64/5.2/regs.d
> similarity index 100%
> rename from dlibs/x86_64/5.2.0/regs.d
> rename to dlibs/x86_64/5.2/regs.d
> diff --git a/dlibs/x86_64/5.2.0/sched.d b/dlibs/x86_64/5.2/sched.d
> similarity index 100%
> rename from dlibs/x86_64/5.2.0/sched.d
> rename to dlibs/x86_64/5.2/sched.d
> diff --git a/dlibs/x86_64/5.2.0/signal.d b/dlibs/x86_64/5.2/signal.d
> similarity index 100%
> rename from dlibs/x86_64/5.2.0/signal.d
> rename to dlibs/x86_64/5.2/signal.d
> diff --git a/dlibs/x86_64/5.2.0/tcp.d b/dlibs/x86_64/5.2/tcp.d
> similarity index 100%
> rename from dlibs/x86_64/5.2.0/tcp.d
> rename to dlibs/x86_64/5.2/tcp.d
> diff --git a/dlibs/x86_64/5.2.0/udp.d b/dlibs/x86_64/5.2/udp.d
> similarity index 100%
> rename from dlibs/x86_64/5.2.0/udp.d
> rename to dlibs/x86_64/5.2/udp.d
> diff --git a/dlibs/x86_64/5.2.0/unistd.d b/dlibs/x86_64/5.2/unistd.d
> similarity index 100%
> rename from dlibs/x86_64/5.2.0/unistd.d
> rename to dlibs/x86_64/5.2/unistd.d
> diff --git a/dlibs/x86_64/5.6.0/errno.d b/dlibs/x86_64/5.6/errno.d
> similarity index 100%
> rename from dlibs/x86_64/5.6.0/errno.d
> rename to dlibs/x86_64/5.6/errno.d
> diff --git a/dlibs/x86_64/5.6.0/io.d b/dlibs/x86_64/5.6/io.d
> similarity index 100%
> rename from dlibs/x86_64/5.6.0/io.d
> rename to dlibs/x86_64/5.6/io.d
> diff --git a/dlibs/x86_64/5.6.0/ip.d b/dlibs/x86_64/5.6/ip.d
> similarity index 100%
> rename from dlibs/x86_64/5.6.0/ip.d
> rename to dlibs/x86_64/5.6/ip.d
> diff --git a/dlibs/x86_64/5.6.0/lockstat.d b/dlibs/x86_64/5.6/lockstat.d
> similarity index 100%
> rename from dlibs/x86_64/5.6.0/lockstat.d
> rename to dlibs/x86_64/5.6/lockstat.d
> diff --git a/dlibs/x86_64/5.6.0/net.d b/dlibs/x86_64/5.6/net.d
> similarity index 100%
> rename from dlibs/x86_64/5.6.0/net.d
> rename to dlibs/x86_64/5.6/net.d
> diff --git a/dlibs/x86_64/5.6.0/pcap.d b/dlibs/x86_64/5.6/pcap.d
> similarity index 100%
> rename from dlibs/x86_64/5.6.0/pcap.d
> rename to dlibs/x86_64/5.6/pcap.d
> diff --git a/dlibs/x86_64/5.6.0/procfs.d b/dlibs/x86_64/5.6/procfs.d
> similarity index 100%
> rename from dlibs/x86_64/5.6.0/procfs.d
> rename to dlibs/x86_64/5.6/procfs.d
> diff --git a/dlibs/x86_64/5.6.0/regs.d b/dlibs/x86_64/5.6/regs.d
> similarity index 100%
> rename from dlibs/x86_64/5.6.0/regs.d
> rename to dlibs/x86_64/5.6/regs.d
> diff --git a/dlibs/x86_64/5.6.0/sched.d b/dlibs/x86_64/5.6/sched.d
> similarity index 100%
> rename from dlibs/x86_64/5.6.0/sched.d
> rename to dlibs/x86_64/5.6/sched.d
> diff --git a/dlibs/x86_64/5.6.0/signal.d b/dlibs/x86_64/5.6/signal.d
> similarity index 100%
> rename from dlibs/x86_64/5.6.0/signal.d
> rename to dlibs/x86_64/5.6/signal.d
> diff --git a/dlibs/x86_64/5.6.0/tcp.d b/dlibs/x86_64/5.6/tcp.d
> similarity index 100%
> rename from dlibs/x86_64/5.6.0/tcp.d
> rename to dlibs/x86_64/5.6/tcp.d
> diff --git a/dlibs/x86_64/5.6.0/udp.d b/dlibs/x86_64/5.6/udp.d
> similarity index 100%
> rename from dlibs/x86_64/5.6.0/udp.d
> rename to dlibs/x86_64/5.6/udp.d
> diff --git a/dlibs/x86_64/5.6.0/unistd.d b/dlibs/x86_64/5.6/unistd.d
> similarity index 100%
> rename from dlibs/x86_64/5.6.0/unistd.d
> rename to dlibs/x86_64/5.6/unistd.d
> diff --git a/dlibs/x86_64/6.1.0/errno.d b/dlibs/x86_64/6.1/errno.d
> similarity index 100%
> rename from dlibs/x86_64/6.1.0/errno.d
> rename to dlibs/x86_64/6.1/errno.d
> diff --git a/dlibs/x86_64/6.1.0/io.d b/dlibs/x86_64/6.1/io.d
> similarity index 100%
> rename from dlibs/x86_64/6.1.0/io.d
> rename to dlibs/x86_64/6.1/io.d
> diff --git a/dlibs/x86_64/6.1.0/ip.d b/dlibs/x86_64/6.1/ip.d
> similarity index 100%
> rename from dlibs/x86_64/6.1.0/ip.d
> rename to dlibs/x86_64/6.1/ip.d
> diff --git a/dlibs/x86_64/6.1.0/lockstat.d b/dlibs/x86_64/6.1/lockstat.d
> similarity index 100%
> rename from dlibs/x86_64/6.1.0/lockstat.d
> rename to dlibs/x86_64/6.1/lockstat.d
> diff --git a/dlibs/x86_64/6.1.0/net.d b/dlibs/x86_64/6.1/net.d
> similarity index 100%
> rename from dlibs/x86_64/6.1.0/net.d
> rename to dlibs/x86_64/6.1/net.d
> diff --git a/dlibs/x86_64/6.1.0/pcap.d b/dlibs/x86_64/6.1/pcap.d
> similarity index 100%
> rename from dlibs/x86_64/6.1.0/pcap.d
> rename to dlibs/x86_64/6.1/pcap.d
> diff --git a/dlibs/x86_64/6.1.0/procfs.d b/dlibs/x86_64/6.1/procfs.d
> similarity index 100%
> rename from dlibs/x86_64/6.1.0/procfs.d
> rename to dlibs/x86_64/6.1/procfs.d
> diff --git a/dlibs/x86_64/6.1.0/regs.d b/dlibs/x86_64/6.1/regs.d
> similarity index 100%
> rename from dlibs/x86_64/6.1.0/regs.d
> rename to dlibs/x86_64/6.1/regs.d
> diff --git a/dlibs/x86_64/6.1.0/sched.d b/dlibs/x86_64/6.1/sched.d
> similarity index 100%
> rename from dlibs/x86_64/6.1.0/sched.d
> rename to dlibs/x86_64/6.1/sched.d
> diff --git a/dlibs/x86_64/6.1.0/signal.d b/dlibs/x86_64/6.1/signal.d
> similarity index 100%
> rename from dlibs/x86_64/6.1.0/signal.d
> rename to dlibs/x86_64/6.1/signal.d
> diff --git a/dlibs/x86_64/6.1.0/tcp.d b/dlibs/x86_64/6.1/tcp.d
> similarity index 100%
> rename from dlibs/x86_64/6.1.0/tcp.d
> rename to dlibs/x86_64/6.1/tcp.d
> diff --git a/dlibs/x86_64/6.1.0/udp.d b/dlibs/x86_64/6.1/udp.d
> similarity index 100%
> rename from dlibs/x86_64/6.1.0/udp.d
> rename to dlibs/x86_64/6.1/udp.d
> diff --git a/dlibs/x86_64/6.1.0/unistd.d b/dlibs/x86_64/6.1/unistd.d
> similarity index 100%
> rename from dlibs/x86_64/6.1.0/unistd.d
> rename to dlibs/x86_64/6.1/unistd.d
> diff --git a/dlibs/x86_64/6.10.0/errno.d b/dlibs/x86_64/6.10/errno.d
> similarity index 100%
> rename from dlibs/x86_64/6.10.0/errno.d
> rename to dlibs/x86_64/6.10/errno.d
> diff --git a/dlibs/x86_64/6.10.0/io.d b/dlibs/x86_64/6.10/io.d
> similarity index 100%
> rename from dlibs/x86_64/6.10.0/io.d
> rename to dlibs/x86_64/6.10/io.d
> diff --git a/dlibs/x86_64/6.10.0/ip.d b/dlibs/x86_64/6.10/ip.d
> similarity index 100%
> rename from dlibs/x86_64/6.10.0/ip.d
> rename to dlibs/x86_64/6.10/ip.d
> diff --git a/dlibs/x86_64/6.10.0/lockstat.d b/dlibs/x86_64/6.10/lockstat.d
> similarity index 100%
> rename from dlibs/x86_64/6.10.0/lockstat.d
> rename to dlibs/x86_64/6.10/lockstat.d
> diff --git a/dlibs/x86_64/6.10.0/net.d b/dlibs/x86_64/6.10/net.d
> similarity index 100%
> rename from dlibs/x86_64/6.10.0/net.d
> rename to dlibs/x86_64/6.10/net.d
> diff --git a/dlibs/x86_64/6.10.0/pcap.d b/dlibs/x86_64/6.10/pcap.d
> similarity index 100%
> rename from dlibs/x86_64/6.10.0/pcap.d
> rename to dlibs/x86_64/6.10/pcap.d
> diff --git a/dlibs/x86_64/6.10.0/procfs.d b/dlibs/x86_64/6.10/procfs.d
> similarity index 100%
> rename from dlibs/x86_64/6.10.0/procfs.d
> rename to dlibs/x86_64/6.10/procfs.d
> diff --git a/dlibs/x86_64/6.10.0/regs.d b/dlibs/x86_64/6.10/regs.d
> similarity index 100%
> rename from dlibs/x86_64/6.10.0/regs.d
> rename to dlibs/x86_64/6.10/regs.d
> diff --git a/dlibs/x86_64/6.10.0/sched.d b/dlibs/x86_64/6.10/sched.d
> similarity index 100%
> rename from dlibs/x86_64/6.10.0/sched.d
> rename to dlibs/x86_64/6.10/sched.d
> diff --git a/dlibs/x86_64/6.10.0/signal.d b/dlibs/x86_64/6.10/signal.d
> similarity index 100%
> rename from dlibs/x86_64/6.10.0/signal.d
> rename to dlibs/x86_64/6.10/signal.d
> diff --git a/dlibs/x86_64/6.10.0/tcp.d b/dlibs/x86_64/6.10/tcp.d
> similarity index 100%
> rename from dlibs/x86_64/6.10.0/tcp.d
> rename to dlibs/x86_64/6.10/tcp.d
> diff --git a/dlibs/x86_64/6.10.0/udp.d b/dlibs/x86_64/6.10/udp.d
> similarity index 100%
> rename from dlibs/x86_64/6.10.0/udp.d
> rename to dlibs/x86_64/6.10/udp.d
> diff --git a/dlibs/x86_64/6.10.0/unistd.d b/dlibs/x86_64/6.10/unistd.d
> similarity index 100%
> rename from dlibs/x86_64/6.10.0/unistd.d
> rename to dlibs/x86_64/6.10/unistd.d

