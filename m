Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DE0273D73
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766088642; cv=fail; b=GUXchsyvZSkzPQ8TGzSYdKJ09eeXYePk8omiaYj9ky8CGOgw8vDPPr9qiIoKhIVKK+WRMmx0pcYCGoi4ifHhCB6sepqNtok6Y5KR0fhKhO/CWVRHp+9In8dAy93oIgVd6Itu7uOIIODvw5D/8zpMuog/SMJR/aQGWlWg2BZn7KI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766088642; c=relaxed/simple;
	bh=fYbjTsYKBF/MXTkCXRyc5/uhQSXbdbOLIBkOXUgQw94=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Gz5S3qd83RHdfemC+7R+cmMpRgIOCR8+atyhMhHAy2eVk//dKUlf2/coIUwgf4gueEkG0b0/Nr0xrQOn/vffJLicBQPWeSEhlwi4c0uTzi4LfWrEFEUkk6Pp2052CmS2pCnKWxJdf6fhjTRx1C8txD5/4Lid3DzuD+TSGtVyV28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=akmF90nN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pcEtma+x; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="akmF90nN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pcEtma+x"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIJjpwq2087714
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Pm+v4uaXm85HBmBh2KEkTEci6Dss2debkjeDIL8gR1k=; b=
	akmF90nNWBdi0e174cNFQKGFxBsSeVFgulDpBOcsWsO0FvkBuG8ar2HYTqv2LSt0
	yNIdpumexPgE1jwbHB8sE71FpV387+TSqlY9RrSeaIwBYzQa6Hgtn58k/GH5Rsji
	AKVhqz4h/7x76rjEQF1DRr55vDo5N2tNG0CHH/cZIJeCpRxTi9axgUqxsTB6lo2a
	XLFJrCIkLwH6I189mMHImDs4AnKIpF6ArIcE2+Dw5/no7zcnUZHdutFrmK7tI7BX
	bHx8Ke62HbaCkiYQFvUEknAH0rAAMizYZngXanEACoCC11fuVsTY24CVxN4nedwD
	0Y5EWcLLWqRelARS8Kq/yg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b4r2a81hc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:10:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIJTwhn035601
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:10:38 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010032.outbound.protection.outlook.com [52.101.85.32])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4b4qtrskxp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:10:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aSRvDDPV4He/BKrVRTwTGvn/JAxCXnm2dssDucYXtBNYIFpB/aqcqo6puszPDJzZCalmB5ecV043zVULRjZd+NmQ9WXUy781w3255N2AOHYpSPBy5eBoqErSOjJW/2YuBYFk8DZ6c/qYtAeR3HJqKnkPIbdh3q+hFxjDbdFXD4z7POsz3H1rzlXHVQ+69b+1bT634e55pFdW5K/hdE6ly8s6nqWJNTvQVxgRnl3ejCIz2T8NfJIbbpHRyjA3Sa2ZG2jDsMXTLznlxEi4U+NhPsocAZAUSYIhkGvfNDhvAh75L4sLeW0I9lhqVnehu9zSCPAa0H6rm+MfrAGLgxVY+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pm+v4uaXm85HBmBh2KEkTEci6Dss2debkjeDIL8gR1k=;
 b=bLXtT6nL5sbIY8uJQxbGpLx5KTjcPmzkCkjT8qgvDPjRSu6hWAGfYp39yTwvEcRiqcSzoXJH1gFrv/Ae2RL+cflVK3Qhju1W1mhqRKDJs/PGplCNieVtuBu71UbtdHjDfT/JBsUJyF/m9CsmoYnu5OMCkyc5WEB5Ia6zpsgZ8OSQR8R29/Oa2AuAdwnctFuWXCinuuEceQ497ZSgAa6Zp6jLPtnpEWFY7NDrYecqWsL0VsgG9MMxBUurgqRlHvra7k4U2RNRLiFGX/na+bHzRil6g0ivxJvgzsCfkHhIsRw4vw21j4vXRBb/y36iK/YovC86Rt/5OD/c3Nudhsj9vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pm+v4uaXm85HBmBh2KEkTEci6Dss2debkjeDIL8gR1k=;
 b=pcEtma+xO42HVE/1cLgzjv3064jTtywr45o2GA5YWplEWiLrMAufw8p+afM9tpZdbQHdmGXqVQe1i+v9NvN+hzH335M5QowfiN9E1Gbu0K1x4f/KdCQXsJAIuPImJepWwAYrMXSeMyEQz5Wkx6CWKcA0L9nCzw1MW8MQfGAxAdA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB4496.namprd10.prod.outlook.com (2603:10b6:a03:2d5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 20:10:34 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 20:10:34 +0000
Message-ID: <db11ae09-92a4-26cb-d8ec-aaef1b5574cc@oracle.com>
Date: Thu, 18 Dec 2025 15:10:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 3/4] bpf: allocate the buffers BPF map to fit highest
 CPU id
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB7522FFA1904E3A7555E4BE15C2ABA@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB7522FFA1904E3A7555E4BE15C2ABA@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR15CA0006.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::14) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB4496:EE_
X-MS-Office365-Filtering-Correlation-Id: 67d02037-3bcc-472f-051a-08de3e7180b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bG5rKzdneWlueW5DbnZycFY3UzFoWEF1N2FXMm9Uc1duK0lyR0JqSkg5VXNG?=
 =?utf-8?B?TE81Y0lpUmhwbGpLbHFMTVBsTCtDVm10Z3RXQmd0Wm9NMHJWeXN3TjJDeCtO?=
 =?utf-8?B?R1RSbGlGRXVIVngxV3Y2bkVmZFZXQTFkV0FtL2lWWEtKb2xjcEhseUVQMGdH?=
 =?utf-8?B?TW14TSs5aUZHd016TE1XSmdUZ3FFSGRKYlN0dlQ3S1hGZ0hCNFpTQktLUGI1?=
 =?utf-8?B?eGxURmhINFdYelFOLy9YYklNSEJPM2VVdzZLY0hYcXFZUFdhc05uY3hGdFY3?=
 =?utf-8?B?RTBMdXFWWExrUmxoalN5VkVNczd3MVk4M0VYVkg2dUdHYk8vNXI0ZmtiY290?=
 =?utf-8?B?aVhJVkRvc0dOOWJDbnFZbFNycis4bmN4Vmt1dFJIZzd1L3kybklvWjVRK3BI?=
 =?utf-8?B?ODRoYmNJR0h2RG5tSVZxZEJXQ01zZUxrVzl0ek1CZDNxZCtQTGcrS1ZGcEpy?=
 =?utf-8?B?SmY0WGlYSThBQUgxK0VTVGJEbW5WUmhqdVF1bk9LcWQyNFkrTUNSYmlXelFn?=
 =?utf-8?B?UDN2dTVvVnNMRi8vUVZkNUMvZFhkRk9GOWphMTNrQnU1MTBpcHBNd09tbjN3?=
 =?utf-8?B?REMxekErMGlnV3V6bWE0UzFoWFFGeTRFc3paMjlya0ZqQzJSa3k5NWY2cDUw?=
 =?utf-8?B?bCszUGhZd0tWRjBBbm5vRDRJM0xpdUwranpDaWk0a2Eva3gzc1VTMFVxYVZn?=
 =?utf-8?B?V0F5UjduQ0RwOTZXQXQwMEM0Z1h4bWNrZHF4UncxdVo5eHY4V1RPRlppY2ZX?=
 =?utf-8?B?UHd4TFBjU0w0S3VBcWxVZmhlNytRZGtQbDhOOVNvUTJSV2QxWXJqZGZjb1BI?=
 =?utf-8?B?R25lVSs5Q2UvTFBEdjNZeW1LU0IwQTBCdDFFcTdKZjdtZm5OcnBsSXVZczVj?=
 =?utf-8?B?UEx3YUlRNHpjNUpEbVBoY1dBOFFQNW8vWE8zemZlRmFDbFkyKzJRSElwby9M?=
 =?utf-8?B?RTlsRFN4OC9oS3NybDdnV0lmTzB1VVdmMFhxcjgrV3RZR01SaWFoRzlVeVl4?=
 =?utf-8?B?TUJydDV1SVQ4Z0NvUEhjQmJDN3gvZ2JNSjVtVStxeVlHa0NwTHNpM0VJYUlS?=
 =?utf-8?B?TVlQcDMyYm9GVCs0N0NWdmZCVHFMSnZRRVpMR0MvOTZQaEVCazQ4RDk0OE9W?=
 =?utf-8?B?OU9hQSs4MWlweEVkaDA0LzJVOXVYVDJvRmdqMjl6dExTMU1VTVZocDVFZDI3?=
 =?utf-8?B?NktDNmtGSFZ6Zk5vOFoxVTdpRnlhZEZLVFBTajc4NEZ5WFVza3VtK3BmMDRI?=
 =?utf-8?B?YVREY2Z1eDVKUE43UnBtRGFqQVFLSFJQSC9hcVkzaHBSQlEzVEl0SjVSbUpI?=
 =?utf-8?B?a1IxTU00RExIK0p1ZldTc3o5UFRZUGxBdzhkV2pCOG1hLzRkdjJSbFovcTNl?=
 =?utf-8?B?d2RpZnZiVFdvbldGYzlISHY3UWxzTTdPaWVaK3lwRHVrclhta1d0S2Fhemhz?=
 =?utf-8?B?TTVxR2tyMndWWXFVUEtjUWRPWlNCTXB1WnhjZk1hd3VpWVV5c1dMdXhDK3Zx?=
 =?utf-8?B?S0FrNDlvWndSOU10d3o2eWlEV0tvOGhKek93ZFJWNnpwUEM0ZFY3YllnTys3?=
 =?utf-8?B?cE1FVGRyLzEwSlhQYVlaVGFjTEFsUWtvYXY3bVVtVFAxUlhtR2J1U2tCYzlP?=
 =?utf-8?B?OUxTU0d0aWZiRE02TW1XVi9uYVhVb1F3aHhObktZUXEvMGt6dHUyRXNnK3NT?=
 =?utf-8?B?dXJlVXZNR3NnN210V2V1bndudWZXbG56OSthbG9yVGxuMVY3Rm92M01oZHp0?=
 =?utf-8?B?TzM1YUxycjY0OHc1M25aRU1OaDBvNWV2bllxbm54ZjVCNnlLVmpQQmxlZEVE?=
 =?utf-8?B?WkUraXAzYm9PK25OQVdCMlJOUnNmc3p2bmhJWjBua3llTldnZVRmb1hVdmQv?=
 =?utf-8?B?ZFZhQ21qS2NxWERkQlg1cDBjdEFmOG9Zc05wZ1F3aEIvR2wzcDJJd0JlQmd4?=
 =?utf-8?Q?l25LX4POZoNlqdpMfc4wbemFKUlkSq+d?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUtWSlYyazVLSGUxWDVnakJ1dFBFTk5PeGZnVUs1N3dMWFZvTTYxcVNyWjBY?=
 =?utf-8?B?dDUxVmNzbzFXWTdVUXpYNTU0UmlreE5WakRGUWlLTWJ4cWp6eFpPbkNnalFX?=
 =?utf-8?B?UW1Fek5ST2FSM2xQdUtKV1dNQjRaNnNEU2t6K1JhZ2hjVnpTaWpWS0RIWEp6?=
 =?utf-8?B?SHpsQzdoZytweU9peXBSQzErZjVKUStNK2hwT3c3UHMwNGxza3dqSy84aVFH?=
 =?utf-8?B?U0pkOWhYcm51bnlERnBmTFJjNGdQdEpEbkFWVUFwdzhjaUh6b1VHM0lVaURJ?=
 =?utf-8?B?QmlIZ281bFVSU2FjK1BmQjRLQit6QVZlcDYzQm9mdFRtQUdZdmRSTWkzMWZ4?=
 =?utf-8?B?NHpNVEVUZkc2eE90V1dCZ2tsVVlscGI1R2c0VHh2OHBNV2dwaHI4d1lqd295?=
 =?utf-8?B?aDZNNXpvVVdFUEtPaThRcTd2VkludXJKSmJaQjBwNlE1Y1hxakFTYzk1bHlr?=
 =?utf-8?B?emlTZG1xNUozc2x2TlRJalFtNVZLZVNIY3ZVOXE1V3htREF0Ri8ydXcwZlA2?=
 =?utf-8?B?RWdkcjAwYlR0K1NveklPS3dHMW84SHM1RzcxeFRUY2JtYlRlTTZVd2dRTlVM?=
 =?utf-8?B?TXpQZUk3cTkrSTJTYk8xRjdYMzd1cmVLNGhVbTNuYWVNU1hXclF6WjY2R20r?=
 =?utf-8?B?YzVLVlBxalNmWXI4K3QySlpLY2VBRFZ2UHFvYVY5dlN5TnUzcjJSd3NDTENQ?=
 =?utf-8?B?SG16a1kwaWl4ejhJc1FqSnFTRG5ZM3pjK1hGOTZBZ2VvYTcwYU9zSnkyTm1u?=
 =?utf-8?B?RTN2aVM0aEUzNC9kODBwcHhZNlNpckNwUXUvNFl2MkpkbXZlWVlodGxuQ285?=
 =?utf-8?B?QkxaV0VhMGVBUmJiNzBCUG14Q3FvbHpKUEVEQkZ0TWZ1NUhteHVhR0VUTm5N?=
 =?utf-8?B?a0xUNWdiQnB6N3oyNHVqN1VqR2ZmVVVKZUt5V3FNMStRekRhdTNBbGV5cVZC?=
 =?utf-8?B?M2t2VXlmbFZBdk1VRGdOZnQ3RUV2WVBCRWJCdE1iMHUyT1hVb3pjWmpSNDRB?=
 =?utf-8?B?RFVGd0ZqSE1ObUJqVnRzSS9pOHpGMjJnS0FKSS9qU2Q5b1oxdE9aWHdVL1dE?=
 =?utf-8?B?WUJ6WkMvczJKd3Z3ZU8xZU9pdkZCdFlJc0NQRHhESTN1VkFGbmtyL2ZjcWEx?=
 =?utf-8?B?a253RVRHRi9mU0VTYmVTRUJtZHRrMkRtclRzNDdEc1liMC9IZjBiYXhvSnhQ?=
 =?utf-8?B?MFRhd1Q1aUlLSmNjN3lWa2lTK0ZsZ1Vvd3NaNFlKSXYyUHJDNVBkZENOc0Jv?=
 =?utf-8?B?OFpVVnVtdkZEeGlVci8wZEVJTU43WlRzelh1TFpiTEJpV2ZwTDJMYTVXSmhO?=
 =?utf-8?B?ZUNUOVlPOElRb3lCSDRVODhKN2xueStUVW52MDZ5eG9JRWhIUklVWGYrNmdl?=
 =?utf-8?B?QzNncFV6VmhTRngyTXE4elFvVE9JSlkyQkFjc3EvNlFhOTQrN0ZHcmk0ME9q?=
 =?utf-8?B?aE9zRXcxMnJYbHpUMEtJNEVuOVBVMlRyLzZUdlFnbnB6QjVVYUpGSWlBbXdP?=
 =?utf-8?B?UzhNRFc1TVNEZDdKZjVUZ0svV0RkSG5RcitxR1hwR1ZnY1hqNEZFMVk5NWtG?=
 =?utf-8?B?MWRHTzRDeUpEUVNXby9JMzdMa3VyU255SUprZzZZb1BBbThGS2YyeCttc2hL?=
 =?utf-8?B?aWg5Umt5Q21nUm9UNXhKMytJYVFwWFNMR3hHVHU2eFV1ellML1VPRUNtQWVk?=
 =?utf-8?B?bEphb1RTc0RrMWhNMG00R1F6eXJPeFVzaGpjRUJKKzNSMWx5UUdldmdNbElR?=
 =?utf-8?B?RnhTYUJkSHd2dlMwbkRET1NMcFZaTFZJcmFmdlpGV1pWYm44bjdydFppenJ1?=
 =?utf-8?B?Q3VWUHpDN2pBZmJqSVlQemFnNFdON0trRWh2Q1ZyK1FOb3Jac2ZJc0p5a1Zk?=
 =?utf-8?B?Vmg5THVQdnNLK3RIaTNaVTk2REgxa0hFMEJDaWFIV3BhTEhlWjZrc2RuRVl5?=
 =?utf-8?B?dUlOMW1mY2RPNnkrUEZhUVh4RVpza05xTnY2czhTc0JsTko4c25yc1NpSEth?=
 =?utf-8?B?NFFsZGtaWFVMS2lrelRMWHcvbjJ0czRKVDRaR3prMUkwSGc3L3dZMGxrNHo1?=
 =?utf-8?B?Tk8veGVCaW9TWkpablZXUGMxZ2k1NWJhSC8wQlQvVHoyNEllZ3lndjIyUjNZ?=
 =?utf-8?Q?LtqSTNcNcOemAO/X0blQIspOD?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lEN8wyOLPEnJ/Gb1Y5QGS/8dtqTWSffQqJr+jZOPTyZuqtugAAnpN5MHDMo1E5/h8/3nPUqyAyp5qacAgizvR6wdgXeZrrox5MQvaQfEnZB7+exT9B2va6o1G/PohEKPqDjoidFj0y8G6jjvSSZJafvJLxoSQS4CEMoaxnZpJpgsA/Od6Xx5I8JIG+ZfzeX01D9vl4Y2yoz/WdEH2yRLX1ZQXokSy8SfBTmQ3SG9LeCQXsgw2RZ9qvDWIwKo70bjJm63WrjcbG2icIR3bT/bR282xSSjI5dpK4yv98RmBHnew8nZyr8ZtOze8mNcsA53drZfTcULzyuuzpGyHlFLGofoC78Fml5/Mfe5Y8m76eEFB2khbt9GTDwppJnAOBJep4p1TLYFCI845PTX6niaubEZYjhPzLmloquiAIxXMfoiY6PufOiz3x/GGhg+UGJPts/goKq0Djuvr/JjpkVEYe9vicz8j3S/jlITUA8rcdqhgehjpmL9ieyRGrpuySRd2V6+Bde5OzwJ64excvUlXG418H5129B1wSmHg0ib2m4S7rMXABnq5DzySXIeQcpCaD/URGcAcDwajnsq8NyeS5UHk6ZiXDypakTnvRBlePE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67d02037-3bcc-472f-051a-08de3e7180b0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 20:10:34.5987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rdsGBKWiiFO8W3bKlA59FHUOPKE/PfBRhv7Qb19fFEGK5kplbQ7o1ldDH+VRmXBFKhJ+rrgv/yipsyZAfVnvVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4496
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2512180167
X-Proofpoint-GUID: 9nk6AbNFyoEzWDeKe7c_WnWtRm9KkvSG
X-Authority-Analysis: v=2.4 cv=bdVmkePB c=1 sm=1 tr=0 ts=69445fbf b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=f-bPEqqfFLJByBH8AEcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:12110
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE2NyBTYWx0ZWRfX/Lv5Ej9GhVEb
 akffzD2E5XP5dGxQG90wIYpJZqjjzRkRAivHrUipu0APB85fGQ7HQ4eBsVW2WbBQWvAN7qZm9ev
 UJLArlJL6QsFD78oDm5D/V+pZbbgmUzCf6kvcoyr4LrLlT9+/m8nXvaBU5IcmHrf6Asd9tpIwTa
 CRr2ya4xPMZqFE91iNyUOfl+Zl055i2l3e9R+NdEqRM5FfILBPCJdZfRiBCxrYNNEYBNT3cq9Rc
 H4cyUl5XzdWSE+X/tSC5QKSTw3QVmIbexqtm2FOCEHYbrGHimd8X0hlr6xb21XgompeH5ggQSOY
 cd2/iB926+Ex5S1ggd0JbG3oCkufhubPaiItEwHTFzWbKwI00+PVrjBIwVgs95zD4Djf3FbvAIc
 lpZtZEFrXiX9CDu7DtM3jP8KTnQMqqa4i8IkqtiAtop/kQeHa2DAiZ6cRwlFfi0BAgxkA6UmIFH
 ePDqYhw3YQ+WoSzKzRi3MjBKacjEx9OxyoK2n0qY=
