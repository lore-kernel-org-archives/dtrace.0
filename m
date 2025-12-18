Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B012820AC
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766089483; cv=fail; b=e+uuEfmN2Ts6O54OXd043RceEHdsG+TOrikMe+9Ndbi/AEwJWGDaAzJn0Vj1EJI8PiebslQ+1OsTc7LRZNnUqwFRItC9Ps/mG1m6uVx4qNrpmnHCKtaCXczZiLDy2iFi9NzVdwRtO+vZyJXT36h8y62CviZmngZYAJK0FuB8fiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766089483; c=relaxed/simple;
	bh=v15yHaCEGznsqcX0Amn3g/ku33XknDfFIWOccoeF/Qg=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RG0wor9Q6RkbJWBkY7K0v572NslnENRCTdtv3PrThdOVZlCxZTs/25R4Nc6FwR/0ElI8Iw9lu+sCyXdkjgERdTsRuaTf1qpq0hPKTGNGXO8ttN4ZIjJ4uwM6hs/V5CDQtj/XX0qlCzHst1vst4SNEkWYg62pI3CRpIfcpkr5kBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YTuVOTg3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dKh3tDtZ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YTuVOTg3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dKh3tDtZ"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIJkedK2385260
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=r+LZjnE/Y/p2USgLd+nN6NZFjdVvdM6fgwAu6uG8aUU=; b=
	YTuVOTg35sNh5XTuGniDvrGfiHV4kBAY/X9WwKDJHpj7yDp0S/J9aIg0mzotu972
	kZrJfAJytxXcJjamQU9mXnqCx/e66Ov98oAEDXsN/UkhocSw/LDKwzKpsMk9yhxJ
	XuNdxRktHZhDxJ12kHR6Tch9Sxra0/nrqeJcWd+XgBrtjEVlxEsBle/oRsvs4ZTi
	9sYriwDWWZYBZp4X2wgyVP2bVukv+HaRgb4Xykje+ECs+SIUAFgxB41ZwEZXsSP+
	rkntr1AdLLcwKXfmaNLbd6V4EvWJE72zvkgWku7iUgFHKTrM4tYq/buUiSs2LFp8
	v7IuN7bZntdtIL8ZLNYK2Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b4r29820y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:24:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIJSgGQ023437
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:24:39 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013000.outbound.protection.outlook.com [40.93.201.0])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4b4qta21y5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:24:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hYGkRiletO0Qrbyh4nd3+4f4/dzVb8AmiHxb0SpGudEL4m/10usse7B8RQty+7ISZscCTejokovBHvBcpcW2gcdee59mzGMVXjnuQBFBXnynvKVhsrcH9O3GCXzycJpTaukvyhzSp7qT8JEALLmDfhS9U6txLTqnVqTNAJtpt/GhTs06TGsOreelh2QJ30KftV6y6o19ITm3WtYLE3pWk9ucyCfY5gvwd1tS7s3OR5+Zd2cbIoRoJWRriApwMys0CTBMyEcRbiXU1QX7baSSgOffUrGKKfh4b8EHfktFVdijdkrONf8rTKSs6DxK4jU6kU5rE2zyXuCbIY9VQ7fBrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+LZjnE/Y/p2USgLd+nN6NZFjdVvdM6fgwAu6uG8aUU=;
 b=PmI/SfhTcyclpt8oZGmY1FaBLvuCqVhGpBpAVuFoBN+5OnvmpCxcbjCesWarg+HWOfzQhLyf0gqG62nZICkSnAZgypET4VDnR3QAk8LCtRIaJHcQmEUfJULBAvLI5lDZTWsfEfMLRs0tawZlKYSn+FWy0yJCaz0wHzVZzJTtykPmRMUF8wS9QpSDDS8QF9yAFXlnx4jrhbhjisCTQShJrJ3pKpTIJghLl8/7kkI3hfnwvs5o1Dgip+eOuhQ8vaImjkqmCvKwf+PAONSPLgOXqoQC6/iAjINFdbpJKrdhjHEJDeOgQfd77dcqCKVmL9VxhXwpvEADSRM0pfQiXOejnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+LZjnE/Y/p2USgLd+nN6NZFjdVvdM6fgwAu6uG8aUU=;
 b=dKh3tDtZHlm0otkB7mt91xDaRsTKG1Lm27j30vwjAcUS7g2FBlKkgpO8BMIC1mMa+1Q/cf2HMfn3t4+A8g+/HV2oNQa3X4Rp4zDwL8oRealLEtJ0v+Zd3qKdPdxHiqe0c5jxXAnOhXKUsfSSntH1jv+73TcUxsSgCpNGKZoaMso=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB5053.namprd10.prod.outlook.com (2603:10b6:5:3a4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 20:24:36 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 20:24:36 +0000
Message-ID: <8c4132ca-3353-432f-5e55-1061e35913be@oracle.com>
Date: Thu, 18 Dec 2025 15:24:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH real-v2 1/4] cg, providers: refactor
 clearing probe arguments
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB7522A4C31BDE5BCAE1818348C2A8A@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB7522A4C31BDE5BCAE1818348C2A8A@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH1PEPF000132EC.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::31) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB5053:EE_
X-MS-Office365-Filtering-Correlation-Id: ac09596e-d4d9-4a7d-9e3f-08de3e73767a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?anl4NERUNHFPTnVrZjYvVVB4amp5ZWtPQzlJNnJobTY4RGpRMmVCSGJpVDBw?=
 =?utf-8?B?dzlxTFZ3L1ZGWFltSUpUMXNMeXVJekFEYi8zN1poTEU0OEI5UCs1bkZwMHAv?=
 =?utf-8?B?L3orTnZFalVsZzdpZm0xNHVnbitlL0lnL210anF3RU9lTzhlNElQQWRGQS9l?=
 =?utf-8?B?MWNPVVVndFhoVzRZb3pyeVdwSjJ0ZEptbVhhWjlsMUV6YXlTUUYrTnBWVzdU?=
 =?utf-8?B?Q0MrUlpyeXdydG5Wbko4MmljQWpaRzlSSlFaMDhhNHJTM0NMbndyUnZSTFBa?=
 =?utf-8?B?Ly9yTFkvT0Y5QjUyRnNnS3A0bVUxak10czhkR1VSdXJ2aXlsY25vMk1kNlVB?=
 =?utf-8?B?M0FTQyttSmFmcDVaR2NYcXVBOVhNT1VNM1AyRkdxb0VyMXFsK0xIbXBFektG?=
 =?utf-8?B?NkZ0ZnJKRGRMckJ3US9aeDhBK2x5WkdVMzl2OXEwMHV6NDRZbzdpN0o3Y3Nk?=
 =?utf-8?B?Z25wYzlLZHJiaFVMekgrd3ZQSHR2RjZkVFJOazk5ZlUvWUpsdnVDcDJLTm1N?=
 =?utf-8?B?bWQ5TGloN2dUUkEyUVdZZkU0QytqT2t4djcyL1ZTL2JGMmJaamtmanJNTVNQ?=
 =?utf-8?B?b01DajBMWlRVdXgvZ25rajhVWHdPamR5WGZsWGhVYlBCU0poK29maHRqY29i?=
 =?utf-8?B?NkUweHVrZnBYZmNJSXUvaU5NQnlIb0s1QURNMEwvdmhZZTk1aE1RKzFwaFNw?=
 =?utf-8?B?cmlVNVdNeHpaZWZDQXI5OXcydFBFRURZeDZWUUh3ckdIeWNTYjE1dUpuU1BZ?=
 =?utf-8?B?Z29jQTVvbG04TnRzUHo1MU9WMVJUN1ZHK2JRWDljbWpsQ3I2WG8zVlFzcmY4?=
 =?utf-8?B?Y2xtRUxXaXd5dDQ0KzIxSzVBYnNwU2hjOUFZRnczcGtBcDJZN2RUM2o2UWdq?=
 =?utf-8?B?aTY3dE5JVDhwSnhkM0I1elJDZmUyY29QZVN6RVpFNVdlb3ZLeml0RWxEUTZy?=
 =?utf-8?B?c0pudTdVNVFyaS8rTm16bUJpRUozaE1sQU1RM2Y5V1gyb2pMbWJCY0RlMmRS?=
 =?utf-8?B?alZwWk9qeExFWFZXWFdkdWszUlc3QktvL0E0ckVLRGs5SmNTYkpuTjZVY0Rl?=
 =?utf-8?B?QWpiVkEvQUpyajlRaUt1bUNFa3Z6ZkFsSngrOVV2QjgyZGdqRmpBd0ZzdDFr?=
 =?utf-8?B?aTlpUnNPRmdVZzU5OTR5VmlxR2owbi80NFNQejVXdG9hQ2FIamxlanJuZC9q?=
 =?utf-8?B?cHZrL1ZnaGtwQW9CbWRjeHZyd3ZRcndoM2JMeHg3ZXBCWnRMT3ZLK0lCcVlW?=
 =?utf-8?B?aFJqU1F1a2hCNGh4c1VVR2Z4RnR1WGFXcGpHWFQ4YmpjczIwZUFDQmw1RjIr?=
 =?utf-8?B?Q0J6bDZIOWNIZlNBaktJUW1oYklJRDZzWWY1dEs2VWw2cE0xcnFpUndoY3hN?=
 =?utf-8?B?bGJiV1ZESzVDQVJkbkJzTXlud3Aza2FIeUMwYUpKdG9KRi9rMG92dGF3SERP?=
 =?utf-8?B?UGJERlBMT080Q0pQalNkM1N3UGlUa05GTU9WYThoWE9NWE1aV1RDaDFBb2dW?=
 =?utf-8?B?RHdBTDN3d0hGMHJ1cGp1WDZpRVh2QTMxc2Q0OGh2TG1kdENSTndhcDRaa0Ri?=
 =?utf-8?B?ZFo0cndURDdZU2ZmNHpRYkh6K25Gam51TUgxRElyOXBTRmpqa1UvMUxQeEVh?=
 =?utf-8?B?ZFpXeTV1TXg0cEFIRmNwcE9HTUtZNk1JODdTaUxQZ1c5cWFIQkJCd1lkMmJx?=
 =?utf-8?B?dmp2UmlnN2FQTW03d0RMZnR4MzZTY01qamhDektuMEZtejlhZzY3NTFzQ1NY?=
 =?utf-8?B?T1ZqU0t3a05LWUxwTGxMcUg3Y05GUEt1Rk1yZFpJRjRHTTRQMExNRGV3T2RH?=
 =?utf-8?B?YUtJNlN2YUJuVEd4bG1heFp6bDVOUmxlTERnUDliQm9ZV1ZDMkFaY0dsVkVm?=
 =?utf-8?B?THRzblZPbWszbm51aE1HL1B1N0I5T0JMUFh1UGFYdE1UbDA5RGFMU2hEV2Rp?=
 =?utf-8?Q?SKx9HM8sECd5p1XGjg4KGagn+IOCVfQU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2NISWprZlBPK1Z5b3lhUUNCVE41bFNRM3pHZWhmME01cE9NVXFzUWRiVXBy?=
 =?utf-8?B?SDRkNy9aY1A4eWM3WjFzbFpaN2MxUGxBSHNuT2hzM2FzZnlSd3E5eVNWY0ZV?=
 =?utf-8?B?Y0Z0YXY5MFF4SHJTNDlOVHpjaUY1U0dpdDd6Y2ZtL2RSeG9ybnBXVVBVRTlB?=
 =?utf-8?B?TExHVUliVTRmNlNoV24rNlBwSi8rTFMraHdURkt6alhTcWVHQk9PTGFaRjl0?=
 =?utf-8?B?c29sRzNTd1FKWlVkS3NxbDNlQnBTNUdrRjVpYjRiOTZreUlDS0NjYlk1YjVU?=
 =?utf-8?B?M2EzdlVFclVjQTB5ZW11TFc3ZzFxLzFmZkZpOWtoUVNLWnJlRWlwUXlnWndq?=
 =?utf-8?B?T3lKUEV0S3JOTnJnYmlHTm9tekJHaE5lYk1TQzVBS2F3cTg1ZlQ0aTRWcWN2?=
 =?utf-8?B?Y1FzRWZubk55aXVZMXphTVQ2Vm9HZXhyU1RFR3p3cllxUnhkek5EVldGWFNn?=
 =?utf-8?B?cWkrY3NjSnBpR1g5aHZ5VjVyWlA5VkwzVkJGbG9LS1hJdUduTkl1U0hjbEE5?=
 =?utf-8?B?dnJpbmgwQkc2Y3BzS2RRTW5lL2J5RUpCZmRhcjdlL1pvalljcnkwU3l5K2Fq?=
 =?utf-8?B?a3h1MU5XWG9vYTVQdytTdHV5K2poQ3JJQStxOHNCQ0xVcUEwM1l1bjZ3UjdP?=
 =?utf-8?B?MzZWSUFnUzdlS1NZUlNKTS9zQ3lxTW9NYXJ5QkVuM0h3QndXeC9ubnRRTWx1?=
 =?utf-8?B?YnVUOHRQMHBMRUNBUDZUVW55K09JbWpRKzNCSXZJVGFKaUpXeVRFWGlqdzFK?=
 =?utf-8?B?eHBMRHBWazZObXRUNVViNG4xN2VhdmNZK2ZJWkFaU2dSc0RaNGV4cGJiR3ln?=
 =?utf-8?B?QUJMNHg0Qlk2cXg1S09aTHNsVE1IL1NKRVF2NlhnZy9jc1l4NERXYTk2aEJw?=
 =?utf-8?B?WUpqaUJXUWQ0dzBFSGF4UmJDNS8xUVd4cFVyTmlJVHQyNHlpNFR6eDQyTXRW?=
 =?utf-8?B?OVJtQkRhaUJaaUdHUFpGV2hiVHExZVJ3b2dHYjViazZ0K2hHVFJoY3NVU3Mz?=
 =?utf-8?B?TTd6MGdXS2h5d0VFTDVTN3ZzRVhzYnp6N3hwZ0xQMUU4eTVMalhONUVkVlpQ?=
 =?utf-8?B?UkVXVTU0R2xacWJyRWUyRlFnbEZ6TmxKYWtLaEFBU29vaFA1eG9SLytFUzF4?=
 =?utf-8?B?T1ZSa2o2R2dNaVNLbDcvbHE0eVNnRFZqUDBTK1FXTy90YTVBcFJ2U1hiRTRD?=
 =?utf-8?B?NHc2eXVuV1hTTlFQT3hoaHFLUlZuU29RYUxJMVlKcjkzd2txN01sbVA1R1c1?=
 =?utf-8?B?ZHdxMXdoNFluSm5NT1BiYk5tdTJRemhJSzJOS1QvbDJ3RGhDejAwWWJxbUlk?=
 =?utf-8?B?VkZyVjZlYWlObmFVOEUvSDVSbHVFdXVqMENkVUlpMFh3V2phTjNyQjBuM0Na?=
 =?utf-8?B?elJRbGw2MFhEQ3Z3Ykxxcm9uODBPblJFNHl1Vnl3c0w4b1k0bnFyTTdBOHVS?=
 =?utf-8?B?ZEpnZFk1Vkh2OGJETnhWNjZLWTQrTTFDRktSQzlRaUV2TzJNWGhJbzIzZjdL?=
 =?utf-8?B?VmJmSjNGY0F2czVDWXFZanNqTC9GYVNKNEYxQmZIT0p1L1VLUFQ5UC9KdlNR?=
 =?utf-8?B?bFk2SkFuVFNweE0wc2tqMEVDTWJKNlpPckZjRndkVHlHN2FWOVlwaFJhTEZJ?=
 =?utf-8?B?M05FbThmWXU4Z1NCQjlsd0UyaGRZVFVPOXQybURXckVvZ3Bxb1I0Vlhhd0gy?=
 =?utf-8?B?MGNFYTNhTnhwKzVrUW5yeE1nZUtIQ1dpeTdBUDRrcGVCQ3Z2RXJXUTVwejln?=
 =?utf-8?B?emFjTVNDeHNzbmd4dmVlb2t4RzhhNjlRam5kYWlxT0EwVFQrTHc5VzNvSHVV?=
 =?utf-8?B?SVZHMjJkR2xNbDl3RllqSHRvS2RwTm1wVThnVWF6RldiVWd1NDN6cGNiUk1n?=
 =?utf-8?B?SDJ1SDg2alFmNnBwbjlKcHFjQ0JTNVgrOHJKNWRRdStyR2JhaVhBNUNBUHEr?=
 =?utf-8?B?dzBEa3U2KzFzaUJOQnhlMkttbGlVRFBNZDc2aEtBb1lDOUJDaXNtTDM3RVhw?=
 =?utf-8?B?RjlkMmxKM3o1d3ppWGs4eWtld2tPYUlpeEhQSVpmOVNjSlB4a1NYMWR2Nitz?=
 =?utf-8?B?b3RjQVcvYlpRb3lZMDdNSW5OenNCdnRzb09UTFoydmtFeENDcVp3UEdpbGNM?=
 =?utf-8?Q?wTfQsMU74fZ4DtoH3hW9i+Z02?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UW5LNTW+8lyB81Q0JRZBVmoCXjzm0FE+o3jljNrxHiZkI95hGtpX3aInsDAquBn4dfjbqQUSSNMI5iFMm5E2sc+3DqeCy0frURfGFhM2CLlb+riqUZLI3OrqSDCIl284+yLrggLAhuqfNaCwWj3LWGJZTHw6lRCV7fSuz3WBUqpl7SbcwPiER3Zdf1FhbSXwR1TFPmedwKjuCYhBiKLRX6OHAdu3WOyAJKsQyHf5cyKvLxyB+GEzKISfCjQwxDlQlOnodP8zG8EZ1uDEfOL9MyBWl6p61IeeEo2gfRNM+WXVQDujrL1FFpRaQjATDVJpMrXuyQo+yJvhxxn7j3e/OdwsHeDxS4Bq29VkgtOUhzaGr8+ynv511wqjRNZRC1SttvTGd8oCcDAJQU+gAP47Ja+0jLTUsUcjQIyQFLlkgzJ57rfcpUy1kbQQ8rlkv0CWnykJ1Ted5LZz0Gl6KAFBHGjv2p/RZ9UDzO4fpRGaMfrpwfar7btEeOQ99h0i5tGGpj+DiA/q63mC5s6ICdjVvty/DIoRz082UvEALT4FgCQdNt8rvGJh1zFZSQMRYaTZFNP00/awxeGuRSGT7jqauAvkMuQ4AoeAcxNCw4pNCgE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac09596e-d4d9-4a7d-9e3f-08de3e73767a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 20:24:36.4317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ymO4NCkhRjYN/e+WZ04/EKISzgVJCHuYKHKyvQCdNDUnI71fbZ+Q4c+hTXeJK1jN2COozrcDRk7c4QaT/dby1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5053
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2512180169
X-Authority-Analysis: v=2.4 cv=Ib2KmGqa c=1 sm=1 tr=0 ts=69446307 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=KJBzz8yXbgMG0HoLC0cA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: dxzht9v-lZuTuwid5Y5fQbccGJX6X8-n
X-Proofpoint-ORIG-GUID: dxzht9v-lZuTuwid5Y5fQbccGJX6X8-n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE2OSBTYWx0ZWRfX4hqwH22eZh9j
 RZ20vlDxNci4Fg5YjWtYU761jyfWCsIaA84bXDvE6K0sDp57bz17UxWyeHkZTat6dvARa5Ozg0E
 ddxainaX9Wwy2YYWMUS2D6qLbEKCfYyro2sxLl3/q9V67en47cwQ1ZsuZwr01YIyJf32RulLvaz
 xgfqilw4eWa/+3ZMvPgDHGdzGPBry9mtWGgzrlhUf8sj0+sB2dDZu3uKxdjChSsHtriq8o4J6/z
 nJLoNGduf6SI8wqQx9TVR34aGDeT3EESlHIUiBW/8Ls4kfLjfcoyZzRgC1hEyI6ztAm2QFwubAX
 icbSzMTq4X9+Tclwy1PFie3LLIWTDLzAPvniuo/EZ9efyrNro1RXYEGuXVuZvVjYC0YxoOuhluI
 BHuvG8odQr6wa1xHRDEoft8VCYkH11XUXG5MwedE15h2BaK9zFOmuqSpk+7pFfxD5uFcGqLEnUY
 jucedrjXp5W37BJwU2w==

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 12/18/25 15:20, Kris Van Hees via DTrace-devel wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_cg.c           | 28 +++++++++++++++++++++++++---
>   libdtrace/dt_cg.h           |  1 +
>   libdtrace/dt_prov_cpc.c     | 17 -----------------
>   libdtrace/dt_prov_dtrace.c  |  8 ++------
>   libdtrace/dt_prov_profile.c | 23 +----------------------
>   libdtrace/dt_prov_sdt.c     |  7 ++-----
>   libdtrace/dt_prov_syscall.c | 10 ++--------
>   7 files changed, 33 insertions(+), 61 deletions(-)
>
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index ec4e3123..a77c022c 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -454,6 +454,26 @@ dt_cg_tramp_copy_regs(dt_pcb_t *pcb)
>   	}
>   }
>   
> +/*
> + * Clear the content of the 'argv' member of the machine state, from the given
> + * index (idx).
> + *
> + * The caller must ensure that %r7 contains the value set by the
> + * dt_cg_tramp_prologue*() functions.
> + */
> +void
> +dt_cg_tramp_clear_argv(dt_pcb_t *pcb, int idx)
> +{
> +	dt_irlist_t	*dlp = &pcb->pcb_ir;
> +	int		i, argc = ARRAY_SIZE(((dt_mstate_t *)0)->argv);
> +
> +	if (idx >= argc)
> +		return;
> +
> +	for (i = idx; i < argc; i++)
> +		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
> +}
> +
>   /*
>    * Copy arguments from a dt_pt_regs structure referenced by %r8.
>    * If 'called' is nonzero, the registers are laid out as when inside the
> @@ -626,6 +646,10 @@ dt_cg_tramp_copy_pc_from_regs(dt_pcb_t *pcb)
>   	/* done */
>   	emitl(dlp, Ldone,
>   	      BPF_NOP());
> +
> +	/* clear the rest of the arguments */
> +	dt_cg_tramp_clear_argv(pcb, 2);
> +
>   	dt_regset_free_args(drp);
>   }
>   
> @@ -640,15 +664,13 @@ void
>   dt_cg_tramp_copy_rval_from_regs(dt_pcb_t *pcb)
>   {
>   	dt_irlist_t	*dlp = &pcb->pcb_ir;
> -	int		i;
>   
>   	emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(0), 0));
>   
>   	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_8, PT_REGS_RET));
>   	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
>   
> -	for (i = 2; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++)
> -		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
> +	dt_cg_tramp_clear_argv(pcb, 2);
>   }
>   
>   /*
> diff --git a/libdtrace/dt_cg.h b/libdtrace/dt_cg.h
> index 9493edbb..401ac0e0 100644
> --- a/libdtrace/dt_cg.h
> +++ b/libdtrace/dt_cg.h
> @@ -26,6 +26,7 @@ extern void dt_cg_tramp_prologue_cpu(dt_pcb_t *pcb);
>   extern void dt_cg_tramp_prologue(dt_pcb_t *pcb);
>   extern void dt_cg_tramp_clear_regs(dt_pcb_t *pcb);
>   extern void dt_cg_tramp_copy_regs(dt_pcb_t *pcb);
> +extern void dt_cg_tramp_clear_argv(dt_pcb_t *pcb, int i);
>   extern void dt_cg_tramp_copy_args_from_regs(dt_pcb_t *pcb, int called);
>   extern void dt_cg_tramp_copy_pc_from_regs(dt_pcb_t *pcb);
>   extern void dt_cg_tramp_copy_rval_from_regs(dt_pcb_t *pcb);
> diff --git a/libdtrace/dt_prov_cpc.c b/libdtrace/dt_prov_cpc.c
> index 57b11b13..fd33990f 100644
> --- a/libdtrace/dt_prov_cpc.c
> +++ b/libdtrace/dt_prov_cpc.c
> @@ -393,26 +393,9 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
>    */
>   static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   {
> -	int		i;
> -	dt_irlist_t	*dlp = &pcb->pcb_ir;
> -
>   	dt_cg_tramp_prologue_cpu(pcb);
> -
> -	/*
> -	 * After the dt_cg_tramp_prologue_cpu() call, we have:
> -	 *				//     (%r7 = dctx->mst)
> -	 *				//     (%r8 = dctx->ctx)
> -	 */
> -
>   	dt_cg_tramp_copy_regs(pcb);
> -
> -	/*
> -	 * Use the PC to set arg0 and arg1, then clear the other args.
> -	 */
>   	dt_cg_tramp_copy_pc_from_regs(pcb);
> -	for (i = 2; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++)
> -		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
> -
>   	dt_cg_tramp_epilogue(pcb);
>   
>   	return 0;
> diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
> index 34b5d8e2..453d3e58 100644
> --- a/libdtrace/dt_prov_dtrace.c
> +++ b/libdtrace/dt_prov_dtrace.c
> @@ -83,7 +83,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   {
>   	dt_irlist_t	*dlp = &pcb->pcb_ir;
>   	dt_activity_t	act = DT_ACTIVITY_ACTIVE;
> -	uint32_t	i, key = 0;
> +	uint32_t	key = 0;
>   
>   	/*
>   	 * The ERROR probe isn't really a trace event that a BPF program is
> @@ -174,11 +174,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_update_elem));
>   
>   	dt_cg_tramp_copy_regs(pcb);
> -
> -	/* zero the probe args */
> -	for (i = 0; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++)
> -		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
> -
> +	dt_cg_tramp_clear_argv(pcb, 0);
>   	dt_cg_tramp_epilogue_advance(pcb, act);
>   
>   	return 0;
> diff --git a/libdtrace/dt_prov_profile.c b/libdtrace/dt_prov_profile.c
> index e1369ca9..cb65ca43 100644
> --- a/libdtrace/dt_prov_profile.c
> +++ b/libdtrace/dt_prov_profile.c
> @@ -216,24 +216,9 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
>    */
>   static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   {
> -	int		i;
> -	dt_irlist_t	*dlp = &pcb->pcb_ir;
> -
>   	dt_cg_tramp_prologue_cpu(pcb);
> -
> -	/*
> -	 * After the dt_cg_tramp_prologue_cpu() call, we have:
> -	 *				//     (%r7 = dctx->mst)
> -	 *				//     (%r8 = dctx->ctx)
> -	 */
> -
>   	dt_cg_tramp_copy_regs(pcb);
> -
> -	/*
> -	 * dctx->mst->argv[0] = kernel PC
> -	 * dctx->mst->argv[1] = userspace PC
> -	 */
> -        dt_cg_tramp_copy_pc_from_regs(pcb);
> +	dt_cg_tramp_copy_pc_from_regs(pcb);
>   
>   	/*
>   	 * TODO: For profile-n probes:
> @@ -246,12 +231,6 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   	 * and update expected+=interval.
>   	 */
>   
> -	/*
> -	 *     (we clear dctx->mst->argv[2] and on)
> -	 */
> -	for (i = 2; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++)
> -		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
> -
>   	dt_cg_tramp_epilogue(pcb);
>   
>   	return 0;
> diff --git a/libdtrace/dt_prov_sdt.c b/libdtrace/dt_prov_sdt.c
> index 74555f5b..5be43ebc 100644
> --- a/libdtrace/dt_prov_sdt.c
> +++ b/libdtrace/dt_prov_sdt.c
> @@ -174,11 +174,8 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   		off += size;
>   	}
>   
> -	/*
> -	 * Clear the remainder of the cached arguments.
> -	 */
> -	for (; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++)
> -		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
> +	/* Clear the remainder of the cached arguments.  */
> +	dt_cg_tramp_clear_argv(pcb, i);
>   
>   	dt_cg_tramp_epilogue(pcb);
>   
> diff --git a/libdtrace/dt_prov_syscall.c b/libdtrace/dt_prov_syscall.c
> index 20843c6f..237f2728 100644
> --- a/libdtrace/dt_prov_syscall.c
> +++ b/libdtrace/dt_prov_syscall.c
> @@ -159,14 +159,8 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
>   	}
>   
> -	/*
> -	 * Zero the remaining probe args.
> -	 *	for ( ; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++)
> -	 *		dctx->mst->argv[i] = 0;
> -	 *				// stdw [%r7 + DMST_ARG(i)], 0
> -	 */
> -	for ( ; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++)
> -		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
> +	/* Zero the remaining probe args. */
> +	dt_cg_tramp_clear_argv(pcb, i);
>   
>   	/*
>   	 * For return probes, store the errno.  That is, examine arg0.
