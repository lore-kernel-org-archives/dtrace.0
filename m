Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B294438B
	for <dtrace@lists.linux.dev>; Sat, 30 Aug 2025 00:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756513331; cv=fail; b=o51/y4SsKH98HKIWafjQYSIfMvXv43DDLtn4XRCNDLwO52cps86lt169nlZw4jlQlAfR+d9PzQuS+bVTXFWx5URU1H9T1KrzHdBJEkUCS6RQHUMv7WqU2n5BcWLwQzxqnqPioY9hjplUV/5CPDwUw1VtBkczKhTESrJPS2ucfTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756513331; c=relaxed/simple;
	bh=fV9RbT2BJwTdHO7DMm0oGKUMvfA7ht6lT5xYAfT9X+4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=doab9Jw4u6ILjw5dwBdHmQ6dEjo+pDpSbk71zZnkxnetgp24xkl9NUqUW4oYGYIxz6N6q4V8TDbXE09oAqno/iCKmxTxPiMFxwEYZJjryCiRxn5GDIW099FWkbpd6g7u7UygGzh6aCNexxfpeUy8Q/EOxamQoUZEIHfEnC/pVkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=p2sMkXq+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=W1185q/6; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="p2sMkXq+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="W1185q/6"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TGflEQ016099
	for <dtrace@lists.linux.dev>; Sat, 30 Aug 2025 00:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=LxzZ0gS8Qt+qy7Ha+jrkm/LRLJZEiINIQ9bdYnAx8e0=; b=
	p2sMkXq+u4p2Y4M+PIXmZSQGOvdQBPr1/H05UYgsvCTo8yi/hIrDSlDaK0rDepHl
	X0pctJ33csXM/hlYhAS54MmoBP74IjQuVnTmS2yop7/MYp1W9wBCNYcd94X8o9ok
	78Zhd13gqUYrOxsD3pGOzH0YdeEhjeauxSSHsr/OSaxF+++b4x4yjPRn/sDJ3YWs
	ef9bATABiI2WpPyJvSXmpDvYZVjZIAP4tWl+5cj+X+/8kpD7Rpvlk+NmYxYIkF8A
	mYqAn5pJReOyoEUOlIcda6U0o+Ak4KZQZtSX3aEvHfp+aO9aaspnFMG/QxwXRliN
	+hirD699een3Ei8Cz319Lw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q6793dkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 30 Aug 2025 00:22:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57TMe8CD018954
	for <dtrace@lists.linux.dev>; Sat, 30 Aug 2025 00:22:08 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48q43drxh7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 30 Aug 2025 00:22:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6T9MUE8GRUbpdIxLh2INYQXrc0/TDOHCbKs2+wvInsQk+RV23c8HU5m6TthJko7hWIm+W61RZJB6lrw8kt2K/nEwIXosv41bNd6LjRCzAVydzmEvEDSjYa0tCSXEZK1aw3S1qQ29DR9tldpEpTDH123ZQh6hqtCCU4bnXjV7E9jGJi0bojAbqvbcPtqx944l+4BLu8pbF4B6DSHkCv3SystizY1lYX/ziiGmt/+Rnymc7weTVX/5NcOXWk1JpwLwNLvbpUSIxzwltQB4pztREGLupW2gn6HgOWN0CU/pobEUwyNOVq1v1N9PM8Sf3X9ZZEyiWZvLUTzbNRWRg0xVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxzZ0gS8Qt+qy7Ha+jrkm/LRLJZEiINIQ9bdYnAx8e0=;
 b=nY4yHzJodZfLI3SkFm3ZZ5YdU8dwAv51m/qG86RDG3fcRYnxslASgKxpkGwyem28weLhl+KYXjPn38Y/NdziPY+GZOkQkmzUoaown1tAQUKRnQceTU9RTPiSZOK1erVEZDO9XwoMTuKEn4O9XR8J0xiVF9GKabAosVp7tRn/dlMOjULYWRrlQyGTcUPPzbi408vy4vxmlJXBfTZGkEabuhSLNCQYtnq6Tn2q9vCd/dcHVFuXW5mKnfqxupmJ2gp5j60qyahr7lFfqzlAagyzPu+VBXe/9ldui3K1wCk46R+JBwgBb/Sd3lvsCkWYdTJj2bWQEsqGnwRO1txgQ+imhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxzZ0gS8Qt+qy7Ha+jrkm/LRLJZEiINIQ9bdYnAx8e0=;
 b=W1185q/6KFUSZ/7LnTk6kWJK5csX5eOf24e1omdvTUjS8/mpg6a5LpBSA8r3/oCE1N+eJa/5hzTUC4Y6CkJ/GQtQNhicyUF44VRXntY1IuevpLTIq2JBDFaYWOlO83zICGWGOlVddtQk9FIR7vYplmMQJ8wMDBLNGkRR1+SOnZY=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BN0PR10MB5095.namprd10.prod.outlook.com (2603:10b6:408:123::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Sat, 30 Aug
 2025 00:22:01 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9073.021; Sat, 30 Aug 2025
 00:22:00 +0000
Message-ID: <cc8b68fd-5d66-85c1-aed1-6f1a3b46f9b2@oracle.com>
Date: Fri, 29 Aug 2025 20:21:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] stapsdt: fix out-of-bounds access when provider name is
 not specified
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672584FFCA103989DCF31BBC23AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB5672584FFCA103989DCF31BBC23AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN8PR15CA0020.namprd15.prod.outlook.com
 (2603:10b6:408:c0::33) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BN0PR10MB5095:EE_
