Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7991A10F2
	for <dtrace@lists.linux.dev>; Sat, 25 May 2024 01:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716598851; cv=fail; b=Yjs/H3pCoUADTe3Z7XBMcGHj8EREnZNvwXXfXwaJWfZnzpPNXm0bPbjzCL5iBbjrqa73NIXDgpS8ypatyFdD7IQzC6fortAR2iDxK0EGJ+efiYU7H6yx7JXfw3TOLUOTEdYV2KISABycTbKXOb8xRy/LiCNQ0L3JuUECrQHjMv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716598851; c=relaxed/simple;
	bh=mPZvyrW1D/pTPzxdjHwTQ0Vv8L3TbsV8/vNiZaE+V+o=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bcwl/SxVPRqwkWljXO+UoAGZeL3KWrLWCMPtiQaYcJ9bs8DtdedAnULa8n7pcQq2Of10utbi7pvSOn1t+FKNYjSV/KkoO0bPrGoGwx2y9Qrlv/z9TsU0v/iyccvzYxMOCEi+3AMT1Q5hwcq1x9AzUdmranecF3uztPJzr6UJe6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VInfzdji; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HQW3x1cs; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VInfzdji";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HQW3x1cs"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44ONxIZr000954
	for <dtrace@lists.linux.dev>; Sat, 25 May 2024 01:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=pJvBVab5gzMe/08K2+8Z6EoL2IMplpY2Gyecw4HNdjs=;
 b=VInfzdjiG2Dx47SUEEUIXXsJ6Nlec89eI5q2G6rc/o3UMOnajjfaeyPXetu0v/mzK8KO
 94N+cvcbFGrKnSF9tWwSINeuD29nIEpKB3ws6HChvVXA6kWulpwP+MK63NTw0yNvIOJ8
 ozlZfTAWgljsa6L4cP4Ul8ldwinp09hHFTL83/CUE2fuVOXk7kesqkrIYx3p54NUqMCB
 6TE4hDIiZES7H1yMpW+OVl1GUuHy5XANQCzMG1VQJHT37XHpT6k1WhRp0x3dh0UvkuQf
 tL+i3IMXDBcy9iXjdatPyhTOx9J2dMQdPBRYEKi7ip+5SecnGNeez8P0wvdJymCWp57P 7Q== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y6jx2negn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 25 May 2024 01:00:48 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44OM31QF013677
	for <dtrace@lists.linux.dev>; Sat, 25 May 2024 01:00:47 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3y6jsbx43b-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 25 May 2024 01:00:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4jfZjb6dtKZ0FyZkGhFRMSa55Jhs4XO9LgFYj7ZGJe1yh8IAWs9ErwEun9zfhAU10QwNfxp8Z9UvcpNML7/SKVw7mGcCt52oZ/CYqLmY+In/kLziPRnw5Aol4hhiLBBURlR/qQmRpd1hCOdhKPUEIUsHhyLonqMgNJ3Hw6sQWurBcBfMrTYOhSGiDhtV9QSCiqKBlzPMZol+nLFCIWtNxmb14pO1qWcwPOfYUE5JN9AkpLPy52i2ncugcCoMJZGChX7XpyJ3qEntIHx2/mBdXWqlkp2ojhcZ+8blJHrykY6/cGNJsJuiczLTMFpNQOCA/hYjYTvIySFLiU1NSdyIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJvBVab5gzMe/08K2+8Z6EoL2IMplpY2Gyecw4HNdjs=;
 b=JrU4ZqGVEzuhJYpno3JMWiXQ78MF2Yyi8HQSSe0xSAvoFkC1GvXUtvKCtJwsM1XDTsFsMned2KNnHbg97aYRsLc0yihTHnxpl0QV3GGaFvoZS8Zw/5A6aZtFw2JRTcDl8zfOLMckD/haedZolhf+D7lJBPWwNb1CXyI0XPGEsvMSOdnme7jkJqtyh2yMDYQupl2G7rxNlYMe3Ws6sKlDIfa3ejFkGJ2QFmTh94d8x2x3xZfiIqqyOV1bVUwIhsGbl7IorDQ1rVUZBl2L0Gsc0zts45KFkxOtRtWs3QdwTJRRKM/6PZ0dn/UjEkoQKE1srgWi42kVAWFX5YtCOht4Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJvBVab5gzMe/08K2+8Z6EoL2IMplpY2Gyecw4HNdjs=;
 b=HQW3x1csC6wMWtA6wI/RZayjvEhqXGa3T6JTQ9qetkIXmjz68JUInGitwysHtywYH/lAkppVL98OS3q1SQyfsMf1zOLOpQxwC2OoCDCaNJ1YrAQ2r8FqHj8jxFtOkVMencvB2OWmW4TLtbhOFzd3gEzlhgNIqe0RkRZhsgEti9U=