X-Proofpoint-ORIG-GUID: 9nk6AbNFyoEzWDeKe7c_WnWtRm9KkvSG

  Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 12/17/25 00:10, Kris Van Hees wrote:
> Even when less than the possible number of CPUs are online, the 'buffers'
> BPF map should be allocated based on the highest possible CPU id because
> probe data is written to the bufer that corresponds to a given CPU id,
> which could be part of non-sequential CPU id configurations.
>
> The observed problem was on a system with 128 possible CPUs (0-127), but
> only CPUs 0-7,100-107 were online.  The 'buffers' BPF map was created with
> space to hold 16 trace data buffers (one for each online CPU), and since it
> is an array map, this caused the trace buffers for CPUs 100-107 to fail to
> allocate buffers, which in turn caused any trace data generated for those
> CPUs never to get reported.  Since 'buffers' is an array map accessed by
> CPU id, enough space must be allocated to accomodate the highest online
> CPU id.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_bpf.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index 0a57b7d2..6568a572 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -755,7 +755,7 @@ gmap_create_buffers(dtrace_hdl_t *dtp)
>   {
>   	return create_gmap(dtp, "buffers", BPF_MAP_TYPE_PERF_EVENT_ARRAY,
>   			   sizeof(uint32_t), sizeof(uint32_t),
> -			   dtp->dt_conf.num_online_cpus);
> +			   dtp->dt_conf.max_cpuid);
>   }
>   
>   /*