X-MS-Office365-Filtering-Correlation-Id: e97b4252-541c-4a24-f6e2-08dde75b3cd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnF4NVR6eXN2dU5tWFg3SXJpQXVaQVpvUEd3MEM5RlFlZUl4WUR1eVh3MTJB?=
 =?utf-8?B?bVpNRmw4WXVjOG8rS3g4NFNONTY3UFAxanErdTVkY0RlaXpwL3p6WW14TnhD?=
 =?utf-8?B?bHdEL1VLbVM3UG1BRFVTNWtsWTJidGhCMXpMZSthdGVrTVlLUS9GQnlISzBl?=
 =?utf-8?B?VEZ1enJPQmJsb2V3a1pXZUpHNzkxOVBmOEJDbEwzVE1jWGhrZGsxMm92RFZr?=
 =?utf-8?B?YzM1ZzliT1BCUDNjeTRuUlJHOTJxZU5IRExBV3FMMkZrRDl5K3BOTHo2Kysv?=
 =?utf-8?B?aTB2dnEvQTU3ZDdETklPd3h2aGVxcnZCS2NibnFucWk5TEVLUHpWd2M3Vm1C?=
 =?utf-8?B?dWV2b1JNRkhWVWpTWVJDbDdWNE9GdFEwWnNITGVEUkQrUU8wNkhQN3N4VVRB?=
 =?utf-8?B?Sy9PNUdQSDcwazBNcDdrcEcyRTNZdEN6VFQrZTRUNUlZbjJsSk9xUzZUeGFi?=
 =?utf-8?B?YThWRE4rSmJiN2Y1dXdVYmUyUmJYN1Q2ZGNXZ1BWQlAxREFTWTBkbzFxN3M4?=
 =?utf-8?B?WHlKbkJiaWJWbU82NitJVnp4bksyUmV4ZHlFUm1HY3BUWGVLNDQvQkZNRUZI?=
 =?utf-8?B?VDcvTmFvZFNCZlBWdkNCamFXR3RwWW9vSjRueVIvQVJkbmlFdHFTb1NzTHo0?=
 =?utf-8?B?Q3l4Nm1Ka3JuMUw5ZG1aOHNFNC82bUZiWVl6Rm9NQ3YzSUhMd3BxcC9GcjBG?=
 =?utf-8?B?RU45WjJxZzdxRUR3YUlUQlV3aXpvNWhnV25IUVdxNFg5eDYrVHNsR1Z2djJF?=
 =?utf-8?B?a29vTHFkYzZFRTZkODRPaDFXZW5GY1JDUHZOWTdLMjJteTY0SFN4KzFDM2E5?=
 =?utf-8?B?YlBIV0ljYk82Ymo5NUVseERlQ2lrVVdGb0VHbEp0Z1kzanJOaWlhNEVzeGp5?=
 =?utf-8?B?OUhKSVkwQ2RRbkc3NG4xSWlESTRnUEZ0NEJMcW5HZ2dOWkx4SHJpNlorMnBl?=
 =?utf-8?B?cmxMT3lJMHhlQXFuRkJZc1dUTHZJK2tHWHV2R2tES3RacFNCTGVwMnA3ZGlQ?=
 =?utf-8?B?b1U5TTYzajVBMnBicFhQSld4Z1g1b2krWlVrVUxxT1RRNUgzQ2FQc25PclJC?=
 =?utf-8?B?ZmdLRWZ0WnQzZXl5aFRzazA0QzRXVWozcWMrY0RTbHpPQTlaQjFDczIyUGkv?=
 =?utf-8?B?Q1RLVElnTWUrUDZDcW1ZZEJlT3dicDY2Y0Z3Z2todjdncnhoZWFEWUcySkJI?=
 =?utf-8?B?M1JlRWlkWVowSDR6cmRWVm9PWkwxVnh4ek5iTnBScGVQVmdaWEdNc3lkQVNu?=
 =?utf-8?B?Njg3U1d4VlYwZHF3NkRpenlkUlBnVkVVWFJQU2o4SkRSYUdoTlZUYzBENUVZ?=
 =?utf-8?B?Y0V3OWhsWDZWMWRVSDdORlJ2ajA0WUlidmREcjVlUThUMWVpOU5wbm1VdzJS?=
 =?utf-8?B?TzJRaFVSS0dmeDZoNmREdG5vaStCUE02UzlGS0NSalVXTjBCT3BPd3VyR01N?=
 =?utf-8?B?VVBtU1d0dTZteTE0N0dWL3JTWFBJdmlzV2ZZbGVaMDd5VDVOeDU1cFhzWkx1?=
 =?utf-8?B?TmpyYk12R2plK0xxM1VZWUNtNkhieVZObS94R3pzWkVEaVJEWlA1eFYxaExZ?=
 =?utf-8?B?VjM0K3ZtSUZkanJLc3V4NjVZQWVoaDQza1FBcHVyQTlNTjJSOE11QW82Yk5I?=
 =?utf-8?B?Uk5SYmIxNkl3blpLYnZzaGgrMVdRMWFNUjc2S2hkRzZOZzhVYklpSnZ1S25l?=
 =?utf-8?B?NzVwU0pMZUo1eDV3MUZLN21iU3pSNm1ubnpuUkZDQUtRcWZoa2crVE1rQmIv?=
 =?utf-8?B?dlFQQ090T1ZlZG5SSDVDeE1FUlRzaTFCOWpEUEw4Skw2aUVNdE9YdC9sd092?=
 =?utf-8?B?a2xIak9NYWVKa1hsUWIxd2w0cGFmZjVzMy9iTWphK0tobENlcUFtQUpUNHFB?=
 =?utf-8?B?dnNaZG1BZkdDR3AzemxYdVNJOExXQ0ovb0IxTXVXbUdjdjN4TTltejR4Rnlq?=
 =?utf-8?Q?KIXcyE5WhYU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnVXZHZFdDBJZEZoUS9CRXFGRHRoUU44Q2x5NHpNMkhhTjZ4WG1tR25jaTFF?=
 =?utf-8?B?eFpPTXVDd0U0NWswOG5SSWx2QXpUWTFUakM5R3NpcC9tYTlMdVEzUjhRc2ZB?=
 =?utf-8?B?bFdqc3RubFkySlJucHZkNWdSd2Nxc0wxK3hpSE9yYkZvYjIrUE94YU1BczBv?=
 =?utf-8?B?OWZLTDVYbFdETlRoaUI0MklGNFRrdW5ydGNoV0t0a216dFd5WGVkSzRBMjF5?=
 =?utf-8?B?TFZ1RWpUTDkrVTZqM3ZmU09mZjBQS05RYmE2U2I0UGRrZktDQWplSlg0cmVH?=
 =?utf-8?B?Y1BTYUd1bVF2YWl6L0sxZ0tmdmlLRVUremp1Z3EydjZlcDNuckNGVkVXUmFs?=
 =?utf-8?B?dVBKaGhvY1hoQktNNDNjdFdPTjVOK21LSzZRYitwd1ZmN1hNM0dUajRvbm10?=
 =?utf-8?B?WFJTRWZhUXlEZWYwVFBjL0k4NnorVFc0T28rOVdaNzdZUjNESEMwelBsMzhN?=
 =?utf-8?B?QjNOTjhRQ1BkakJnejRaNmh3WlBCdURwRG12TUxPSVp3emlHS3R0dkJydXZF?=
 =?utf-8?B?STU4VEMrNlZOYTdYekQ5SU8wdGxaakJtNVBFYnI1Q2NqcmFsSnVEZ1R5Vi9L?=
 =?utf-8?B?VzlxOUx5WmpXUVVTM3ZsUDZaRnZLMUpkclBXZzZUa1Mwa1haVVRUdDZCSUtF?=
 =?utf-8?B?bURQUzVVaWZjOFBpY29WZXJpT0RId2htVFIwNkFaMk1Lb0xxNHRubC96U2Uz?=
 =?utf-8?B?T2U3OGN0Wk12ZDM0ZzJBcVhlQWlCZFF0SUJVLzFkUTM0dkVOd0lJcUJlQW5D?=
 =?utf-8?B?NkVXSjVNQUhqQ2VMZC9GNmkzclNtVGpRV0dUanpWcDZ1WHpieVYvazM5OU5x?=
 =?utf-8?B?RDJEa292M0REUmExcnNQY2RqakJiK0NBTVJ6T1dKdDk4TTBMZ1I1NW5HYTVH?=
 =?utf-8?B?TDdOL0RMNWxKQkpFcDRraEZqYUU0VFBWc3dJcEJVeCtRbkg3dUJUNUN3MkJt?=
 =?utf-8?B?bEpyMUJHUC9WaUt2YWRLWjRFQVY5cUNhNTI4ZStjcDZWREk4SXV2cThaL240?=
 =?utf-8?B?N2hrTGJYTWtNTkMzOUxPNUY1L2VCVFRaMWhhWmhFQzZRRU5haDBObnNua3d0?=
 =?utf-8?B?WGFNNmZXbXJNaU1qUTUyRjE3NWxXcGxFTTc1TWR6Y1d6Zk9pSmxyc090U1VC?=
 =?utf-8?B?bVFlNzY2RTZzb3FWd25xTk5ib2VxMUNkWWUyTDZvK04vb09BOHdmVnMvZ25h?=
 =?utf-8?B?b1BkZC9BTld0b0crYjNkZzNCK3hXU3hPemh2ZC90emFxZ2MwdG5tSTVFQmNo?=
 =?utf-8?B?L1Q1c0UveUFJUXlCZDhkTmRGRTdvVVFQTkpvWlFRQjcwc3dWbm52bUMxVjQ1?=
 =?utf-8?B?YjFsRHNjMmRrTUFvcDgwU3p5eW1FbVM3cjdOby92ZmpRTlFPOTB2Rkk5c0lJ?=
 =?utf-8?B?NlUxWWo0U0h4aHNCMGFsQVRBQTdoZnBubTJvWEsycWhwUVl3MGNFN1FNaVh5?=
 =?utf-8?B?SEVmNVJmSjU5ZkEvRk4vWk54YjAvdys1L1h0WnNZbnl5UUVCNUdqRVZFSWRT?=
 =?utf-8?B?NEJKWjhOcGZHaVBidVp5MWFscng2bmkrU2FLcHc5Zy8wMjdjMWlaa2lnMnR5?=
 =?utf-8?B?ZkwwanMweENMeGo0amN2akEzaEY3VjhpSk9kTERNcG5nYm1DWm5SQ0Z6UDBx?=
 =?utf-8?B?RlJIRGJPdzBud1FiOXJPbHRZdmRGeXppMHRSMzR2YXZINThONFh6UHVhMVkz?=
 =?utf-8?B?WktEZi9sd2pNb0Q3RkxyYUE5VHlOaWZqRzVkNzczT1cyQld6M0I3WFYvKzBs?=
 =?utf-8?B?QmJVenRnMlNrU3NuM2dGODZMQWtKM1VMalR1N2w0clRRcXpGcklXSDBBTUtP?=
 =?utf-8?B?R2NaeEhjcWFxZktHMS9IWlc2VXROVFIrUGxUWUdYRzRxUEpFZVptNkVFa3Ri?=
 =?utf-8?B?THpnaFRpYTlBWWppbDJUbXNzQjVNaDg0OVdZTmVVQ1VobkhGL3FTdlBnMkN4?=
 =?utf-8?B?Q09uTGQvTCsxcmc2ajlZTjQ4Z3FHcUFCb1JRa2NIWjNvVGV5VG9EQmZTVXRl?=
 =?utf-8?B?SjNzcTJOR3dJYU85bzNEeVNiU09Ed0p5Zk1SZDRpalNWdHBpNmVBeDlDMmpa?=
 =?utf-8?B?Rk9lcGtnTVQ2VlJWclhRRHZpK1QyNlFNNFBvYnVvQVRtZzJNZ1dWVjVkRkJR?=
 =?utf-8?Q?DDePgwFWtnaIn+Myl7TJidzyk?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5sgMZmqXoua51GCHIYIcI34yY84NdfPIltaH9T/q89ZuvByxu/1uXKAqhdIYlSZCwTJHZ7WxmMeY3SbD23Y6hMFuWDNX+s7jk6+9QJueooa2oYN8FDJe7z2HpiDLeDRW1JBsW4W7sdLjvs3aJsS3OTuCN6F3aAgMO3qWJySGgkHY4BEGsPlNYCNaPwMvuNy9C5cSI1HzZlRCtOsWbWaR1HZIGsVlMudWlGnTQQS40DlUZMI2n6QYQojgmpmMVtgqVb5+AbTR+ATmzYLZZqAbPTBZcwlIkBPLXENL9OdjXwhtwdn8qTncElRp913vo5m+eoc06rxO2RI+kQFKVUn4avooaW4e2x+g2TX0QNfLZkFxRoWYrHiUy2skQ1r4eiPFN+1dYKlk2RnVG4hvmvvTU9OouMzi4Ig25tnerv/WUXpvQbGV8fGEXxiaHmE9Nzi2o7x7Pw3FRsn8KeCOw3qT/E93rKv0ZzwzfVVh6ZUkpMRi5i/FD8gN+BJMI42QQ5eB929dHJha3YISjsqfLNUufp+96agp5xN0wbp+IfeUWE4NhGFK4UwhHvIceNvWGG6AQMOYNs81H0MG4GZSU87QgqBC0DeaRRvE6O76lB86mxQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e97b4252-541c-4a24-f6e2-08dde75b3cd7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2025 00:22:00.8499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f4PFSRzBb4uvPO3aBJwEArQNmKTwIfOH+/xJVPjXl6/VhuobvDrKRukRTJUs0n2jMBVtpsVB8dzYT1KQv3yZFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5095
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508300001
X-Proofpoint-GUID: W8Qb_MMD5LzgyugMrXGeSVHCB4kdiskb
X-Proofpoint-ORIG-GUID: W8Qb_MMD5LzgyugMrXGeSVHCB4kdiskb
X-Authority-Analysis: v=2.4 cv=NrLRc9dJ c=1 sm=1 tr=0 ts=68b24430 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=WI0MjOtT7Yw-H5KEhp4A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNSBTYWx0ZWRfXyrhmtNOtoBtS
 oFffV6gJm+gVpO2qGnYOxP8zVCV1XsAr2yJ8ke6RIzSAAZP+jc9QcQSxH0BJgEvMnK0oHYIQYbo
 eOh6pIiX3Oeqd+flxqbzAdwq2onb3lI0xs58yQNpdfh8n9F2FppZm8FYKZvb3rsW/cJ+kq5S2tb
 uFQJxZ9N/Re+o7dTnG3mhn6Z1s1xpG00voYyQFbh8yknxEUeFm7x2eqD4v5s353N/S3vHk77Kga
 bxAfIS4Pz3X1XYD43uLNvEsvrbewBQbVdQFMjEHMXYKs+LZHCaxvRSEaE8H35NmF9pmyrC29aCs
 9ur6vDVJfAyJ4t929nxBEzFqBbv8xb1BEHgM7vqKFAAXZqXs7niCMDJopOGIf1VyaKmOH7bq8v0
 BplIZuSo

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

I'm assuming no test is practical here... it all depends on what garbage 
one finds in front of pdp->prv?

On 8/29/25 14:46, Kris Van Hees wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_pid.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index 4af9141aa..ffc52132f 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -1518,10 +1518,14 @@ dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_
>   	dt_proc_t *dpr = NULL;
>   	const char *pidstr;
>   	pid_t pid;
> +	size_t len = strlen(pdp->prv);
> +
> +	if (len == 0)
> +		return 0;
>   
>   	assert(pcb != NULL);
>   
> -	pidstr = &pdp->prv[strlen(pdp->prv)];
> +	pidstr = &pdp->prv[len];
>   
>   	while (isdigit(*(pidstr - 1)))
>   		pidstr--;