Received: from PH0PR10MB7028.namprd10.prod.outlook.com (2603:10b6:510:281::9)
 by PH0PR10MB6436.namprd10.prod.outlook.com (2603:10b6:510:21c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.27; Sat, 25 May
 2024 01:00:44 +0000
Received: from PH0PR10MB7028.namprd10.prod.outlook.com
 ([fe80::657:da26:8778:ad24]) by PH0PR10MB7028.namprd10.prod.outlook.com
 ([fe80::657:da26:8778:ad24%4]) with mapi id 15.20.7611.016; Sat, 25 May 2024
 01:00:44 +0000
Message-ID: <8239c11d-da86-47c7-9575-1537ede3e64b@oracle.com>
Date: Fri, 24 May 2024 19:00:43 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] config: surpress output from check-bpfc-option-rule
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <PH8PR10MB629210A71B9B0171DA698F97C2F52@PH8PR10MB6292.namprd10.prod.outlook.com>
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <PH8PR10MB629210A71B9B0171DA698F97C2F52@PH8PR10MB6292.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYXPR02CA0067.namprd02.prod.outlook.com
 (2603:10b6:930:cd::18) To PH0PR10MB7028.namprd10.prod.outlook.com
 (2603:10b6:510:281::9)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB7028:EE_|PH0PR10MB6436:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a3d3a4a-3c79-4e58-f37a-08dc7c561b59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QUFySksvcVBnVEdkLzZIQlVEZlVFM3hzYkhFRlduTkR4MGhyeXRiSVdLcXpj?=
 =?utf-8?B?QVBSZVZwU3BtQzhGNCtsWTlsL2hpaU5zMDRNSVB1b0htQlc3VGdDK0M4R0Rm?=
 =?utf-8?B?Q1pDNXl0Skk5YjdnR0p5cExDY2ZobG5CeDJkTTF4ZGJTdmIrREhYZ3dRazZT?=
 =?utf-8?B?SHhoR0o2MFcrbVJIQkhNZ2hac0NmNTZLR0ZiRlVLcHY1bXRpQklIQ2hUQ3F0?=
 =?utf-8?B?b3Z6a29UY09xd2hkU2JXdVJVV256NHRCMWJsOWVYYjNZOVBaU3JlRUNLQnAw?=
 =?utf-8?B?QjNNTGtZVDR1SFVVb0I2aTlnaDhKVm1zN1hPZzFxRm1haHNxNisxS0QzTlVK?=
 =?utf-8?B?RzlJeVpkVGhjMGorejQvM1VsbjM2THA4OStaaTRPZk1Gc1NnbDYxazdkRXdM?=
 =?utf-8?B?Z0d3OUwyL3cyeFZsZW5ZdkVad1IyWmpHdVBneXNmSTdzcVg0clhhVEsyM3VK?=
 =?utf-8?B?aDY1QUIvUVh1SWRZamR1dlFCazNmcTFSQkUyYjdVYnhsQ3c4YXIzbHpaRk1u?=
 =?utf-8?B?NjNiaEpCMnFZVXRjb1ZhV1hHSkxsZkd5cGRSTWdtd3R0OVJ0NDdYdXFtdmFw?=
 =?utf-8?B?UU5mcHFUNDRudUlDL0gzbFBDS2gvZVJHd0FFR09yVUplakNYOWFrcnQ4eFFW?=
 =?utf-8?B?VWdPUDBnZW52TzhiWE40NXN5VTBNRDk1UTdXd2ROZkNQL251enNzVllTME50?=
 =?utf-8?B?QzJBR3lmbTJBcW82WTRONHJEWW1oSWNMSDJRVUg4RDJXcGVsNjJHNmV6Z2NW?=
 =?utf-8?B?WjhDR202dTJibDhyR3NHaStvQ3k0NzZOTVk5WmxaOWlhK0g5RmFnSTFlN3Vv?=
 =?utf-8?B?QlN2NE9STENPV2RvYS9kcGVHMUNmSTMxZGl4c0c5bmloa1loM2tiUkYxdGtH?=
 =?utf-8?B?cGZwcExWWkIwTFBZTFh4QVU3a1hmVzhFV0RKUlFIRldidmtOY1pRYjNRNnl5?=
 =?utf-8?B?WlhHbk5hbVpTa0M1R0NXWWpld2NUclYwODFsOS9xYUtWYm1YeUhPT1hLTkVv?=
 =?utf-8?B?RnRyS3lGRmowZVNUcGVmY0V2S2ZTQklTM0tQT0xnb1k0VFl3Vms2L2I5a0Y5?=
 =?utf-8?B?WW5xcXY1VFVRUTlnMVdoWGcrQnR2YS9ZVTV2cUtGd21URzhXbWRKZHlnRnoy?=
 =?utf-8?B?NWthV2lFRlFDU2F1VnkwY2VHZ3VKWklieGF6ejZpRStwcmowaXlpdWhIQUt0?=
 =?utf-8?B?UFAwU3YvcWFKTU5HKzVjYjRHL25MU1VhcVY5Y2V0SnMxNXkvbUVoVThWYWdo?=
 =?utf-8?B?RTg5cDF1alhuOCtZK2hiVnBEa01QcUlSa1oxOTVUaElhd3dCS0M2SHZCbU95?=
 =?utf-8?B?V0dwY0dndHRMcjlyNlFVN1hWUVhGY2hDZVdYTlp1R3hjN1ZpcWtZNzhybmhY?=
 =?utf-8?B?VFdIdVlLYzJIK1I2ejFKMUdNSThKT0RLUm5Pc2tqMnJ6UFJma2FJL0RmZVRm?=
 =?utf-8?B?TEFOODRZQnJXM3poOGEzbUkvMWJITjY2MUdrTUVMUGVmNktoV0thWm1mOUdS?=
 =?utf-8?B?bDFYSytxRHl3Ym5JUThHYXNZa2taVGovM2t2Szl3UGNWa21LeTFsK1lJbUs5?=
 =?utf-8?B?WHpNS1JrUG1aTFZXbzBMcDJ4NktsdFo5RWN5NjVOZC9JZFlJT3RVNGYvMXZk?=
 =?utf-8?B?SWorVm5kaHdzL25WWnJXejlKQm81aTg2WXBUM1hzSTdSd1NsMStaeS9XdjZO?=
 =?utf-8?B?WVgxdHZQcVRHV29lMmlQcWM0L1BLWS9QOCtLWkRvWDYrdk9FUWxKdVpnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB7028.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UHRoRExBcWovR3VQb010aFNDaVZ6YXZ2RnV0MGRZUmFHMnNxKzZjVXlwcnZ4?=
 =?utf-8?B?dFQyayt3dkRPbS8vSDdoMlZRdVVaUFdKRThJcXpsZ3p1K0VPZnA5MmpTSWZr?=
 =?utf-8?B?b0tGeHRmcEsrK1hrUWhTaVBBalNUd0ZnMERxR3pRT0JXY0pEUWNMclBzRjFO?=
 =?utf-8?B?Q0NFSlgzN0paUmVZUndFK3hzV0t1SjVtdTE3T1VpbXNoY3Zwdzh6eEI5V2Zo?=
 =?utf-8?B?dlQ1Ty81bk5ndVJxaGp3eW5GTVFBWG5zSkg2T2Z0K0t6SklaR3RSbDhxL3hR?=
 =?utf-8?B?ckQxV2w5MXFqSG9kbU1RaEF0NDcwajhBUEo2cFhsOENoZnUwSkJPWlNTN3N5?=
 =?utf-8?B?cUU1Q2lYQ1ZYd3lxREJMakpyT1U3T08yOTJHUkNaaTFJb1RWQW45djQvZE1X?=
 =?utf-8?B?cFBaN3NCOTgyUm5aTnprSFg4c2dUREYzWEZMcjZSV2cwaGxsWXk2WEVKdDAx?=
 =?utf-8?B?aysrbktUSlFoN1hnNFlYSmZhVE9FV0VsSG5VTmVQaStDRWJXazd5bTRPdXR4?=
 =?utf-8?B?cFZCZVJHZ2pBR2kwT3NoWGh1MUREZUhBNjZhZ1BhTDMyaVFWb3dPRUZpa1Vj?=
 =?utf-8?B?RXVjUlJ4NmF4dDFpeUxrbXBYd0dYaVh2ZmdmRWt5a1daclRJTUwvdDM0LzF0?=
 =?utf-8?B?WE4zRHJYYStmYy83R0ZCUU9oeWlaMmdQRkxaRDczS2N6bGRYdVhqcy8rRHdm?=
 =?utf-8?B?K3R1dHpxN2I1NXpISW56dkRuMDBTaUxjSU54VW9FYUpQWCtnd0U1OFcvd0No?=
 =?utf-8?B?VklqMEM5MUtIdkNaMEVZcWMxVDd0SklNUXVlcVJydmZ6WXBlN0xpdE5nOHN0?=
 =?utf-8?B?M0NPV1pSVVl0WjRUeFlMTWJwMThBbFFnWTF6OE9lN0ZnbWxpbzJBS1BHTDNE?=
 =?utf-8?B?UkcvR2gxQm9Db0FPeHNzWE9lM1c2R3c3VHZLcjVzWkxtQjdkY0UvMTUweDRH?=
 =?utf-8?B?RUlKRlovYklmejk4Tk5WNjZvUndSMzcvdUdLd0NxOVZzMmlQR0syR0FoRjhu?=
 =?utf-8?B?cWt2UGdxejYrR3E0RG01V00rNjdXWjUvY3dNb2VLV09hMkFWeWRXMWVQY05Q?=
 =?utf-8?B?REJ2YTNHL0FuZzNNb1VHbjRnalVaUlcxSXZ1c1cvSmppdmFKMjhzY3UwNXp5?=
 =?utf-8?B?U2krNWd1T1lZQTQ4WUxRdzVvdktRWm15MXFRRWh4SjYzVmdqaEdaNGFLRGRR?=
 =?utf-8?B?V0JINFVNVVJkSU0rUUxtdEovanVodjFpQ3hlR2pib2pYSk1pUk1QWSsyaTVV?=
 =?utf-8?B?RnMvVnM3Vk9VbUM3UUFiRjlzTW5UNHQ0Y0lPNDg2N1ZCTG5WYkJiMlBKeXJz?=
 =?utf-8?B?VjhDYTUwNTRidVZsUmdUTEtYNStESUt6U1JmbHV6QlA2ZjlSNmdEMkJXVStW?=
 =?utf-8?B?RzVkczRlY1h6Qjl1WXZCVXNCalAxQjI4WU1FeERSSHp1Z3ZiRDgrQXJHbjRi?=
 =?utf-8?B?dmEwL243RG5qbzR0WFVvc2U1ZjZxQ1pFdjVITnlLZkF0c1RhR2xjVUhCK28v?=
 =?utf-8?B?SWlRUDNsTU43Q1R0SkpweUtjQ0ZLRTU3bHpmbVI0MEwrVFZkYlEzajlEUmpn?=
 =?utf-8?B?d0JqbGprRDlLa2FQMmVDWHBORU5aQm53Z0k0MzNqRkFIUVZPRXFUbGhzT0Zp?=
 =?utf-8?B?bXk3eHhkcXpUZXpDWjl3WURjTEdkbXNZREFkRTVHaVh0dzRXaDJDTXZwMWNi?=
 =?utf-8?B?ZTBheTV1bWh1UXVnaC9mWFF4dEtrQzBtNFZ0NXR5OGdTZk90bFFFWW85T0tj?=
 =?utf-8?B?amtEdFIrRUMvb1pMdVVGS2RIdmVRaTFuQUw3WmtSa1IvWjZ4MjJaeVltTVhl?=
 =?utf-8?B?TnVKdHBzRVZIRmhVSUQrSzczSWd0Z054NSs2YXBSbXdIV0VsdXJicjQrVEJD?=
 =?utf-8?B?blhnR1UzYTRSZWRuS21OYXJaTk9Nc090SDM0dm14aXk0eGRnUmN0a2kreEJz?=
 =?utf-8?B?VFpzUWJqY1JiS3p3R1lqS0U3TGp4bkFsODcwWC95UlpmN1V6czZFWm1JZ0pY?=
 =?utf-8?B?c3N3YXVKSDNtbEV3RDhoYlhUV1RDL1RuVUVKZStpTGl3OGNVeVJsSDI1WE80?=
 =?utf-8?B?eVZtSGl5VDBKNjJKVHB3YTRIOGkyVjdGWUwzOFQzZnVpVjZ5OW9ZS2NqaVN3?=
 =?utf-8?B?Nkc4bGlieUtCeUZONU45SlNNdTFCWUxiUmxRdUZhcGNZUHpIMElyWUtRS1FB?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	fH8CgsfSJwRBC+xTAwVpkA3s+NDfOHldM385HwaUfnr+I0t9gz1Nr7vJu5cFFUIxUOTr4cPz+Sq1/fc9EtSuORQhmPuffuvHhr7aHX0bn00i4v2Bfa5AjX/BVGVvri+mknNIL9VgWHv9vHzbuXNpUlOnTOmBIyE8TwbaXCAlxoxYMarkYDlVnr4v8cQxK0H4fNqmyvCt9OafuyFVGMecUKz3Iy1xMILl/ENATaCfxBsCHftbX5JOJnaYYjzeAVnoQKYTEpTRqYkpv7cyoFBQ2PBa/PUdJ6xAnWPsZx7Zl3u369WS/19FssAlYMBV5mRE+kZgid+JSgPttjlMw+gxTHFEeGEQZTHtiNcFQwxR1nAjDX6ufluFwr9VEnM3VrMpDV4amKHvgngbaC+QTOU7/ZgNeZfkuwm6d463m9f0S20/hhgJwiwU5WEMC4QagWI24SX1m9uA6zbbi/ACxi5oIZSXC2O5N6AXEXpcmmfzpQNcIihJEbOx1NdIStFuN1/rqLTE+frvRmyjTUHBqSjKVYh93OCRa0J5SN69i8NdByA45XtzXV9mlmpzMIZ2qxes3/m230qkDZzNcvK1UpoS+EGgC1QgW0CqbjKBbjLzkno=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3d3a4a-3c79-4e58-f37a-08dc7c561b59
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB7028.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2024 01:00:44.8958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8FbwOjISuhpo9HFDeIjGP5Hxr1tu4A/PkFrk5UQJTmDhxbAuOdX9etI4HvPGeMfqCe/7CJOdKqvdTSMCRw1kDzIRURBJBFZ4qDhiW5V4FPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB6436
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_08,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405250006
X-Proofpoint-GUID: yQCLtP1PmaUk6t9c0-iI4fe95bxgFxPg
X-Proofpoint-ORIG-GUID: yQCLtP1PmaUk6t9c0-iI4fe95bxgFxPg


Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>

On 5/24/24 17:57, Kris Van Hees wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  Makeconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makeconfig b/Makeconfig
> index 7249125e..87a601c8 100644
> --- a/Makeconfig
> +++ b/Makeconfig
> @@ -177,7 +177,7 @@ $(objdir)/.config/config.$(1).h $(objdir)/.config/config.$(1).mk: $(objdir)/.con
>  	     echo 'HAVE_$(1)=y' > $(objdir)/.config/config.$(1).mk;; \
>  	xno) echo '/* #undef HAVE_$(1) */' > $(objdir)/.config/config.$(1).h; \
>  	     echo '# HAVE_$(1) undefined' > $(objdir)/.config/config.$(1).mk;; \
> -	*) if $(BPFC) --help $(2) 2>&1 >/dev/null | grep error; then \
> +	*) if $(BPFC) --help $(2) 2>&1 >/dev/null | grep -q error; then \
>  	       echo '/* #undef HAVE_$(1) */' > $(objdir)/.config/config.$(1).h; \
>  	       echo '# HAVE_$(1) undefined' > $(objdir)/.config/config.$(1).mk; \
>  	   else \

